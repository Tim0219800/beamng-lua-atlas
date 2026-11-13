---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/solarTimeOfDay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calculs solaires purs (sans appel moteur) : à partir d'une latitude, longitude, date et décalage UTC, calcule lever, midi solaire, coucher et minuit solaire, puis les convertit dans la convention de temps du jeu (tod.time : 0 = midi, 0.25 = 18h, 0.5 = minuit, 0.75 = 6h). Sert aux choix d'heure du jour (matin, après-midi, soir…) dans les menus de course rapide, et gère les cas polaires (jour ou nuit continu).
--- Accès : extension `core_solarTimeOfDay` : `extensions.load("core_solarTimeOfDay")`, puis la globale `core_solarTimeOfDay`
---@class core_solarTimeOfDay
core_solarTimeOfDay = {}

--- Construit la liste d'options d'heure du jeu. Dans un cas polaire, renvoie seulement solarMidnight et solarNoon (clés de traduction ui.quickrace.tod.*). Sinon copie chaque option fournie en y ajoutant value = valeur solaire pour sa clé (nil si inconnue).
---Source : lua/ge/extensions/core/solarTimeOfDay.lua:265
---@param state table Voir notes.
---@param options table[]|nil Options existantes avec un champ key (morning, earlyNoon, noon, lateNoon, afternoon, evening, sunset, night, sunrise…).
---@return table[]  Options avec champ value.
function core_solarTimeOfDay.buildSolarTimeOfDayOptions(state, options) end

--- Décalage horaire civil (heures) : state.utcOffset s'il est donné, sinon déduit de la longitude et de la règle d'heure d'été.
---Source : lua/ge/extensions/core/solarTimeOfDay.lua:169
---@param state table Voir notes.
---@return number|nil  Décalage en heures, nil si state est incomplet.
function core_solarTimeOfDay.getCivilOffsetHours(state) end

--- Fenêtre de nuit : début (coucher) et fin (lever) en valeurs tod.time.
---Source : lua/ge/extensions/core/solarTimeOfDay.lua:256
---@param state table Voir notes.
---@return number|nil  Début de la nuit (coucher).
---@return number|nil  Fin de la nuit (lever). nil si polaire ou state incomplet.
function core_solarTimeOfDay.getSolarNightWindow(state) end

--- Calcule les événements solaires en minutes locales : sunrise, noon, sunset, night (minuit solaire) et polar.
---Source : lua/ge/extensions/core/solarTimeOfDay.lua:200
---@param state table Voir notes.
---@return {sunrise: integer|nil, noon: integer, sunset: integer|nil, night: integer, polar: string|nil}|nil  Événements, nil si state est incomplet.
function core_solarTimeOfDay.getSolarTimeOfDayEvents(state) end

--- Valeurs tod.time nommées : sunrise, noon, sunset, night, plus morning (1/3 du lever vers midi), earlyNoon (5/9), lateNoon (40 % de midi vers coucher), afternoon (70 %) et evening (94 %) quand lever et coucher existent.
---Source : lua/ge/extensions/core/solarTimeOfDay.lua:252
---@param state table Voir notes.
---@return table<string, number>|nil  Valeurs par clé, nil si state est incomplet.
function core_solarTimeOfDay.getSolarTimeOfDayValues(state) end

--- Renvoie la valeur tod.time de l'option dont la clé est donnée parmi celles de buildSolarTimeOfDayOptions.
---Source : lua/ge/extensions/core/solarTimeOfDay.lua:291
---@param key string Clé d'option.
---@param state table Voir notes.
---@param options table[]|nil Options candidates.
---@return number|nil  Valeur, nil si clé non texte ou introuvable.
function core_solarTimeOfDay.getTimeValueForKey(key, state, options) end

--- Convertit des minutes locales depuis minuit en valeur tod.time ((minutes/1440 - 0.5) modulo 1). Les minutes sont arrondies puis ramenées dans 0..1439.
---Source : lua/ge/extensions/core/solarTimeOfDay.lua:165
---@param minutes number Minutes depuis minuit.
---@return number|nil  Valeur tod.time (0 = midi), nil si minutes n'est pas un nombre fini.
function core_solarTimeOfDay.timeFromMinutes(minutes) end

--- Convertit un temps normalisé en heure du jeu en suivant le soleil réel : 0 à 0.25 = midi vers coucher, 0.25 à 0.5 = coucher vers minuit, 0.5 à 0.75 = minuit vers lever, 0.75 à 1 = lever vers midi. En cas polaire, utilise seulement le midi solaire. Sans événements solaires valides, renvoie le temps normalisé inchangé.
---Source : lua/ge/extensions/core/solarTimeOfDay.lua:173
---@param normalizedTime number Temps normalisé ; ramené dans 0..1 par modulo.
---@param state table Voir notes.
---@return number|nil  Valeur tod.time ; -1 si normalizedTime est négatif ; nil si non numérique.
function core_solarTimeOfDay.timeFromNormalizedTime(normalizedTime, state) end

