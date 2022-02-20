starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/marcelbaur/opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
# set the workspace path
set -x GOPATH /users/marcelbaur/go

# add the go bin path to be able to execute our programs
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
set -x PATH $PATH ~/.emacs.d/bin
alias ls="exa -la"
alias vim="nvim"
# Pretty print thing at the beginning:
# neofetch

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/marcelbaur/google-cloud-sdk/path.fish.inc' ]; . '/Users/marcelbaur/google-cloud-sdk/path.fish.inc'; end

# Setting PATH for Python 3.10
# The original version is saved in /Users/marcelbaur/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"
set PATH "$HOME/.composer/vendor/bin:$PATH"
set FZF_DEFAULT_COMMAND 'rg --files --hidden'

source ~/.iterm2_shell_integration.fish
