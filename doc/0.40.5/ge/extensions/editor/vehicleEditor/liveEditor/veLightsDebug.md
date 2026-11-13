# `editor_vehicleEditor_liveEditor_veLightsDebug`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua` · VM : Game Engine (GE) · 159 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_veLightsDebug` : `extensions.load("editor_vehicleEditor_liveEditor_veLightsDebug")`, puis la globale `editor_vehicleEditor_liveEditor_veLightsDebug`

Fenêtre 'Lights Debug' du Vehicle Editor live. Dessine avec debugDrawer les props lumineux du véhicule (vdata.props dont mesh vaut SPOTLIGHT ou POINTLIGHT) : pour un spot, une sphère, une ligne de direction de longueur lightRange et une pointe de flèche ; pour un point de lumière, une sphère et une sphère translucide de rayon lightRange. Options : spots, points, X-Ray (sans test de profondeur), noms, vecteurs unitaires (longueur 1).

## Remarques

- Le dessin se fait dans le hook onVehicleEditorRenderJBeams émis par editor_veMain ; la position vient de prop:getLiveTransformWorld() + vEditor.vehiclePos.
- Un drawLine nul est dessiné avant chaque prop comme contournement d'un bug du debugDrawer (indiqué dans le code).
- setSolidTriCulling(false) est appelé à chaque frame mais jamais rétabli (ligne commentée).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veLightsDebug.onDeserialized(data)` | Restaure l'état d'ouverture. *(interne)* *(hook)* | 147 |
| `editor_vehicleEditor_liveEditor_veLightsDebug.onSerialize()` | Renvoie {windowOpen}. *(interne)* *(hook)* | 141 |
| `editor_vehicleEditor_liveEditor_veLightsDebug.onUpdate()` | Appelé chaque frame : dessine la fenêtre avec les cases à cocher. *(interne)* *(hook)* | 123 |
| `editor_vehicleEditor_liveEditor_veLightsDebug.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)` | Hook émis par editor_veMain à chaque frame de rendu : dessine les spots et points lumineux des props du véhicule si la fenêtre est ouverte. *(interne)* *(hook)* | 32 |
| `editor_vehicleEditor_liveEditor_veLightsDebug.open()` | Ouvre la fenêtre. | 137 |

### Détail des paramètres

#### `editor_vehicleEditor_liveEditor_veLightsDebug.onDeserialized(data)`

Restaure l'état d'ouverture.

- `data` (*table*) : Table de onSerialize.

#### `editor_vehicleEditor_liveEditor_veLightsDebug.onSerialize()`

Renvoie {windowOpen}.

- **renvoie** : table {windowOpen = boolean}

#### `editor_vehicleEditor_liveEditor_veLightsDebug.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`

Hook émis par editor_veMain à chaque frame de rendu : dessine les spots et points lumineux des props du véhicule si la fenêtre est ouverte.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | 'Lights Debug'. |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`, `drawTriSolid`, `setSolidTriCulling`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua`.*
