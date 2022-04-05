# Hammerspoon Setup

[Hammerspoon](http://www.hammerspoon.org) lets you automate Mac OSX tasks.  I use it to save and restore window arrangements
using a hotkey combo.  To set it up:

1. `brew install hammerspoon`
2. Download [ArrangeDesktop spoon](https://github.com/Hammerspoon/Spoons/blob/master/Spoons/ArrangeDesktop.spoon.zip)
3. Save the script below into `~/.hammerspoon/init.lua`
4. Go to Hammerspoon menu (Hammer icon) and reload config
5. Now you can hit the key combo below and get the menu!

### init.lua script

```lua
-- Download the spoon from https://github.com/Hammerspoon/Spoons/blob/master/Spoons/ArrangeDesktop.spoon.zip
-- If you hit the hotkey pop up menu allows you to set new configuration or load one. Hit ESC to exit
spoon = hs.loadSpoon("ArrangeDesktop")
if spoon then
  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "D", function()
    local m = hs.menubar.new()
    local items = spoon.addMenuItems()
    m:setMenu(items)
    m:popupMenu({x = 100, y = 100})
  end)
else
  hs.alert("Please download ArrangeDesktop spoon!")
end
```