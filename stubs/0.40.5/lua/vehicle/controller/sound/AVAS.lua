---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/sound/AVAS.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de système d'alerte sonore pour piétons (AVAS) des véhicules électriques. Joue une boucle « avant » en modes D/S, une boucle « arrière » en R, et rien sinon ou au-dessus de la vitesse maximale (+1 m/s) ; le paramètre de pitch/volume dépend de la vitesse.
--- Accès : contrôleur `sound/AVAS` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_sound_AVAS
---@field type string "auxiliary".
local controller_sound_AVAS = {}

--- Ne fait rien (la configuration est lue dans initSounds).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sound/AVAS.lua:62
---@param jbeamData table Données jbeam.
function controller_sound_AVAS.init(jbeamData) end

--- Crée les deux sources sonores en boucle et lit vitesse maximale et volume. Appelé par le moteur à l'initialisation des sons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sound/AVAS.lua:65
---@param jbeamData table Données jbeam.
function controller_sound_AVAS.initSounds(jbeamData) end

--- Arrête les deux sons et remet l'état à « stopped ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sound/AVAS.lua:56
function controller_sound_AVAS.reset() end

--- Chaque frame : choisit l'état (avant/arrière/arrêté) selon le rapport et la vitesse, joue/arrête les sons et ajuste le paramètre de vitesse.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sound/AVAS.lua:22
---@param dt number Pas de temps en secondes.
function controller_sound_AVAS.updateGFX(dt) end

return controller_sound_AVAS
