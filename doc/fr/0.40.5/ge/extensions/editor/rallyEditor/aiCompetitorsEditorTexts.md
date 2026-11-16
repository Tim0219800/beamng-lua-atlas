# `editor_rallyEditor_aiCompetitorsEditorTexts`

*Fichier : `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorTexts.lua` · VM : Game Engine (GE) · 166 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_aiCompetitorsEditorTexts` : `extensions.load("editor_rallyEditor_aiCompetitorsEditorTexts")`, puis la globale `editor_rallyEditor_aiCompetitorsEditorTexts`

Table de textes (libellés, titres de sections, infobulles) en anglais de l'onglet « AI Competitors » de l'éditeur de rallye. Aucun code : le module ne contient que des chaînes lues par aiCompetitorsTab et aiCompetitorsEditorPlot. Utile pour retrouver le sens de chacun des 26 paramètres généraux du modèle et des traits d'un concurrent.

## Remarques

- Dans l'interface, le trait « skill » du modèle est présenté sous le nom « Pace » (driverTraitTooltips.Pace).
- Le temps de référence est, selon le texte d'aide, remplacé en jeu par le temps de la barre « silver ».

## Champs

| Champ | Type | Description |
|---|---|---|
| `chart` | table<string, string> | Textes du graphique : title, subtitle, legendHint, axisLabel, plotTooSmall. |
| `competitorNavigationTooltip` | string | Infobulle du sélecteur de concurrent (la sauvegarde écrit toute la liste). |
| `driverPreviewSection` | table<string, string> | Textes de la section Driver preview (title, subtitle, emptyCompetitors). |
| `driverTraitTooltips` | table<string, string> | Infobulles des traits Pace, Consistency, Risk. |
| `generalGroupPresentation` | table<integer, {title: string, blurb: string}> | Titre et description des 6 groupes de paramètres généraux (même ordre que generalParamGroups du modèle). |
| `generalParamLabels` | table<string, string> | Libellé affiché de chaque paramètre général (clé = nom snake_case). |
| `generalParamTooltips` | table<string, string> | Infobulle de chaque paramètre général. |
| `globalSection` | table<string, string> | Titre et sous-titre de la section Global parameters. |
| `outcomeLabels` | table<integer, string> | Libellés courts des 5 résultats : Clean, Push, Minor incident, Major incident, DNF. |
| `playerReferenceHelp` | string | Aide du temps de référence de la spéciale (secondes), base du modèle et de l'aperçu. |
| `previewSection` | table<string, string> | Titre et sous-titre de la section Preview. |
| `referenceSection` | table<string, string> | Textes de la section temps de référence et pilotes (title, subtitle, referenceTimeLabel). |
| `toolbar` | table<string, string> | Textes de la barre d'outils : header, configPathPrefix, reload, save. |
| `windowDescription` | string | Titre de l'onglet : « AI Competitors Configuration ». |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorTexts.lua`.*
