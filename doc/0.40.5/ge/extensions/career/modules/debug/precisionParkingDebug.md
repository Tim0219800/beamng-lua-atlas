# `career_modules_debug_precisionParkingDebug`

*Fichier : `lua/ge/extensions/career/modules/debug/precisionParkingDebug.lua` · VM : Game Engine (GE) · 409 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_precisionParkingDebug` : `extensions.load("career_modules_debug_precisionParkingDebug")`, puis la globale `career_modules_debug_precisionParkingDebug`

Onglet de debug carrière « Precision Parking ». Un bouton active/désactive le debug ; quand il est actif, le module cherche (toutes les 0,1 s) la place de parking de livraison la plus proche du véhicule joueur (accessPointsByName des deliveryProviders), calcule des données de précision de stationnement et les affiche en ImGui, avec des dessins 3D (sphères, lignes, flèches via debugDrawer).

## Remarques

- Outil de développement ; debugOrder = 10.
- En cas d'absence de véhicule joueur, debugData.error est affiché en rouge.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_precisionParkingDebug.drawDebugMenu()` | Dessine le bouton d'activation et, si actif, met à jour puis affiche les données de précision de stationnement. *(interne)* | 154 |
| `career_modules_debug_precisionParkingDebug.drawDebugVisualization()` | Dessine la visualisation 3D de debug si le mode est actif. *(interne)* | 396 |
| `career_modules_debug_precisionParkingDebug.onDebugDisabled()` | Nettoyage quand le debug est désactivé : coupe le mode et vide debugData. *(interne)* *(hook)* | 403 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | 'Precision Parking'. |
| `debugOrder` | number | Ordre de tri (10). |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawArrow`, `drawLine`, `drawSphere`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/precisionParkingDebug.lua`.*
