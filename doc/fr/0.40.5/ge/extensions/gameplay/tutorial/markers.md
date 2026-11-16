# `gameplay_tutorial_markers`

*Fichier : `lua/ge/extensions/gameplay/tutorial/markers.lua` · VM : Game Engine (GE) · 312 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_tutorial_markers` : `extensions.load("gameplay_tutorial_markers")`, puis la globale `gameplay_tutorial_markers`

Gère les marqueurs visuels du tutoriel de carrière : marqueurs d'attention au-dessus d'un véhicule ou à une position, marqueurs de direction sur une place de parking, et décalques au sol des places de parking dont la couleur indique si le véhicule est bien garé (blanc : non garé, jaune : garé mais mal orienté, vert : garé et bien orienté). Fournit aussi les tests de stationnement utilisés pour valider un objectif de parking.

## Exemple

```lua
local id = gameplay_tutorial_markers.createMarkerAboveVehicle(getPlayerVehicle(0))
-- plus tard
gameplay_tutorial_markers.removeMarker(id)
```

## Remarques

- Tolérance de parking 0,8 ; vitesse « à l'arrêt » < 0,1 m/s ; orientation correcte si produit scalaire avec l'avant de la place >= 0,7.
- Les marqueurs grossissent avec la distance à la caméra : facteur 1 jusqu'à 30 m, jusqu'à 3,5 à 250 m.
- Les décalques de parking ne sont dessinés que dans un rayon de 300 m (fondu entre 250 et 300 m) et utilisent la texture art/shapes/interface/parkDecalStripes.png.
- Les marqueurs sont identifiés par un entier croissant renvoyé à la création.
- update doit être appelé chaque frame par le code appelant (le fichier ne définit pas de hook onUpdate).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_tutorial_markers.addParkingSpotDecal(parkingSpot)` | Enregistre un décalque au sol pour une place de parking (affiché par update). | 139 |
| `gameplay_tutorial_markers.checkParkGoalWithStationaryTime(vehicle, parkingSpot, dtReal, requiredSeconds, state)` | Valide un objectif de parking : garé, bien orienté et immobile pendant la durée demandée. L'état du chronomètre est conservé dans la table state. | 193 |
| `gameplay_tutorial_markers.checkVehicleInParkingSpot(vehicle, parkingSpot)` | Teste si un véhicule est garé dans une place, bien orienté et à l'arrêt. | 167 |
| `gameplay_tutorial_markers.cleanup()` | Supprime tous les marqueurs et vide décalques et véhicules associés. | 303 |
| `gameplay_tutorial_markers.clearAllMarkers()` | Supprime tous les marqueurs. | 131 |
| `gameplay_tutorial_markers.createDirectionMarkerFromParkingSpot(parkingSpot, scale)` | Crée un marqueur de direction posé 1,75 m au-dessus d'une place de parking, orienté selon la rotation de la place. | 82 |
| `gameplay_tutorial_markers.createMarker(pos, rot, scale)` | Crée un marqueur d'attention (scenario/raceMarkers/attention) à une position, 1,75 m au-dessus pour la partie visible, et l'affiche. | 39 |
| `gameplay_tutorial_markers.createMarkerAboveVehicle(vehicle, scale)` | Crée un marqueur d'attention 2 m au-dessus d'un véhicule (échelle 1,5 par défaut). | 75 |
| `gameplay_tutorial_markers.removeMarker(markerId)` | Supprime un marqueur par son id. | 118 |
| `gameplay_tutorial_markers.removeParkingSpotDecal(parkingSpotName)` | Retire le décalque d'une place et le véhicule qui lui était associé. | 157 |
| `gameplay_tutorial_markers.setDefaultParkingSpotVehicleGetter(getter)` | Définit la fonction qui fournit le véhicule à tester pour la couleur des décalques de parking, quand aucun véhicule n'est associé à la place. | 30 |
| `gameplay_tutorial_markers.setParkingSpotVehicle(parkingSpotName, vehicle)` | Associe un véhicule à une place pour déterminer la couleur de son décalque. | 163 |
| `gameplay_tutorial_markers.update(dt, dtSim)` | Met à jour les marqueurs (échelle selon la distance à la caméra, update de chaque marqueur) puis calcule et envoie les décalques de parking proches à Engine.Render.DynamicDecalMgr. | 231 |

### Détail des paramètres

#### `gameplay_tutorial_markers.addParkingSpotDecal(parkingSpot)`

Enregistre un décalque au sol pour une place de parking (affiché par update).

- `parkingSpot` (*table*) : Place avec name, pos, rot, scl.

#### `gameplay_tutorial_markers.checkParkGoalWithStationaryTime(vehicle, parkingSpot, dtReal, requiredSeconds, state)`

Valide un objectif de parking : garé, bien orienté et immobile pendant la durée demandée. L'état du chronomètre est conservé dans la table state.

- `vehicle` (*table*) : Objet véhicule.
- `parkingSpot` (*table*) : Place de parking.
- `dtReal` (*number*) : Delta temps réel (s).
- `requiredSeconds` (*number|nil*) : Durée d'immobilité requise (1 s par défaut).
- `state` (*table|nil*) : Table d'état {stationaryTimer, wasStationary}, à réutiliser d'un appel à l'autre.
- **renvoie** : boolean true quand l'objectif est atteint.

#### `gameplay_tutorial_markers.checkVehicleInParkingSpot(vehicle, parkingSpot)`

Teste si un véhicule est garé dans une place, bien orienté et à l'arrêt.

- `vehicle` (*table*) : Objet véhicule.
- `parkingSpot` (*table*) : Place de parking (méthode checkParking, rot).
- **renvoie** : boolean isParked : garé dans la place (tolérance 0,8).
- **renvoie** : boolean isFacingCorrect : orientation compatible (produit scalaire >= 0,7).
- **renvoie** : boolean isStationary : vitesse < 0,1 m/s.

#### `gameplay_tutorial_markers.createDirectionMarkerFromParkingSpot(parkingSpot, scale)`

Crée un marqueur de direction posé 1,75 m au-dessus d'une place de parking, orienté selon la rotation de la place.

- `parkingSpot` (*table*) : Place de parking avec pos, rot (et name).
- `scale` (*vec3|nil*) : Échelle ; x sert de rayon (2 par défaut).
- **renvoie** : integer|nil Id du marqueur, ou nil si la place est invalide ou le chargement échoue.

#### `gameplay_tutorial_markers.createMarker(pos, rot, scale)`

Crée un marqueur d'attention (scenario/raceMarkers/attention) à une position, 1,75 m au-dessus pour la partie visible, et l'affiche.

- `pos` (*vec3*) : Position du marqueur.
- `rot` (*quat|nil*) : Rotation facultative.
- `scale` (*vec3|nil*) : Échelle (1,1,1 par défaut).
- **renvoie** : integer|nil Id du marqueur, ou nil en cas d'échec.

#### `gameplay_tutorial_markers.createMarkerAboveVehicle(vehicle, scale)`

Crée un marqueur d'attention 2 m au-dessus d'un véhicule (échelle 1,5 par défaut).

- `vehicle` (*table*) : Objet véhicule (getPosition).
- `scale` (*vec3|nil*) : Échelle du marqueur.
- **renvoie** : integer|nil Id du marqueur, ou nil.

#### `gameplay_tutorial_markers.removeMarker(markerId)`

Supprime un marqueur par son id.

- `markerId` (*integer*) : Id renvoyé à la création.
- **renvoie** : boolean true si supprimé, false s'il est introuvable.

#### `gameplay_tutorial_markers.removeParkingSpotDecal(parkingSpotName)`

Retire le décalque d'une place et le véhicule qui lui était associé.

- `parkingSpotName` (*string*) : Nom de la place.

#### `gameplay_tutorial_markers.setDefaultParkingSpotVehicleGetter(getter)`

Définit la fonction qui fournit le véhicule à tester pour la couleur des décalques de parking, quand aucun véhicule n'est associé à la place.

- `getter` (*function|nil*) : Fonction sans argument renvoyant un véhicule (objet) ou nil.

#### `gameplay_tutorial_markers.setParkingSpotVehicle(parkingSpotName, vehicle)`

Associe un véhicule à une place pour déterminer la couleur de son décalque.

- `parkingSpotName` (*string*) : Nom de la place.
- `vehicle` (*table|nil*) : Objet véhicule.

#### `gameplay_tutorial_markers.update(dt, dtSim)`

Met à jour les marqueurs (échelle selon la distance à la caméra, update de chaque marqueur) puis calcule et envoie les décalques de parking proches à Engine.Render.DynamicDecalMgr.

- `dt` (*number*) : Delta temps réel.
- `dtSim` (*number*) : Delta temps de simulation.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/tutorial/markers.lua`.*
