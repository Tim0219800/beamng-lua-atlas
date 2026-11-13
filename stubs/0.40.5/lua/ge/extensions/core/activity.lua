---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/activity.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE (core_activity) minuscule : démarre une 'activité' nommée. Aujourd'hui la seule activité connue est 'ContinueFreeroam', qui lance extensions.freeroam_continueFreeroam.start() puis signale l'écran de chargement (core_gamestate.loadingScreenActive()). Un moddeur peut l'appeler depuis l'UI ou un script.
--- Accès : extension `core_activity` : `extensions.load("core_activity")`, puis la globale `core_activity`
---@class core_activity
core_activity = {}

--- Lance l'activité portant ce nom si elle existe dans la table interne, sinon loggue 'Unknown activity'.
---Source : lua/ge/extensions/core/activity.lua:16
---@param name string Nom d'activité, actuellement 'ContinueFreeroam'
function core_activity.startActivity(name) end

