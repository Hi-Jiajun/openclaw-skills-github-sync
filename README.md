# OpenClaw Skills GitHub Sync

OpenClaw skills GitHub 同步工具。

## 功能

- 支持私有仓库同步
- 支持公开仓库同步
- 每次同步需要手动确认（非实时）
- 自动检测变更并提交推送
- 支持 Windows / Linux / Mac

## 支持平台

| 平台 | 脚本 |
|------|------|
| Windows | sync.ps1 |
| Linux/Mac | sync.sh |

## 使用说明

详细使用说明请查看 [SKILL.md](SKILL.md)

## 快速开始

### Windows

```powershell
powershell -ExecutionPolicy Bypass -File "sync.ps1"
```

### Linux / Mac

```bash
chmod +x sync.sh
./sync.sh
```

## GitHub

https://github.com/Hi-Jiajun/openclaw-skills-github-sync
