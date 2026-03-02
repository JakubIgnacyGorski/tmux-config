# Tmux config

Installation method depends on existence of `XDG_CONFIG_HOME` variable.

## Variable defined

```
git clone <this repo> "$XDG_CONFIG_HOME/tmux"
cd "$XDG_CONFIG_HOME/tmux"
./install.sh
```

## Variable undefined

```
git clone <this repo> "$HOME/.tmux"
cd "$HOME/.tmux"
./install.sh --home
```
