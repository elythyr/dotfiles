# Always call ls after cd
# Problems: cdls:1: maximum nested function level reached
# cdls() {
#     cd $1;
#     ls;
# }
# alias cd='cdls'

# Load a local config when switching directory
# Disabled because it was slowing down a bit
# The goal is to be able to override aliases in some specific cases
# function chpwd() {
#     # Always reload the main file to erase any previous override
#     source $HOME/.zshrc

#     if [ -r $PWD/.zsh_config ]; then
#         source $PWD/.zsh_config
#     fi
# }
