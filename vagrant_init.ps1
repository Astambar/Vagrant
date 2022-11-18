$varCheminDuScript = $MyInvocation.MyCommand.Definition
powershell -NoExit "$varCheminDuScript/../script.ps1"