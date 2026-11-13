---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/bypassDampers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire pour amortisseurs à canaux de dérivation (bypass shocks, type tout-terrain/Trophy truck) : l'amortissement d'une poutre change selon son déplacement le long de zones successives. À chaque pas physique il mesure le déplacement de la poutre d'amortisseur par rapport à sa longueur au repos et applique via `obj:setBoundedBeamDamp` les coefficients de la zone correspondante. Il joue aussi un son de soupape quand le sens de déplacement s'inverse. Ordre d'appel : `defaultOrder = 80`.
--- Accès : contrôleur `bypassDampers` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_bypassDampers
---@field defaultOrder number 80 : rang d'appel par défaut.
---@field type string "auxiliary".
local controller_bypassDampers = {}

--- Retrouve les poutres des amortisseurs par nom et construit la liste triée des zones d'amortissement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/bypassDampers.lua:138
---@param jbeamData table Données jbeam du contrôleur.
function controller_bypassDampers.init(jbeamData) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/bypassDampers.lua:203
function controller_bypassDampers.initLastStage() end

--- Lit les réglages des sons de soupape depuis le jbeam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/bypassDampers.lua:127
---@param jbeamData table Données jbeam du contrôleur.
function controller_bypassDampers.initSounds(jbeamData) end

--- Vide (rien à remettre à zéro).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/bypassDampers.lua:124
function controller_bypassDampers.reset() end

--- Pas physique : pour chaque amortisseur, calcule déplacement et vitesse, détecte l'inversion de sens (son de soupape), trouve la zone courante et applique ses coefficients d'amortissement si elle a changé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/bypassDampers.lua:36
---@param dt number Pas physique en secondes.
function controller_bypassDampers.update(dt) end

--- Chaque frame : joue les sons de soupape mis en attente par update.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/bypassDampers.lua:105
---@param dt number Pas de temps en secondes (non utilisé).
function controller_bypassDampers.updateGFX(dt) end

return controller_bypassDampers
