# `career_modules_debug_vehOfferDebug`

*Fichier : `lua/ge/extensions/career/modules/debug/vehOfferDebug.lua` · VM : Game Engine (GE) · 166 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_vehOfferDebug` : `extensions.load("career_modules_debug_vehOfferDebug")`, puis la globale `career_modules_debug_vehOfferDebug`

Onglet de debug carrière « Delivery > Veh Offers ». Fenêtre 'Vehicle Offer Debug' listant, par facilité de livraison, les offres de véhicules/remorques non expirées (career_modules_delivery_vehicleOfferManager). L'entrée '> Available vehicle/trailer per facility' imprime le nombre d'offres par niveau de déblocage (1 à 5) via isVehicleTagUnlocked.

## Remarques

- Outil de développement ; debugOrder = 11.
- Réutilise career_modules_debug_parcelDebug.drawFacilityHeader.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_vehOfferDebug.drawDebugFunctions()` | Entrées '> Available vehicle per facility' et '> Available trailer per facility' : comptent les offres non expirées par niveau et impriment le résultat trié. *(interne)* | 35 |
| `career_modules_debug_vehOfferDebug.drawDebugMenu()` | Dessine la fenêtre 'Vehicle Offer Debug' : temps de livraison, choix de facilité (all, auto ou id) et tableaux d'offres. *(interne)* | 117 |
| `career_modules_debug_vehOfferDebug.onCareerActivated()` | Hook : mémorise les modules delivery et parcelDebug. *(interne)* *(hook)* | 13 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | 'Delivery > Veh Offers'. |
| `debugOrder` | number | Ordre de tri (11). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/vehOfferDebug.lua`.*
