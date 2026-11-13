---@meta
-- tim19Atlas stub generated from lua/vehicle/bullettime.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ancienne API de ralenti (bullet time) côté véhicule, conservée pour la compatibilité des mods. Elle ne fait que relayer vers `simTimeAuthority` dans le moteur de jeu (GE Lua). Les fonctions dépréciées affichent un toast d'erreur dans l'UI et loguent une trace ; il faut utiliser `get`, `set` ou `selectPreset`.
--- Accès : globale `bullettime`
---@class bullettime
bullettime = {}

--- Renvoie l'échelle de temps de simulation actuelle (`obj:getSimulationTimeScale()`).
---Source : lua/vehicle/bullettime.lua:13
---@return number  Échelle de temps (1 = temps réel).
function bullettime.get() end

--- Déprécié : affiche l'avertissement puis appelle `simTimeAuthority.requestValue()` côté GE.
---Source : lua/vehicle/bullettime.lua:25
function bullettime.requestValue() end

--- Déprécié (même fonction que update) : toast d'erreur et trace.
---Source : lua/vehicle/bullettime.lua:8
function bullettime.reset() end

--- Demande à `simTimeAuthority.selectPreset` (côté GE) de choisir un préréglage de vitesse.
---Source : lua/vehicle/bullettime.lua:21
---@param v any Préréglage, sérialisé par dumps (déduit du code).
function bullettime.selectPreset(v) end

--- Demande au moteur de jeu de changer la vitesse de simulation, en exécutant `simTimeAuthority.set(1/v)` côté GE.
---Source : lua/vehicle/bullettime.lua:17
---@param v number Facteur de vitesse voulu (déduit du code : la valeur envoyée est 1/v).
function bullettime.set(v) end

--- Déprécié (même fonction que update) : toast d'erreur et trace.
---Source : lua/vehicle/bullettime.lua:8
function bullettime.slowMotion() end

--- Déprécié : affiche un toast d'erreur « Deprecated API: bullettime » et logue une trace.
---Source : lua/vehicle/bullettime.lua:8
function bullettime.update() end

