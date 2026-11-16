# `editor_vehicleEditor_liveEditor_veGeneralData`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veGeneralData.lua` · VM : Game Engine (GE) · 112 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_veGeneralData` : `extensions.load("editor_vehicleEditor_liveEditor_veGeneralData")`, puis la globale `editor_vehicleEditor_liveEditor_veGeneralData`

Fenêtre 'General Data' du Vehicle Editor live. Chaque frame, elle envoie au VM du véhicule une commande qui renvoie (via obj:queueGameEngineLua) une table dans vEditor.generalData : position, rotation, direction, roll/pitch/yaw, vitesse, accélérations (sensors.gx2/gy2/gz2), vitesse air/sol, température, pression, densité de l'air et dégâts. Elle les affiche avec des unités lisibles.

## Remarques

- Unités affichées : position m, vitesse m/s, accélération m/s², température convertie de K en °C (-273.15), pression convertie de Pa en kPa (*0.001), densité kg/m³, dégâts en $.
- Les données arrivent avec un frame de retard (commande asynchrone queueLuaCommand).
- La commande est envoyée à chaque frame où la fenêtre est ouverte (im.Begin vrai).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veGeneralData.onDeserialized(data)` | Restaure l'état d'ouverture. *(interne)* *(hook)* | 101 |
| `editor_vehicleEditor_liveEditor_veGeneralData.onSerialize()` | Renvoie {windowOpen}. *(interne)* *(hook)* | 95 |
| `editor_vehicleEditor_liveEditor_veGeneralData.onUpdate()` | Appelé chaque frame : demande les données au véhicule et dessine le tableau à deux colonnes. *(interne)* *(hook)* | 20 |
| `editor_vehicleEditor_liveEditor_veGeneralData.open()` | Ouvre la fenêtre. | 91 |

### Détail des paramètres

#### `editor_vehicleEditor_liveEditor_veGeneralData.onDeserialized(data)`

Restaure l'état d'ouverture.

- `data` (*table*) : Table de onSerialize.

#### `editor_vehicleEditor_liveEditor_veGeneralData.onSerialize()`

Renvoie {windowOpen}.

- **renvoie** : table {windowOpen = boolean}

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | 'General Data'. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veGeneralData.lua`.*
