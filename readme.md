# ***The Library of M. Diffalot***

> general fish shell utilities

# naming conventions

The patterns for installing functions into the `~/.config/fish/{functions|conf.d|completions}`
directories are prone to collisions, so it's polite to add a unique namespace at the beginning for each
project.   When I first began this library, it was hardly more than your average bohemian
neighborhood little
library library box, despite the blued steel trimmings and armed reconasaiance drones that circled
my compound at night.  I was such a sweet  young thing, pure foolishness to think I could publish a
library called `utils` and not step on anyone's toes.  

Nowadays, I make up a namespace for each project to group them together and everything else just
gets thrown in with all the other `_mdiff_{*}` files where at least they won't get lonely, poor
dears.

namespaced - this is a primary entrypoint script that may or may not call other scripts in its
namespace

namespaced-on-a-kebab - this script was designed from the ground up to be convenient for you to type
into your terminal, so typetypetype, get to it!

namespaced_on_a_wire - this is mostly for internal use, but have fun if you can make it run on it's
own and do something useful, go for it!

_namespaced_on_a_wire_and_afraid_of_heights - this is a script for scripts, keep your paws off.  it's sourced in your
shell because one of my scripts needs it, and you need my scripts, so, you see where this all ends
up, buddy-boy?? (but really do whatever you want with it, if you break it, download another)


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

