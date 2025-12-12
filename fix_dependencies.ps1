# AGP Namespace Fix for Flutter Dependencies
$pubCache = "$env:LOCALAPPDATA\Pub\Cache\hosted\pub.dev"

Write-Host "Fixing Flutter Dependencies for AGP 8.0+" -ForegroundColor Cyan

# isar_flutter_libs
$isarManifest = "$pubCache\isar_flutter_libs-3.1.0+1\android\src\main\AndroidManifest.xml"
if (Test-Path $isarManifest) {
    $content = Get-Content $isarManifest -Raw
    if (-not ($content -like '*namespace=*')) {
        Write-Host "Fixing isar_flutter_libs..." -ForegroundColor Yellow
        $content = $content -replace 'package="dev.isar.isar_flutter_libs"', ''
        $content = $content -replace '<manifest', '<manifest xmlns:android="http://schemas.android.com/apk/res/android" namespace="dev.isar.isar_flutter_libs"'
        Set-Content -Path $isarManifest -Value $content -NoNewline
        Write-Host "Fixed isar_flutter_libs" -ForegroundColor Green
    }
}

# rust_in_flutter
$rustManifest = "$pubCache\rust_in_flutter-4.12.0\android\src\main\AndroidManifest.xml"
if (Test-Path $rustManifest) {
    $content = Get-Content $rustManifest -Raw
    if (-not ($content -like '*namespace=*')) {
        Write-Host "Fixing rust_in_flutter..." -ForegroundColor Yellow
        $content = $content -replace 'package="com.example.rust_in_flutter"', ''
        $content = $content -replace '<manifest', '<manifest xmlns:android="http://schemas.android.com/apk/res/android" namespace="com.example.rust_in_flutter"'
        Set-Content -Path $rustManifest -Value $content -NoNewline
        Write-Host "Fixed rust_in_flutter" -ForegroundColor Green
    }
}

Write-Host "Fix completed!" -ForegroundColor Green
