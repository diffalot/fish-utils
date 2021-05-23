# general fish shell utilities

## development notes

many thanks to the [tide contribution
guidelines](https://github.com/ilancosman/tide/blob/main/contributing.md)
with source code that made for a great guidebook.

- linting: [`fish --no-execute`](https://fishshell.com/docs/current/cmds/fish.html)
- formatting: ***(changes file in place)*** [`fish_indent --ansi --write`](https://fishshell.com/docs/current/cmds/fish_indent.html)
- testing: tko

example steps for a quick development loop:

```
fish --no-execute functions/setup-diff-tide-prompt.fish
fish --write functions/setup-diff-tide-prompt.fish
source functions/setup-diff-tide-prompt.fish

setup-diff-tide-prompt
```

Which could be a function

```
function dev-feedback -a source fun
    fish --no-execute $source
    fish_indent --write $source
    fish source $source
    $fun $args
end
```

That I couldn't figure out how to run with onchange

```
# npm i -g onchange
# 
# onchange --initial --kill "**/*.fish" -- \
#     dev-feedback \
#     function/setup-diff-tide-prompt.fish \
#     setup-diff-tide-prompt
```

