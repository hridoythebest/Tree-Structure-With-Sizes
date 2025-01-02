# Specify the folder path
$FolderPath = "C:\"

# Get the tree structure with sizes
Get-ChildItem -Path $FolderPath -Recurse | ForEach-Object {
    $type = if ($_.PSIsContainer) { "Folder" } else { "File" }
    $size = if ($_.PSIsContainer) { "-" } else { "{0:N2} MB" -f ($_.Length / 1MB) }
    "{0,-5} {1,-10} {2}" -f $type, $size, $_.FullName
}
