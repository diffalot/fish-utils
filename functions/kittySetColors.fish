function kittySetColors -a name

  set -l socket (ls /tmp/theKitty-*)

  if test -e "/Users/alice/.config/kitty/kitty-themes/themes/$name.conf"
    echo found in kitty-themes
    kitty @ --to unix:$socket set-colors -- "/Users/alice/.config/kitty/kitty-themes/themes/$name.conf"

  #echo searching for "/Users/alice/.config/kitty/base16-kitty/colors/base16-$name-256.conf"
  else if test -f "/Users/alice/.config/kitty/base16-kitty/colors/base16-$name-256.conf"
    echo $name found in base16, connecting to $socket
    kitty @ --to unix:$socket set-colors -- "/Users/alice/.config/kitty/base16-kitty/colors/base16-$name-256.conf"

  else
    # not found
    echo $name not found
    echo "see theme previews at https://github.com/dexpota/kitty-themes
    or ~/.config/kitty/kitty-themes
    or ~/.config/kitty/base16-kitty/colors
    "

  end
end
