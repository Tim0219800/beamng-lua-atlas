# `career_modules_debug_parcelDebug`

*Fichier : `lua/ge/extensions/career/modules/debug/parcelDebug.lua` · VM : Game Engine (GE) · 341 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_parcelDebug` : `extensions.load("career_modules_debug_parcelDebug")`, puis la globale `career_modules_debug_parcelDebug`

Onglet de debug carrière « Delivery > Parcels ». Fenêtre ImGui 'Parcel Debug' montrant, pour chaque facilité de livraison (toutes, la plus proche dans un rayon de 50 m, ou une choisie), l'en-tête, les colis sortants (outCargo) et entrants (inCargo). L'entrée '> Available parcel per facility' imprime dans la console le nombre de colis disponibles par niveau (L1 à L5) et par facilité.

## Remarques

- Outil de développement ; les modules delivery sont référencés dans onCareerActivated.
- Les helpers drawFacilityHeader/OutCargo/InCargo sont réutilisés par cargoFluidDebug et vehOfferDebug.
- Le mode 'auto' compare des distances au carré avec le seuil 2500 (soit 50 m).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_parcelDebug.drawDebugFunctions()` | Entrée '> Available parcel per facility' : compte les colis non expirés/non livrés par palier minimal (selon career_modules_delivery_parcelMods.lockedBecauseOfMods) et imprime le tableau trié. *(interne)* | 33 |
| `career_modules_debug_parcelDebug.drawDebugMenu()` | Dessine la fenêtre 'Parcel Debug' : temps de livraison, choix de facilité (all, auto, ou id) puis les tables des facilités retenues. *(interne)* | 85 |
| `career_modules_debug_parcelDebug.drawFacilityHeader(facility, outCargo, inCargo, ignoreGenerators)` | Dessine l'en-tête (tableau) d'une facilité de livraison : nom, stockages et informations de génération. | 136 |
| `career_modules_debug_parcelDebug.drawFacilityInCargo(facility, inCargo)` | Dessine le tableau des colis entrants d'une facilité (Id, Name, Slots…). | 272 |
| `career_modules_debug_parcelDebug.drawFacilityOutCargo(facility, outCargo)` | Dessine le tableau des colis sortants d'une facilité (Id, Name…). | 200 |
| `career_modules_debug_parcelDebug.onCareerActivated()` | Hook : mémorise les modules delivery (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager). *(interne)* *(hook)* | 12 |

### Détail des paramètres

#### `career_modules_debug_parcelDebug.drawFacilityHeader(facility, outCargo, inCargo, ignoreGenerators)`

Dessine l'en-tête (tableau) d'une facilité de livraison : nom, stockages et informations de génération.

- `facility` (*table*) : Facilité de livraison.
- `outCargo` (*table*) : Colis sortants de la facilité.
- `inCargo` (*table*) : Colis entrants de la facilité.
- `ignoreGenerators` (*boolean|nil*) : Masque les informations de générateurs si vrai.

#### `career_modules_debug_parcelDebug.drawFacilityInCargo(facility, inCargo)`

Dessine le tableau des colis entrants d'une facilité (Id, Name, Slots…).

- `facility` (*table*) : Facilité de livraison.
- `inCargo` (*table*) : Colis entrants.

#### `career_modules_debug_parcelDebug.drawFacilityOutCargo(facility, outCargo)`

Dessine le tableau des colis sortants d'une facilité (Id, Name…).

- `facility` (*table*) : Facilité de livraison.
- `outCargo` (*table*) : Colis sortants.

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | 'Delivery > Parcels'. |
| `debugOrder` | number | Ordre de tri (10). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/parcelDebug.lua`.*
