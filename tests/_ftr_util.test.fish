#!/usr/bin/env fish

source ../functions/_ftr_utils.fish

#(not sure if these are necessary)
set -l working_from_directory (pwd)
set -l relative_path_to_target '../functions/session.fish'
set -l names_of_functions_under_test 'session'
set -l names_of_functions_mocks 'session-tmux' 'session-nvr' '_target_exists' '_target_is_a_function'

if test is_debug_mode $debug
  set -l
  printf "%s finished" status -f
end
#
#
#-------------------------------------------------------------------------------------------------
if test is_debug_mode $debug
  set -l
  printf "test of %s by %s is finished" (dirname under_test) (status -f)
end
