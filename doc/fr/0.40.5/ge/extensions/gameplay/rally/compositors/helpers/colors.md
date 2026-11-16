# `gameplay_rally_compositors_helpers_colors`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/helpers/colors.lua` · VM : Game Engine (GE) · 79 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_compositors_helpers_colors` : `extensions.load("gameplay_rally_compositors_helpers_colors")`, puis la globale `gameplay_rally_compositors_helpers_colors`

Palette de couleurs partagée par les styles de notes de rallye visuelles. Les valeurs sont soit des références CSS (var(--bng-...)) consommées par l'application d'UI des notes visuelles, soit des codes hexadécimaux. Aucune fonction : uniquement des chaînes de couleur, regroupées par usage (général, carte de chaleur de l'intensité des virages, spectre néon à fort contraste, badges de coupe, avertissements, modificateurs).

## Remarques

- Ces valeurs sont des chaînes CSS, pas des objets Color du moteur.
- Alias : iconAndTextDefault = offWhite ; mainPaletteFg = offBlack ; cutBg = neonGreen ; cutStroke = deepGreen ; dontCutBg = neonCrimson ; dontCutStroke = deepCrimson ; careBg/cautionBg/doubleCautionBg = offBlack ; careIcon = careStroke ('#ffff00') ; cautionIcon/doubleCautionIcon = '#ff0000'.
- Les champs au type 'any' dans la page auto sont des alias vers d'autres champs de type string.

## Champs

| Champ | Type | Description |
|---|---|---|
| `black` | string | '#000000'. |
| `blue500` | string | Bleu 500. |
| `blue600` | string | Bleu 600. |
| `careBg` | string | Fond de la note 'care' (= offBlack). |
| `careIcon` | string | Icône de la note 'care' (= careStroke). |
| `careStroke` | string | Contour de la note 'care' ('#ffff00'). |
| `cautionBg` | string | Fond de la note 'caution' (= offBlack). |
| `cautionIcon` | string | Icône 'caution' (= cautionStroke). |
| `cautionStroke` | string | Contour de la note 'caution' ('#ff0000'). |
| `cutBg` | string | Fond du badge 'coupe' autorisée (= neonGreen). |
| `cutStroke` | string | Contour du badge 'coupe' (= deepGreen). |
| `deepBlue` | string | '#005ecb'. |
| `deepCrimson` | string | '#c4002f'. |
| `deepCyan` | string | '#008fb3'. |
| `deepGold` | string | '#c7a500'. |
| `deepGreen` | string | '#00a152'. |
| `deepOrange` | string | '#c96500'. |
| `dontCutBg` | string | Fond du badge 'ne pas couper' (= neonCrimson). |
| `dontCutStroke` | string | Contour du badge 'ne pas couper' (= deepCrimson). |
| `doubleCautionBg` | string | Fond de la note 'double caution' (= offBlack). |
| `doubleCautionIcon` | string | Icône 'double caution' (= doubleCautionStroke). |
| `doubleCautionStroke` | string | Contour de 'double caution' ('#ff0000'). |
| `green500` | string | Vert 500. |
| `green600` | string | Vert 600. |
| `iconAndTextDefault` | string | Couleur par défaut des icônes et textes (= offWhite). |
| `indigoblue650` | string | Bleu indigo 650. |
| `indigoblue750` | string | Bleu indigo 750. |
| `mainPaletteFg` | string | Couleur de premier plan de la palette principale (= offBlack). |
| `modifierBg` | string | Fond des modificateurs ('#a855f7'). |
| `modifierStroke` | string | Contour des modificateurs ('#7e22ce'). |
| `neonBlue` | string | '#33a6ff'. |
| `neonCrimson` | string | '#ff1744'. |
| `neonCyan` | string | '#00d5ff'. |
| `neonGold` | string | '#ffd600'. |
| `neonGreen` | string | '#00e676'. |
| `neonOrange` | string | '#ff8a00'. |
| `offBlack` | string | var(--bng-off-black), noir adouci. |
| `offWhite` | string | var(--bng-off-white), blanc adouci. |
| `orange` | string | Orange de la charte BeamNG. |
| `orange500` | string | Orange 500. |
| `peach300` | string | Pêche 300. |
| `peach400` | string | Pêche 400. |
| `red550` | string | Rouge 550 (carte de chaleur des virages). |
| `red650` | string | Rouge 650. |
| `red750` | string | Rouge 750. |
| `white` | string | '#ffffff'. |
| `yellow400` | string | Jaune 400 (tertiaire). |
| `yellow500` | string | Jaune 500. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/helpers/colors.lua`.*
