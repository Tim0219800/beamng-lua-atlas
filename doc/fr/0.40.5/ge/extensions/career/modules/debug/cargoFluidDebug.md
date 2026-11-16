# `career_modules_debug_cargoFluidDebug`

*Fichier : `lua/ge/extensions/career/modules/debug/cargoFluidDebug.lua` · VM : Game Engine (GE) · 164 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_cargoFluidDebug` : `extensions.load("career_modules_debug_cargoFluidDebug")`, puis la globale `career_modules_debug_cargoFluidDebug`

Onglet de debug carrière « Delivery > Fluid Cargo ». Fenêtre ImGui 'Fluid CargoDebug' qui affiche, par facilité de livraison (toutes, la plus proche ou une choisie), les stockages de matériaux (fluides) : fournisseurs, débits et connexions, en s'appuyant sur career_modules_delivery_* et career_modules_debug_parcelDebug.

## Remarques

- Outil de développement ; les références aux modules delivery sont prises dans onCareerActivated, donc inutilisable avant l'activation de la carrière.
- debugOrder = 11.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_cargoFluidDebug.drawDebugFunctions()` | Sous-menu de fonctions de debug ; vide dans ce module. *(interne)* | 35 |
| `career_modules_debug_cargoFluidDebug.drawDebugMenu()` | Dessine la fenêtre 'Fluid CargoDebug' : temps de livraison, choix de facilité (all, auto, ou une facilité ayant des materialStorages) et tableau Fluid / Rate / Connections par facilité. *(interne)* | 111 |
| `career_modules_debug_cargoFluidDebug.onCareerActivated()` | Hook de carrière : mémorise les modules delivery (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager) et career_modules_debug_parcelDebug. *(interne)* *(hook)* | 13 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | 'Delivery > Fluid Cargo'. |
| `debugOrder` | number | Ordre de tri dans la fenêtre de debug (11). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/cargoFluidDebug.lua`.*
