---
name: openclaw-skills-github-sync
description: |
  将 OpenClaw skills 同步到 GitHub（非实时，需手动确认）。
  支持 Windows/Linux/Mac。
  使用场景：skill 创建或修改完成后同步到 GitHub
---

# OpenClaw Skills GitHub Sync Skill

将你的 OpenClaw skills 同步到 GitHub 仓库。

## 功能

- 支持私有仓库同步
- 支持公开仓库同步
- 每次同步需要手动确认（非实时）
- 自动检测变更并提交推送
- 支持 Windows / Linux / Mac

## 支持平台

| 平台 | 脚本 |
|------|------|
| Windows | scripts/sync.ps1 |
| Linux | scripts/sync.sh |
| Mac | scripts/sync.sh |

## 快速开始

### 方式一：交互式配置（推荐首次使用）

首次使用时，运行交互式配置向导：

#### Windows
```powershell
powershell -ExecutionPolicy Bypass -File "scripts/setup.ps1"
```

#### Linux / Mac
```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

交互式配置会引导你：
- 检查 GitHub 登录状态
- 设置私有/公开 Skills 路径
- 自动初始化 Git 仓库

### 方式二：手动配置

1. 安装 GitHub CLI：
```bash
# Linux
sudo apt install gh

# Mac
brew install gh

# Windows
winget install GitHub.cli
```

2. 登录 GitHub：
```bash
gh auth login
```

3. 创建仓库并手动配置

## 同步流程

1. 你创建或修改 skill 后
2. 提醒你是否同步到 GitHub
3. 你确认后执行同步脚本
4. 脚本会自动检测变更、提交并推送到对应仓库

## 注意事项

- 公开仓库建议设置为私有，除非你愿意分享代码
- 同步前确保本地仓库已初始化
- credentials/ 目录不会被同步（仅同步 skills 代码）
