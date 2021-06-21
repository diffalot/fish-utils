#!/usr/bin/env fish

source _ftr_utils.fish

# event hub, decision maker
# listens for variable changes and emits events
# events go down the stack to trigger actions and variables changes are 
# listened for where they were created
# 
# file:///usr/local/Cellar/fish/3.2.2_1/share/doc/fish/cmds/emit.html
# 
# Activity_Group_Controller 
# _prefix_HUB_ABC_Admin_Belt_Control
# (_ftr_HUB_FCD_File_Change_Directorate)
#          AGC is the abbreviation for the group name, essentially, which hub?
#              the hubis identified as the controller by the capitalized group name
#              without any tasks mentioned, better example might be
#       user scripts interact with hubs
#
# event handlers
# _prefix_sv__ABC_belt_tensioner (subscribes to events and updates variables)
# _prefix__vp_ABC_belt_tension_monitor (processes uupdates from beld tensioners and updates managers 
           #                           
# _prefix_svp_ABC_belt_tension_manager (observes whole tensioning process and provides status and reports for hub)
# (any process that is not at least 2 of svp must not be expected to survive)
# function names :
#   _ftr : standard lib namespace
#   _s : subscribes to an event (S if subscribes to _many_ (means it should probably be broken apart))
#   _v : communicates upstream via variables 
#   _p : publishes events for subscribers to act on (P if subscribes to more than one(similarly, is probably doing too much))
#   _EVENT_NAME or .. : the event the function tracks
#   _action : what this function does
# 
# event name: _ftr_e_EVENT_NAME
#   _ftr : standard lib namespace
#   _e : this is an event

function ftr_watch_plugin_directory -a directory_to_watch

    argparse 'help' 'debug' -- $argv

    if test ( _is_debugMode $debug )
        set -S directory_to_watch
        set -S argv
    end
    
    # list all files in all appropriate subdirectories of our shell plugin, and
    # we'll sort them into three main groups
    #
    # 1. Tests - we want to run these when files change, depending on how long
    #     the test suite is, we will want to avoid running every test for every
    #     file change.  But let's not think about thfat quite yet.
    #
    # 2. Functions - we want to make connections between our tests, and our
    #     functions, and I see two relatively easy ways of doing so, one
    #     has an uknown risk, and then a third option that sounds miserable  
    #
    #    a. Make sure functions and tests have the exact saame
    #        root names so that whenever a function changes we know exactly which
    #        one to run
    #
    #   b. We can also search through the text in our files and build
    #       a dependency graph, but this would take me a long time to put
    #       together because I know next about the field, but I know I would
    #       baby-sit a baby groot in a heartbeat.  Can you imagine the
    #       shenanigans? It'd be a constant stream of antics--wheew, I  need to
    #       sit down for a minute.  Also the dependency graph of a small
    #       project might just be the whole project.
    #
    #   c. I swear I did not come up with this idea, but you're just going to
    #       have to believe me on that if ya can.  I was thinking--I was **not**
    #       thinking about doing this until someone ran up to me while I was in
    #       line for my tuesday roast at the dilly and stapled this heinous
    #       plan to my forehead, I know! Why is it alway meeeee!  But once
    #       I decoded it I realized they were syggesting that we come up with
    #       somethink like a vim modeline that o maintain it maually, would manually list the
    #       dependencies and we'd have to maintain it.  You would have been so
    #       proud of me .  I said nope! and whistled my way out the door.
    #
    #
    #
    #onchange -k --initial "$directory/**/*.fish"  -- $command
    #
    # OMG, I just saw this after reading that, ans I was trulyy frightened for
    # a minute, but them I remembered theat we're goint to take a huge
    # ;shortcut and hot write our own file system even watcd, and actually I
    # m the one who put those there   


    if test (is_debug_mode $debug)
        set -l
        printf "%s finished" (status -f)
    end

end

# fswatch would take to long to configure right now :<
# From http://emcrisostomo.github.io/fswatch/doc/1.7.0/fswatch.html/Tutorial-Introduction-to-fswatch.html
# And https://stackoverflow.com/questions/34713278/fswatch-to-watch-only-a-certain-file-extension
# TODO Double check this event
#fswatch -0 --latency 1 --event=414 --exclude "*" --include "\.fish" --recursive $directory | xargs -0 -n 2 -I {} $command {}

