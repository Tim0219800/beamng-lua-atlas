# `freeroam_facilities_fuelPrice`

*Fichier : `lua/ge/extensions/freeroam/facilities/fuelPrice.lua` · VM : Game Engine (GE) · 177 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_facilities_fuelPrice` : `extensions.load("freeroam_facilities_fuelPrice")`, puis la globale `freeroam_facilities_fuelPrice`

Génère les prix du carburant des stations-service du niveau et les affiche sur les panneaux à afficheurs 7 segments de la scène. Au démarrage du niveau, pour chaque station ayant `prices`, calcule un prix (base + aléa) et remplace les objets d'affichage par des copies TSStatic des chiffres (`art/shapes/quarter_mile_display/display_<c>.dae`). Se décharge tout seul si aucune donnée de prix. Global : freeroam_facilities_fuelPrice.

## Remarques

- Prix = priceBaseline + priceRandomnessGain * (random() - priceRandomnessBias) quand gain et bias sont fournis. Un carburant `disabled` affiche « - » sur les afficheurs.
- getFuelPrice renvoie toujours le prix métrique (par litre) ; pour l'affichage, si l'unité locale du niveau (localUnits) est gallonUS, le prix est multiplié par 3.78541. Le prix est formaté « %.3f » sans point ; us_9_10_tax force le 4e chiffre à 9.
- Les objets d'affichage d'origine sont cachés ; les copies sont dans le SimGroup `fuelPrice_localCopies` (non sauvegardé).
- restoreSign(hide) supprime les copies et remet les formes d'origine (display_8.dae) ; appelle pairs(cachedPriceData) sans test de nil, donc erreur si les prix n'ont jamais été générés.
- Dans _set7CharDisplay, le chiffre est composé avec le caractère issu de la chaîne de prix ; si un objet est introuvable, l'erreur est loggée (tag setPrices).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_facilities_fuelPrice.getFuelPrice(stationId, fuelType)` | Prix courant (unité métrique) d'un carburant dans une station. | 99 |
| `freeroam_facilities_fuelPrice.onClientStartMission(levelPath)` | Hook au démarrage du niveau : appelle setDisplayPrices ; s'il n'y a pas de données de prix, décharge l'extension. *(interne)* *(hook)* | 108 |
| `freeroam_facilities_fuelPrice.onDeserialized(data)` | Appelé après rechargement Lua : restaure les prix si on est dans le même niveau, sinon régénère les prix (onClientStartMission). *(interne)* *(hook)* | 130 |
| `freeroam_facilities_fuelPrice.onSerialize()` | Appelé avant un rechargement Lua : sauvegarde cachedPriceData, le niveau courant et l'unité locale. *(interne)* *(hook)* | 122 |
| `freeroam_facilities_fuelPrice.restoreSign(hide)` | Supprime les copies de chiffres et restaure les panneaux d'origine (afficheur 8), éventuellement cachés. Utile avant de déplacer un panneau dans l'éditeur. | 141 |
| `freeroam_facilities_fuelPrice.setDisplayPrices()` | Calcule les prix de toutes les stations du niveau courant et met à jour les afficheurs. | 29 |

### Détail des paramètres

#### `freeroam_facilities_fuelPrice.getFuelPrice(stationId, fuelType)`

Prix courant (unité métrique) d'un carburant dans une station.

- `stationId` (*string*) : Id de la station.
- `fuelType` (*string*) : Type d'énergie (ex. gasoline, diesel).
- **renvoie** : number|nil Prix ou nil.

#### `freeroam_facilities_fuelPrice.onClientStartMission(levelPath)`

Hook au démarrage du niveau : appelle setDisplayPrices ; s'il n'y a pas de données de prix, décharge l'extension.

- `levelPath` (*string*) : Chemin du niveau (non utilisé).

#### `freeroam_facilities_fuelPrice.onDeserialized(data)`

Appelé après rechargement Lua : restaure les prix si on est dans le même niveau, sinon régénère les prix (onClientStartMission).

- `data` (*table*) : Table renvoyée par onSerialize.

#### `freeroam_facilities_fuelPrice.onSerialize()`

Appelé avant un rechargement Lua : sauvegarde cachedPriceData, le niveau courant et l'unité locale.

- **renvoie** : table {cachedPriceData, currentLevel, levelUnit}

#### `freeroam_facilities_fuelPrice.restoreSign(hide)`

Supprime les copies de chiffres et restaure les panneaux d'origine (afficheur 8), éventuellement cachés. Utile avant de déplacer un panneau dans l'éditeur.

- `hide` (*boolean|nil*) : true = cacher les panneaux d'origine.

#### `freeroam_facilities_fuelPrice.setDisplayPrices()`

Calcule les prix de toutes les stations du niveau courant et met à jour les afficheurs.

- **renvoie** : boolean true si au moins un prix a été généré.

## Appels vers le moteur (C++)

- `obj:` `getScale`, `getTransform`, `postApply`, `preApply`, `setField`, `setHidden`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/facilities/fuelPrice.lua`.*
