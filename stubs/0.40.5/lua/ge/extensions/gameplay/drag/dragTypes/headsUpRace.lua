---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de course « heads-up » : départ simultané sans handicap, le meilleur temps du timer important gagne. Chargée par gameplay_drag_core quand dragType vaut 'headsUpRace'. Chaque frame, onUpdate fait avancer chaque racer local (updateRacer puis la fonction de phase de phaseHandlers : stage, countdown, race, stop, emergencyStop) et déclenche les changements de phase de groupe selon le mode (solo, hôte MP, client MP). startActivity met tous les dials à 0.
--- Accès : extension `gameplay_drag_dragTypes_headsUpRace` : `extensions.load("gameplay_drag_dragTypes_headsUpRace")`, puis la globale `gameplay_drag_dragTypes_headsUpRace`
---@class gameplay_drag_dragTypes_headsUpRace
---@field dependencies string[] gameplay_drag_core, gameplay_drag_phaseHandlers.
gameplay_drag_dragTypes_headsUpRace = {}

--- Construit la liste classée des résultats : chaque entrée contient vehId, lane, time, isPlayable, disqualified. Le plus petit temps gagne, les disqualifiés sont derniers.
---Source : lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua:134
---@param dragData table Données de course avec racers.
---@return table[]  Liste des résultats, {} si pas de racers.
function gameplay_drag_dragTypes_headsUpRace.generateWinData(dragData) end

--- Hook de chargement : récupère les références vers core et phaseHandlers et remet l'activité à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua:36
function gameplay_drag_dragTypes_headsUpRace.onExtensionLoaded() end

--- Hook par frame, actif uniquement quand l'activité est démarrée : simule les racers locaux, appelle la fonction de leur phase, change de phase quand elle est complétée (sans dépendance), marque la course terminée et gère l'avancement groupé des phases selon solo/hôte/client.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua:61
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta brut (s).
function gameplay_drag_dragTypes_headsUpRace.onUpdate(dtReal, dtSim, dtRaw) end

--- Arrête l'activité (hasActivityStarted = false).
---Source : lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua:42
function gameplay_drag_dragTypes_headsUpRace.resetDragRace() end

--- Démarre l'activité : dragData.isStarted = true et fixe un délai de dial de 0 pour chaque racer (phaseHandlers.setDialsData). Appelée par core.startDragRaceActivity.
---Source : lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua:46
function gameplay_drag_dragTypes_headsUpRace.startActivity() end

