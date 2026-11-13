---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil 'Other/Vehicle Spawner' du Vehicle Editor live. Au chargement de l'éditeur il mémorise jusqu'à 20 véhicules (Car ou Truck) de core_vehicles.getVehicleList. La fenêtre permet de faire apparaître un véhicule à la position/orientation de la caméra (fenêtre 'Select Vehicle'), de choisir un point sur le terrain (molette = rotation de 5°) puis d'y aligner tous les véhicules de la liste (espacés de 10 m), et de tout supprimer ('Despawn All').
--- Accès : extension `editor_vehicleEditor_liveEditor_veVehicleSpawner` : `extensions.load("editor_vehicleEditor_liveEditor_veVehicleSpawner")`, puis la globale `editor_vehicleEditor_liveEditor_veVehicleSpawner`
---@class editor_vehicleEditor_liveEditor_veVehicleSpawner
---@field menuEntry string 'Other/Vehicle Spawner'.
editor_vehicleEditor_liveEditor_veVehicleSpawner = {}

--- Restaure l'état d'ouverture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua:172
---@param data table Table de onSerialize.
function editor_vehicleEditor_liveEditor_veVehicleSpawner.onDeserialized(data) end

--- Appelé à l'initialisation de l'éditeur : remplit vehsList avec les 20 premiers véhicules Car/Truck.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua:152
function editor_vehicleEditor_liveEditor_veVehicleSpawner.onEditorInitialized() end

--- Renvoie {windowOpen}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua:166
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veVehicleSpawner.onSerialize() end

--- Appelé chaque frame : dessine la fenêtre, les repères de départ et la fenêtre de sélection de véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua:113
function editor_vehicleEditor_liveEditor_veVehicleSpawner.onUpdate() end

--- Ouvre la fenêtre.
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua:148
function editor_vehicleEditor_liveEditor_veVehicleSpawner.open() end

