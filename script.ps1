$init = "vagrant_virtual_machine"
Set-Location /
<#VARIABLE#>
$personaldata = @(
    'git config --global user.email leuchartjason@gmail.com'
    'git config --global user.name Astambar'
    'cd'
    'cd Holberton'
    'git clone https://github.com/Astambar/holbertonschool-higher_level_programming.git'
    'git clone https://github.com/Astambar/holbertonschool-low_level_programming.git'
    'git clone https://github.com/Astambar/holbertonschool-system_engineering-devops.git'
)
$data = @(
    'sudo apt update -y'
    'sudo apt upgrade -y'
    'sudo apt install emacs -y'
    'sudo apt install git -y'
    'mkdir Holberton'
    'git clone https://github.com/holbertonschool/Betty.git'
    'cd Betty'
    'sudo ./install.sh'
    'sudo apt install gcc -y'
    'sudo apt intall valgrind -y'
    'sudo apt install python3.8 -y'
    'sudo apt install locate -y'
    'sudo apt install pycodestyle -y'
    'sudo apt install net-tools -y'
    'sudo apt install ruby -y'
    'sudo apt install shellcheck'
    'sudo apt install nodejs -y'
    'sudo apt install npm -y'
    'curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -'
    'sudo apt-get install -y nodejs'
    'sudo npm install semistandard --global'
    'curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -'
    'sudo apt-get install -y nodejs'
    'sudo npm install axios --global'
    'export NODE_PATH=/usr/lib/node_modules'


)
$data += $personaldata

$ubuntu_ssh_command = $data -join ';'
<# Fonction#>

function create_virtual_machine {
    param (
        
    )
    $virtual_machine = Read-Host "Definissez votre type de machine virtuel :"
    vagrant init $virtual_machine
    vagrant up
    vagrant ssh -c $ubuntu_ssh_command
    vagrant ssh
    
}

<#
DEBUT DE LA PROCEDURE D'INSTALATION VAGRANT
#>

if (Test-Path -Path "./$init") {
    Write-Output "$init  existe"
    Set-Location $init
    Get-ChildItem
    $dossier = Read-Host "Definissez votre dossier d'instalation :"
    if (Test-Path -Path "./$dossier") {
        Write-Output "Le dossier existe deja"
        if (Set-Location ./$dossier) {
            Set-Location ./$dossier
        }
        $response = "false"
        do {
            $confirme = Read-Host "Voulez vous vraiment refaire le Vagrantfile ? y/n"
            if ($confirme -eq "y") {
                Write-Output "lancement de la procedure d'ecrasement"
                vagrant destroy -f
                Remove-Item ./* -Recurse -Force
                create_virtual_machine
                $response = "true"
            }
            elseif ($confirme -eq "n") {
                Write-Output "nous passons donc cet etape"
                vagrant up
                vagrant ssh -c $ubuntu_ssh_command
                vagrant ssh
                $response = "true"
            }
            else {
                Write-Output "reponse incorecte"
            }
        } until ($response -eq "true")   
    
    }
    else {
        Write-Output "Le dossier n'existe pas"
        mkdir $dossier
        Set-Location $dossier
        create_virtual_machine
    }
}
else {
    Write-Output "$init  n'existe pas"
    mkdir $init
    Set-Location ./$init
    Get-ChildItem
    $dossier = Read-Host "Definissez votre dossier d'instalation :"
    mkdir $dossier
    Set-Location $dossier
    create_virtual_machine
}