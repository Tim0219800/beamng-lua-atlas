---@meta
-- tim19Atlas stub generated from lua/common/jbeam/interaction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étape de post-traitement jbeam qui charge les fichiers *.interaction.json (dossier /vehicles/common/ puis dossier du véhicule) et en fusionne les groupes d'interaction, catégories d'actions et actions. Produit vehicle.interactionGroups, vehicle.actionCategories et vehicle.inputActions, utilisés ensuite par le système d'actions d'entrée (lua/ge/extensions/core/input/actions.lua d'après le commentaire du code).
--- Accès : `require("jbeam/interaction")`
---@class jbeam_interaction
local jbeam_interaction = {}

--- Lit les fichiers d'interaction, applique les surcharges d'icônes et stocke les résultats dans vehicle.interactionGroups, vehicle.actionCategories et vehicle.inputActions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/interaction.lua:26
---@param vehicle table Données du véhicule (vehicleDirectory requis ; modifiées en place).
function jbeam_interaction.process(vehicle) end

return jbeam_interaction
