#!/usr/bin/env fish


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
