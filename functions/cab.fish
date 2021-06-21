#!/usr/bin/env fish

function _cab_cache

    # Pre-validation
    set -l $to_cache (count $_cab_level_definitions)

    if test $to_cache -lt 5
        set_color brred --bold
        echo You must have at least five levels for logging.
        echo You currently have $to_cache levels defined in \$_cab_level_definitions
        set_color brred --italic
        set -S _cab_level_definitons
        set_color normal
        return 1
    end

    #TODO: Empty cache first
    # Cache Setup
    set -g _cab_all_names
    set -g _cab_level_names
    set -g _cab_level_fonts

    function is_valid_color -a input
        if contains $input $_cab_possible_colors
            return 0
        end
        return 1
    end

    function is_valid_flag -a input
        if contains $input $_cab_possible_flags
            return 0
        end
        return 1
    end

    for i in (seq 1 $to_cache)
        set -l level_setting $_cab_level_definitions[$i]
        set -l level_names_and_font_settings (string split % $level_setting)

        set -l level_names (string split : $level_names_and_font_settings[1])
        set -l font_attributes (string split : $level_names_and_font_settings[2])

        set -a cab_all_names $i             # I never said it was _only_ names

        for $name in $level_names
            if not contains $name $_cab_all_names
                set -a _cab_all_names $name
            if
                set_color bryellow --italic
                echo "Names can only be used on a single level; it will not be available on level $i."
                set_color normal
            end
        end

        # only add attributes that are valid
        set -l set_color_args
        for attribute in font_attributes 
            if test (is_valid_color attribute) -eq 0
                set -a set_color_args attribute
            end
            if test (is_valid_flag attribute) -eq 0
                set -a set_color_args (string join '' '--' attribute)
            end
        end
        
        # add names and fonts to the appropriate arrays
        set -a _cab_level_names 
        set -a _cab_fonts set_color_args 
        
        # we rely on the index of the log level name given in scripts to find
        # the associated font, so we check that we're on track to have that 
        # after each level setting is processed to make finding bugs easier 
        # for everyone.
        set -l recorded_names _cab_names[count _cab_names]
        set -l recorded_font  _cab_fonts[count _cab_fonts]
        # INFO these are light checks that can be toughened up if necessary
        if test (test (string join ':' recorded_names) != $level_names) \
            -o  (not contains font_attributes[1] recorded_font)
            echo
            echo '============================================================='
            echo
            set -l
            echo
            status stack-trace
            echo
            status fish-path
            status filename
            status current-command
            status function
            status line-number
            echo
            echo '============================================================='
            echo
            set_color brred --bold
            echo "Unkown failure recording $level_names from $level_setting.  We'd love to fix it, please send us the command output we just filled your screen with to alice@gigantic,computer"
            set_color normal
            return 1
        end

    end

    # Post-validation
    set -l total_cached_names (count $_cached_names)
    set -l total_cached_fonts (count $_cached_fonts)

    if test $total_cached_names -ne $total_cached_fonts
        set_color brred --bold
        echo We wound up with $total_cached_names levels and $total_cached_fonts fonts and we were looking for $to_setup
        set_color brred --italic
        set -S _cab_names
        set_color normal
        set_color brred --bold
        set_color normal
        return 1
    end
end

function _cab_setup
    set -g _cab_ready false
    if not set -q _cab_display_less_than
        set -g _cab_display_less_than 2
    end

    if not set -q _cab_level_definitions
        set -g _cab_level_definitions error:fail%brred/black \
                             warn:DANGER:please:well%bryellow/black \
                             info:NOTE:ok%brblue \
                             debug:oof:%brgreen \
                             trace:well%cyan 
    end

    set -g _cab_possible_flags bold dim italics reverse underline
    set -g _cab_possible_colors (set_color --print-colors)

    _cab_cache; and set _cab_ready true
end

function get_level_index_for -a level_name
    for level in $_cab_level_names
        if contains $level_name $level
            printf '%i' (contains --index $level_name $level)
        end
    end
    return -1
end

function get_color_args_for level_name
    set -l level_index (get_level_index_for $level_name)
    if $level_index -gt 0
        printf $_cab_level_fonts[$level_index]
    end
end

function cab -a level show_vars
    set -l first_message 2
    switch $show_vars
        case show_vars show vars
        set first_message 3
        set show_vars true
    end
    for i in (seq $first_message (count $argv))
        if not test "$_cab_ready" = 'true'
            printf "%s\n" $argv[$i]
        else
            eval set_color (get_color_args_for $level || printf "%s\n" "red --bold")
            printf "%s\n"
        end
    end
    if test $show_vars = 'true'
        for i in (seq 1 (count $argv))
            set -S $argv[i]
        end
    end
end
