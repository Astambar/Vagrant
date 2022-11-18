$varCheminDuScript = $MyInvocation.MyCommand.Definition
powershell -NoExit "$varCheminDuScript/../powershell.ps1"