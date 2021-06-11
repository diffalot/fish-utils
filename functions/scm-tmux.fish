#!/usr/bin/env fish
function scm-tmux -a scheme

    # don't override these unless you are very careful about it
    set -l info green
    set -l warn yellow
    set -l error red
    
    # Set defaults
    set -l darkest colour234	
    set -l lightest colour240
    set -l grayest colour234 
    set -l highligt cadetblue
    set -l counterpoint '#6a5acd' # slateblue
    
    switch $scheme
        case 'day'
            echo using $scheme scheme
            set -g darkest colour250
            set -g lightest colour242
            set -g grayest colour238      
            set -g counterpoint '#5f9ea0' # cadetblue
            set -g highlight '#2e8b57' # darkslateblue
        case 'light-green'
            echo using $scheme scheme
            set -g darkest '#20b2aa'
            set -g lightest '#f5fffa'
            set -g grayest '#00ced1'
            set -g highlight '#b1a8e5'
            set -g counterpoint '#f3dcf3' # darkslateblue
        case '*'
            echo 'no scheme set, using defaults'
    end
    
    # Copied from .tmux.config edited by hand
    tmux set -g status-bg "$darkest"
    tmux set -g status-fg "$lightest"
    tmux set -g status-style "bg=$darkest,fg=$lightest"

    tmux set-window-option -g window-status-style fg=$lightest
    tmux set-window-option -g window-status-activity-style fg=$warn,blink
    tmux set-window-option -g window-status-current-style fg=$highlight
    
    tmux set -g mode-style bg=$counterpoint,fg=$darkest
    tmux set -g message-command-style bg=$lightest,fg=$darkest
    
    tmux set -g pane-border-style fg=$grayest
    tmux set -g pane-active-border-style fg=$highlight

    tmux set-option -g message-style bg=$darkest,fg=$counterpoint,blink

    # status right
    tmux set -g status-right "#{?client_prefix,#[fg=$highlight]#[bg=$grayest],} ❰ #W #I:#P ⁂ "

    # status left
    tmux set -g status-left "#{?client_prefix,#[fg=$highlight]#[bg=$grayest],} ⁂ #S ❱❱ #[bg=$darkest,fg=$lightest]"

    # end copied shit
    #
end

#     set -g night_window_style fg=$lightest bg=$darkest
#     set -g day_window_style fg=$darkest bg=$lightest
#     set -g current_window_style (tmux show -Av window-style)
# 
#     set -g window-style $night_window_style
# 
# 
# end
# 

