# Alacritty

## Configure bindings for Ctrl+Enter and Shift+Enter

In `~/.config/alacritty/alacritty.yml` add the following bindings:
```
  - { key: Return,  mods: Shift,                         chars: "\x1b[13;2u"              }
  - { key: Return,  mods: Control,                       chars: "\x1b[13;5u"              }
```

Source: https://stackoverflow.com/a/42461580
