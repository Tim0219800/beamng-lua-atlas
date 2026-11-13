---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/propAnimation/dualAxisLever.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire d'animation d'un levier à deux axes (levier de boîte automatique type P R N D S M avec grille). Lit le nom du mode courant (electrics.values.gear par défaut), le met en file puis déplace le levier virtuel mode par mode (en passant par les modes intermédiaires), éventuellement via des coordonnées intermédiaires (modeChanges), et publie la position dans electrics dualAxisX / dualAxisY. Gère les modes S et M (avec modes impulsionnels M+ et M-).
--- Accès : contrôleur `propAnimation/dualAxisLever` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_propAnimation_dualAxisLever
---@field type string "auxiliary".
---@field updateGFX function nop au chargement, puis updateGFX interne après init.
local controller_propAnimation_dualAxisLever = {}

--- Lit coordonnées des modes, modes impulsionnels, changements de mode, sons et lisseurs ; démarre sur le premier mode de la liste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/propAnimation/dualAxisLever.lua:271
---@param jbeamData table Données jbeam du contrôleur.
function controller_propAnimation_dualAxisLever.init(jbeamData) end

--- Remet position, file de modes, états de mouvement et lisseurs à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/propAnimation/dualAxisLever.lua:249
---@param jbeamData table Données jbeam.
function controller_propAnimation_dualAxisLever.reset(jbeamData) end

return controller_propAnimation_dualAxisLever
