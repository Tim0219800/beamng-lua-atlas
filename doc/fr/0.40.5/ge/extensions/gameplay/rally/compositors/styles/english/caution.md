# `gameplay_rally_compositors_styles_english_caution`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/styles/english/caution.lua` · VM : Game Engine (GE) · 19 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_compositors_styles_english_caution` : `extensions.load("gameplay_rally_compositors_styles_english_caution")`, puis la globale `gameplay_rally_compositors_styles_english_caution`

Composant 'caution' partagé par les styles anglais : textes des trois niveaux d'avertissement ('care', 'caution', 'double caution') et couleurs des notes visuelles correspondantes (fond, contour, icône, texte) tirées de compositors/helpers/colors.

## Remarques

- Le module renvoie directement la table {levels, levelVisuals} (pas de M).
- visualCompositor choisit l'icône 'doubleCaution' pour level >= 3, sinon 'caution'.

## Champs

| Champ | Type | Description |
|---|---|---|
| `levelVisuals` | table<integer, table> | Couleurs par niveau : {colorBg, colorStroke, colorNoteIcon, colorNoteText}. Niveau 1 jaune sur noir, niveaux 2 et 3 rouge sur noir. |
| `levels` | table<integer, string> | Texte parlé par niveau : [1]='care', [2]='caution', [3]='double caution'. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/styles/english/caution.lua`.*
