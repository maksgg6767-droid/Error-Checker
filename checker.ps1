
# =============================================
# Minecraft Anti-Cheat Checker v1.1
# =============================================

$ErrorActionPreference = "Stop"

Write-Host "[*] Инициализация сканера системы..." -ForegroundColor Cyan
Start-Sleep -Seconds 1

Write-Host "[*] Подготовка проверки файлов..." -ForegroundColor Cyan
Start-Sleep -Seconds 1

$URL = "https://github.com/maksgg6767-droid/Error-Checker/archive/refs/heads/main.zip"
$ZIP = Join-Path $env:TEMP "main.zip"
$EXTRACT = Join-Path $env:TEMP "CHECKK-main"

try {
    Write-Host "[*] Загрузка базы проверки..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $URL -OutFile $ZIP
    Write-Host "[+] Архив загружен" -ForegroundColor Green

    Write-Host "[*] Распаковка базы..." -ForegroundColor Yellow
    Expand-Archive -Path $ZIP -DestinationPath $EXTRACT -Force
    Write-Host "[+] Архив распакован" -ForegroundColor Green
}
catch {
    Write-Host ("[-] Ошибка загрузки или распаковки: " + $_.Exception.Message) -ForegroundColor Red
    return
}

Write-Host "[*] Поиск компонентов сканера..." -ForegroundColor Yellow

$Exe = Get-ChildItem -Path $EXTRACT -Filter "Ftchecker.exe" -Recurse |
    Select-Object -First 1

if ($Exe) {
    Write-Host ("[+] Найден компонент: " + $Exe.FullName) -ForegroundColor Green
    Write-Host "[!] Перед запуском проверьте цифровую подпись и файл антивирусом." -ForegroundColor Yellow
}
else {
    Write-Host "[-] Ftchecker.exe не найден в архиве." -ForegroundColor Red
}

Write-Host ""
Write-Host "[*] Проверка завершена. Наличие файла само по себе не означает, что Minecraft чист." -ForegroundColor Cyan
