---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veCrashTester.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil 'Other/Crash Tester' du Vehicle Editor live. On choisit un point de départ sur le terrain (molette = rotation par pas de 5°), un nombre de véhicules (1 à 15) et une vitesse cible (10 à 200 km/h). 'Run Test!' fait apparaître des voitures/camions tirés au hasard (core_vehicles.getVehicleList, Type Car ou Truck), espacés de 10 m, frein à main relâché et lancés à la vitesse cible via applyClusterVelocityScaleAdd. 'Stop Test!' supprime les véhicules.
--- Accès : extension `editor_vehicleEditor_liveEditor_veCrashTester` : `extensions.load("editor_vehicleEditor_liveEditor_veCrashTester")`, puis la globale `editor_vehicleEditor_liveEditor_veCrashTester`
---@class editor_vehicleEditor_liveEditor_veCrashTester
---@field menuEntry string 'Other/Crash Tester' (sous-menu 'Other').
editor_vehicleEditor_liveEditor_veCrashTester = {}

--- Restaure l'état d'ouverture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veCrashTester.lua:151
---@param data table Table de onSerialize.
function editor_vehicleEditor_liveEditor_veCrashTester.onDeserialized(data) end

--- Renvoie {windowOpen}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veCrashTester.lua:145
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veCrashTester.onSerialize() end

--- Appelé chaque frame : dessine la fenêtre (curseurs, boutons) et les repères de départ (triangles rouges via debugDrawer:drawTriSolid).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veCrashTester.lua:111
function editor_vehicleEditor_liveEditor_veCrashTester.onUpdate() end

--- Ouvre la fenêtre.
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veCrashTester.lua:141
function editor_vehicleEditor_liveEditor_veCrashTester.open() end

