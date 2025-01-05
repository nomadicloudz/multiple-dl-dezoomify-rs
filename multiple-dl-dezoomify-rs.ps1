# requires dezoomify-rs.exe
# https://github.com/lovasoa/dezoomify-rs

# get manifest url and save as NAME.json
$manifestFile = "C:\full\path\to\manifest.json"

$manifest = Get-Content $manifestFile | ConvertFrom-Json

foreach ($image in $manifest.sequences.canvases) {
    $id = $image.images[0].resource.service."@id"
    $label = $image.label

    Write-Output "NEW --------------------------"
    Write-Output "Label: $label"
    Write-Output "ID: $id"

    # downloads largest available image
    & "C:\full\path\to\dezoomify-rs.exe" @($id, '-l') 
}
