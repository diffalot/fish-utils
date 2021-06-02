# general fish shell utilities

## Fish shell programming guides and information

[zero lenght string testing](https://stackoverflow.com/questions/47743015/fish-shell-how-to-check-if-a-variable-is-set-empty#:~:text=test%20%2Dn%20%22%24var%22,true%20if%20it%20is%20empty)

## development notes

many thanks to the [tide contribution
guidelines](https://github.com/ilancosman/tide/blob/main/contributing.md)
with source code that made for a great guidebook.

- linting: [`fish --no-execute`](https://fishshell.com/docs/current/cmds/fish.html)
- formatting: ***(changes file in place)*** [`fish_indent --write`](https://fishshell.com/docs/current/cmds/fish_indent.html)
- testing: tko

example setup for a quick development loop:

```
fish --no-execute functions/setup-diff-tide-prompt.fish
fish --ansi --write
source functions/setup-diff-tide-prompt.fish

setup-diff-tide-prompt
```

