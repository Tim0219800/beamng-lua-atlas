---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPlot.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tracé ImGui (via la draw list) de l'aperçu de la distribution des temps d'arrivée dans l'onglet « AI Competitors » de l'éditeur de rallye. drawFinishTimeChart dessine la grille, les axes, une courbe par résultat (4 premiers résultats pondérés) et la courbe du mélange en surbrillance ; drawOutcomeShareRow affiche en colonnes la part (%) de chaque résultat. Les données viennent de aiCompetitorsEditorPreview.computeVisualization.
--- Accès : extension `editor_rallyEditor_aiCompetitorsEditorPlot` : `extensions.load("editor_rallyEditor_aiCompetitorsEditorPlot")`, puis la globale `editor_rallyEditor_aiCompetitorsEditorPlot`
---@class editor_rallyEditor_aiCompetitorsEditorPlot
---@field outcomeLineColors table<integer, ImVec4> Couleurs des 5 résultats (Safe, Push, Minor, Major, DNF), réutilisables pour les libellés.
editor_rallyEditor_aiCompetitorsEditorPlot = {}

--- Réserve une zone (largeur disponible x 300 px), dessine grille, axes gradués en secondes (densité en ordonnée), les courbes pondérées des résultats 1 à 4 (trait 1.2) et la courbe du mélange (trait 2.4), le tout rogné à la zone de tracé.
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPlot.lua:113
---@param im table Module ui_imgui.
---@param visualization table Résultat de computeVisualization : density.mixture, weightedComponents, yMax, timeLo, timeHi.
---@param chartCopy table Textes (aiCompetitorsEditorTexts.chart) : axisLabel et plotTooSmall.
function editor_rallyEditor_aiCompetitorsEditorPlot.drawFinishTimeChart(im, visualization, chartCopy) end

--- Affiche sur une ligne à numOutcomes colonnes le libellé coloré de chaque résultat et son pourcentage (100 × visualization.weights[i], 2 décimales).
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPlot.lua:100
---@param im table Module ui_imgui.
---@param visualization table Résultat de computeVisualization (champ weights).
---@param outcomeLabels table<integer, string> Libellés ; sinon ceux de modelModule.outcomeLabels.
---@param outcomeColors table<integer, ImVec4> Couleur de texte de chaque résultat.
---@param modelModule table Module aiCompetitorsEditorModel (numOutcomes, outcomeLabels).
function editor_rallyEditor_aiCompetitorsEditorPlot.drawOutcomeShareRow(im, visualization, outcomeLabels, outcomeColors, modelModule) end

