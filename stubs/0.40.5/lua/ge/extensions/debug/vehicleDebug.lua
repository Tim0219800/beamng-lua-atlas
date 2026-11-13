---@meta
-- tim19Atlas stub generated from lua/ge/extensions/debug/vehicleDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Affichage de debug au-dessus de chaque véhicule actif : quand il est activé, onUpdate dessine avec debugDrawer l'id du véhicule, sa position et la rotation (quaternion) de son nœud de référence, au-dessus de sa boîte englobante. Le changement d'état est signalé à l'UI par le guihook vehicleDebugInfoEnabledChanged. L'état est conservé lors d'un rechargement Lua.
--- Accès : extension `debug_vehicleDebug` : `extensions.load("debug_vehicleDebug")`, puis la globale `debug_vehicleDebug`
---@class debug_vehicleDebug
---@field dependencies string[] {'ui_imgui'}.
debug_vehicleDebug = {}

--- Envoie au véhicule la taille de la fenêtre principale (bdebug.receiveViewportSize(largeur, hauteur)). Sans effet si le véhicule n'existe pas.
---Source : lua/ge/extensions/debug/vehicleDebug.lua:30
---@param vehId integer Id du véhicule.
function debug_vehicleDebug.bdebugRequestViewportSize(vehId) end

--- Retourne l'état d'affichage.
---Source : lua/ge/extensions/debug/vehicleDebug.lua:21
---@return boolean  true si activé.
function debug_vehicleDebug.getDebugEnabled() end

--- Hook de rechargement Lua : restaure debugEnabled.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/debug/vehicleDebug.lua:61
---@param serializedData table|nil État retourné par onSerialize.
function debug_vehicleDebug.onDeserialized(serializedData) end

--- Hook de rechargement Lua : retourne {debugEnabled}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/debug/vehicleDebug.lua:67
---@return table  État à conserver.
function debug_vehicleDebug.onSerialize() end

--- Hook de mise à jour : dessine les informations de debug de chaque véhicule actif si l'affichage est activé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/debug/vehicleDebug.lua:38
---@param dt number Delta temps (s).
function debug_vehicleDebug.onUpdate(dt) end

--- Active ou désactive l'affichage et notifie l'UI.
---Source : lua/ge/extensions/debug/vehicleDebug.lua:25
---@param value boolean Nouvel état.
function debug_vehicleDebug.setDebugEnabled(value) end

--- Inverse l'état d'affichage et notifie l'UI (vehicleDebugInfoEnabledChanged).
---Source : lua/ge/extensions/debug/vehicleDebug.lua:16
function debug_vehicleDebug.toggleDebugEnabled() end

