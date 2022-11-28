aptInstall() {
    sudo apt install "$1"
}

snapInstall() {
    sudo snap install "$1"
}

installUtilitiesPackages() {
    aptInstall wget
    aptInstall curl
    aptInstall snapd
    aptInstall htop 
    aptInstall gnupg
    aptInstall ca-certificates
    aptInstall lsb-release
}

installDevPackages() {
    aptInstall build-essential
    snapInstall code
    aptInstall emacs-nox
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-pluginsudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-pluginlinux/ubuntu   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
}

cleanUp() {
    sudo apt clean
    sudo apt autoclean
    sudo apt autoremove

}

main() {
    echo "Script To setup a Developper Workstation on Ubuntu based system"

    echo "Update the system...."
    sudo apt update
    sudo apt upgrade
    sudo apt autoremove

    echo "Install Utilities Packages..."
    installUtilitiesPackages

    echo "Install Developper Packages..."
    installDevPackages
    cleanUp
}

main