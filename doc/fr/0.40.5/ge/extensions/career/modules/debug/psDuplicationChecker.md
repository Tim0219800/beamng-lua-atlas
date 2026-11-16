# `career_modules_debug_psDuplicationChecker`

*Fichier : `lua/ge/extensions/career/modules/debug/psDuplicationChecker.lua` · VM : Game Engine (GE) · 86 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_psDuplicationChecker` : `extensions.load("career_modules_debug_psDuplicationChecker")`, puis la globale `career_modules_debug_psDuplicationChecker`

Outil de debug « Parking Spot Duplication Checker » pour level designers : compare les places de parking (parkingSpots) de deux fichiers .sites.json (par défaut city.sites.json et facilities/delivery/mixed.sites.json de west_coast_usa) et liste celles dont les boîtes orientées (OBB) se recouvrent, en les dessinant en 3D avec leur nom.

## Exemple

```lua
extensions.load("career/modules/debug/psDuplicationChecker")
career_modules_debug_psDuplicationChecker.show()
```

## Remarques

- Les fichiers A et B se choisissent avec editor_fileDialog (filtre .sites.json).
- Le test de recouvrement utilise overlapsOBB_OBB sur pos/rot/scl de chaque parking spot.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_psDuplicationChecker.compareFiles()` | Charge les deux fichiers sites (gameplay_sites_sitesManager.loadSites) et remplit la liste de résultats avec chaque paire de parking spots dont les OBB se chevauchent. | 24 |
| `career_modules_debug_psDuplicationChecker.drawDebugFunctions()` | Sous-menu de fonctions de debug ; vide. *(interne)* | 15 |
| `career_modules_debug_psDuplicationChecker.drawDebugMenu()` | Dessine la fenêtre 'PS Duplication Checker' : sélecteurs de fichiers A/B, bouton Compare et liste des doublons, dessinés en 3D (orange pour A, bleu pour B) avec leur nom. | 46 |
| `career_modules_debug_psDuplicationChecker.show()` | Ouvre l'outil : M.onUpdate = drawDebugMenu puis extensions.hookUpdate('onUpdate'). | 81 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | 'Parking Spot Duplication Checker'. |
| `debugOrder` | number | Ordre de tri (11). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUpdate` — écouté par 186 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/psDuplicationChecker.lua`.*
