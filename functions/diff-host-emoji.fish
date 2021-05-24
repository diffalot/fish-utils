#!/usr/bin/env fish

function diff-host-emoji -a new_emoji
    # TODO(alice) this logic seems redundant and confusing
    # new emoji will be set universally, but they only exist as overrides in
    # this function
    set -l emoji_length (string length $new_emoji)
    #echo length "$emoji_length"
    if test "$emoji_length" = "1"
        #echo length (string length $new_emoji)
        #if test 1 -eq (string length $new_emoji)
            #echo setting $new_emoji as temporary override
            set -l hex_emoji ( \
                # echo without the new line
                printf "%s" $new_emoji | \
                # a tip from https://apple.stackexchange.com/questions/331995/display-emoji-faces-for-correct-wrong-commands-in-terminals
                hexdump -C | \
                # remove any group of 8 digits
                sed -r "s/[0-9]{8}//g" | \
                # remove all spaces
                sed -r "s/ //g" | \
                # cut out the remaining column
                sed -r "s/\|....\|//" | \
                # escape every group of hex digits
                sed -r "s/../\\\x&/g" \
            )
            #echo -e $hex_emoji
            #echo -e $new_emoji
            set -g diff_host_emoji_override $hex_emoji
        #end
    end
    # if an override has been set, use it
    if test -n "$diff_host_emoji_override"
        #echo -e override $diff_host_emoji_override
        set -U diff_host_emoji $diff_host_emoji_override
        # else use the default defined for this hostname
    else
        switch (hostname)
            case 'o.lo'
                set -U diff_host_emoji 💃
            case 'Le-Guin.local'
                set -U diff_host_emoji 🌈
            case '*'
                set -U diff_host_emoji 👻
        end
    end
    echo -e $diff_host_emoji
end

    #printf "%s %s\n" \$diff_host_emoji: $diff_host_emoji
    #set --show diff_host_emoji
    #printf "%s %s\n" "printf \$new_emoji:" $new_emoji
    #echo "echo \$new_emoji: " $new_emoji
    #set --show new_emoji
    #echo "\$diff_host_emoji_override: " $diff_host_emoji_override
