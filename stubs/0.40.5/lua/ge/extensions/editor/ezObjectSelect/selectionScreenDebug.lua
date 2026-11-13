---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionScreenDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dessin en surcouche ImGui (plein écran, sans entrées) de la sélection de l'outil Easy Object Select : contours/enveloppes convexes et remplissages des candidats (vert pour le pick actif, jaune pour le reste de la pile, blanc pour la découverte, orange pour les objets sélectionnés, magenta pendant le glisser), cercle de découverte autour du curseur, étiquettes, et fenêtre de debug avec courbe de performance (180 échantillons).
--- Accès : extension `editor_ezObjectSelect_selectionScreenDebug` : `extensions.load("editor_ezObjectSelect_selectionScreenDebug")`, puis la globale `editor_ezObjectSelect_selectionScreenDebug`
---@class editor_ezObjectSelect_selectionScreenDebug
editor_ezObjectSelect_selectionScreenDebug = {}

--- Dessine la surcouche pour un snapshot de selectionModel.update et enregistre le temps de performance de la frame. Sort immédiatement si le snapshot n'a pas de caméra.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionScreenDebug.lua:299
---@param snapshot table|nil Snapshot produit par editor_ezObjectSelect_selectionModel.update.
---@param options table|nil Options d'affichage : debugEnabled, showHoverRing, outlineMode (1 = pas d'enveloppes convexes), discoveryPixels, maxDiscoveryOutlines… (déduit du code).
function editor_ezObjectSelect_selectionScreenDebug.draw(snapshot, options) end

--- Remet à zéro l'historique de performance (échantillons et compteurs).
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionScreenDebug.lua:51
function editor_ezObjectSelect_selectionScreenDebug.reset() end

