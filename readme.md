# general fish shell utilities

## Sessions and Projects

if a file is opened from within a project directory, I should immmediately trasported into
 an ide for that project with the docs and all that waiting for me.

 An IDE is a tmux session with the readme opened in tab 1 in neovim in tmux window 1 along with whatever project file 
  I've opened. in neovim tab 2

I need a way to split off just a single tab from nvim and transfer it to another neovim running in a different window of tmux??
that might be overkill

how about if I open a file that's already in another ....

I need to see how far I can get with nvr and tmux

- [ ] open nvim server in a detached tmux session in a specific pane with specific files open in specific tab
- [ ] get a list of current nvim sessions and which tmux sessions they are in and where
- [ ] transfer a single nvim buffer, window, tab, session from one nvim server to another (start from session, that ctrl space might take care of it all)
- [ ] insure nvim opens up in the first window of tmux and pushes everything back in line
- [ ] can nvim open up a tmux pane with nnn or fzf next to it? can it receive file selections back?

Starting a session
- [ ] nvim and tmux start, taking their session name from the directory basename
- [ ] if a session is there, nvim joins it, if not nvim creates it
- [ ] if nvim was called from a terminal inside tmux, nvim will push other panes out till it's a total of 2 or three panes left, including neovim (ordered by recent access) 

- https://github.com/mhinz/neovim-remote python remote control


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

