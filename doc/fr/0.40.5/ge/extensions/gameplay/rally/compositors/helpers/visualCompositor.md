# `gameplay_rally_compositors_helpers_visualCompositor`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/helpers/visualCompositor.lua` · VM : Game Engine (GE) · 283 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/compositors/helpers/visualCompositor")` (fichier sous extensions/ mais pas une extension classique)

Compositeur visuel des notes de rallye : transforme une note structurée en une liste (4 maximum) de 'visuels' pour l'application d'UI des notes visuelles (icônes de virage turn1..turn6/turnHp/turnSq, caution/doubleCaution, icônes atomiques, modificateurs, distance). Il lit les visuels dans le registre componentTypes du style actif via le textCompositor, avec le même ordre et les mêmes règles que le compositeur de texte (descripteur prioritaire sur l'intensité, ajustement de risque). Les éléments sans visuel ou de type inconnu sont ignorés sans erreur. Le module renvoie un constructeur : require(...)(textCompositor).

## Remarques

- Un modificateur 'turnModifier' ou 'additionalNote' se rattache au dernier visuel de virage déjà émis ; s'il n'y en a pas encore, il est mis en attente pour le prochain virage.
- Un visuel de virage porte : type (icône), turnModifier, colorNoteIcon, colorNoteText, background {color, strokeColor, opacity=1}, isLeft (direction == -1), size=2, turnTypeValue.
- caution : l'icône est 'doubleCaution' si level >= 3, sinon 'caution'.
- Le premier visuel reçoit isInto/intoColor (la note est chaînée à la précédente si 0 < distance avant < distance max des liens) ; le dernier reçoit distance et colorDistance (config.visualGeneral.distanceColor).
- Chaque visuel reçoit id = '<nom de la note avec _>_<index>' et pnId = pacenote.id.
- Si distAfterMeters > 0 et que les appels de distance sont activés, config.visualGeneral doit exister sinon erreur d'indexation (déduit du code).

## Classe `C`

Compositeur visuel renvoyé par le constructeur du module.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_compositors_helpers_visualCompositor")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_getMaxLinkDistance()` | Distance maximale (seuil du dernier lien) en dessous de laquelle deux notes sont enchaînées ('into'). | 24 |
| `C:compositeVisual(pacenote, structured, distBeforeMeters, distAfterMeters)` | Construit la liste de visuels d'une note structurée. | 204 |
| `C:init(textCompositor)` | Mémorise le compositeur de texte dont on lit la configuration. | 20 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/helpers/visualCompositor.lua`.*
