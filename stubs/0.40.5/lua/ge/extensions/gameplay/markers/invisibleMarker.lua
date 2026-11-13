---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/invisibleMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur sans effet, instance renvoyée par le constructeur du module.
---@class gameplay_markers_invisibleMarker
local gameplay_markers_invisibleMarker = {}

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:38
function gameplay_markers_invisibleMarker:clearObjects() end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:23
function gameplay_markers_invisibleMarker:createObjects() end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:30
function gameplay_markers_invisibleMarker:hide() end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:8
function gameplay_markers_invisibleMarker:init() end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:42
---@param visible boolean Ignoré.
function gameplay_markers_invisibleMarker:instantFade(visible) end

--- Ne fait rien : n'ajoute aucun élément interactif.
---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:47
---@param interactData table Ignoré.
---@param interactableElements table[] Ignoré.
function gameplay_markers_invisibleMarker:interactInPlayMode(interactData, interactableElements) end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:27
---@param value boolean Ignoré.
function gameplay_markers_invisibleMarker:setHidden(value) end

--- Mémorise le cluster dans self.cluster.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:18
---@param cluster table Cluster associé.
function gameplay_markers_invisibleMarker:setup(cluster) end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:33
function gameplay_markers_invisibleMarker:show() end

--- Ne fait rien (appelée chaque frame par le gestionnaire de marqueurs).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:13
---@param data table Données de frame (ignorées).
function gameplay_markers_invisibleMarker:update(data) end

