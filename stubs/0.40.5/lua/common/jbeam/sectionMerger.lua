---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sectionMerger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fusionne des sections jbeam entre elles pour la rétrocompatibilité : la section triggers2 est versée dans triggers et rails2 dans rails. Les lignes fusionnées reçoivent originSection (nom de la section d'origine), la section source est supprimée pour ne pas être traitée plus loin, et sectionRenames est mis à jour (triggers2 -> triggers, rails2 -> rails).
--- Accès : `require("jbeam/sectionMerger")`
---@class jbeam_sectionMerger
local jbeam_sectionMerger = {}

--- Fusionne triggers2 dans triggers et rails2 dans rails, et enregistre ces renommages dans sectionRenames.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sectionMerger.lua:70
---@param vehicle table Données jbeam du véhicule (modifiées en place).
---@param sectionRenames table<string, string> Table ancien nom vers nouveau nom, complétée par la fonction.
---@return boolean  Toujours true.
function jbeam_sectionMerger.process(vehicle, sectionRenames) end

return jbeam_sectionMerger
