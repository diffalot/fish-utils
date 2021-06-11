#!/usr/bin/env fish

source ../functions/_ftr_utils.fish

#(not sure if these are necessary)
set -l working_from_directory (pwd)
set -l relative_path_to_target '../functions/session.fish'
set -l names_of_functions_under_test 'session'
set -l names_of_functions_mocks 'session-tmux' 'session-nvr' '_target_exists' '_target_is_a_function'

if test (is_debug_mode($debug))
  set -l
  printf "%s finished" (status -f)
end
# Defining a function mock
# -----------------------
#
# The mock is going to record each time that it is called and what arguments
# its been given each time it was called
#
# In our prototype session function we will set up a variety of failing and
# passing results for each function and check each time we run the session
# function that it's parts were called appropriately without the full rigamarole
# of starting a neovim or tmux session.
#
# Here's our function under test without all the debug messaging that 
# I love so much, especially when I'm new to a language like I am with fish.
#
# I have very little interest in testing the debug funtions tonight, but I will
# definitely be looking at them closely and throwing some weird shit at them once I've built better
# test harnesses.
#
# ```
# function session -a requested_session
#     argparse 'h/help' 'debug' -- $argv
#
#     session-nvr $requested_session $argv
#     esession-tmux $requested_session $argv
# end
# ```
# Now let's look at the functions we'll be mocking ana how we might want them
# to respond.
#
# 1. I definitely want to test help because we definitely don't want our users
#    to fire up software that surprises them
#
#
#
#
#
#
#
#
#-------------------------------------------------------------------------------------------------
if test (is_debug_mode($debug))
  set -l
  printf "test of %s by %s is finished" (dirname under_test) (status -f) 
end
