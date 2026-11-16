# `util_lawnMower`

*Fichier : `lua/ge/extensions/util/lawnMower.lua` · VM : Game Engine (GE) · 270 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_lawnMower` : `extensions.load("util_lawnMower")`, puis la globale `util_lawnMower`

Tondeuse à gazon pilotée par les props JBeam (côté GE uniquement). Il cherche dans le JBeam analysé de chaque véhicule les props portant l'option mowerRadius et, tant que le plateau de coupe est bas et à plat au-dessus d'un terrain, coupe l'herbe dans le masque de surface partagé (util_surfaceMaskWheels) en traçant un disque puis des segments, et lance des particules de brins d'herbe sur les matériaux de terrain dont le nom contient « grass ». Aucun Lua côté véhicule n'est nécessaire. La partie JBeam déclare "gameEngineExtensions": {"util_lawnMower": true} pour charger l'extension automatiquement.

## Exemple

```lua
-- Dans la partie JBeam de la tondeuse :
-- "gameEngineExtensions": {"util_lawnMower": true},
-- "props": [["func","mesh","idRef:","idX:","idY:","baseRotation","rotation","translation"],
--   ["mower_deck","deck.dae","deck_ref","deck_x","deck_y",{"x":0,"y":0,"z":0},{"x":0,"y":0,"z":0},{"x":0,"y":0,"z":0},{"mowerRadius":0.9,"mowerGroundDistance":0.4}]]
extensions.util_lawnMower.toggle()
```

## Remarques

- Options de prop : mowerRadius (m, obligatoire, rayon du passage coupé) ; mowerGroundDistance (m, défaut 0,5 : hauteur maximale du centre du plateau au-dessus du terrain pour couper).
- Le plateau coupe seulement s'il est bas ET posé à plat : le plan défini par les nœuds idRef/idX/idY doit être à peu près parallèle au terrain (|cos| >= 0,85, environ 31 degrés). Pour que relever ou replier le plateau coupe la coupe, il doit être monté sur de vrais nœuds physiques ; une simple animation de prop n'est pas détectée.
- Le centre de coupe est le centroïde de idRef, idX, idY (repli sur idRef seul si idX/idY manquent).
- Mise à jour toutes les 0,05 s. Seuls le véhicule joueur et les tondeuses proches (fenêtre du clipmap) coupent ; la fenêtre est centrée sur le véhicule joueur (setCenter).
- Les brins d'herbe ne sont lancés qu'à la première coupe d'une cellule de 0,5 m (cache mownCells), sur matériau « grass » (heuristique sur le nom). Le masque est sur GPU et ne peut pas être relu.
- Un déplacement de plus de 10 m entre deux mises à jour est traité comme une téléportation (pas de trait) ; sous 0,2 m rien n'est tracé.

**Dépendances (chargées avant) :** `util_surfaceMaskWheels`, `core_vehicle_manager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_lawnMower.onClientStartMission()` | Hook appelé au démarrage d'un niveau : vide les caches de cellules coupées, de matériaux d'herbe et d'objet terrain. *(interne)* *(hook)* | 233 |
| `util_lawnMower.onDeserialized(data)` | Hook de désérialisation après rechargement : restaure l'état enabled. *(interne)* *(hook)* | 264 |
| `util_lawnMower.onExtensionLoaded()` | Appelé au chargement : active la tondeuse et scanne les véhicules déjà présents. *(interne)* *(hook)* | 244 |
| `util_lawnMower.onPreRender(dtReal, dtSim)` | Hook appelé chaque frame avant le rendu : si activé et si des tondeuses existent, centre le clipmap du masque et fait couper chaque tondeuse (toutes les 0,05 s). Supprime l'état des véhicules disparus. *(interne)* *(hook)* | 164 |
| `util_lawnMower.onSerialize()` | Hook de sérialisation avant un rechargement d'extensions : sauvegarde l'état enabled. *(interne)* *(hook)* | 260 |
| `util_lawnMower.onVehicleDestroyed(vehId)` | Hook appelé quand un véhicule est détruit : oublie ses tondeuses. *(interne)* *(hook)* | 239 |
| `util_lawnMower.onVehicleSpawned(vehId)` | Hook appelé quand un véhicule apparaît (ou est réapparu après un changement de pièce) : relit ses props JBeam à la recherche de mowerRadius. *(interne)* *(hook)* | 229 |
| `util_lawnMower.setEnabled(enabled)` | Active ou désactive la coupe et remet le chronomètre à zéro. | 251 |
| `util_lawnMower.toggle()` | Inverse l'état activé/désactivé. | 256 |

### Détail des paramètres

#### `util_lawnMower.onDeserialized(data)`

Hook de désérialisation après rechargement : restaure l'état enabled.

- `data` (*table|nil*) : Données renvoyées par onSerialize

#### `util_lawnMower.onPreRender(dtReal, dtSim)`

Hook appelé chaque frame avant le rendu : si activé et si des tondeuses existent, centre le clipmap du masque et fait couper chaque tondeuse (toutes les 0,05 s). Supprime l'état des véhicules disparus.

- `dtReal` (*number*) : Delta de temps réel en secondes
- `dtSim` (*number*) : Delta de temps de simulation en secondes (prioritaire pour le chronomètre)

#### `util_lawnMower.onSerialize()`

Hook de sérialisation avant un rechargement d'extensions : sauvegarde l'état enabled.

- **renvoie** : table {enabled = boolean}

#### `util_lawnMower.onVehicleDestroyed(vehId)`

Hook appelé quand un véhicule est détruit : oublie ses tondeuses.

- `vehId` (*integer*) : Identifiant du véhicule

#### `util_lawnMower.onVehicleSpawned(vehId)`

Hook appelé quand un véhicule apparaît (ou est réapparu après un changement de pièce) : relit ses props JBeam à la recherche de mowerRadius.

- `vehId` (*integer*) : Identifiant du véhicule

#### `util_lawnMower.setEnabled(enabled)`

Active ou désactive la coupe et remet le chronomètre à zéro.

- `enabled` (*boolean*) : true pour activer

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions requises : util_surfaceMaskWheels (service de masque) et core_vehicle_manager (données JBeam analysées) |
| `enabled` | boolean | Active ou non la coupe ; true après onExtensionLoaded |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/lawnMower.lua`.*
