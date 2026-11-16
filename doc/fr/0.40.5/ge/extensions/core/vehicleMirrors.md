# `core_vehicleMirrors`

*Fichier : `lua/ge/extensions/core/vehicleMirrors.lua` · VM : Game Engine (GE) · 145 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicleMirrors` : `extensions.load("core_vehicleMirrors")`, puis la globale `core_vehicleMirrors`

Extension GE `core_vehicleMirrors` : ébauche de rendu des reflets de rétroviseurs. Suit le véhicule du joueur 0, demande ses données de miroirs via le hook onVehicleMirrorsChanged, puis contient (renderMirrors) le code qui calcule la direction de réflexion et appelle veh:renderCameraToMaterial vers une texture 128x128 (FOV 70). En l'état, ce rendu est désactivé : l'appel à renderMirrors et à l'UI de réglage sont commentés dans onPreRender. L'extension est donc pratiquement inerte.

## Remarques

- Distinct de core_vehicle_mirror (réglage des angles).
- Le module appelle lui-même extensions.hook('onVehicleMirrorsChanged', vehId, vData.mirrors or {}) depuis onPreRender, puis reçoit ce hook (onVehicleMirrorsChanged) comme n'importe quelle extension ; `vData.mirrors` est lu sur le bundle du véhicule (le champ jbeam est plutôt vData.vdata.mirrors, d'où probablement toujours {}).
- Le code du rendu (non exécuté) suppose pour chaque miroir les champs id1, id2, id3 (noeuds), textureTarget et userCorrection (vec3 ajouté par ce module).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicleMirrors.onPreRender(dtReal, dtSim, dtRaw)` | Hook par frame avant le rendu : détecte un changement de véhicule du joueur 0 et déclenche une demande de données de miroirs (hook onVehicleMirrorsChanged). Le rendu des miroirs lui-même est commenté. *(interne)* *(hook)* | 108 |
| `core_vehicleMirrors.onVehicleMirrorsChanged(id, data)` | Hook (émis par ce module) : reçoit les données de miroirs du véhicule suivi (ignorées pour un autre véhicule), les mémorise et ajoute à chaque miroir un champ userCorrection (vec3 nul). *(interne)* *(hook)* | 128 |
| `core_vehicleMirrors.onVehicleSwitched(oldVehId, newVehId)` | Hook : le joueur change de véhicule (ne fait rien). *(interne)* *(hook)* | 9 |

### Détail des paramètres

#### `core_vehicleMirrors.onPreRender(dtReal, dtSim, dtRaw)`

Hook par frame avant le rendu : détecte un changement de véhicule du joueur 0 et déclenche une demande de données de miroirs (hook onVehicleMirrorsChanged). Le rendu des miroirs lui-même est commenté.

- `dtReal` (*number*) : temps réel (s)
- `dtSim` (*number*) : temps de simulation (s)
- `dtRaw` (*number*) : temps brut (s)

#### `core_vehicleMirrors.onVehicleMirrorsChanged(id, data)`

Hook (émis par ce module) : reçoit les données de miroirs du véhicule suivi (ignorées pour un autre véhicule), les mémorise et ajoute à chaque miroir un champ userCorrection (vec3 nul).

- `id` (*integer*) : véhicule
- `data` (*table*) : table de miroirs

#### `core_vehicleMirrors.onVehicleSwitched(oldVehId, newVehId)`

Hook : le joueur change de véhicule (ne fait rien).

- `oldVehId` (*integer*) : ancien véhicule
- `newVehId` (*integer*) : nouveau véhicule

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleMirrorsChanged` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `setDrawingEnabled`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicleMirrors.lua`.*
