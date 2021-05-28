#!/usr/bin/env fish

function font-test
    base16 default-dark
    msgcat --color=test
    echo $TERM
    if test -n $TMUX tmux info | grep -e RGB -e Tc
    echo -e '\e[3m this text should be italicized, and you should begin editing in nvim via $TERM soon. \e[23m'
    ~/.tmux/24-bit-color.sh
    sleep 7
    nvim -p ~/.config/kitty/kitty.conf
    if test -z $TMUX
        tmux kill-session
        tmux kill-session
        killall tmux
        echo "starting a new tmux session"
        tmux new-session -d -s font-test
        tmux send-keys -t 'font-test:1.1' fish SPACE ~/font-test.fish
        sleep 3
        echo "entering tmux session"
        sleep 1
        tmux a -t font-test
        echo "you have left the tmux session"
    end
end

font-test
