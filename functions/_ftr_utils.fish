#!/usr/bin/env fish

# _target_exists
# _target_is_a_function
#
# CHECK: needs testing
function is_debug_mode -a debug \
   -d "returns true \$debug is 1 or the \$_ftr_debug environment variable is 1"
   return test ($debug -o $_ftr_debug)
end

function _ftr_gives_human_report
   return 0
end

function _ftr_is_a_number -a var
   if test (var -ge 0 -o var -lt 0)
      printf %i 0
   else
      printf %i 1
   end
end

function _ftr_indent -a padding
   set -S padding
   set -l spaces 'sed s/^/'
   for n in (seq 1 padding)
      set -a spaces " "
   end
   set -a spaces '/'

   set_color red
   echo spaces $spaces
   set_color normal

   set -l s1d (string join '' $spaces)

   echo
   set_color red
   echo sed $s1d
   set_color normal
   echo
   while read $line
      printf '%b\n' (eval $s1d $line)
   end
end
