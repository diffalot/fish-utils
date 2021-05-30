#!/usr/bin/env fish

# pure is a great prompt, but I dont think it follows ANSI guidelines and that
# prevents it from being compatible with using the built in theme configuration
# utilities (maybe).
#
# I'm to investigate.  I just used the `fish_config` web interface to set theme to `Base16
# Default Dark` and then I set my terminal to base16 defa
#
# Here's what `fish_`

# todo(alice) make this command take arguments?
function setup-diff-tide-prompt
    # todo(alice) would it be useful to have a printer for generic
    # settings/variable changes?
    set -U tide_print_newline_before_prompt true
    set -U tide_context_always_display true
    set -U tide_pwd_truncate_margin 60

    echo "\t\tSet tide display variables:
        set -U tide_print_newline_before_prompt true
        set -U tide_context_always_display true
        set -U tide_pwd_truncate_margin 60
        "

    set -l _diff_left_prompt \
        os jobs context \
        newline \
        rust virtual_env chruby nvm status vi_mode prompt_char

    set -l _diff_right_prompt \
        cmd_duration pwd \
        newline \
        git

    _diff_print_tide_prompt_setters "Replacing prompt settings:" "$tide_left_prompt_items" "$tide_right_prompt_items"
    _diff_print_tide_prompt_setters "New prompt settings:" "$_diff_left_prompt" "$_diff_right_prompt"

    set -U tide_left_prompt_items $_diff_left_prompt
    set -U tide_right_prompt_items $_diff_right_prompt

    echo Prompt set! \(But give it a minute to show up, it\'s async.\)
end

function _diff_print_tide_prompt_setters -a intro_text left_prompt right_prompt

    echo $intro_text

    set -l _prompt_log "
set -U tide_left_prompt_items \\
    $left_prompt

set -U tide_right_prompt_items \\
    $right_prompt
"

    echo $_prompt_log | sed 's/newline /\\\\\n    newline \\\\\n    /'

end
