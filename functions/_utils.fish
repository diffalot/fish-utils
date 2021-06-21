#!/usr/bin/env fish

function _source_directory --argument-names directory # full_tree_find regex
    # set -l $maxdepth # TODO: accept these arguments
    # set -l $regex_string 
    if test "$debug" = 'true'
        echo "Running in " (status) 
        echo "find $directory -maxdepth 1 -regex '.*\.fish\$' | sort | xargs -I {} cat {} | source"
        echo "running find in $directory for.fish files to source"
        echo (find $directory -maxdepth 1 -regex '.*\.fish\$' | sort)
        echo "And now sourcing"
    end

    find $directory -maxdepth 1 -regex '.*\.fish\$' | sort | xargs -I {} cat {} | source
end

#function flagged_help

# DOCS: all user-facing-functions should check their arguments and fail gracefully because _internal_functions should fail hard and exit with a stack trace
function source-plugin-directory --description "
- Sources all `*.fish` files in <directory>/{conf.d|functions|completions} if they exist.
- If no directory is provided, the current directory is assumed.
" \
    --argument-names target_directory

    set -l usage "source-plugin-directory <directory>"
    # if _help_flagged $argv 
    if test -z $directory
        set $target_directory (pwd)
    end
    set -l sourced_directories
    for directory in conf.d functions completions
        if test -d $directory
            _source_directory $plugin_directory/$directory
            if $status -eq 0
                set -a sourced_directories $directory
            end
        end
    end
    if test (count sourced_directories) -eq 0
        set_color yellow --bold
        echo "No `completions`, `conf.d`, or `functions` directories were found in `$target_directory` so nothing was sourced"
        set_color normal
    end
end

function setup_debug
    # if debug is set
    return 0
end

function string_is
    if set -q argv[1]
        set -l pattern
        switch $argv[1]
            case int integer
                set pattern '^[+-]?\d+$'
            case hex hexadecimal xdigit
                set pattern '^[[:xdigit:]]+$'
            case oct octal
                set pattern '^[0-7]+$'
            case bin binary
                set pattern '^[01]+$'
            case float double
                set pattern '^[+-]?(?:\d+(\.\d+)?|\.\d+)$'
            case alpha
                set pattern '^[[:alpha:]]+$'
            case alnum
                set pattern '^[[:alnum:]]+$'
            case '*'
                echo "unknown class..." >&2
                return
        end
        set argv match --quiet --regex -- $pattern $argv[3]
    end
end


# random, useless, and cool

function color_check 
    color_blast $argv
end

function color_blast
    if tput cols > 99
        crunchbang;
    end
    if tput cols > 55
        crunchbang-mini;
        colorview;
        crunchbang;
        color-support;
        alpha;
    end
    if tput cols > 99
        hex-block;
        colortest; 
        crunchbang;
    end
    colorwheel
end
