---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre principale « Race Tool » de l'éditeur de courses/chemins (menu Gameplay > Race/Path Editor, mode d'édition « Edit Races »). Elle gère le fichier de course courant (*.race.json, dossier par défaut /gameplay/races/) : charger, sauvegarder, nouvelle course, copie depuis un Time Trials de scénario, liste de toutes les courses. Elle héberge les sous-fenêtres (pathnodes, segments, startPositions, trackLayout, timeTrials, tools) et une fenêtre « Race Test » (testing). Les chargements passent par l'historique d'édition (annuler/rétablir). Le chemin courant est un objet gameplay/race/path.
--- Accès : extension `editor_raceEditor` : `extensions.load("editor_raceEditor")`, puis la globale `editor_raceEditor`
---@class editor_raceEditor
editor_raceEditor = {}

--- Indique si le gizmo d'édition est autorisé : vrai quand le mode d'édition courant est « Edit Races ».
---Source : lua/ge/extensions/editor/raceEditor.lua:551
---@return boolean  true si le mode d'édition courant est celui de l'éditeur de course.
function editor_raceEditor.allowGizmo() end

--- Appelle autoConfig() puis getAiPath() sur le chemin courant pour recalculer la route IA (et la distance aiPathDistance).
---Source : lua/ge/extensions/editor/raceEditor.lua:28
function editor_raceEditor.calculateAiRoute() end

--- À appeler quand le chemin courant a été modifié hors de la fenêtre : redonne le chemin à la sous-fenêtre active (setPath).
---Source : lua/ge/extensions/editor/raceEditor.lua:555
function editor_raceEditor.changedFromExternal() end

--- Renvoie le chemin complet du fichier de course courant (dossier + nom).
---Source : lua/ge/extensions/editor/raceEditor.lua:552
---@return string  Par défaut « /gameplay/races/NewRace.race.json ».
function editor_raceEditor.getCurrentFilename() end

--- Renvoie l'objet gameplay/race/path en cours d'édition.
---Source : lua/ge/extensions/editor/raceEditor.lua:553
---@return table  Objet chemin de course (pathnodes, segments, startPositions…).
function editor_raceEditor.getCurrentPath() end

--- Renvoie la sous-fenêtre « tools » de l'éditeur de course.
---Source : lua/ge/extensions/editor/raceEditor.lua:567
---@return table  Instance du module raceEditor/tools.
function editor_raceEditor.getToolsWindow() end

--- Indique si la fenêtre « Race Tool » est affichée.
---Source : lua/ge/extensions/editor/raceEditor.lua:554
---@return boolean  Visibilité de la fenêtre raceEditorTool.
function editor_raceEditor.isVisible() end

--- Lit un fichier .race.json, construit un nouveau chemin (onDeserialized), recalcule la route IA et valide une action d'historique « Set path to <nom> » pour le remplacer. Ne fait rien si filename est nil ; logue une erreur si le fichier est introuvable.
---Source : lua/ge/extensions/editor/raceEditor.lua:79
---@param filename string|nil Chemin du fichier .race.json.
---@return table|nil  currentPath (voir notes : peut être l'ancien chemin).
function editor_raceEditor.loadRace(filename) end

--- Appelé après un rechargement Lua avec l'état sauvegardé ; restaure le chemin, le nom et le dossier du fichier, puis recalcule la route IA.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor.lua:520
---@param data table|nil Table de onSerialize : path, previousFilepath, previousFilename.
function editor_raceEditor.onDeserialized(data) end

--- Appelé à chaque frame. Dessine la fenêtre Race Tool (menu File, listes, onglets des sous-fenêtres) et repasse en mode objectSelect si la fenêtre est masquée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor.lua:254
function editor_raceEditor.onEditorGui() end

--- Déclare le mode d'édition raceEditMode, enregistre la fenêtre (500x500) et l'entrée de menu, puis instancie les sous-fenêtres et la fenêtre de test.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor.lua:471
function editor_raceEditor.onEditorInitialized() end

--- Déclare la catégorie de préférences raceEditor (directionalNodes, showAiRoute, showCustomFields, useSimpleDrag).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor.lua:535
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_raceEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Si la fenêtre masquée est raceEditorTool, repasse en mode objectSelect.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor.lua:499
---@param windowName string Nom de la fenêtre masquée.
function editor_raceEditor.onEditorToolWindowHide(windowName) end

--- Appelé avant un rechargement Lua ; sérialise le chemin courant et le dernier dossier/nom de fichier.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor.lua:511
---@return table  {path, previousFilepath, previousFilename}.
function editor_raceEditor.onSerialize() end

--- Hook de mise à jour ; dessine la fenêtre « Race Test » (testingWindow:draw(dtSim)) quand elle est ouverte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor.lua:113
---@param dtReal number Delta temps réel (non utilisé).
---@param dtSim number Delta temps de simulation passé à la fenêtre de test.
---@param dtRaw number Delta temps brut (non utilisé).
function editor_raceEditor.onUpdate(dtReal, dtSim, dtRaw) end

--- Si la fenêtre qui prend le focus est raceEditorTool, active le mode d'édition raceEditMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor.lua:505
---@param windowName string Nom de la fenêtre.
function editor_raceEditor.onWindowGotFocus(windowName) end

--- Sérialise une course et l'écrit en JSON (jsonWriteFile, joli format). Met à jour le dossier et le nom de fichier mémorisés.
---Source : lua/ge/extensions/editor/raceEditor.lua:67
---@param race table|nil Chemin de course à sauvegarder ; si nil, utilise le chemin courant.
---@param savePath string Chemin complet du fichier de sortie.
function editor_raceEditor.saveRace(race, savePath) end

--- Ouvre la fenêtre « Race Test », lui donne le chemin courant et prépare la course de test (testingWindow:setupRace).
---Source : lua/ge/extensions/editor/raceEditor.lua:106
function editor_raceEditor.setupRace() end

--- Vide la sélection, affiche la fenêtre Race Tool et active le mode d'édition raceEditMode.
---Source : lua/ge/extensions/editor/raceEditor.lua:447
function editor_raceEditor.show() end

