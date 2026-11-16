# `gameplay_util_vehicleSighting`

*Fichier : `lua/ge/extensions/gameplay/util/vehicleSighting.lua` · VM : Game Engine (GE) · 77 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_util_vehicleSighting` : `extensions.load("gameplay_util_vehicleSighting")`, puis la globale `gameplay_util_vehicleSighting`

Détermine si un observateur (la caméra du joueur ou un véhicule) peut « voir » un véhicule cible. La portée dépend de l'angle : portée maximale (80 m) droit devant, portée minimale (5 m) hors du cône périphérique (90°), interpolée entre les deux. Un rayon optionnel vérifie l'absence d'obstacle.

## Exemple

```lua
if gameplay_util_vehicleSighting.canPlayerSeeVehicle(vehId, {maxDistDirectSight = 120, needDirectVisualContact = false}) then ... end
```

## Remarques

- Paramètres par défaut : maxDistDirectSight 80 (m), minDistPeriphSight 5 (m), periphSightAngle 90 (degrés), needDirectVisualContact true.
- Si `params` est fourni, seules les clés présentes sont lues ; les clés manquantes retombent sur les valeurs par défaut.
- Le test de visibilité lance castRay entre les deux positions relevées de 1 m ; tout obstacle trouvé (statique ou dynamique) bloque la vue.
- Deux positions confondues (distance < 1e-6) renvoient true sans autre test.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_util_vehicleSighting.canPlayerSeeVehicle(targetVehId, params)` | Teste si la caméra du joueur voit le véhicule cible (position et direction de core_camera). | 46 |
| `gameplay_util_vehicleSighting.canVehicleSeeVehicle(observerVehId, targetVehId, params)` | Teste si un véhicule voit un autre véhicule (position et direction avant de l'observateur). | 59 |
| `gameplay_util_vehicleSighting.checkSighting(observerPos, observerDir, targetPos, params)` | Test de visibilité générique à partir de positions : distance, angle par rapport à la direction d'observation, puis rayon d'occultation. | 12 |

### Détail des paramètres

#### `gameplay_util_vehicleSighting.canPlayerSeeVehicle(targetVehId, params)`

Teste si la caméra du joueur voit le véhicule cible (position et direction de core_camera).

- `targetVehId` (*integer*) : Id du véhicule cible.
- `params` (*table|nil*) : Réglages, voir checkSighting.
- **renvoie** : boolean false si core_camera ou le véhicule n'existe pas.

#### `gameplay_util_vehicleSighting.canVehicleSeeVehicle(observerVehId, targetVehId, params)`

Teste si un véhicule voit un autre véhicule (position et direction avant de l'observateur).

- `observerVehId` (*integer*) : Id de l'observateur.
- `targetVehId` (*integer*) : Id de la cible.
- `params` (*table|nil*) : Réglages, voir checkSighting.
- **renvoie** : boolean false si l'un des véhicules n'existe pas.

#### `gameplay_util_vehicleSighting.checkSighting(observerPos, observerDir, targetPos, params)`

Test de visibilité générique à partir de positions : distance, angle par rapport à la direction d'observation, puis rayon d'occultation.

- `observerPos` (*vec3*) : Position de l'observateur.
- `observerDir` (*vec3*) : Direction de regard normalisée.
- `targetPos` (*vec3*) : Position de la cible.
- `params` (*table*) : maxDistDirectSight, minDistPeriphSight, periphSightAngle, needDirectVisualContact (table obligatoire).
- **renvoie** : boolean true si la cible est visible.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/util/vehicleSighting.lua`.*
