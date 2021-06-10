#!/usr/bin/env fish

function color_check
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
