---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/assorted.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Post-traitement de deux sections jbeam diverses. (1) Section engine : construit engine.waterDamage.nodes en concaténant les listes de nœuds issues des liens de groupe _group_nodes et _engineGroup_nodes de waterDamage (nœuds dont la noyade endommage le moteur). (2) Section soundscape : transforme la liste d'entrées en dictionnaire indexé par leur champ name. Appelé par le chargeur après la résolution des liens de groupe.
--- Accès : `require("jbeam/sections/assorted")`
---@class jbeam_sections_assorted
local jbeam_sections_assorted = {}

--- Applique les deux post-traitements (engine.waterDamage.nodes et soundscape) en place sur les données du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/assorted.lua:10
---@param vehicle table Données jbeam du véhicule.
function jbeam_sections_assorted.process(vehicle) end

return jbeam_sections_assorted
