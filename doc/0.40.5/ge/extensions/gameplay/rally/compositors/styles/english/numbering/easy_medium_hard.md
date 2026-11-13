# `gameplay_rally_compositors_styles_english_numbering_easy_medium_hard`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/styles/english/numbering/easy_medium_hard.lua` · VM : Game Engine (GE) · 13 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_compositors_styles_english_numbering_easy_medium_hard` : `extensions.load("gameplay_rally_compositors_styles_english_numbering_easy_medium_hard")`, puis la globale `gameplay_rally_compositors_styles_english_numbering_easy_medium_hard`

Numérotation anglaise partagée des virages en trois niveaux : hard, medium, easy. Chaque niveau donne le texte parlé, la plage de diamètre physique mesuré (m) et le visuel (icône de virage, couleurs). Utilisé par le style english/casual.

## Remarques

- Plages de diamètre : hard [0, 65[, medium [65, 190[, easy [190, +inf[ ; correspondent aux icônes turn1, turn3 et turn6.
- Pas de lengthsByIntensity : ce système ne définit pas de longueurs.
- Le module renvoie directement la table {id, intensity} ; les plages peuvent être recalibrées par mission via calibrationOverrides.

## Champs

| Champ | Type | Description |
|---|---|---|
| `id` | string | Identifiant du système : 'easy_medium_hard' (copié dans corner.numberingSystem). |
| `intensity` | table[] | Trois entrées {id, text, diameter={min,max}, visual={icon, text, colorBg, colorStroke, ...}}, de la plus serrée (hard, rouge) à la plus ouverte (easy, vert). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/styles/english/numbering/easy_medium_hard.lua`.*
