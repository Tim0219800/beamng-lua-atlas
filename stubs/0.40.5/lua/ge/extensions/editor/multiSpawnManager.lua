---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/multiSpawnManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil d'éditeur « Vehicle Groups Manager » (menu Gameplay) pour créer, éditer, charger et sauvegarder des groupes de véhicules (fichiers .vehGroup.json) et les faire apparaître dans le monde via core_multiSpawn. Un groupe est de type « custom » (liste de véhicules choisie à la main : modèle, config, peintures) ou « generator » (paramètres : amount, allMods, allConfigs, minPop, modelPopPower, configPopPower, popDecreaseFactor, maxYear, avec lesquels core_multiSpawn.createGroup génère les véhicules). Les groupes trouvés dans vehicleGroups/ et settings/editor/vehicleGroups/ sont chargés automatiquement au premier affichage.
--- Accès : extension `editor_multiSpawnManager` : `extensions.load("editor_multiSpawnManager")`, puis la globale `editor_multiSpawnManager`
---@class editor_multiSpawnManager
---@field filePaths string[] Dossiers explorés pour charger automatiquement les groupes : {"vehicleGroups/", "settings/editor/vehicleGroups/"}. Modifiable avant le premier affichage de l'outil.
editor_multiSpawnManager = {}

--- Lit un fichier .vehGroup.json, en fait le groupe courant (après nettoyage), sélectionne son premier véhicule et l'ajoute à la liste des groupes s'il n'y est pas déjà. Écrit un avertissement dans le log si la lecture échoue.
---Source : lua/ge/extensions/editor/multiSpawnManager.lua:192
---@param filePath string Chemin du fichier .vehGroup.json.
function editor_multiSpawnManager.loadGroup(filePath) end

--- Hook d'éditeur appelé à chaque frame : dessine la fenêtre « Vehicle Groups Manager » (menus File et Tools, liste des groupes, édition du groupe, options d'apparition).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/multiSpawnManager.lua:757
---@param dt number Durée de la frame en secondes.
function editor_multiSpawnManager.onEditorGui(dt) end

--- Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre principale et trois fenêtres modales (générateur, peinture personnalisée, remplacement du groupe) et l'entrée de menu « Gameplay ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/multiSpawnManager.lua:863
function editor_multiSpawnManager.onEditorInitialized() end

--- Hook émis par core_multiSpawn une fois le groupe apparu ; remet spawnState à 0 (fait disparaître « Please wait... »).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/multiSpawnManager.lua:853
function editor_multiSpawnManager.onVehicleGroupSpawned() end

--- Handler de l'entrée de menu : initialise les tables au besoin, vide la sélection d'objets de l'éditeur et affiche la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/multiSpawnManager.lua:857
function editor_multiSpawnManager.onWindowMenuItem() end

--- Écrit le groupe courant (traité par processGroup) dans un fichier JSON et mémorise le dossier et le chemin du fichier.
---Source : lua/ge/extensions/editor/multiSpawnManager.lua:223
---@param file any Non utilisé (déduit du code).
---@param filePath string Chemin de destination.
function editor_multiSpawnManager.saveGroup(file, filePath) end

