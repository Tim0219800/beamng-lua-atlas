# `editor_vehicleEditor_liveEditor_veRawData`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veRawData.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_veRawData` : `extensions.load("editor_vehicleEditor_liveEditor_veRawData")`, puis la globale `editor_vehicleEditor_liveEditor_veRawData`

Fenêtre 'Raw Vehicle Data' du Vehicle Editor live : affiche sous forme d'arbre imgui récursif toute la table vEditor.vehData (données du véhicule courant, dont vdata jbeam) via imguiUtils.addRecursiveTreeTable. Utile à un moddeur pour inspecter la structure jbeam résolue.

## Remarques

- Rien n'est dessiné tant que la fenêtre n'est pas ouverte ou que vEditor.vehicle/vehData sont absents.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veRawData.onDeserialized(data)` | Restaure l'état d'ouverture de la fenêtre. *(interne)* *(hook)* | 36 |
| `editor_vehicleEditor_liveEditor_veRawData.onSerialize()` | Renvoie {windowOpen} pour restaurer l'état après rechargement Lua. *(interne)* *(hook)* | 30 |
| `editor_vehicleEditor_liveEditor_veRawData.onUpdate()` | Appelé chaque frame : dessine la fenêtre et l'arbre des données si elle est ouverte. *(interne)* *(hook)* | 15 |
| `editor_vehicleEditor_liveEditor_veRawData.open()` | Ouvre la fenêtre (utilisé par le menu du Vehicle Editor). | 26 |

### Détail des paramètres

#### `editor_vehicleEditor_liveEditor_veRawData.onDeserialized(data)`

Restaure l'état d'ouverture de la fenêtre.

- `data` (*table*) : Table de onSerialize.

#### `editor_vehicleEditor_liveEditor_veRawData.onSerialize()`

Renvoie {windowOpen} pour restaurer l'état après rechargement Lua.

- **renvoie** : table {windowOpen = boolean}

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | 'Raw Vehicle Data' : libellé du menu lu par editor_veMain. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veRawData.lua`.*
