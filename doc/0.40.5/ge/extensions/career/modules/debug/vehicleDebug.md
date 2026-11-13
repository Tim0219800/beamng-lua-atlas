# `career_modules_debug_vehicleDebug`

*Fichier : `lua/ge/extensions/career/modules/debug/vehicleDebug.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_vehicleDebug` : `extensions.load("career_modules_debug_vehicleDebug")`, puis la globale `career_modules_debug_vehicleDebug`

Onglet de debug carrière « Vehicles ». Permet d'ajouter le véhicule joueur à l'inventaire, de le réapparaître (career_modules_inventory.debugRespawnCurrentVehicle), de basculer sur un véhicule possédé (enterVehicle) ou de le vendre (sellVehicleFromInventory).

## Remarques

- Outil de développement ; debugOrder = 2.
- La vente se fait après la boucle d'affichage pour ne pas modifier la table pendant son parcours.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_vehicleDebug.drawDebugMenu()` | Dessine les boutons d'ajout/réapparition du véhicule courant, le véhicule actuel de l'inventaire et la liste des véhicules possédés avec boutons d'entrée et de vente. *(interne)* | 9 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | 'Vehicles'. |
| `debugOrder` | number | Ordre de tri (2). |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/vehicleDebug.lua`.*
