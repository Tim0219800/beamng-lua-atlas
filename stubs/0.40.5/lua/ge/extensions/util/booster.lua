---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/booster.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension minuscule de démonstration pour un déclencheur « booster » : trigger(data) affiche les données reçues, puis devrait propulser un véhicule vers le haut via core_booster côté véhicule. Dans l'état du code, la propulsion ne se déclenche jamais.
--- Accès : extension `util_booster` : `extensions.load("util_booster")`, puis la globale `util_booster`
---@class util_booster
util_booster = {}

--- Affiche « Booster triggered » et le contenu de data. Prévu pour réagir à un évènement de trigger (data.subjectID est l'id du véhicule), mais ne fait rien d'autre à cause du bug signalé.
---Source : lua/ge/extensions/util/booster.lua:7
---@param data table Données de l'évènement de trigger (subjectID attendu).
function util_booster.trigger(data) end

