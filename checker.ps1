
# =============================================
# Ftchecker Launcher v1.0
# =============================================

$ErrorActionPreference = "Stop"

Write-Host "[*] Инициализация..." -ForegroundColor Cyan

$url = "https://github.com/maksgg6767-droid/Error-Checker/raw/refs/heads/main/Ftchecker.exe"
$out = Join-Path $env:TEMP "Ftchecker.exe"

try {
    Write-Host "[*] Загрузка Ftchecker..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $url -OutFile $out
    Write-Host "[+] Файл загружен: $out" -ForegroundColor Green

    $answer = Read-Host "Запустить Ftchecker.exe? (Y/N)"

    if ($answer -eq "Y") {
        Start-Process -FilePath $out -Wait
    }
}
catch {
    Write-Host ("[-] Ошибка: " + $_.Exception.Message) -ForegroundColor Red
}

Read-Host "Нажми Enter для выхода"
