---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/freeroam.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_multiseat_freeroam` : `extensions.load("ui_multiseat_freeroam")`, puis la globale `ui_multiseat_freeroam`
---@class ui_multiseat_freeroam
---@field dependencies table
ui_multiseat_freeroam = {}

---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:109
function ui_multiseat_freeroam.activate() end

---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:114
function ui_multiseat_freeroam.deactivate() end

--- back to regular single player freeroam: keep one vehicle for player 0, remove the rest
---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:191
---@param options any
function ui_multiseat_freeroam.exitMultiseat(options) end

---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:119
function ui_multiseat_freeroam.isActive() end

---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:343
function ui_multiseat_freeroam.onClientEndMission() end

---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:295
---@param data any
function ui_multiseat_freeroam.onDeserialized(data) end

---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:164
---@param changeSet any
---@param result any
function ui_multiseat_freeroam.onMultiseatSettingsApplied(changeSet, result) end

---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:250
function ui_multiseat_freeroam.onMultiseatSettingsClosed() end

---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:253
---@param actions any
---@param _context any
---@param registerButton any
function ui_multiseat_freeroam.onPauseHomeRailBuildMultiseatActions(actions, _context, registerButton) end

---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:280
---@param reason any
function ui_multiseat_freeroam.onSerialize(reason) end

---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:304
function ui_multiseat_freeroam.onUiReady() end

---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:155
function ui_multiseat_freeroam.openSettings() end

---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:123
function ui_multiseat_freeroam.restoreAfterReload() end

---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:129
---@param levelName any
function ui_multiseat_freeroam.startSplitscreenFreeroam(levelName) end

