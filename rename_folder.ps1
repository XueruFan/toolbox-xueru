# 进入目标文件夹
$targetPath = "C:\ccnp_report\raw_data\part_7_brain\crop"
Set-Location $targetPath

# 调试信息
Write-Host "当前目录: $(Get-Location)"
Write-Host "所有子文件夹:"
Get-ChildItem -Directory | Select-Object Name

# 仅处理以"CCNP"开头且长度>7的文件夹
$folders = Get-ChildItem -Directory | Where-Object {
    $_.Name -like "CCNP*" -and $_.Name.Length -gt 7
}
    $folders | ForEach-Object {
        $newName = $_.Name.Substring(7)
        Write-Host "重命名: $($_.Name) -> $newName"
        Rename-Item -Path $_.FullName -NewName $newName
}