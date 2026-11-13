---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/lapTimes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_lapTimes` : prépare pour l'UI (appli de temps au tour) les chronos d'une course du système de course « race » : temps courant, tour et segment courants, historique des tours et segments, meilleurs temps, écarts au précédent/meilleur. Elle est alimentée par les fonctions update*FromRace(race, playerId) appelées par le moteur de course, mémorise les résultats dans quatre tables (rapide, lente, statique, placements) et les envoie à l'UI dans onUpdate sous forme de streams guihooks `lapTimes_fast`, `lapTimes_slow`, `lapTimes_static`, `lapTimes_placement`.
--- Accès : extension `core_lapTimes` : `extensions.load("core_lapTimes")`, puis la globale `core_lapTimes`
---@class core_lapTimes
core_lapTimes = {}

--- Formate un temps en secondes au format MM:SS.mmm ; avec addSign, préfixe '+' (>= 0) ou '-' pour les écarts.
---Source : lua/ge/extensions/core/lapTimes.lua:92
---@param timeInSeconds number|nil Temps en secondes (négatif accepté avec addSign).
---@param addSign boolean|nil true = ajoute le signe.
---@return string|nil  Texte formaté ; nil si timeInSeconds est nil.
function core_lapTimes.formatTime(timeInSeconds, addSign) end

--- Qualifie un écart de temps pour l'affichage.
---Source : lua/ge/extensions/core/lapTimes.lua:109
---@param val number Écart en secondes (positif = plus lent).
---@return string  'worse', 'better' ou 'same'.
function core_lapTimes.getDiffFlavor(val) end

--- Réinitialise tout l'état (statut 'stopped', tours, segments, meilleurs temps, tables de streams) et demande un envoi complet des quatre streams à l'UI.
---Source : lua/ge/extensions/core/lapTimes.lua:53
function core_lapTimes.initialize() end

--- Hook du nouveau système de course : configure totalLaps, totalSegments (nombre de pathnodes triés) et closedCircuit à partir de l'objet race.
---Source : lua/ge/extensions/core/lapTimes.lua:641
---@param race table Objet course (lapCount, path.pathnodes.sorted, path.config.closed).
function core_lapTimes.newRaceStart(race) end

--- Hook du nouveau système de course : appelle onRaceStop.
---Source : lua/ge/extensions/core/lapTimes.lua:654
function core_lapTimes.newRaceStop() end

--- Démarre le suivi d'une course : appelle initialize puis lit le nombre de tours et de segments dans meta, passe le statut à 'started' et demande l'envoi des quatre streams. Sans effet si meta est nil.
---Source : lua/ge/extensions/core/lapTimes.lua:665
function core_lapTimes.onRaceStart() end

--- Passe le statut à 'stopped' et demande l'envoi des quatre streams.
---Source : lua/ge/extensions/core/lapTimes.lua:147
function core_lapTimes.onRaceStop() end

--- Hook par image : envoie à l'UI (guihooks.queueStream) les streams marqués comme à envoyer puis efface les drapeaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/lapTimes.lua:595
---@param dtReal number Non utilisé.
---@param dtSim number Non utilisé.
---@param dtRaw number Non utilisé.
function core_lapTimes.onUpdate(dtReal, dtSim, dtRaw) end

--- Met à jour totalLaps, totalSegments et closedCircuit pour les champs présents dans config.
---Source : lua/ge/extensions/core/lapTimes.lua:120
---@param config table {totalLaps?, totalSegments?, closedCircuit?}.
function core_lapTimes.setConfiguration(config) end

--- Calcule les valeurs rapides pour un joueur : temps depuis le départ, durée du tour et du segment courants (avec le temps de fin figé quand la course est terminée) et prépare le stream rapide.
---Source : lua/ge/extensions/core/lapTimes.lua:156
---@param race table Objet course.
---@param playerId integer Clé de race.states.
function core_lapTimes.updateFastFromRace(race, playerId) end

--- Vide et prépare le stream de placements (vide : fonctionnalité non implémentée, TODO dans le code).
---Source : lua/ge/extensions/core/lapTimes.lua:572
---@param race table Objet course.
---@param playerId integer Non utilisé.
function core_lapTimes.updatePlacementFromRace(race, playerId) end

--- Recalcule l'historique pour un joueur : statut, tour/segment courants, meilleur tour, meilleurs segments par index, diffs, listes lapTimes/segmentTimes/combinedTimes et prépare le stream lent.
---Source : lua/ge/extensions/core/lapTimes.lua:242
---@param race table Objet course.
---@param playerId integer Clé de race.states.
function core_lapTimes.updateSlowFromRace(race, playerId) end

--- Met à jour les valeurs statiques (nombre de tours, nombre de segments, circuit fermé) à partir de la course et prépare le stream statique.
---Source : lua/ge/extensions/core/lapTimes.lua:546
---@param race table Objet course.
---@param playerId integer Non utilisé.
function core_lapTimes.updateStaticFromRace(race, playerId) end

