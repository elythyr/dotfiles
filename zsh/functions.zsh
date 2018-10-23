# Always call ls after cd
cdls() {
    cd $1;
    ls;
}
alias cd='cdls'
