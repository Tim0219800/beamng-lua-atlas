---@meta
-- tim19Atlas stub generated from lua/console/console-lib.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque d'aide de la VM console (BeamNG sans jeu) : crée des objets Lua factices pour que le code de véhicule/physique puisse tourner hors du jeu complet, fabrique des objets `ground_model` à partir de la description JSON des matériaux de sol, et lit art/groundmodels.json. Utilisée par bananabench.
--- Accès : `require("console-lib")`
---@class console_lib
local console_lib = {}

--- Crée et remplit un objet natif `ground_model()` à partir d'une table de paramètres (coefficients de frottement, profondeur, rugosité, fluide…) avec les valeurs par défaut listées dans les notes.
---Source : lua/console/console-lib.lua:27
---@param v table Description d'un matériau de sol (entrée de art/groundmodels.json).
---@return userdata  Objet ground_model natif.
function console_lib.createGroundModel(v) end

--- Crée les globales factices nécessaires pour exécuter du code de véhicule hors du jeu (map, gameplay_statistic, core_sounds, physicsEngineEvent, vehicleReset).
---Source : lua/console/console-lib.lua:6
function console_lib.initConsole() end

--- Lit et renvoie le contenu de art/groundmodels.json.
---Source : lua/console/console-lib.lua:52
---@return table|nil  Tables des modèles de sol décodées.
function console_lib.readGroundModels() end

return console_lib
