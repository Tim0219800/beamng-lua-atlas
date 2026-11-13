---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/propAnimation/sequentialLever.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire d'animation d'un levier séquentiel : à chaque changement de rapport du device « gearbox » (rapport monté = levier poussé, rapport descendu = levier tiré), il fait osciller une valeur lissée entre -1, 0 et 1 publiée dans electrics.values.sequentialLeverY, et joue un son de levier (montée / descente) avec l'agressivité de passage comme paramètre.
--- Accès : contrôleur `propAnimation/sequentialLever` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_propAnimation_sequentialLever
---@field type string "auxiliary".
local controller_propAnimation_sequentialLever = {}

--- Récupère le device de boîte, vérifie son type et lit les sons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/propAnimation/sequentialLever.lua:59
---@param jbeamData table Données jbeam du contrôleur.
function controller_propAnimation_sequentialLever.init(jbeamData) end

--- Remet l'état du levier et le lisseur à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/propAnimation/sequentialLever.lua:52
---@param jbeamData table Données jbeam.
function controller_propAnimation_sequentialLever.reset(jbeamData) end

--- Chaque frame : détecte le changement de rapport, lisse l'impulsion, joue le son et publie la valeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/propAnimation/sequentialLever.lua:28
---@param dt number Pas de temps en secondes.
function controller_propAnimation_sequentialLever.updateGFX(dt) end

return controller_propAnimation_sequentialLever
