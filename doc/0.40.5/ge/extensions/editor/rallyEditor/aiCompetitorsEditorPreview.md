# `editor_rallyEditor_aiCompetitorsEditorPreview`

*Fichier : `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPreview.lua` · VM : Game Engine (GE) · 144 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_aiCompetitorsEditorPreview` : `extensions.load("editor_rallyEditor_aiCompetitorsEditorPreview")`, puis la globale `editor_rallyEditor_aiCompetitorsEditorPreview`

Calcul des données d'aperçu de l'onglet « AI Competitors » de l'éditeur de rallye. À partir des paramètres généraux, du temps de référence et des traits d'un concurrent (skill, consistency, risk, en [0,1]), il calcule la densité du mélange de résultats sur 500 échantillons : une première passe sur une plage large, un zoom automatique sur la zone où le mélange est significatif, puis une seconde passe sur la plage zoomée. Il renvoie aussi les poids de chaque résultat et le maximum d'ordonnée. Utilise aiCompetitorsEditorModel.mixtureDensityTimes (donc gameplay/rally/aiCompetitors).

## Remarques

- Plage large : de 0.65 × référence à min(référence × max_time_multiplier_vs_reference [2.35 par défaut], référence × 2.8).
- Le zoom garde la zone où le mélange dépasse 2 % du pic, avec une marge de 10 % (au moins 1 % de la plage large) et une largeur minimale de 5.5 % de la plage large ; le zoom n'est retenu que s'il occupe moins de 90 % de la plage large.
- Seuls les 4 premiers résultats (hors DNF) ont des composantes de densité.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_aiCompetitorsEditorPreview.computeVisualization(input)` | Calcule tout ce qu'il faut pour tracer l'aperçu : poids des résultats, densités sur la plage zoomée, composantes pondérées des 4 premiers résultats, maximum d'ordonnée et bornes de temps. | 67 |
| `editor_rallyEditor_aiCompetitorsEditorPreview.narrowTimeRangeFromMixture(densityResult, broadTimeLo, broadTimeHi)` | Réduit la plage de temps à la zone où la densité du mélange dépasse 2 % de son pic, avec marge et largeur minimale. Renvoie la plage large inchangée si le pic est quasi nul (≤ 1e-30), si la plage large est nulle ou si le zoom garde plus de 90 % de la plage. | 21 |

### Détail des paramètres

#### `editor_rallyEditor_aiCompetitorsEditorPreview.computeVisualization(input)`

Calcule tout ce qu'il faut pour tracer l'aperçu : poids des résultats, densités sur la plage zoomée, composantes pondérées des 4 premiers résultats, maximum d'ordonnée et bornes de temps.

- `input` (*table*) : {general (paramètres généraux), referenceSec (temps de référence en s), skillUnit, consistencyUnit, riskUnit (chacun dans [0,1])}.
- **renvoie** : table {weights, density, weightedComponents, yMax, timeLo, timeHi}.

#### `editor_rallyEditor_aiCompetitorsEditorPreview.narrowTimeRangeFromMixture(densityResult, broadTimeLo, broadTimeHi)`

Réduit la plage de temps à la zone où la densité du mélange dépasse 2 % de son pic, avec marge et largeur minimale. Renvoie la plage large inchangée si le pic est quasi nul (≤ 1e-30), si la plage large est nulle ou si le zoom garde plus de 90 % de la plage.

- `densityResult` (*table*) : Résultat de mixtureDensityTimes : mixture, times, sampleCount.
- `broadTimeLo` (*number*) : Borne basse de la plage large (secondes).
- `broadTimeHi` (*number*) : Borne haute de la plage large (secondes).
- **renvoie** : number Borne basse retenue (s).
- **renvoie** : number Borne haute retenue (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `chartSampleCount` | integer | Nombre d'échantillons de la courbe (500). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPreview.lua`.*
