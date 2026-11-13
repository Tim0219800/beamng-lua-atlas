---@meta
-- tim19Atlas stub generated from lua/common/jbeam/scaling.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étape de post-traitement jbeam qui applique les clés « scaleXxx » : pour toute clé numérique nommée scale suivie d'un nom (ex. scaleNodeWeight), multiplie la valeur de la clé voisine Xxx (ex. NodeWeight) par ce facteur, puis supprime la clé scale. Parcourt récursivement toutes les sections de type dictionnaire, sauf celles ignorées par jbeam/utils (ignoreSections).
--- Accès : `require("jbeam/scaling")`
---@class jbeam_scaling
local jbeam_scaling = {}

--- Applique les clés scaleXxx sur tout le véhicule (en place).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/scaling.lua:12
---@param vehicle table Données jbeam du véhicule.
function jbeam_scaling.process(vehicle) end

return jbeam_scaling
