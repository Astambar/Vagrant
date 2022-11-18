$varCheminDuScript = $MyInvocation.MyCommand.Definition
powershell -NoExit "$varCheminDuScript/../vagrant_start.ps1"