# delete everything down to the shebang when you're ready

printf "\nthis script isn't ready yet\n">&1&2

# I don't evenwant it to be sourced, much less run
# https://stackoverflow.com/a/28776166
#sourced=0
#if [ -n "$ZSH_EVAL_CONTEXT" ]; then 
#  case $ZSH_EVAL_CONTEXT in *:file) sourced=1;; esac
#elif [ -n "$KSH_VERSION" ]; then
#  [ "$(cd $(dirname -- $0) && pwd -P)/$(basename -- $0)" != "$(cd $(dirname -- ${.sh.file}) && pwd -P)/$(basename -- ${.sh.file})" ] && sourced=1
#elif [ -n "$BASH_VERSION" ]; then
#  (return 0 2>/dev/null) && sourced=1 
#else # All other shells: examine $0 for known shell binary filenames
#  # Detects `sh` and `dash`; add additional shell filenames as needed.
#  case ${0##*/} in sh|dash) sourced=1;; esac
#fi

set -l

# in case anyone tries to source this 
# and if they manage to execute it... it could be not at all tragic

function limit_to_screen_width -a string
    if type -q par
        printf %s (printf %s $string | par w(tput cols)fj)
    else if type -q fmt
        fmt -w (tput cols) $string
    else
        printf %s $string
    end
end

function _warn -a how_long
    clear
    set message "This script isn't ready yet!!! Cancel running it within 30 seconds, or this console session will be exited for your own protection.  "
    set message "$message$message$message$message$message$message"
    set message "$message$message$message$message$message$message"
    set message "$message$message$message$message$message$message"
    set width (tput cols)
    set height (tput lines)
    set needed_letters math width * height

    printf (limit_to_screen_width $message) 
    echo "

    oh no...
    "
    sleep $how_long
end

_warn 5 ^&2^&1

set -l colors 'normal' \
              'red' '--background yellow' '--italic' \
              'yellow' '--background black' '--bold' \
              'black' '--background brwhite' '--bold' '--italic' \
              'brblue' '--background brwhite' '--bold' '--italic' \
              'bryellow' '--background brwhite' '--bold' '--italic' \
              'brmagenta' '--background brwhite' '--bold' '--italic' \
              'brred' '--background brwhite' '--bold' '--italic'

for color in $colors
    set_color (printf %s $color); 
    and _warn 4; 
    and set_color normal
end

echo "That's it! That's the header for the template!

well, what do you think?"

sleep 30 # or till it becomes funny again

exit 1;
# vv now you can delete everything above this shebang vv


#!/usr/bin/env fish

# no need to source in production, all files in `~/.config/fish/functions/` and
# `~/.config/fish/conf.d` will be sourced`
source _utils.fish
# but is that worth mentioning?

function your-new-function -a argument

    argparse 'help' 'debug' -- $argv

    if test (_is_debug_mode $debug)
        set -S directory_to_watch
        set -S argv
    end

    # alright, programmer
    # show us some programming

    if test (is_debug_mode $debug)
        set -l
        printf "%s finished" (status -f)
    end

end
