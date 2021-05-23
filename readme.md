# general fish shell utilities

## development notes

many thanks to the [tide contribution
guidelines](https://github.com/ilancosman/tide/blob/main/contributing.md)
with source code that made for a great guidebook.

- linting: [`fish --no-execute`](https://fishshell.com/docs/current/cmds/fish.html)
- formatting: ***(changes file in place)*** [`fish_indent --ansi --write`](https://fishshell.com/docs/current/cmds/fish_indent.html)
- testing: tko

example setup for a quick development loop:

```
fish --no-execute functions/setup-diff-tide-prompt.fish
fish --ansi --write
source functions/setup-diff-tide-prompt.fish

setup-diff-tide-prompt
```

