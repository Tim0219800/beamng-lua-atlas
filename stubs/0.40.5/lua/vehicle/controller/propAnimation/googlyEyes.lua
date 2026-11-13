---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/propAnimation/googlyEyes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire humoristique d'« yeux » de véhicule : agrandit ou rétrécit des poutres taguées (poutres d'yeux, limiteurs, attaches) selon l'accélération verticale (sensors.gz) pour faire gonfler les yeux ; ils sont à taille maximale à l'ignition 3 (démarreur).
--- Accès : contrôleur `propAnimation/googlyEyes` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_propAnimation_googlyEyes
---@field type string "auxiliary".
local controller_propAnimation_googlyEyes = {}

--- Retrouve les poutres par tag, mémorise leurs longueurs de repos et lit les coefficients jbeam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/propAnimation/googlyEyes.lua:52
---@param jbeamData table Données jbeam du contrôleur.
function controller_propAnimation_googlyEyes.init(jbeamData) end

--- Remet le lisseur de taille à 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/propAnimation/googlyEyes.lua:48
---@param jbeamData table Données jbeam.
function controller_propAnimation_googlyEyes.reset(jbeamData) end

--- Chaque frame : calcule le coefficient de taille selon sensors.gz et ajuste longueurs et bornes des poutres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/propAnimation/googlyEyes.lua:23
---@param dt number Pas de temps en secondes.
function controller_propAnimation_googlyEyes.updateGFX(dt) end

return controller_propAnimation_googlyEyes
