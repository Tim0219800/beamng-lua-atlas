---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/flash.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Réglages du flash du mode photo. Garde en mémoire l'état du flash (activé, tir à la capture, intensité, angle, teinte, saturation) et le transmet à l'extension util/photomodeFlash, qu'il charge à la demande. Sert de façade au panneau UI du mode photo et au module de capture (ui_photomode_capture) qui déclenche les captures avec flash.
--- Accès : extension `ui_photomode_flash` : `extensions.load("ui_photomode_flash")`, puis la globale `ui_photomode_flash`
---@class ui_photomode_flash
ui_photomode_flash = {}

--- Applique un état de preset (fusion puis applyRuntimeSettings). Ne fait rien si l'argument n'est pas une table.
---Source : lua/ge/extensions/ui/photomode/flash.lua:95
---@param flashState table État du flash issu d'un preset
---@return boolean  succès
---@return string|nil  raison de l'échec
function ui_photomode_flash.applyPresetState(flashState) end

--- Si le flash est désactivé, coupe util/photomodeFlash (enable(false)). Sinon charge cette extension et appelle applyFromUi avec les réglages courants.
---Source : lua/ge/extensions/ui/photomode/flash.lua:103
---@return boolean  succès
---@return string|nil  raison de l'échec (flash_unavailable, flash_apply_failed…)
function ui_photomode_flash.applyRuntimeSettings() end

--- Fusionne dans l'état les champs présents de partialState (enabled et fireOnCapture convertis en booléens). N'agit pas sur le moteur de rendu.
---Source : lua/ge/extensions/ui/photomode/flash.lua:82
---@param partialState table Champs à modifier ; tout autre type est ignoré
---@return boolean  toujours true
function ui_photomode_flash.applyStatePatch(partialState) end

--- Renvoie une copie de l'état du flash : enabled, fireOnCapture, intensity, outerAngle, hue, saturation.
---Source : lua/ge/extensions/ui/photomode/flash.lua:63
---@return table  État sérialisable du flash
function ui_photomode_flash.buildState() end

--- Renvoie un état de flash aux valeurs par défaut, sans modifier l'état courant.
---Source : lua/ge/extensions/ui/photomode/flash.lua:78
---@return table  Valeurs par défaut
function ui_photomode_flash.captureDefaultPresetState() end

--- État du flash à enregistrer dans un preset (identique à buildState).
---Source : lua/ge/extensions/ui/photomode/flash.lua:74
---@return table  État courant
function ui_photomode_flash.capturePresetState() end

--- Nombre d'images pendant lesquelles garder l'UI masquée/figée lors d'une capture avec flash : 5 si flash activé et fireOnCapture, sinon 0.
---Source : lua/ge/extensions/ui/photomode/flash.lua:147
---@return integer  0 ou 5
function ui_photomode_flash.getCaptureUiHoldFrames() end

--- Coupe le flash côté moteur puis remet les réglages Lua aux valeurs par défaut.
---Source : lua/ge/extensions/ui/photomode/flash.lua:154
function ui_photomode_flash.resetSettings() end

--- Coupe le flash côté moteur (util/photomodeFlash.enable(false)) s'il est chargé, sans toucher aux réglages Lua.
---Source : lua/ge/extensions/ui/photomode/flash.lua:159
function ui_photomode_flash.restoreRuntimeState() end

--- Délègue une capture à util/photomodeFlash.runCapture(kind, ...) en protégeant l'appel par pcall.
---Source : lua/ge/extensions/ui/photomode/flash.lua:130
---@param kind any Type de capture transmis tel quel à util/photomodeFlash (déduit du code)
---@param ... any Arguments supplémentaires transmis tels quels
---@return boolean  true si la capture a été demandée
---@return string|nil  raison de l'échec (screenshot_request_failed par défaut)
function ui_photomode_flash.runCapture(kind, ...) end

