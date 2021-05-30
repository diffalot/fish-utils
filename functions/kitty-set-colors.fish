#!/usr/bin/env fish
alias kss=kitty-set-colors

# TODO: try this out it looks neat
# https://unix.stackexchange.com/a/203847/162483
function _or_default
      set -q $argv[1]; and echo $$argv[1]; or echo $argv[2]
  end

function _kitty_socket
    echo (ls /tmp/theKitty-*)
end

function ksf -a file -d "Kitty Set File - sets a file as the color scheme"
    kitty @ --to unix:(_kitty_socket) set-colors -- $file
end

function kitty-set-colors -a search_query -d \
"Kitty Set Search - search theme directories with rg for a filename match"
    set -l maybe_query

    if test -n "$search_query"
      set maybe_query \-\-query $search_query
    end
    echo sett query $maybe_query
    set -l theme (find "$HOME/.config/kitty/kitty-themes/themes" \
          "$HOME/.config/kitty/base16-kitty/colors" \
          "$HOME/Desktop/colors/iTerm2-Color-Schemes/kitty" \
          -type f | fzf --reverse --delimiter / --with-nth -1 \
          --bind "?:toggle-preview" --preview 'echo {}' \
          --preview-window hidden:up:wrap $maybe_query)

    ksf $theme
    set_color --italics;
    echo -n "setting theme to ";
    set_color --bold 00ffcc;
    echo -n (basename $theme ".conf");
    set_color --italics normal;
    echo " from ";
    set_color --dim --italics;

    set -l _t_length    (string length $theme)
    set -l _s_columns   (tput cols)

    if test $_t_length -gt $_s_columns
        echo (string sub --start (math $_t_length - $_s_columns + 1) $theme)
    else
        echo $theme
        #echo (string pad --width $_s_columns $theme)
    end
    #set -l
end
