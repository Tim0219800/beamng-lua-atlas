---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/fadeScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_fadeScreen` : `extensions.load("ui_fadeScreen")`, puis la globale `ui_fadeScreen`
---@class ui_fadeScreen
---@field delayFrames number
ui_fadeScreen = {}

---Source : lua/ge/extensions/ui/fadeScreen.lua:61
---@param fadeIn any
---@param pause any
---@param fadeOut any
---@param screenData any
---@param args any
function ui_fadeScreen.cycle(fadeIn, pause, fadeOut, screenData, args) end

---Source : lua/ge/extensions/ui/fadeScreen.lua:42
---@param fade any
---@param args any
function ui_fadeScreen.fadeFromBlack(fade, args) end

---Source : lua/ge/extensions/ui/fadeScreen.lua:61
---@param fadeIn any
---@param pause any
---@param fadeOut any
---@param screenData any
---@param args any
function ui_fadeScreen.fadeSequence(fadeIn, pause, fadeOut, screenData, args) end

--- screenData = content {image, title, text} that is displayed during the pause phase
---Source : lua/ge/extensions/ui/fadeScreen.lua:15
---@param fade any
---@param screenData any
---@param args any
function ui_fadeScreen.fadeToBlack(fade, screenData, args) end

---Source : lua/ge/extensions/ui/fadeScreen.lua:97
function ui_fadeScreen.isBlack() end

---Source : lua/ge/extensions/ui/fadeScreen.lua:75
function ui_fadeScreen.onGuiUpdate() end

--- this delay is needed so we can be sure that the screen is completely black before moving on.
---Source : lua/ge/extensions/ui/fadeScreen.lua:70
---@param state any
function ui_fadeScreen.onScreenFadeStateDelayed(state) end

--- screenData = content {image, title, text} that is displayed during the pause phase
---Source : lua/ge/extensions/ui/fadeScreen.lua:15
---@param fade any
---@param screenData any
---@param args any
function ui_fadeScreen.start(fade, screenData, args) end

---Source : lua/ge/extensions/ui/fadeScreen.lua:42
---@param fade any
---@param args any
function ui_fadeScreen.stop(fade, args) end

