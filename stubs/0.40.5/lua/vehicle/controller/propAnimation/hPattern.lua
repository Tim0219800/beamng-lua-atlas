---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/propAnimation/hPattern.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire d'animation d'un levier de vitesses en H (boîte manuelle). Suit le rapport engagé du device « gearbox » et déplace un levier virtuel sur deux axes (electrics hPatternAxisX / hPatternAxisY) en passant par la grille : en engagement, il se déplace d'abord en X puis en Y ; en dégagement, d'abord en Y puis en X. Joue un son d'engagement et de dégagement avec l'agressivité de passage. Les changements de rapport rapides sont mis en file (dequeue) pour être animés l'un après l'autre.
--- Accès : contrôleur `propAnimation/hPattern` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_propAnimation_hPattern
---@field type string "auxiliary".
local controller_propAnimation_hPattern = {}

--- Lit les coordonnées de la grille en H, vérifie le device de boîte et initialise sons et file de rapports.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/propAnimation/hPattern.lua:159
---@param jbeamData table Données jbeam du contrôleur.
function controller_propAnimation_hPattern.init(jbeamData) end

--- Remet le levier à (0, 0), vide la file de rapports et réinitialise lisseurs et démo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/propAnimation/hPattern.lua:142
---@param jbeamData table Données jbeam.
function controller_propAnimation_hPattern.reset(jbeamData) end

--- Chaque frame : met en file les changements de rapport, déplace le levier en X/Y, joue les sons et publie les electrics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/propAnimation/hPattern.lua:72
---@param dt number Pas de temps en secondes.
function controller_propAnimation_hPattern.updateGFX(dt) end

return controller_propAnimation_hPattern
