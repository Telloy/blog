# Hugo博客部署脚本
$ErrorActionPreference = "Stop"

$nodeBin = "C:\Users\zyc\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin"
$env:Path = "$nodeBin;$env:Path"
$env:HTTP_PROXY = "http://127.0.0.1:7897"
$env:HTTPS_PROXY = "http://127.0.0.1:7897"

Write-Host "1. 构建Hugo站点..." -ForegroundColor Cyan
& "$env:LOCALAPPDATA\hugo\hugo.exe"

Write-Host "2. 部署到Vercel..." -ForegroundColor Cyan
Push-Location public
& "$nodeBin\node.exe" "..\node_modules\vercel\dist\vc.js" --prod --yes
Pop-Location

Write-Host "完成！访问 https://czyc.cc" -ForegroundColor Green
