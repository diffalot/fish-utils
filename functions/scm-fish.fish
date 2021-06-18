#!/usr/bin/env fish

# no need to source in production, all files in `~/.config/fish/functions/` and
# `~/.config/fish/conf.d` will be sourced`
source _mdiff_utils.fish
# but is that worth mentioning?

function scm-fish -a cmd

    argparse 'help' 'debug' -- $argv

    if test _is_debugMode $debug
        set_color green
        printf '%b parsed arguments\n' (status function)
        set_color cyan --italic
        set -S cmd
        set -S help
        set -S debug
        set -S argv
        set_color normal
        echo
    end




    if test _is_debug_mode $debug
        set_color green
        printf "%b finished with environment\n" (status function)
        set_color normal
        set_color magenta --bold
        set -l
        set_color normal
    end

end
