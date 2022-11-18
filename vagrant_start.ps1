$init = "vagrant_virtual_machine"
Set-Location /
if (Test-Path -Path "./$init") {
    Set-Location $init
    Get-ChildItem
    $dossier = Read-Host "Machine Cible"
    if (Test-Path -Path "./$dossier") {
        Set-Location $dossier
        vagrant up
        vagrant ssh
    }
    else {
        Set-Location "machine inexistante"
    }
}
else {
    Set-Location "le dossier initiale est absent"
}
