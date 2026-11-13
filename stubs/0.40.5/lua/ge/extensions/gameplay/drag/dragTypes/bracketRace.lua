---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de course « bracket race » : chaque pilote annonce un dial (temps visé) et gagne en s'en approchant sans le battre. Chargée par gameplay_drag_core quand dragType vaut 'bracketRace'. Chaque frame, onUpdate fait avancer chaque racer local (updateRacer puis la fonction de phase de phaseHandlers nommée comme la phase : stage, countdown, race, stop, emergencyStop), puis déclenche les changements de phase de groupe selon le mode (solo, hôte MP, client MP). startActivity règle les délais de départ d'après les dials (setDialsData).
--- Accès : extension `gameplay_drag_dragTypes_bracketRace` : `extensions.load("gameplay_drag_dragTypes_bracketRace")`, puis la globale `gameplay_drag_dragTypes_bracketRace`
---@class gameplay_drag_dragTypes_bracketRace
---@field dependencies string[] gameplay_drag_core, gameplay_drag_phaseHandlers.
gameplay_drag_dragTypes_bracketRace = {}

--- Construit la liste classée des résultats : chaque entrée contient vehId, lane, time (timer important), dialDiff, dialNotSet, isPlayable, disqualified. Ordre : écarts positifs croissants, puis breakouts (écart absolu croissant), puis disqualifiés/sans dial (joueurs d'abord, puis couloir, puis vehId).
---Source : lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua:127
---@param dragData table Données de course avec racers.
---@return table[]  Liste des résultats, {} si pas de racers.
function gameplay_drag_dragTypes_bracketRace.generateWinData(dragData) end

--- Hook de chargement : récupère les références vers core et phaseHandlers et remet l'activité à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua:34
function gameplay_drag_dragTypes_bracketRace.onExtensionLoaded() end

--- Hook par frame, actif uniquement quand l'activité est démarrée : simule les racers locaux, appelle la fonction de leur phase, change de phase quand elle est complétée (sans dépendance), marque la course terminée et gère l'avancement groupé des phases selon solo/hôte/client.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua:59
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta brut (s).
function gameplay_drag_dragTypes_bracketRace.onUpdate(dtReal, dtSim, dtRaw) end

--- Arrête l'activité (hasActivityStarted = false).
---Source : lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua:40
function gameplay_drag_dragTypes_bracketRace.resetDragRace() end

--- Démarre l'activité : dragData.isStarted = true et calcule les délais de départ de chaque racer d'après la valeur de son timer dial (phaseHandlers.setDialsData). Appelée par core.startDragRaceActivity.
---Source : lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua:44
function gameplay_drag_dragTypes_bracketRace.startActivity() end

