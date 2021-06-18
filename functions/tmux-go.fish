function tmux-go --description 'toggles if tmux is has colors applied to the status bar backgroud' --argument action
switch action
case test $action == 'hide'
tmux set -g status off
case test string match $action 'trans' 'transparent' 'dim' 'disappear'  'clear'
tmux set -g status-style 'bg=default'
tmux set -g status-bg default
case test "$action" == 'show'
tmux set -g status on
case '*'
printf 'Sorry, tmux doesn\'t '
set_color red --reverse --bold 
printf " %s " $action 
set_color normal
printf '. They would happily '
set_color green --reverse --italic
printf ' hide, show, trans, dim, or clear ' 
set_color normal
printf ' for you... \n'
set_color normal
end
end
