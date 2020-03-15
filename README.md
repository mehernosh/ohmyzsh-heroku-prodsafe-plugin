# ohmyzsh heroku prodsafe plugin

Code adapted from: https://medium.com/rahasak/change-terminal-color-when-ssh-e2a13ccee681

### Installation

Run:
```
curl -s https://raw.githubusercontent.com/airbase/ohmyzsh-heroku-prodsafe-plugin/master/src/install.sh | bash
```
Once the script runs, please activate the pluing in your ~/.zshrc:
Find the line plugins= and add 'prodsafe' eg

```
plugins=(git heroku python prodsafe)
```

### Customize

The [plugin](blob/master/src/plugin/prodsafe.plugin.zsh) is just a shell script that replaces the `heroku` command on your machine with an alias function.

When called, it checks for the substring `"prod"` in the command args. If found, it switches to a profile called prodsafe.

The install script writes a prodsafe plugin which cannot be edited from the UI, it asks you to edit the raw JSON. But you can delete it and replace it with your own prodsafe profile creaded fresh from the UI.
