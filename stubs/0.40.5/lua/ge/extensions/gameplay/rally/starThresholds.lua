---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/starThresholds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcule les seuils de temps des étoiles (or, argent, bronze) d'une spéciale de rallye à partir d'un temps de référence créé à la main (baseline) et de la longueur de l'étape. Or = baseline x 1,03 (rythme serré, aucune marge pour les resets). Argent et bronze = baseline x multiplicateur d'allure + une marge additive qui pardonne un certain nombre de resets par km.
--- Accès : extension `gameplay_rally_starThresholds` : `extensions.load("gameplay_rally_starThresholds")`, puis la globale `gameplay_rally_starThresholds`
---@class gameplay_rally_starThresholds
---@field bronzePaceMult number Multiplicateur d'allure du bronze (1.23).
---@field bronzeResetsPerKm number Resets par km pardonnés pour le bronze (2.233, soit ~5 resets sur les plus courtes spéciales).
---@field goldMult number Multiplicateur d'allure de l'or (1.03), volontairement serré.
---@field perResetSeconds number Secondes ajoutées par reset dans la marge : pénalité de chrono (~5 s) plus perte d'élan (~3,5 s), soit 8.5.
---@field silverPaceMult number Multiplicateur d'allure de l'argent (1.13).
---@field silverResetsPerKm number Resets par km pardonnés pour l'argent (0.9, soit ~2 resets sur les plus courtes spéciales d'environ 2,2 km).
gameplay_rally_starThresholds = {}

--- Calcule les seuils or/argent/bronze en secondes, arrondis au dixième.
---Source : lua/ge/extensions/gameplay/rally/starThresholds.lua:39
---@param baselineSeconds number|string Temps de référence de l'étape en secondes (converti par tonumber, 0 si invalide)
---@param lengthKm number|string Longueur de l'étape en km (0 si invalide)
---@return table  {gold=number, silver=number, bronze=number} en secondes
function gameplay_rally_starThresholds.compute(baselineSeconds, lengthKm) end

