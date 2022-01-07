@echo off

rem create a temporary folder
mkdir installtemp
cd installtemp

rem install vs2022
curl -LO "https://aka.ms/vs/17/release/vs_community.exe"
start /wait vs_community.exe --nocache --passive --addProductLang En-us --norestart --installWhileDownloading --config ..\.vsconfig --wait > nul

rem install vscode
curl -L "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" -o vscode.exe
vscode.exe /VERYSILENT /NORESTART /MERGETASKS=!runcode
call refreshenv

rem install vscode extensions
call code --install-extension aaron-bond.better-comments --force
call code --install-extension adpyke.vscode-sql-formatter --force
call code --install-extension Angular.ng-template --force
call code --install-extension azemoh.one-monokai --force
call code --install-extension dbaeumer.vscode-eslint --force
call code --install-extension DotJoshJohnson.xml --force
call code --install-extension eamodio.gitlens --force
call code --install-extension esbenp.prettier-vscode --force
call code --install-extension ghaschel.vscode-angular-html --force
call code --install-extension jchannon.csharpextensions --force
call code --install-extension johnpapa.Angular2 --force
call code --install-extension ms-dotnettools.csharp --force
call code --install-extension ms-vscode-remote.remote-wsl --force
call code --install-extension ms-vscode.cmake-tools --force
call code --install-extension ms-vscode.cpptools --force
call code --install-extension ms-vscode.hexeditor --force
call code --install-extension ms-edgedevtools.vscode-edge-devtools --force
call code --install-extension mtxr.sqltools --force
call code --install-extension pflannery.vscode-versionlens --force
call code --install-extension rbbit.typescript-hero --force
call code --install-extension vscode-icons-team.vscode-icons --force

rem install nvm for windows
curl -L "https://github.com/coreybutler/nvm-windows/releases/download/1.1.9/nvm-setup.zip" -o nvm.zip
tar -xf nvm.zip
nvm-setup.exe /silent
call refreshenv

rem install node.js long time support and use it
nvm install lts
nvm use lts

rem install latest git version
winget install --id Git.Git -e --source winget

rem cleanup
cd ..
rmdir /s /q installtemp