---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/sound/linearMovement.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de sons pour un mouvement linéaire (vérin, siège, plateau, béquille…). Il mesure la longueur d'une poutre « capteur de position » (trouvée par tag), en déduit une vitesse lissée et joue : une boucle de mouvement (volume/pitch selon la vitesse, paramètre CT = direction), des sons de segment à chaque cran de segmentLength (montée/descente) et des sons de fin de course (position min/max).
--- Accès : contrôleur `sound/linearMovement` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_sound_linearMovement
---@field type string "auxiliary".
---@field updateGFX function nop au chargement, puis updateGFX interne après init réussi.
local controller_sound_linearMovement = {}

--- Retrouve la poutre capteur par tag, lit la configuration de segments/butées et crée les lisseurs de vitesse.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sound/linearMovement.lua:236
---@param jbeamData table Données jbeam du contrôleur.
function controller_sound_linearMovement.init(jbeamData) end

--- Crée la boucle de mouvement et lit les évènements et réglages sonores ; valide les seuils. Appelé par le moteur à l'initialisation des sons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sound/linearMovement.lua:178
---@param jbeamData table Données jbeam.
function controller_sound_linearMovement.initSounds(jbeamData) end

--- Remet la dernière longueur, le segment et les lisseurs à l'état initial.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sound/linearMovement.lua:171
---@param jbeamData table Données jbeam.
function controller_sound_linearMovement.reset(jbeamData) end

--- Arrête la boucle et réarme les sons de butée selon la position actuelle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sound/linearMovement.lua:163
---@param jbeamData table Données jbeam.
function controller_sound_linearMovement.resetSounds(jbeamData) end

return controller_sound_linearMovement
