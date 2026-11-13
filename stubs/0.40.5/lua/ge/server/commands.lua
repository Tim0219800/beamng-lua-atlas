---@meta
-- tim19Atlas stub generated from lua/ge/server/commands.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : globale `commands`
---@class commands
---@field getGame any
---@field onSettingsChanged any
commands = {}

---Source : lua/ge/server/commands.lua:128
---@param player any
---@param plan any
function commands.applyDropPlayerAtCameraNoResetPlan(player, plan) end

--- camera modifier for normal speed (typically alt+scrollwheel)
---Source : lua/ge/server/commands.lua:53
---@param val any
function commands.changeCameraSpeed(val) end

---Source : lua/ge/server/commands.lua:73
---@param player any
function commands.dropCameraAtPlayer(player) end

---Source : lua/ge/server/commands.lua:82
---@param player any
function commands.dropPlayerAtCamera(player) end

---Source : lua/ge/server/commands.lua:148
---@param player any
function commands.dropPlayerAtCameraNoReset(player) end

---Source : lua/ge/server/commands.lua:140
---@param player any
function commands.dropPlayerAtCameraNoResetImpl(player) end

---Source : lua/ge/server/commands.lua:31
function commands.getCamera() end

---Source : lua/ge/server/commands.lua:164
function commands.getCameraTransformJson() end

---Source : lua/ge/server/commands.lua:8
function commands.initCamera() end

---Source : lua/ge/server/commands.lua:27
---@param player any
function commands.isFreeCamera(player) end

--- retrocompat
---Source : lua/ge/server/commands.lua:58
---@param usingPlayerVehicle any
function commands.onNodegrabStart(usingPlayerVehicle) end

---Source : lua/ge/server/commands.lua:66
---@param usingPlayerVehicle any
function commands.onNodegrabStop(usingPlayerVehicle) end

---Source : lua/ge/server/commands.lua:106
---@param player any
function commands.planDropPlayerAtCameraNoReset(player) end

---Source : lua/ge/server/commands.lua:98
---@param player any
function commands.resetDropPlayerAtCameraNoResetCamera(player) end

--- function used by C++ side, if you rename or move, you need to edit C++ side too
---Source : lua/ge/server/commands.lua:40
---@param player any
function commands.setCameraFree(player) end

--- retrocompat
---Source : lua/ge/server/commands.lua:33
---@param player any
function commands.setCameraPlayer(player) end

--- function used by C++ side, if you rename or move, you need to edit C++ side too
---Source : lua/ge/server/commands.lua:40
---@param player any
function commands.setFreeCamera(player) end

---Source : lua/ge/server/commands.lua:170
---@param json any
function commands.setFreeCameraTransformJson(json) end

--- function used by C++ side, if you rename or move, you need to edit C++ side too
---Source : lua/ge/server/commands.lua:33
---@param player any
function commands.setGameCamera(player) end

---Source : lua/ge/server/commands.lua:156
---@param player any
function commands.toggleCamera(player) end

--- camera modifier for faster speed (typically shift key)
---Source : lua/ge/server/commands.lua:48
---@param enabled any
function commands.toggleFastSpeed(enabled) end

---Source : lua/ge/server/commands.lua:222
function getCameraForward() end

---Source : lua/ge/server/commands.lua:226
function getCameraFov() end

---Source : lua/ge/server/commands.lua:224
function getCameraFovDeg() end

---Source : lua/ge/server/commands.lua:225
function getCameraFovRad() end

---Source : lua/ge/server/commands.lua:219
function getCameraPosition() end

---Source : lua/ge/server/commands.lua:223
function getCameraQuat() end

---Source : lua/ge/server/commands.lua:221
function getCameraRight() end

---Source : lua/ge/server/commands.lua:220
function getCameraUp() end

---Source : lua/ge/server/commands.lua:213
---@param fovDeg any
function setCameraFov(fovDeg) end

---Source : lua/ge/server/commands.lua:197
---@param fovDeg any
function setCameraFovDeg(fovDeg) end

---Source : lua/ge/server/commands.lua:207
---@param fovRad any
function setCameraFovRad(fovRad) end

---Source : lua/ge/server/commands.lua:192
---@param px any
---@param py any
---@param pz any
---@param rx any
---@param ry any
---@param rz any
---@param rw any
function setCameraPosRot(px, py, pz, rx, ry, rz, rw) end

