---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/occupantFaces.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les visages des occupants (têtes de personnages). Charge, une fois, les pièces du slot 'skin_character_face' du véhicule /vehicles/unicycle/ pour construire la liste de visages disponibles et le matériau associé à chacun (base 'character_display'). Fournit des utilitaires pour l'interface et le tirage aléatoire, et une étape process qui enregistre tous les matériaux de visage sur chaque prop 'character_head' d'un véhicule dont le système d'occupants est activé.
--- Accès : `require("jbeam/sections/occupantFaces")`
---@class jbeam_sections_occupantFaces
local jbeam_sections_occupantFaces = {}

--- Matériau à utiliser pour un visage (matériau de base si la pièce est inconnue).
---Source : lua/common/jbeam/sections/occupantFaces.lua:43
---@param partName string Nom de pièce de visage.
---@return string  Nom de matériau.
function jbeam_sections_occupantFaces.getFaceMaterial(partName) end

--- Liste des visages {value = nom de pièce, label = nom affiché}, triés par label. Table partagée à ne pas modifier.
---Source : lua/common/jbeam/sections/occupantFaces.lua:33
---@return table[]  Options de visages.
function jbeam_sections_occupantFaces.getFaceOptions() end

--- Nom d'une pièce de visage tirée au hasard.
---Source : lua/common/jbeam/sections/occupantFaces.lua:38
---@return string  Nom de pièce.
function jbeam_sections_occupantFaces.getRandomFacePart() end

--- Indique si le nom de pièce est un visage connu.
---Source : lua/common/jbeam/sections/occupantFaces.lua:27
---@param partName string Nom de pièce.
---@return boolean  true si c'est un visage.
function jbeam_sections_occupantFaces.isFacePart(partName) end

--- Enregistre tous les matériaux de visage sur les têtes d'occupants du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/occupantFaces.lua:49
---@param vehicleObj userdata Objet véhicule moteur.
---@param vehicle table Données jbeam (occupantSystem, props).
function jbeam_sections_occupantFaces.process(vehicleObj, vehicle) end

return jbeam_sections_occupantFaces
