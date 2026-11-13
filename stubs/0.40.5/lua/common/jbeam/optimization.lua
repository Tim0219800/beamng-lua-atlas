---@meta
-- tim19Atlas stub generated from lua/common/jbeam/optimization.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étapes de finalisation des données jbeam avant envoi à la physique. assignCIDs numérote chaque ligne des sections « valides » avec un cid continu (0, 1, 2...) dans un ordre déterministe (clés triées) et calcule vehicle.maxIDs. process réordonne les nœuds de poutres (id1 < id2), supprime les champs inutiles à l'exécution, remplace les références objet par des cid (hydros, roues), retire les sections désactivées (disableSection) puis supprime vehicle.validTables.
--- Accès : `require("jbeam/optimization")`
---@class jbeam_optimization
local jbeam_optimization = {}

--- Attribue à chaque ligne des sections listées dans vehicle.validTables un cid continu et enregistre le nombre de lignes par section dans vehicle.maxIDs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/optimization.lua:53
---@param vehicle table Données jbeam du véhicule (avec validTables), modifiées en place.
---@return boolean  Toujours true.
function jbeam_optimization.assignCIDs(vehicle) end

--- Optimise et nettoie les données du véhicule : poutres id1<id2, nettoyage des valeurs par défaut, déréférencement en cid, suppression des sections désactivées et de validTables.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/optimization.lua:218
---@param vehicle table Données jbeam du véhicule.
---@param debugEnabled boolean|nil Si vrai, conserve les champs group et engineGroup.
---@return boolean  Toujours true.
function jbeam_optimization.process(vehicle, debugEnabled) end

return jbeam_optimization
