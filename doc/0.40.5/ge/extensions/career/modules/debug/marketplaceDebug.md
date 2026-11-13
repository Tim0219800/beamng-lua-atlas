# `career_modules_debug_marketplaceDebug`

*Fichier : `lua/ge/extensions/career/modules/debug/marketplaceDebug.lua` · VM : Game Engine (GE) · 114 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_marketplaceDebug` : `extensions.load("career_modules_debug_marketplaceDebug")`, puis la globale `career_modules_debug_marketplaceDebug`

Onglet de debug carrière « Marketplace ». Affiche les véhicules de l'inventaire (et s'ils sont en vente via career_modules_marketplace.findVehicleListing), les annonces en cours avec leurs offres (valeur, écart, durée restante) et boutons Accept/Decline, plus un bouton 'Generate Random Offer'.

## Remarques

- Bug probable : drawDebugMenu lit les variables globales listedVehicles et offerTTL, qui ne sont définies nulle part dans ce fichier (nil) ; la section 'Current Listings' provoque une erreur ou n'affiche rien d'utile si elles ne sont pas globales ailleurs.
- Outil de développement ; debugOrder = 0.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_marketplaceDebug.drawDebugMenu()` | Dessine les sections 'Vehicle Inventory', 'Current Listings' (offres avec Accept/Decline via career_modules_marketplace.acceptOffer/declineOffer) et le bouton 'Generate Random Offer' (generateOffer). *(interne)* | 42 |
| `career_modules_debug_marketplaceDebug.onCareerActivated()` | Hook de carrière ; corps vide. *(interne)* *(hook)* | 111 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | 'Marketplace'. |
| `debugOrder` | number | Ordre de tri (0). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/marketplaceDebug.lua`.*
