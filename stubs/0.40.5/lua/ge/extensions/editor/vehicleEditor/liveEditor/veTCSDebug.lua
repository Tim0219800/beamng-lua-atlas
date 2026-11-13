---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre 'TCS Debug' du Vehicle Editor live : trace en temps réel (600 points d'historique) les données de contrôle de traction du premier contrôleur de type 'esc' du véhicule (debugData.tcs) : facteurs de freinage par roue, glissement par roue avec seuil, facteurs d'accélérateur et glissement global. Trois graphes PlotMultiLines.
--- Accès : extension `editor_vehicleEditor_liveEditor_veTCSDebug` : `extensions.load("editor_vehicleEditor_liveEditor_veTCSDebug")`, puis la globale `editor_vehicleEditor_liveEditor_veTCSDebug`
---@class editor_vehicleEditor_liveEditor_veTCSDebug
---@field menuEntry string 'TCS'.
editor_vehicleEditor_liveEditor_veTCSDebug = {}

--- Restaure l'état d'ouverture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua:222
---@param data table Table de onSerialize.
function editor_vehicleEditor_liveEditor_veTCSDebug.onDeserialized(data) end

--- Appelé au chargement de l'extension : remplit l'historique slipThresholds de 600 zéros.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua:206
function editor_vehicleEditor_liveEditor_veTCSDebug.onExtensionLoaded() end

--- Appelé au déchargement (ne fait rien).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua:213
function editor_vehicleEditor_liveEditor_veTCSDebug.onExtensionUnloaded() end

--- Renvoie {windowOpen}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua:216
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veTCSDebug.onSerialize() end

--- Appelé chaque frame : demande les données TCS au véhicule, met à jour les historiques et dessine les graphes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua:35
---@param dt number Delta temps.
function editor_vehicleEditor_liveEditor_veTCSDebug.onUpdate(dt) end

--- Ouvre la fenêtre.
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua:201
function editor_vehicleEditor_liveEditor_veTCSDebug.open() end

