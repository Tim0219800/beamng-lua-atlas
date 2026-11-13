---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorTexts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Table de textes (libellés, titres de sections, infobulles) en anglais de l'onglet « AI Competitors » de l'éditeur de rallye. Aucun code : le module ne contient que des chaînes lues par aiCompetitorsTab et aiCompetitorsEditorPlot. Utile pour retrouver le sens de chacun des 26 paramètres généraux du modèle et des traits d'un concurrent.
--- Accès : extension `editor_rallyEditor_aiCompetitorsEditorTexts` : `extensions.load("editor_rallyEditor_aiCompetitorsEditorTexts")`, puis la globale `editor_rallyEditor_aiCompetitorsEditorTexts`
---@class editor_rallyEditor_aiCompetitorsEditorTexts
---@field chart table<string, string> Textes du graphique : title, subtitle, legendHint, axisLabel, plotTooSmall.
---@field competitorNavigationTooltip string Infobulle du sélecteur de concurrent (la sauvegarde écrit toute la liste).
---@field driverPreviewSection table<string, string> Textes de la section Driver preview (title, subtitle, emptyCompetitors).
---@field driverTraitTooltips table<string, string> Infobulles des traits Pace, Consistency, Risk.
---@field generalGroupPresentation table<integer, {title: string, blurb: string}> Titre et description des 6 groupes de paramètres généraux (même ordre que generalParamGroups du modèle).
---@field generalParamLabels table<string, string> Libellé affiché de chaque paramètre général (clé = nom snake_case).
---@field generalParamTooltips table<string, string> Infobulle de chaque paramètre général.
---@field globalSection table<string, string> Titre et sous-titre de la section Global parameters.
---@field outcomeLabels table<integer, string> Libellés courts des 5 résultats : Clean, Push, Minor incident, Major incident, DNF.
---@field playerReferenceHelp string Aide du temps de référence de la spéciale (secondes), base du modèle et de l'aperçu.
---@field previewSection table<string, string> Titre et sous-titre de la section Preview.
---@field referenceSection table<string, string> Textes de la section temps de référence et pilotes (title, subtitle, referenceTimeLabel).
---@field toolbar table<string, string> Textes de la barre d'outils : header, configPathPrefix, reload, save.
---@field windowDescription string Titre de l'onglet : « AI Competitors Configuration ».
editor_rallyEditor_aiCompetitorsEditorTexts = {}

