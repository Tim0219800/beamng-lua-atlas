---@meta
-- tim19Atlas stub generated from lua/common/jbeam/groups.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étape de post-traitement du chargement jbeam pour la colonne/champ « group » des lignes (nœuds, poutres, etc.). Convertit chaque liste group = {"a","b"} en table indexée par un numéro de groupe global et attribue à la ligne firstGroup (numéro du premier groupe non vide). Produit vehicle.groups, la table nom de groupe vers numéro (numérotation à partir de 0).
--- Accès : `require("jbeam/groups")`
---@class jbeam_groups
local jbeam_groups = {}

--- Numérote les groupes jbeam du véhicule : remplit vehicle.groups (nom -> numéro) et transforme les champs group des lignes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/groups.lua:10
---@param vehicle table Données jbeam fusionnées du véhicule (modifiées en place).
function jbeam_groups.process(vehicle) end

return jbeam_groups
