---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/cameraDistanceApp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Application UI de debug « distance caméra ». À chaque frame, mesure la distance entre le véhicule joueur et la caméra, la pousse à l'UI via guihooks.trigger('cameraDistance', distance) et dessine dans le monde une sphère rouge de rayon 0,5 m sur le véhicule avec l'étiquette « camera distance target ».
--- Accès : extension `ui_cameraDistanceApp` : `extensions.load("ui_cameraDistanceApp")`, puis la globale `ui_cameraDistanceApp`
---@class ui_cameraDistanceApp
ui_cameraDistanceApp = {}

--- Hook appelé à chaque frame : dessine la sphère et le texte de debug sur le véhicule joueur et envoie la distance véhicule-caméra à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/cameraDistanceApp.lua:11
---@param dtReal number Temps réel écoulé (s), inutilisé.
---@param dtSim number Temps de simulation écoulé (s), inutilisé.
---@param dtRaw number Temps brut écoulé (s), inutilisé.
function ui_cameraDistanceApp.onUpdate(dtReal, dtSim, dtRaw) end

