#!/usr/bin/env fish

# _target_exists
# _target_is_a_function
#
# CHECK: needs testing
function is_debug_mode -a debug \
   -d "returns true \$debug is true or the \$_ftr_debug environment variable is true"
   return test ($debug -o $_ftr_debug)
end
