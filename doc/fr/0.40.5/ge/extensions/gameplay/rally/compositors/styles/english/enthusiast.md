# `gameplay_rally_compositors_styles_english_enthusiast`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/styles/english/enthusiast.lua` · VM : Game Engine (GE) · 71 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_compositors_styles_english_enthusiast` : `extensions.load("gameplay_rally_compositors_styles_english_enthusiast")`, puis la globale `gameplay_rally_compositors_styles_english_enthusiast`

Style de notes de rallye 'English enthusiast' : copilote anglais complet, avec numérotation 1 à 6 (one_to_six), appels de distance activés (english/distance), longueurs de virage, formes (opens, tightens, over crest, etc.), descripteurs (flat, square, hairpin, open/tight hairpin, bare), cautions et tous les modificateurs du fichier english/modifiers. Assemble les modules du dossier english ; M.composite et M.enumerate pointent vers compositorUtil.

## Remarques

- AVERTISSEMENT du fichier : toute modification d'une chaîne utilisée pour une note impose de régénérer les fichiers audio.
- Le descripteur 'bare' a un texte vide : il sert à dire un virage sans mot d'intensité (label 'bare').
- Formes : opens, tightens, opensOverCrest, opensAndTightens, overCrest (variant '2'), tightensDown, tightensOverCrest, tightensAndOpens ; certaines n'ont pas de visuel.
- Les champs sont documentés tels que lus par textCompositor et styleValidator ; une validation est faite au chargement.

## Champs

| Champ | Type | Description |
|---|---|---|
| `componentTypes` | table | corner (numérotation one_to_six, direction left/right, shapes, descriptors), caution (english/caution) et modifiers (english/modifiers). |
| `composite` | function | compositorUtil.compositeFromPhrases. |
| `distance` | table | Config de distance (english/distance), appels de distance activés. |
| `enumerate` | function | compositorUtil.enumerateConcise. |
| `system` | table | Notes système localisées (english/systemPacenotes). |
| `visualGeneral` | table | Couleurs générales des notes visuelles (english/visual). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/styles/english/enthusiast.lua`.*
