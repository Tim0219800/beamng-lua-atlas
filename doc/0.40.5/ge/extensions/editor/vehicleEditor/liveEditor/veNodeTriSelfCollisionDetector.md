# `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua` · VM : Game Engine (GE) · 227 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector` : `extensions.load("editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector")`, puis la globale `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector`

Fenêtre 'Node Triangle Self Collision Detector' du Vehicle Editor live. Le bouton 'Start Analysis' teste, pour chaque triangle collidable, quels nœuds du véhicule passent à moins d'un rayon donné (0.025 à 0.1 m, 0.025 m étant le vrai rayon de collision) du triangle. Sont ignorés : triangles NONCOLLIDABLE, nœuds du triangle, nœuds sans collision ou sans selfCollision, nœuds de coupleurs ou avec couplerTag/tag, et nœuds de même premier groupe qu'un sommet du triangle. Les paires trouvées sont imprimées dans la console et dessinées (sphère orange, triangle vert, textes).

## Remarques

- Complexité O(triangles x nœuds) exécutée en un seul frame : peut figer l'éditeur sur un gros véhicule.
- Les résultats sont stockés par ID de véhicule dans vehsResultData et inclus dans onSerialize.
- Distances en mètres.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onDeserialized(data)` | Restaure l'état d'ouverture et le rayon (data.nodeCollisionRadius). *(interne)* *(hook)* | 213 |
| `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onSerialize()` | Renvoie {windowOpen, nodeCollisionRadius, vehsResultData}. *(interne)* *(hook)* | 205 |
| `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onUpdate()` | Appelé chaque frame : dessine la fenêtre (curseur de rayon, boutons Start Analysis / Clear Results). *(interne)* *(hook)* | 177 |
| `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)` | Hook de rendu émis par editor_veMain : dessine les résultats de l'analyse du véhicule courant (sphère du nœud, triangle, étiquettes). *(interne)* *(hook)* | 40 |
| `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.open()` | Ouvre la fenêtre. | 201 |

### Détail des paramètres

#### `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onDeserialized(data)`

Restaure l'état d'ouverture et le rayon (data.nodeCollisionRadius).

- `data` (*table*) : Table de onSerialize.

#### `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onSerialize()`

Renvoie {windowOpen, nodeCollisionRadius, vehsResultData}.

- **renvoie** : table État à restaurer.

#### `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`

Hook de rendu émis par editor_veMain : dessine les résultats de l'analyse du véhicule courant (sphère du nœud, triangle, étiquettes).

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | 'Node Triangle Self Collision Detector'. |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawText`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua`.*
