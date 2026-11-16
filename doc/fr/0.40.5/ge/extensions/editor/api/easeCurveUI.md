# `editor_api_easeCurveUI`

*Fichier : `lua/ge/extensions/editor/api/easeCurveUI.lua` · VM : Game Engine (GE) · 203 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_easeCurveUI` : `extensions.load("editor_api_easeCurveUI")`, puis la globale `editor_api_easeCurveUI`

Widget ImGui de l'éditeur pour éditer une courbe d'easing (type EaseF du moteur). La valeur est une chaîne "dir type param0 param1". Le widget affiche deux combos (direction InOut/In/Out, type Linear..Bounce), un aperçu de la courbe cliquable ouvrant un sélecteur de miniatures, et des sliders de paramètres pour Elastic (Amplitude, Period) et Back (Overshoot).

## Remarques

- Les noms de direction et de type doivent rester synchronisés avec engine::Ease::enumDirection et enumType (l'indice vaut l'ordre dans l'enum).
- Un paramètre à -1 signifie « valeur par défaut de la courbe ».
- Les courbes sont échantillonnées par worldEditorCppApi.getEaseCurveSamples (64 points pour l'aperçu, 32 pour les miniatures).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_easeCurveUI.draw(opts)` | Dessine le widget d'édition de courbe. Appelle opts.setValue(valueString, editEnded) à chaque modification ; editEnded est true pour les choix de combo/sélecteur et à la fin du glissement d'un slider. | 147 |

### Détail des paramètres

#### `editor_api_easeCurveUI.draw(opts)`

Dessine le widget d'édition de courbe. Appelle opts.setValue(valueString, editEnded) à chaque modification ; editEnded est true pour les choix de combo/sélecteur et à la fin du glissement d'un slider.

- `opts` (*table*) : id (string unique), value (string "dir type param0 param1"), setValue(valueString, editEnded)

## Appels vers le moteur (C++)

- `worldEditorCppApi.` `getEaseCurveSamples`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/easeCurveUI.lua`.*
