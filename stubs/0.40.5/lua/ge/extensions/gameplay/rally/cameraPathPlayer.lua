---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/cameraPathPlayer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lecteur de chemin caméra renvoyé par le constructeur du module.
---@class gameplay_rally_cameraPathPlayer
local gameplay_rally_cameraPathPlayer = {}

--- Mémorise la snaproad utilisée pour produire les points du chemin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/cameraPathPlayer.lua:11
---@param snaproad table Objet fournissant pointsForCameraPath(metersBefore, metersAfter).
function gameplay_rally_cameraPathPlayer:init(snaproad) end

--- Demande les points à la snaproad (40 m avant, 20 m après), construit le chemin caméra et le lance avec core_paths.playPath. Ne fait rien si aucun point n'est renvoyé.
---Source : lua/ge/extensions/gameplay/rally/cameraPathPlayer.lua:146
function gameplay_rally_cameraPathPlayer:play() end

--- Arrête le chemin caméra en cours (core_paths.stopCurrentPath).
---Source : lua/ge/extensions/gameplay/rally/cameraPathPlayer.lua:162
function gameplay_rally_cameraPathPlayer:stop() end

