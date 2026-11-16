# `career_modules_debug_attributesDebug`

*Fichier : `lua/ge/extensions/career/modules/debug/attributesDebug.lua` · VM : Game Engine (GE) · 62 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_attributesDebug` : `extensions.load("career_modules_debug_attributesDebug")`, puis la globale `career_modules_debug_attributesDebug`

Onglet de debug carrière « Attributes ». Affiche l'argent, la BeamXP, les vouchers et l'XP de chaque branche avec des boutons de triche (+/-) qui appellent career_modules_playerAttributes.addAttributes avec les tags 'cheat'. Le menu 'Branches > Branch Order' liste les branches triées et ouvre leur fichier dans l'explorateur.

## Remarques

- Module d'outil de développement : drawDebugMenu et drawDebugFunctions sont appelées par la fenêtre de debug carrière, pas par un moddeur.
- debugOrder = 0, debugName = 'Attributes'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_attributesDebug.drawDebugFunctions()` | Dessine le sous-menu ImGui 'Branches > Branch Order' : pour chaque branche triée, bouton Edit (Engine.Platform.exploreFolder sur branch.file) et ligne cliquable qui fait dump(branch). *(interne)* | 9 |
| `career_modules_debug_attributesDebug.drawDebugMenu()` | Dessine les compteurs money, beamXP, vouchers et ceux de chaque branche (avec son niveau) avec boutons d'ajout/retrait (ex. +100000 argent, +1000 XP, +5/+100/+500 par branche). *(interne)* | 25 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | Titre de l'onglet : 'Attributes'. |
| `debugOrder` | number | Ordre de tri dans la fenêtre de debug (0). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/attributesDebug.lua`.*
