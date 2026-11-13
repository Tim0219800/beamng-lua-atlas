---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/trafficSignalsEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur de feux de signalisation (fenêtre « Traffic Signals Editor », menu Window > Gameplay, mode d'édition signalsEditMode). Permet de créer et placer des signaux (instances), des contrôleurs et des séquences de phases, d'éditer les définitions de contrôleur, de simuler les feux dans le niveau puis d'enregistrer le tout dans signals.json du niveau (editor.levelPath). Travaille sur les données de core_trafficSignals (newSignal, newController, newSequence, setupSignals, loadSignals). Maj + clic gauche crée un signal, clic gauche sélectionne.
--- Accès : extension `editor_trafficSignalsEditor` : `extensions.load("editor_trafficSignalsEditor")`, puis la globale `editor_trafficSignalsEditor`
---@class editor_trafficSignalsEditor
editor_trafficSignalsEditor = {}

--- Renvoie la table des éléments de l'éditeur (signaux, contrôleurs, séquences) indexée par id.
---Source : lua/ge/extensions/editor/trafficSignalsEditor.lua:257
---@return table<integer|string, table>  Éléments par id.
function editor_trafficSignalsEditor.getCurrentElements() end

--- Renvoie les données de signaux en cours d'édition (tables vivantes, non copiées).
---Source : lua/ge/extensions/editor/trafficSignalsEditor.lua:261
---@return table  {instances, controllers, sequences}.
function editor_trafficSignalsEditor.getCurrentSignals() end

--- Charge un fichier de signaux JSON et l'applique avec setCurrentSignals (format obsolète rejeté).
---Source : lua/ge/extensions/editor/trafficSignalsEditor.lua:295
---@param fileName string|nil Chemin du fichier, défaut <niveau>/signals.json.
function editor_trafficSignalsEditor.loadFile(fileName) end

--- Hook de fin de mission : force une ré-initialisation des tables à la prochaine ouverture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficSignalsEditor.lua:1879
function editor_trafficSignalsEditor.onClientEndMission() end

--- Après rechargement Lua : restaure les options et réapplique les signaux avec setCurrentSignals.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficSignalsEditor.lua:1888
---@param data table Valeur renvoyée par onSerialize.
function editor_trafficSignalsEditor.onDeserialized(data) end

--- Hook de frame de l'éditeur : dessine la fenêtre (menu File Load/Save/Clear, listes et propriétés des signaux, contrôleurs, séquences) et le rendu de debug des signaux. Initialise les tables au premier appel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficSignalsEditor.lua:1735
---@param dt number Delta de temps.
function editor_trafficSignalsEditor.onEditorGui(dt) end

--- Hook d'initialisation de l'éditeur : enregistre la fenêtre (540x600), le mode d'édition signalsEditMode avec ses raccourcis et l'entrée de menu dans le groupe Gameplay.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficSignalsEditor.lua:1900
function editor_trafficSignalsEditor.onEditorInitialized() end

--- Avant rechargement Lua : renvoie {options, signals} (signaux sérialisés).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficSignalsEditor.lua:1883
---@return table  {options, signals}.
function editor_trafficSignalsEditor.onSerialize() end

--- Hook du menu : initialise les tables si besoin, vide la sélection d'objets et affiche la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficSignalsEditor.lua:1894
function editor_trafficSignalsEditor.onWindowMenuItem() end

--- Écrit les signaux sérialisés dans un fichier JSON (jsonWriteFile) et affiche « Signals saved! » 3 s.
---Source : lua/ge/extensions/editor/trafficSignalsEditor.lua:308
---@param fileName string|nil Chemin du fichier, défaut <niveau>/signals.json.
function editor_trafficSignalsEditor.saveFile(fileName) end

--- Remplace les données de l'éditeur : réinitialise, recrée instances (pos/dir convertis en vec3), contrôleurs et séquences via core_trafficSignals, puis resélectionne les éléments courants. Sans argument, utilise les signaux du niveau (core_trafficSignals.getData()).
---Source : lua/ge/extensions/editor/trafficSignalsEditor.lua:265
---@param data table|nil {instances, controllers, sequences} ; champs manquants traités comme vides.
function editor_trafficSignalsEditor.setCurrentSignals(data) end

