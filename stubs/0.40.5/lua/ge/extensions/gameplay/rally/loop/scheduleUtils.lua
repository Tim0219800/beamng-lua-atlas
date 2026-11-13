---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petites fonctions utilitaires de calcul d'horaires pour les boucles de rallye : arrondi à la minute supérieure, conversion de créneaux (slots) minutes vers secondes, calcul du prochain créneau, comparaison de temps avec tolérance. Tous les temps sont en secondes.
--- Accès : extension `gameplay_rally_loop_scheduleUtils` : `extensions.load("gameplay_rally_loop_scheduleUtils")`, puis la globale `gameplay_rally_loop_scheduleUtils`
---@class gameplay_rally_loop_scheduleUtils
gameplay_rally_loop_scheduleUtils = {}

--- Ajoute la durée du créneau au temps courant puis, par défaut, arrondit à la minute supérieure.
---Source : lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua:27
---@param currentTime number Temps courant en secondes.
---@param slotSizeMinutes number|nil Taille du créneau en minutes (défaut 1).
---@param roundToMinute boolean|nil true par défaut ; false pour ne pas arrondir.
---@return number  Prochain créneau en secondes.
function gameplay_rally_loop_scheduleUtils.calculateNextSlotTime(currentTime, slotSizeMinutes, roundToMinute) end

--- Teste si newTime est strictement supérieur à currentTime + tolérance.
---Source : lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua:45
---@param newTime number Temps à tester.
---@param currentTime number Temps de référence.
---@param tolerance number|nil Tolérance en secondes (défaut 0).
---@return boolean  true si newTime > currentTime + tolerance.
function gameplay_rally_loop_scheduleUtils.isLaterTime(newTime, currentTime, tolerance) end

--- Arrondit un temps à la minute supérieure : ceil(t / 60) * 60.
---Source : lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua:11
---@param timeSecs number Temps en secondes.
---@return number  Temps arrondi, en secondes.
function gameplay_rally_loop_scheduleUtils.roundToNextMinute(timeSecs) end

--- Convertit une taille de créneau de minutes en secondes (1 minute par défaut si nil).
---Source : lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua:18
---@param slotSizeMinutes number|nil Taille du créneau en minutes.
---@return number  Secondes.
function gameplay_rally_loop_scheduleUtils.slotMinutesToSeconds(slotSizeMinutes) end

