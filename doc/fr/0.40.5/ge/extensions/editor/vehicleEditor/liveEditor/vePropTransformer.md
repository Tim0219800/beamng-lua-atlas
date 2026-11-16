# `editor_vehicleEditor_liveEditor_vePropTransformer`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua` · VM : Game Engine (GE) · 573 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_vePropTransformer` : `extensions.load("editor_vehicleEditor_liveEditor_vePropTransformer")`, puis la globale `editor_vehicleEditor_liveEditor_vePropTransformer`

Fenêtre 'Prop Transformer' du Vehicle Editor live : permet de choisir un prop (pièce visuelle comme un rétroviseur ou une lampe) du véhicule en visant son nœud de référence ('Pick Prop', molette pour parcourir les props superposés) puis de modifier sa transformation en direct : baseTranslation, baseTranslationGlobal (m), baseRotation, baseRotationGlobal (affichées en degrés, converties en radians pour le moteur), soit par champs numériques, soit avec le gizmo d'axes. Les valeurs « sans nodeRotate/Offset/Move » peuvent être copiées dans le presse-papiers au format JSON "x":…, "y":…, "z":… pour les coller dans le jbeam.

## Remarques

- Les modifications ne s'appliquent qu'à la session live ; il faut recopier les valeurs dans le jbeam.
- Les valeurs du presse-papiers ignorent les transformations de nœuds (nodeRotate/nodeOffset/nodeMove) : ce sont celles du jbeam d'origine.
- Les rotations sont saisies en degrés (champs EnterReturnsTrue : validées avec Entrée) mais stockées en radians côté moteur.
- État conservé par ID de véhicule (copie de vehData) ; onVehicleSpawned le supprime et le recrée.
- Utilise les mêmes gizmos que nodeTransformer (setAxisGizmoRenderPlane, MoveGrid, PlaneHashes).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_vePropTransformer.onDeserialized(data)` | Restaure l'état d'ouverture. *(interne)* *(hook)* | 560 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.onSerialize()` | Renvoie {windowOpen}. *(interne)* *(hook)* | 554 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.onUpdate(dt)` | Appelé chaque frame : dessine la fenêtre (bouton Pick Prop, champs de translation/rotation, boutons de copie et de gizmo). *(interne)* *(hook)* | 452 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)` | Hook de rendu émis par editor_veMain : initialise l'état si besoin, dessine le prop choisi, applique la transformation via gizmo et exécute le picking de prop (mode 2). *(interne)* *(hook)* | 433 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleSpawned(id)` | Quand un véhicule apparaît, oublie puis recrée son état. *(interne)* *(hook)* | 545 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleSwitched(oldVehicle, newVehicle, player)` | Au changement de véhicule, bascule vers l'état du nouveau véhicule. *(interne)* *(hook)* | 541 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.open()` | Ouvre la fenêtre. | 550 |

### Détail des paramètres

#### `editor_vehicleEditor_liveEditor_vePropTransformer.onDeserialized(data)`

Restaure l'état d'ouverture.

- `data` (*table*) : Table de onSerialize.

#### `editor_vehicleEditor_liveEditor_vePropTransformer.onSerialize()`

Renvoie {windowOpen}.

- **renvoie** : table {windowOpen = boolean}

#### `editor_vehicleEditor_liveEditor_vePropTransformer.onUpdate(dt)`

Appelé chaque frame : dessine la fenêtre (bouton Pick Prop, champs de translation/rotation, boutons de copie et de gizmo).

- `dt` (*number*) : Delta temps.

#### `editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`

Hook de rendu émis par editor_veMain : initialise l'état si besoin, dessine le prop choisi, applique la transformation via gizmo et exécute le picking de prop (mode 2).

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleSpawned(id)`

Quand un véhicule apparaît, oublie puis recrée son état.

- `id` (*integer*) : ID du véhicule.

#### `editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleSwitched(oldVehicle, newVehicle, player)`

Au changement de véhicule, bascule vers l'état du nouveau véhicule.

- `oldVehicle` (*integer*) : ID de l'ancien véhicule.
- `newVehicle` (*integer*) : ID du nouveau véhicule.
- `player` (*integer*) : Index du joueur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | 'Prop Transformer'. |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`, `drawTriSolid`
- `worldEditorCppApi.` `setAxisGizmoRenderMoveGrid`, `setAxisGizmoRenderPlane`, `setAxisGizmoRenderPlaneHashes`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua`.*
