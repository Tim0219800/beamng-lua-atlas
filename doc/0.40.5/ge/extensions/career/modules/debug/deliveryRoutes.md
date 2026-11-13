# `career_modules_debug_deliveryRoutes`

*Fichier : `lua/ge/extensions/career/modules/debug/deliveryRoutes.lua` · VM : Game Engine (GE) · 207 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_deliveryRoutes` : `extensions.load("career_modules_debug_deliveryRoutes")`, puis la globale `career_modules_debug_deliveryRoutes`

Onglet de debug carrière « Delivery > Routes ». Fenêtre ImGui 'Delivery Access Points' listant les facilités de livraison et leurs points d'accès (accessPointsByName), avec sélection d'un point. Contient aussi un lancer de rayon souris (updateMouseInfo) et un helper de tracé d'arc, en grande partie inachevés.

## Remarques

- Outil de développement, partiellement inachevé : drawRoute est vide, drawArc n'est appelée nulle part, le bloc 'mouse clicking' est vide.
- updateMouseInfo désactive puis réactive la collision de la forêt autour du raycast souris.
- debugOrder = 10.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_deliveryRoutes.drawDebugFunctions()` | Sous-menu de fonctions de debug ; vide. *(interne)* | 29 |
| `career_modules_debug_deliveryRoutes.drawDebugMenu(dt)` | Dessine la fenêtre 'Delivery Access Points' : arbre des facilités (career_modules_delivery_generator.getFacilities) avec leurs points d'accès sélectionnables. *(interne)* | 63 |
| `career_modules_debug_deliveryRoutes.onCareerActivated()` | Hook de carrière : mémorise les modules delivery (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager). *(interne)* *(hook)* | 12 |
| `career_modules_debug_deliveryRoutes.updateMouseInfo()` | Met à jour la table locale mouseInfo : position caméra, rayon souris, résultat de cameraMouseRayCast, états down/hold/up du bouton gauche (hors captation ImGui) et positions/normales de clic, maintien et relâchement. *(interne)* | 172 |

### Détail des paramètres

#### `career_modules_debug_deliveryRoutes.drawDebugMenu(dt)`

Dessine la fenêtre 'Delivery Access Points' : arbre des facilités (career_modules_delivery_generator.getFacilities) avec leurs points d'accès sélectionnables.

- `dt` (*number*) : Delta de temps (non utilisé).

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | 'Delivery > Routes'. |
| `debugOrder` | number | Ordre de tri dans la fenêtre de debug (10). |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/deliveryRoutes.lua`.*
