#!/usr/bin/env fish
function _diffalot_host_emoji
    echo "Here is a work"
    #if test -n $_diffalot_host_emoji_override
    #  echo $_diffalot_host_emoji_override
    #  exit
    # if an override has been set, use it
    # else use the default defined for this hostname
    #else
    echo (hostname)
    switch (hostname)
        case 'o.lo'
            echo '🌈'
        case 'Le-Guin.local'
            echo '💃'
        case '*'
            echo 👻
    end
    #end
end
