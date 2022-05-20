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

-- local function mapLaunch(key, name, showName)
--    hs.hotkey.bind({}, key, function()
--        launchOrNextWindow(name, showName)
--    end)
-- end

hs.hotkey.bind({ 'cmd' }, 'i', function()
   launchOrNextWindow('Alacritty')
end)

hs.hotkey.bind({ 'alt' }, 'g', function()
   launchOrNextWindow('Google Chrome')
end)


hs.hotkey.bind({ 'alt' }, 'f', function()
  launchOrNextWindow('企业微信');
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

-- local function sysEvent(name)
--     hs.eventtap.event.newSystemKeyEvent(name, true):post()
--     hs.eventtap.event.newSystemKeyEvent(name, false):post()
-- end

-- hs.hotkey.bind({}, 'f8', function()
--     local app = hs.application.get('QQ音乐')
--     if app == nil then
--         hs.application.launchOrFocus('QQMusic')
--     else
--         -- 放在 else 里为了防止启动 iTunes
--         sysEvent('PLAY')
--     end
-- end)

hs.hotkey.bind({ 'cmd', 'alt', 'ctrl' }, 's', function()
    local currentActiveApp = hs.application.frontmostApplication();
    local name = currentActiveApp:name()
    hs.alert(name)
end)
-- function alert()
--   hs.alert.show('config1 loaded')
-- end
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
--   local timer = hs.timer.delayed.new(1000, alert)
--   timer:start()
-- end)

local switch = false
hs.hotkey.bind({ 'cmd', 'alt', 'ctrl' }, 'f', function()
  local allScreens = hs.screen.allScreens()
  local s1 = allScreens[2]
  local s2 = allScreens[3]
  if s1 ~= nil then
    s1:rotate(switch and 0 or 90)
  end
  if s2 ~= nil then
    s2:rotate(switch and 90 or 0)
  end
  switch = not switch
end)



-- hs.hotkey.bind({ 'cmd', 'alt', 'ctrl' }, 'r', function()
--   hs.eventtap.keyStroke({"cmd"}, "r", 200, hs.application.applicationsForBundleID("com.google.Chrome"))
--   hs.alert('gog')
-- end)
