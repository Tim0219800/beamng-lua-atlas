---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/quickraceSetup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de liaison entre le mode course rapide (scénario) et le Track Builder : quand un scénario est chargé, elle décharge les pistes en place, charge la piste personnalisée du scénario (sc.track.customData.name) via util_trackBuilder_splineTrack, ajoute les checkpoints et positionne le véhicule, éventuellement dans le sens inverse.
--- Accès : extension `util_trackBuilder_quickraceSetup` : `extensions.load("util_trackBuilder_quickraceSetup")`, puis la globale `util_trackBuilder_quickraceSetup`
---@class util_trackBuilder_quickraceSetup
util_trackBuilder_quickraceSetup = {}

--- Hook appelé au début du chargement d'un niveau ; réinitialise le drapeau done pour permettre une nouvelle installation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/trackBuilder/quickraceSetup.lua:23
function util_trackBuilder_quickraceSetup.onClientStartMission() end

--- Hook appelé quand un scénario est chargé. Si l'installation n'est pas déjà faite : unloadAll, load de la piste du scénario, addCheckPointPositions(reverse), positionVehicle(reverse).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/trackBuilder/quickraceSetup.lua:10
---@param sc table Scénario ; utilise sc.track.customData.name (nom de la piste) et sc.track.reverse (sens inverse).
function util_trackBuilder_quickraceSetup.onScenarioLoaded(sc) end

