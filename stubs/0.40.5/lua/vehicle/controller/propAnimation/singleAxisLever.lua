---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/propAnimation/singleAxisLever.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire d'animation d'un levier de vitesses à un seul axe (levier de boîte automatique). Convertit electrics.values.gearModeIndex en position de levier lissée (électrique de sortie) grâce à une table de coordonnées par index de mode, et joue un son de levier au début de chaque déplacement.
--- Accès : contrôleur `propAnimation/singleAxisLever` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_propAnimation_singleAxisLever
---@field type string "auxiliary".
local controller_propAnimation_singleAxisLever = {}

--- Lit la table de coordonnées, le nœud/évènement du son et le nom de l'electric de sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/propAnimation/singleAxisLever.lua:55
---@param jbeamData table Données jbeam du contrôleur.
function controller_propAnimation_singleAxisLever.init(jbeamData) end

--- Remet la position du levier à 0 et le lisseur à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/propAnimation/singleAxisLever.lua:47
---@param jbeamData table Données jbeam.
function controller_propAnimation_singleAxisLever.reset(jbeamData) end

--- Chaque frame : lisse la position vers la coordonnée du mode courant, joue le son au début du mouvement et publie la position.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/propAnimation/singleAxisLever.lua:28
---@param dt number Pas de temps en secondes.
function controller_propAnimation_singleAxisLever.updateGFX(dt) end

return controller_propAnimation_singleAxisLever
