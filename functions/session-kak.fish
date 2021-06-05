function session-kak
    set -l session (basename (pwd))
    set kak_sessions (kak -l)
    set -S session
    set -S kak_sessions

    set -l session_exists (contains $session kak_sessions)

    if test -n session_exists[1]
        echo joining $session
        session -c $session $argv
    else
        echo starting $session
        session -s $session $argv
    end
    
    set -l
end
