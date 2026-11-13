---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/levelValidator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil « Level Validator » de l'éditeur (menu Window > Debug). Le bouton « Find issues » lance un job qui cherche dans le niveau les objets dupliqués, flottants (non plantés sur le terrain), les splines mal configurées (moins de 2 nœuds) et les échelles nulles ou quasi nulles, pour les objets de scène et les éléments de forêt. Les résultats sont triables, ignorables, et certains corrigeables (suppression des doublons, sans undo possible). Les résultats peuvent être lus par d'autres modules via getLevelLogs.
--- Accès : extension `editor_levelValidator` : `extensions.load("editor_levelValidator")`, puis la globale `editor_levelValidator`
---@class editor_levelValidator
---@field dependencies table<integer, string> {"core_forest"}.
editor_levelValidator = {}

--- Renvoie la liste brute des problèmes trouvés (entrées avec logLevel, type, objectId, message…).
---Source : lua/ge/extensions/editor/levelValidator.lua:894
---@return table  levelLogs.
function editor_levelValidator.getLevelLogs() end

--- Renvoie les problèmes regroupés par type lisible (Duplicated Object, Floating Object, Spline Misconfigured, Duplicated Forest Item, Floating Forest Item, et « Zero or Near-Zero Scale »). Chaque entrée est enrichie du nom et de la position de l'objet, et d'une position/rotation de caméra (15 m derrière l'objet).
---Source : lua/ge/extensions/editor/levelValidator.lua:897
---@return table  {elementsByType = {[i] = {type, count, elements}}}.
function editor_levelValidator.getLevelLogsAggregated() end

--- Appelé au démarrage d'un niveau : réinitialise les dimensions du terrain, les logs et l'état de vérification.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/levelValidator.lua:876
function editor_levelValidator.onClientStartMission() end

--- Appelé après la sauvegarde du niveau. Corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/levelValidator.lua:884
---@param state any Non utilisé.
function editor_levelValidator.onEditorAfterSaveLevel(state) end

--- Dessine la fenêtre de l'outil (bouton Find issues, liste filtrable et triable, actions).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/levelValidator.lua:578
function editor_levelValidator.onEditorGui() end

--- Enregistre la fenêtre « levelValidator » et l'entrée de menu « Level Validator » (groupe Debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/levelValidator.lua:856
function editor_levelValidator.onEditorInitialized() end

--- Si extendedLogs change, vide les résultats et réinitialise l'état de vérification.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/levelValidator.lua:888
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_levelValidator.onEditorPreferenceValueChanged(path, value) end

--- Enregistre la catégorie de préférences levelValidator.general (extendedLogs, columnSizes caché).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/levelValidator.lua:865
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_levelValidator.onEditorRegisterPreferences(prefsRegistry) end

--- Hook de chargement : écrit un log Debug « initialized ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/levelValidator.lua:861
function editor_levelValidator.onExtensionLoaded() end

--- Lance la validation du niveau dans un job (core_jobsystem, période 0.04) et passe l'état à « recherche en cours ».
---Source : lua/ge/extensions/editor/levelValidator.lua:567
function editor_levelValidator.startLevelValidation() end

--- Comparateurs de tri des colonnes de la liste de résultats (a et b sont deux entrées de log).
---@class editor_levelValidator_sortingFunctions
local editor_levelValidator_sortingFunctions = {}

--- Tri par uniqueErrorCode (0 si absent).
---Source : lua/ge/extensions/editor/levelValidator.lua:45
---@param a table Entrée de log.
---@param b table Entrée de log.
---@return boolean  a avant b.
function editor_levelValidator_sortingFunctions.Code(a, b) end

--- Tri par message.
---Source : lua/ge/extensions/editor/levelValidator.lua:51
---@param a table Entrée de log.
---@param b table Entrée de log.
---@return boolean  a avant b.
function editor_levelValidator_sortingFunctions.Description(a, b) end

--- Tri par champ filename.
---Source : lua/ge/extensions/editor/levelValidator.lua:71
---@param a table Entrée de log.
---@param b table Entrée de log.
---@return boolean  a avant b.
function editor_levelValidator_sortingFunctions.File(a, b) end

--- Tri par champ lineNumber (0 si absent).
---Source : lua/ge/extensions/editor/levelValidator.lua:77
---@param a table Entrée de log.
---@param b table Entrée de log.
---@return boolean  a avant b.
function editor_levelValidator_sortingFunctions.Line(a, b) end

--- Tri par logLevel (chaîne).
---Source : lua/ge/extensions/editor/levelValidator.lua:39
---@param a table Entrée de log.
---@param b table Entrée de log.
---@return boolean  a avant b.
function editor_levelValidator_sortingFunctions.LogLevel(a, b) end

--- Tri par nom de l'objet a.object (chaîne vide si absent).
---Source : lua/ge/extensions/editor/levelValidator.lua:63
---@param a table Entrée de log.
---@param b table Entrée de log.
---@return boolean  a avant b.
function editor_levelValidator_sortingFunctions.ObjectName(a, b) end

--- Tri par champ origin (chaîne vide si absent).
---Source : lua/ge/extensions/editor/levelValidator.lua:57
---@param a table Entrée de log.
---@param b table Entrée de log.
---@return boolean  a avant b.
function editor_levelValidator_sortingFunctions.Origin(a, b) end

