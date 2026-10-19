
# =============================================
# Minecraft Anti-Cheat Checker v1.2
# =============================================

$ErrorActionPreference = "Stop"

Write-Host "[*] Инициализация сканера..." -ForegroundColor Cyan
Start-Sleep -Seconds 1

$URL = "https://github.com/maksgg6767-droid/Error-Checker/archive/refs/heads/main.zip"
$ZIP = Join-Path $env:TEMP "main.zip"
$EXTRACT = Join-Path $env:TEMP "CHECKK-main"

try {
    Write-Host "[*] Загрузка базы проверки..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $URL -OutFile $ZIP

    Write-Host "[*] Распаковка архива..." -ForegroundColor Yellow
    Expand-Archive -Path $ZIP -DestinationPath $EXTRACT -Force

    Write-Host "[+] Архив распакован" -ForegroundColor Green
}
catch {
    Write-Host ("[-] Ошибка: " + $_.Exception.Message) -ForegroundColor Red
    Read-Host "Нажми Enter для выхода"
    return
}

$Exe = Get-ChildItem -Path $EXTRACT -Filter "Ftchecker.exe" -Recurse |
    Select-Object -First 1

if (-not $Exe) {
    Write-Host "[-] Ftchecker.exe не найден." -ForegroundColor Red
    Read-Host "Нажми Enter для выхода"
    return
}

Write-Host ("[+] Найден файл: " + $Exe.FullName) -ForegroundColor Green
Write-Host "[!] Запускай только проверенный файл." -ForegroundColor Yellow

$Answer = Read-Host "Запустить Ftchecker.exe? (Y/N)"

if ($Answer -eq "Y") {
    try {
        $Process = Start-Process -FilePath $Exe.FullName -Wait -PassThru
        Write-Host ("[*] Программа завершилась с кодом: " + $Process.ExitCode) -ForegroundColor Cyan
        Write-Host "[!] Код завершения сам по себе не подтверждает отсутствие читов."
    }
    catch {
        Write-Host ("[-] Ошибка запуска: " + $_.Exception.Message) -ForegroundColor Red
    }
}
else {
    Write-Host "[*] Запуск отменён." -ForegroundColor Gray
}

Read-Host "Нажми Enter для выхода"
