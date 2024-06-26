source "${MY_BASH_DOT_BASE}/lib/colors.bash"

# bash displays the primary prompt PS1 when it is ready to read a command, and
# the secondary prompt PS2 when it needs more input to complete a command.

# \a: an ASCII bell character (07)
# \d: the date in "Weekday Month Date" format (e.g. "Tue May 26")
# \D{format}: the format is passed to strftime(3).
# \e: an ASCII escape character (033)
# \h: the hostname up the first '.'
# \H: the hostname
# \j: the number of jobs currently managed by the shell
# \I: the basename of the shell's terminal device name
# \n: newline
# \r: carriage return
# \s: the name of the shell, the basename of $0
# \t: the current time in 24-hour HH:MM:SS format
# \T: the current time in 12-hour HH:MM:SS format
# \@: the current time in 12-hour am/pm format
# \A: the current time in 24-hour HH:MM format
# \u: the username of the current user
# \v: the version of bash (e.g., 2.00)
# \V: the release of bash, version + patch level (e.g., 2.00.0)
# \w: the value of $PWD, with $HOME abbr'ed with '~' ($PROMPT_DIRTRIM)
# \W: the basename of $PWD, with $HOME abbr'ed
# \!: the history number of this command
# \#: the command number of this command
# \$: if the effective UID is 0, a '#', otherwise a '$'
# \nnn: the character corresponding to the octal number 'nnn'
# \\: a backslash
# \[: begin a sequence of non-printing characters, which could be used to embed
#     a terminal control sequence into the prompt
# \]: end a sequence of non-printing characters

# Title text of the terminal.
term_title="\[\033]0;\w\007\]"

function error_code() {
    local retval=$?
    if [[ retval -eq 0 ]]; then
        echo -e "${echo_bold_green}:)${echo_reset_color}"
    else
        echo -e "${echo_bold_red}$retval${echo_reset_color}"
    fi
}

function user_host() {
    echo -e "${echo_yellow}\u@\h${echo_normal}"
}

function curr_path() {
    echo -e "${echo_cyan}\w${echo_normal}"
}

function generate_prompt() {
    # Prompt line.
    local prompt="┌─ $(error_code) $(user_host) [$(curr_path)]\n└─▪ "

    # PS1 is the primary prompt, PS2 is secondary (multiline command)
    PS1="${term_title}${prompt}"
    PS2="└─▪ "
}

PROMPT_COMMAND=generate_prompt
