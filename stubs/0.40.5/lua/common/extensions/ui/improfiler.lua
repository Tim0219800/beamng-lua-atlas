---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/improfiler.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Profileur LuaJIT affiché dans une fenêtre ImGui « LuaJIT Profiler ». La première partie du fichier est le module jit/p de Mike Pall (MIT, 2005-2017) adapté : échantillonnage du profileur intégré de LuaJIT (jit.profile) et formatage du résultat dans une chaîne au lieu de stdout. La fin du fichier est la partie BeamNG : toutes les 3 secondes, le profil est terminé, son texte affiché dans la fenêtre, puis un nouveau profil est lancé avec le mode « vzm0lspi0 500 -500 » (états VM, zones, minimum 0 %, split, chemins complets, intervalle 0 ms...).
--- Accès : extension `ui_improfiler` : `extensions.load("ui_improfiler")`, puis la globale `ui_improfiler`
---@class ui_improfiler
ui_improfiler = {}

--- Hook appelé chaque frame : dessine la fenêtre « LuaJIT Profiler » avec le dernier résultat ; toutes les 3 s de temps réel, termine le profil en cours, met à jour le texte affiché et relance le profileur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions/ui/improfiler.lua:307
---@param dtReal number Delta temps réel (s), cumulé pour le minuteur de 3 s.
---@param dtSim number Non utilisé.
---@param dtRaw number Non utilisé.
function ui_improfiler.onUpdate(dtReal, dtSim, dtRaw) end

