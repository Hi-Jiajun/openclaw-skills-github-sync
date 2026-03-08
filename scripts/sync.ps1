# OpenClaw Skills GitHub Sync Script for Windows
# ==== 配置加载 ====
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$configFile = Join-Path $scriptDir "config.ps1"

if (Test-Path $configFile) {
    . $configFile
} else {
    # 默认配置
    $privatePath = "$env:USERPROFILE\openclaw-skills-private"
    $publicPath = "$env:USERPROFILE\openclaw-skills-public"
}

Write-Host "=========================================="
Write-Host "OpenClaw Skills GitHub Sync"
Write-Host "=========================================="

function Sync-Repo {
    param($repoPath, $repoName)
    
    if (-not (Test-Path $repoPath)) {
        Write-Host "[SKIP] $repoName not found"
        return
    }
    
    Set-Location $repoPath
    
    if (-not (Test-Path ".git")) {
        Write-Host "[SKIP] $repoName - Not a git repository"
        return
    }
    
    # 检查 .gitignore
    if (-not (Test-Path ".gitignore")) {
        Write-Host "[WARN] No .gitignore found, creating..."
        @"
# Credentials
credentials/
*.key
*.pem

# OS
.DS_Store
Thumbs.db

# Logs
*.log

# Temp
*.tmp
*.temp
"@ | Out-File -FilePath ".gitignore" -Encoding UTF8
    }
    
    $status = git status --porcelain
    
    if ($status) {
        Write-Host "Changes in $repoName :"
        $status | ForEach-Object { Write-Host "  $_" }
        
        Write-Host ""
        Write-Host "Run 'git status' to review changes before committing."
        
        $confirm = Read-Host "Continue with sync? (y/n)"
        if ($confirm -ne "y" -and $confirm -ne "Y") {
            Write-Host "Sync cancelled."
            return
        }
        
        git add -A
        git commit -m "Sync $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
        git push origin main
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "[OK] $repoName synced"
        } else {
            Write-Host "[FAIL] $repoName sync failed"
        }
    } else {
        Write-Host "[OK] $repoName - No changes"
    }
}

# Sync private skills
Write-Host ""
Write-Host "--- Private Skills ---"
Sync-Repo -repoPath $privatePath -repoName "Private"

# Sync public skills  
Write-Host ""
Write-Host "--- Public Skills ---"
Sync-Repo -repoPath $publicPath -repoName "Public"

Write-Host ""
Write-Host "=========================================="
