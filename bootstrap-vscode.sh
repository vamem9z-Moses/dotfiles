echo "Installing vscode extensions"

echo "Installing Language support for JAVA"
code --install-extension redhat.java

echo "Installing Beautify"
code --install-extension HookyQR.beautify

echo "Installing Debugger for Chrome"
code --install-extension msjsdiag.debugger-for-chrome

echo "Installing Python support"
code --install-extension ms-python.python

echo "Installing C/C++ support"
code --install-extension ms-vscode.cpptools

echo "Installing ESLint support"
code --install-extension dbaeumer.vscode-eslint

echo "Installing vscode icons"
code --install-extension robertohuertasm.vscode-icons

echo "Installing TSLint support"
code --install-extension eg2.tslint

echo "Installing Go support"
code --install-extension lukehoban.Go

echo "Installing Project Manager"
code --install-extension alefragnani.project-manager

echo "Installing Ruby support"
code --install-extension rebornix.Ruby

echo "Installing One Dark Pro theme"
code --install-extension zhuangtongfa.Material-theme

echo "Installing Git Extension Pack"
code --install-extension donjayamanne.git-extension-pack

echo "Installing npm Intellisense"
code --install-extension christian-kohler.npm-intellisense

echo "Installing npm support"
code --install-extension eg2.vscode-npm-script

echo "Installing vim support"
code --install-extension vscodevim.vim

echo "Installing jinja support"
code --install-extension wholroyd.jinja


echo "Setup User Settings"
if [ "$platform" == 'darwin' ]; then
	ln -s $PWD/vscode/settings.json $HOME/Library/"Application Support"/Code/User
else
	ln -s $PWD/vscode/settings.json $HOME/.config/Code/User
fi
