if [[ ! "$(which heroku)" ]]; then 
    echo "heroku not found. Please install heroku and try again"
    exit 1
fi
OHMYZSH="~/.oh-my-zsh"
if [ -d "${OHMYZSH}" ]; then
    echo "~/.oh-my-zsh was not found. You might want to install manually."
    exit 1
fi

function cleanup(){
    echo "Install failed. Trying to clean up.."
    if [ -f ~/Library/Application\ Support/iTerm2/DynamicProfiles/prodsafepluginprofiles.mehernosh.json ]; then
        rm ~/Library/Application\ Support/iTerm2/DynamicProfiles/prodsafepluginprofiles.mehernosh.json
    fi

    if [ -f ~/.oh-my-zsh/custom/plugins/prodsafe/prodsafe.plugin.zsh ]; then
        rm ~/.oh-my-zsh/custom/plugins/prodsafe/prodsafe.plugin.zsh 
    fi

    echo "Cleaned up."
}

set -e

mkdir -p ~/Library/Application\ Support/iTerm2/DynamicProfiles/

pushd ~/Library/Application\ Support/iTerm2/DynamicProfiles/

curl https://raw.githubusercontent.com/mehernosh/ohmyzsh-heroku-prodsafe-plugin/master/src/profile/prodsafepluginprofiles.mehernosh.json -o prodsafepluginprofiles.mehernosh.json

popd

mkdir -p ~/.oh-my-zsh/custom/plugins/prodsafe/
pushd ~/.oh-my-zsh/custom/plugins/prodsafe/

curl https://raw.githubusercontent.com/mehernosh/ohmyzsh-heroku-prodsafe-plugin/master/src/plugin/prodsafe.plugin.zsh -o prodsafe.plugin.zsh

popd 

echo "prodsafe plugin was installed"
echo "please activate the pluing in your ~/.zshrc"
echo "find the line plugins= and add 'prodsafe'"
echo "eg:"
echo "plugins=(git heroku python prodsafe)"
