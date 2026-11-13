# `editor_rallyEditor_aiCompetitorsEditorPlot`

*Fichier : `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPlot.lua` · VM : Game Engine (GE) · 179 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_aiCompetitorsEditorPlot` : `extensions.load("editor_rallyEditor_aiCompetitorsEditorPlot")`, puis la globale `editor_rallyEditor_aiCompetitorsEditorPlot`

Tracé ImGui (via la draw list) de l'aperçu de la distribution des temps d'arrivée dans l'onglet « AI Competitors » de l'éditeur de rallye. drawFinishTimeChart dessine la grille, les axes, une courbe par résultat (4 premiers résultats pondérés) et la courbe du mélange en surbrillance ; drawOutcomeShareRow affiche en colonnes la part (%) de chaque résultat. Les données viennent de aiCompetitorsEditorPreview.computeVisualization.

## Remarques

- La courbe du résultat 5 (DNF) n'est pas tracée : seuls les résultats 1 à 4 ont une courbe de densité (le DNF n'a pas de temps d'arrivée).
- Le graphique fait 300 px de haut, 20 divisions horizontales et 10 verticales ; si la zone de tracé fait moins de 48 px, le texte chartCopy.plotTooSmall est affiché à la place.
- Couleurs : bleu 58a6ff, orange ffa657, vert 3fb950, rouge f85149, gris 8b949e ; le mélange est en blanc bleuté f0f6fc.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_aiCompetitorsEditorPlot.drawFinishTimeChart(im, visualization, chartCopy)` | Réserve une zone (largeur disponible x 300 px), dessine grille, axes gradués en secondes (densité en ordonnée), les courbes pondérées des résultats 1 à 4 (trait 1.2) et la courbe du mélange (trait 2.4), le tout rogné à la zone de tracé. | 113 |
| `editor_rallyEditor_aiCompetitorsEditorPlot.drawOutcomeShareRow(im, visualization, outcomeLabels, outcomeColors, modelModule)` | Affiche sur une ligne à numOutcomes colonnes le libellé coloré de chaque résultat et son pourcentage (100 × visualization.weights[i], 2 décimales). | 100 |

### Détail des paramètres

#### `editor_rallyEditor_aiCompetitorsEditorPlot.drawFinishTimeChart(im, visualization, chartCopy)`

Réserve une zone (largeur disponible x 300 px), dessine grille, axes gradués en secondes (densité en ordonnée), les courbes pondérées des résultats 1 à 4 (trait 1.2) et la courbe du mélange (trait 2.4), le tout rogné à la zone de tracé.

- `im` (*table*) : Module ui_imgui.
- `visualization` (*table*) : Résultat de computeVisualization : density.mixture, weightedComponents, yMax, timeLo, timeHi.
- `chartCopy` (*table*) : Textes (aiCompetitorsEditorTexts.chart) : axisLabel et plotTooSmall.

#### `editor_rallyEditor_aiCompetitorsEditorPlot.drawOutcomeShareRow(im, visualization, outcomeLabels, outcomeColors, modelModule)`

Affiche sur une ligne à numOutcomes colonnes le libellé coloré de chaque résultat et son pourcentage (100 × visualization.weights[i], 2 décimales).

- `im` (*table*) : Module ui_imgui.
- `visualization` (*table*) : Résultat de computeVisualization (champ weights).
- `outcomeLabels` (*table<integer, string>*) : Libellés ; sinon ceux de modelModule.outcomeLabels.
- `outcomeColors` (*table<integer, ImVec4>*) : Couleur de texte de chaque résultat.
- `modelModule` (*table*) : Module aiCompetitorsEditorModel (numOutcomes, outcomeLabels).

## Champs

| Champ | Type | Description |
|---|---|---|
| `outcomeLineColors` | table<integer, ImVec4> | Couleurs des 5 résultats (Safe, Push, Minor, Major, DNF), réutilisables pour les libellés. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPlot.lua`.*
