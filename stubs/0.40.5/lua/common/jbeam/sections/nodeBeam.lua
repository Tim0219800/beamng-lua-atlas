---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/nodeBeam.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traite les sections jbeam de la structure physique : nodes (calcule la position finale pos en vec3 après rotation/déplacement du composant, puis supprime posX/posY/posZ), hydros (ajoute la poutre hydraulique et applique les valeurs par défaut de vitesse, limites, source d'entrée et facteur), ropes (cordes physiques : découpe en segments de nœuds et poutres anisotropes), quads (chaque quad devient deux triangles). Vérifie aussi que les nœuds de référence existent.
--- Accès : `require("jbeam/sections/nodeBeam")`
---@class jbeam_sections_nodeBeam
local jbeam_sections_nodeBeam = {}

--- Traite nodes, hydros, ropes, quads et garantit la présence de refNodes[0].
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/nodeBeam.lua:149
---@param vehicle table Données jbeam du véhicule (modifiées en place).
function jbeam_sections_nodeBeam.process(vehicle) end

return jbeam_sections_nodeBeam
