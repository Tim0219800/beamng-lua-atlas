---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre 'Flexbody Debug' du Vehicle Editor live, pour diagnostiquer les flexbodies (meshes déformables) du véhicule. Onglet 'Single Flexmesh' : choisir un flexbody (combo trié, favoris), régler la visibilité du mesh, afficher le flexbody choisi, picker un nœud ou un sommet (vertex) à la souris dans un rayon 'Max Dist from Cursor' (0 à 10 m) et visualiser leurs relations. Onglet 'All Flexmeshes' : trouver les sommets sans nœud proche et (mode expert) les sommets aux coordonnées hors limites. Dépend de editor_veMain.
--- Accès : extension `editor_vehicleEditor_liveEditor_veFlexbodyDebug` : `extensions.load("editor_vehicleEditor_liveEditor_veFlexbodyDebug")`, puis la globale `editor_vehicleEditor_liveEditor_veFlexbodyDebug`
---@class editor_vehicleEditor_liveEditor_veFlexbodyDebug
---@field dependencies table<integer, string> {'editor_veMain'}.
---@field menuEntry string 'Flexbody Debug'.
editor_vehicleEditor_liveEditor_veFlexbodyDebug = {}

--- Restaure l'état d'ouverture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua:1157
---@param data table Table de onSerialize.
function editor_vehicleEditor_liveEditor_veFlexbodyDebug.onDeserialized(data) end

--- Renvoie {windowOpen}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua:1151
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veFlexbodyDebug.onSerialize() end

--- Appelé chaque frame : initialise l'état du véhicule, dessine la fenêtre à onglets et les fenêtres annexes (sommets hors limites, sommets sans nœuds).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua:1108
---@param dt number Delta temps.
function editor_vehicleEditor_liveEditor_veFlexbodyDebug.onUpdate(dt) end

--- Hook de rendu émis par editor_veMain : dessine le flexbody sélectionné et exécute le picking de nœud/sommet selon le mode courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua:622
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw) end

--- Quand un véhicule apparaît, oublie ses données mémorisées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua:1143
---@param id integer ID du véhicule.
function editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleSpawned(id) end

--- Au changement de véhicule, bascule vers l'état (ou crée l'état) du nouveau véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua:1139
---@param oldVehicle integer ID de l'ancien véhicule.
---@param newVehicle integer ID du nouveau véhicule.
---@param player integer Index du joueur.
function editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Ouvre la fenêtre.
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua:1147
function editor_vehicleEditor_liveEditor_veFlexbodyDebug.open() end

