#!/usr/bin/env fish

function diff_host_emoji
    # if an override has been set, use it
    if test -n $diff_host_emoji_override
        echo $diff_host_emoji_override
        # else use the default defined for this hostname
    else
        switch (hostname)
            case 'o.lo'
                set -Uq diff_host_emoji 💃
                echo '💃'
            case 'Le-Guin.local'
                set -Uq diff_host_emoji 🌈
                echo '🌈'
            case '*'
                set -U diff_host_emoji 👻
                echo 👻
        end
    end
end
