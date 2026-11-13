---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/easeCurveUI.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Widget ImGui de l'éditeur pour éditer une courbe d'easing (type EaseF du moteur). La valeur est une chaîne "dir type param0 param1". Le widget affiche deux combos (direction InOut/In/Out, type Linear..Bounce), un aperçu de la courbe cliquable ouvrant un sélecteur de miniatures, et des sliders de paramètres pour Elastic (Amplitude, Period) et Back (Overshoot).
--- Accès : extension `editor_api_easeCurveUI` : `extensions.load("editor_api_easeCurveUI")`, puis la globale `editor_api_easeCurveUI`
---@class editor_api_easeCurveUI
editor_api_easeCurveUI = {}

--- Dessine le widget d'édition de courbe. Appelle opts.setValue(valueString, editEnded) à chaque modification ; editEnded est true pour les choix de combo/sélecteur et à la fin du glissement d'un slider.
---Source : lua/ge/extensions/editor/api/easeCurveUI.lua:147
---@param opts table id (string unique), value (string "dir type param0 param1"), setValue(valueString, editEnded)
function editor_api_easeCurveUI.draw(opts) end

