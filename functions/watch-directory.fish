#!/usr/bin/env fish

function watch-directory -a directory
    fswatch --event=414 --exclude ".git" --recursive --one-event $directory
end

function is_command -a cmd

end

for cmd in git fswatch timeout 
    echo typeof cmd
   #if test typeof  
end
