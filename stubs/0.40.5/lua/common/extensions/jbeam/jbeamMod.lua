---@meta
-- tim19Atlas stub generated from lua/common/extensions/jbeam/jbeamMod.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension d'exemple (commentaire du fichier : « an example of how you could add things into jbeam loading ») qui montre comment se brancher sur les deux phases de chargement JBeam. Les deux hooks se contentent d'écrire une ligne de log niveau I (« onJbeamLoadingPhase1/2 called :) »). Elle n'est pas chargée par défaut : il faut un extensions.load('jbeam_jbeamMod') (ligne commentée dans le fichier).
--- Accès : extension `jbeam_jbeamMod` : `extensions.load("jbeam_jbeamMod")`, puis la globale `jbeam_jbeamMod`
---@class jbeam_jbeamMod
jbeam_jbeamMod = {}

--- Hook appelé pendant la phase 1 du chargement JBeam d'un véhicule. Ici : écrit seulement un log « onJbeamLoadingPhase1 called :) ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions/jbeam/jbeamMod.lua:14
---@param loadingProgress any Non utilisé dans ce fichier.
---@param objID integer Non utilisé (déduit du nom : id de l'objet véhicule).
---@param vehicle any Non utilisé.
---@param unifyJournal any Non utilisé.
---@param vehicleConfig table Non utilisé (déduit du nom : configuration du véhicule).
---@param vars any Non utilisé.
function jbeam_jbeamMod.onJbeamLoadingPhase1(loadingProgress, objID, vehicle, unifyJournal, vehicleConfig, vars) end

--- Hook appelé pendant la phase 2 du chargement JBeam d'un véhicule. Ici : écrit seulement un log « onJbeamLoadingPhase2 called :) ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions/jbeam/jbeamMod.lua:18
---@param loadingProgress any Non utilisé dans ce fichier.
---@param objID integer Non utilisé (déduit du nom : id de l'objet véhicule).
---@param vehicle any Non utilisé.
---@param unifyJournal any Non utilisé.
---@param vehicleConfig table Non utilisé (déduit du nom : configuration du véhicule).
---@param vars any Non utilisé.
function jbeam_jbeamMod.onJbeamLoadingPhase2(loadingProgress, objID, vehicle, unifyJournal, vehicleConfig, vars) end

