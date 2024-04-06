function check_git_installed() {
    git --version >/dev/null 2>&1
    if [ $? -eq 0 ]; then echo -e "true"; else echo -e "false"; fi
}
