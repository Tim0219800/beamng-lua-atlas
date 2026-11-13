---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPreview.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcul des données d'aperçu de l'onglet « AI Competitors » de l'éditeur de rallye. À partir des paramètres généraux, du temps de référence et des traits d'un concurrent (skill, consistency, risk, en [0,1]), il calcule la densité du mélange de résultats sur 500 échantillons : une première passe sur une plage large, un zoom automatique sur la zone où le mélange est significatif, puis une seconde passe sur la plage zoomée. Il renvoie aussi les poids de chaque résultat et le maximum d'ordonnée. Utilise aiCompetitorsEditorModel.mixtureDensityTimes (donc gameplay/rally/aiCompetitors).
--- Accès : extension `editor_rallyEditor_aiCompetitorsEditorPreview` : `extensions.load("editor_rallyEditor_aiCompetitorsEditorPreview")`, puis la globale `editor_rallyEditor_aiCompetitorsEditorPreview`
---@class editor_rallyEditor_aiCompetitorsEditorPreview
---@field chartSampleCount integer Nombre d'échantillons de la courbe (500).
editor_rallyEditor_aiCompetitorsEditorPreview = {}

--- Calcule tout ce qu'il faut pour tracer l'aperçu : poids des résultats, densités sur la plage zoomée, composantes pondérées des 4 premiers résultats, maximum d'ordonnée et bornes de temps.
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPreview.lua:67
---@param input table {general (paramètres généraux), referenceSec (temps de référence en s), skillUnit, consistencyUnit, riskUnit (chacun dans [0,1])}.
---@return table  {weights, density, weightedComponents, yMax, timeLo, timeHi}.
function editor_rallyEditor_aiCompetitorsEditorPreview.computeVisualization(input) end

--- Réduit la plage de temps à la zone où la densité du mélange dépasse 2 % de son pic, avec marge et largeur minimale. Renvoie la plage large inchangée si le pic est quasi nul (≤ 1e-30), si la plage large est nulle ou si le zoom garde plus de 90 % de la plage.
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPreview.lua:21
---@param densityResult table Résultat de mixtureDensityTimes : mixture, times, sampleCount.
---@param broadTimeLo number Borne basse de la plage large (secondes).
---@param broadTimeHi number Borne haute de la plage large (secondes).
---@return number  Borne basse retenue (s).
---@return number  Borne haute retenue (s).
function editor_rallyEditor_aiCompetitorsEditorPreview.narrowTimeRangeFromMixture(densityResult, broadTimeLo, broadTimeHi) end

