---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veGeneralData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre 'General Data' du Vehicle Editor live. Chaque frame, elle envoie au VM du véhicule une commande qui renvoie (via obj:queueGameEngineLua) une table dans vEditor.generalData : position, rotation, direction, roll/pitch/yaw, vitesse, accélérations (sensors.gx2/gy2/gz2), vitesse air/sol, température, pression, densité de l'air et dégâts. Elle les affiche avec des unités lisibles.
--- Accès : extension `editor_vehicleEditor_liveEditor_veGeneralData` : `extensions.load("editor_vehicleEditor_liveEditor_veGeneralData")`, puis la globale `editor_vehicleEditor_liveEditor_veGeneralData`
---@class editor_vehicleEditor_liveEditor_veGeneralData
---@field menuEntry string 'General Data'.
editor_vehicleEditor_liveEditor_veGeneralData = {}

--- Restaure l'état d'ouverture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veGeneralData.lua:101
---@param data table Table de onSerialize.
function editor_vehicleEditor_liveEditor_veGeneralData.onDeserialized(data) end

--- Renvoie {windowOpen}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veGeneralData.lua:95
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veGeneralData.onSerialize() end

--- Appelé chaque frame : demande les données au véhicule et dessine le tableau à deux colonnes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veGeneralData.lua:20
function editor_vehicleEditor_liveEditor_veGeneralData.onUpdate() end

--- Ouvre la fenêtre.
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veGeneralData.lua:91
function editor_vehicleEditor_liveEditor_veGeneralData.open() end

