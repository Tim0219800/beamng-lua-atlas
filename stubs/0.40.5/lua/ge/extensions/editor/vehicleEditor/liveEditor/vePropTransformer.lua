---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre 'Prop Transformer' du Vehicle Editor live : permet de choisir un prop (pièce visuelle comme un rétroviseur ou une lampe) du véhicule en visant son nœud de référence ('Pick Prop', molette pour parcourir les props superposés) puis de modifier sa transformation en direct : baseTranslation, baseTranslationGlobal (m), baseRotation, baseRotationGlobal (affichées en degrés, converties en radians pour le moteur), soit par champs numériques, soit avec le gizmo d'axes. Les valeurs « sans nodeRotate/Offset/Move » peuvent être copiées dans le presse-papiers au format JSON "x":…, "y":…, "z":… pour les coller dans le jbeam.
--- Accès : extension `editor_vehicleEditor_liveEditor_vePropTransformer` : `extensions.load("editor_vehicleEditor_liveEditor_vePropTransformer")`, puis la globale `editor_vehicleEditor_liveEditor_vePropTransformer`
---@class editor_vehicleEditor_liveEditor_vePropTransformer
---@field menuEntry string 'Prop Transformer'.
editor_vehicleEditor_liveEditor_vePropTransformer = {}

--- Restaure l'état d'ouverture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua:560
---@param data table Table de onSerialize.
function editor_vehicleEditor_liveEditor_vePropTransformer.onDeserialized(data) end

--- Renvoie {windowOpen}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua:554
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_vePropTransformer.onSerialize() end

--- Appelé chaque frame : dessine la fenêtre (bouton Pick Prop, champs de translation/rotation, boutons de copie et de gizmo).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua:452
---@param dt number Delta temps.
function editor_vehicleEditor_liveEditor_vePropTransformer.onUpdate(dt) end

--- Hook de rendu émis par editor_veMain : initialise l'état si besoin, dessine le prop choisi, applique la transformation via gizmo et exécute le picking de prop (mode 2).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua:433
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw) end

--- Quand un véhicule apparaît, oublie puis recrée son état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua:545
---@param id integer ID du véhicule.
function editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleSpawned(id) end

--- Au changement de véhicule, bascule vers l'état du nouveau véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua:541
---@param oldVehicle integer ID de l'ancien véhicule.
---@param newVehicle integer ID du nouveau véhicule.
---@param player integer Index du joueur.
function editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Ouvre la fenêtre.
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua:550
function editor_vehicleEditor_liveEditor_vePropTransformer.open() end

