hs.window.animationDuration = 0
local function getWinList(name)
   return hs.window.filter.new(false):setAppFilter(name, { currentSpace = true }):getWindows()
end

local function launchOrNextWindow(name, id)
   local findName = name
   local appName = hs.application.frontmostApplication():name()
   if findName ~= appName then
      if id then
       hs.application.launchOrFocusByBundleID(id)
      else
       hs.application.launchOrFocus(name)
      end
   else
       local wlist = getWinList(findName)
       local wcount = #wlist
       if wcount > 1 then
           hs.eventtap.keyStroke({'cmd'}, '`')
       else
           local win = wlist[1]
           if win:isMinimized() then
             win:unminimize()
           else
             -- win:minimize()
           end
       end
   end
end

hs.hotkey.bind({ 'cmd' }, 'i', function()
   launchOrNextWindow('Alacritty')
end)

hs.hotkey.bind({ 'alt' }, 'g', function()
   launchOrNextWindow('Google Chrome')
end)

hs.hotkey.bind({ 'alt' }, 'f', function()
  launchOrNextWindow('Lark');
end)

hs.hotkey.bind({ 'alt' }, 'a', function()
  launchOrNextWindow('WeChat');
end)

hs.hotkey.bind({ 'alt' }, 'i', function()
   launchOrNextWindow('iterm')
end)

hs.hotkey.bind({ 'alt' }, 'v', function()
   launchOrNextWindow('', 'com.microsoft.VSCode')
end)

hs.hotkey.bind({ 'alt' }, 'u', function()
   launchOrNextWindow('', 'com.electron.lark.iron')
end)

