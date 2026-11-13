---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/braking/compressionBrake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de frein moteur à décompression (« Jake brake » de camion). Il maintient un coefficient de 0 à 1 et des niveaux préréglés, transmet au moteur `setCompressionBrakeCoef` quand l'accélérateur est relâché, et publie quatre electrics (réglage, valeur réelle, activé, index de niveau). Il force aussi l'agressivité de conduite du contrôleur principal à 1 pendant que le frein est actif.
--- Accès : contrôleur `braking/compressionBrake` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_braking_compressionBrake
---@field type string "auxiliary".
local controller_braking_compressionBrake = {}

--- Monte ou descend d'un nombre de niveaux (borné) et applique le coefficient du niveau.
---Source : lua/vehicle/controller/braking/compressionBrake.lua:33
---@param indexChange integer Variation d'index (+1, -1...).
function controller_braking_compressionBrake.changeCompressionBrakeLevel(indexChange) end

--- Renvoie le coefficient et l'index de niveau pour la sauvegarde d'état.
---Source : lua/vehicle/controller/braking/compressionBrake.lua:79
---@return table  Table d'état (clés `<nom>Coef`, `<nom>LevelIndex`).
function controller_braking_compressionBrake.getState() end

--- Retrouve le moteur contrôlé, les noms d'electrics et les niveaux depuis le jbeam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/compressionBrake.lua:106
---@param jbeamData table Données jbeam du contrôleur.
function controller_braking_compressionBrake.init(jbeamData) end

--- Force la prochaine transmission du coefficient au moteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/compressionBrake.lua:74
---@param jbeamData table Données jbeam.
function controller_braking_compressionBrake.reset(jbeamData) end

--- Fixe directement le coefficient du frein moteur (borné à 0..1) et affiche un message UI sauf si silent.
---Source : lua/vehicle/controller/braking/compressionBrake.lua:26
---@param coef number Coefficient 0 à 1.
---@param silent boolean|nil true pour ne pas afficher de message.
function controller_braking_compressionBrake.setCompressionBrakeCoef(coef, silent) end

--- Choisit un niveau par son index (borné à 1..nombre de niveaux) et applique son coefficient.
---Source : lua/vehicle/controller/braking/compressionBrake.lua:38
---@param level integer Index de niveau (1 = premier).
---@param silent boolean|nil true pour ne pas afficher de message.
function controller_braking_compressionBrake.setCompressionBrakeLevel(level, silent) end

--- Restaure l'index de niveau et le coefficient (valeurs validées, silencieusement).
---Source : lua/vehicle/controller/braking/compressionBrake.lua:87
---@param data table|nil Table d'état.
function controller_braking_compressionBrake.setState(data) end

--- Coupe le frein s'il est actif, sinon l'active au niveau mémorisé.
---Source : lua/vehicle/controller/braking/compressionBrake.lua:43
function controller_braking_compressionBrake.toggleCompressionBrakeState() end

--- Chaque frame : calcule le coefficient réel, le transmet au moteur quand il change, gère l'override d'agressivité du contrôleur principal et met à jour les electrics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/compressionBrake.lua:51
---@param dt number Pas de temps en secondes.
function controller_braking_compressionBrake.updateGFX(dt) end

return controller_braking_compressionBrake
