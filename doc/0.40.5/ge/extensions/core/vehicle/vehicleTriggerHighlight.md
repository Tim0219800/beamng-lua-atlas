# `core_vehicle_vehicleTriggerHighlight`

*Fichier : `lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua` · VM : Game Engine (GE) · 296 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicle_vehicleTriggerHighlight` : `extensions.load("core_vehicle_vehicleTriggerHighlight")`, puis la globale `core_vehicle_vehicleTriggerHighlight`

Extension GE `core_vehicle_vehicleTriggerHighlight` : met en surbrillance dans le monde 3D des triggers de véhicule (zones d'interaction définies dans le jbeam). Chaque frame, onUpdate dessine avec debugDrawer une sphère (avec un cercle face caméra) ou une boîte pulsante (alpha oscillant) et, si demandé, une étiquette 'id - nom [section]'. Utile pour les outils de debug/édition de triggers.

## Exemple

```lua
core_vehicle_vehicleTriggerHighlight.setHighlightedTriggerByName(vehId, 'hood_trigger', {showTriggerIdAsLabel = true})
-- ...
core_vehicle_vehicleTriggerHighlight.clearHighlightedTrigger()
```

## Remarques

- Les identifiants sont mémorisés sous forme de chaînes ; `triggerId` est le cid du trigger (clé de vdata.triggers et argument de veh:getTrigger).
- Options par trigger : showTriggerIdAsLabel (true par défaut ; false masque l'étiquette).
- Le trigger est déterminé comme sphère si trg.type == 'sphere' (ou type absent et size nombre) et comme boîte si trg.type == 'box' (ou type absent et size table) ; rayon d'une sphère = size, sinon radius, sinon la moitié de la diagonale de size, sinon 0.1.
- drawOneHighlightedTrigger modifie la couleur partagée SPHERE_COLOR (champ alpha) à chaque dessin : les triggers dessinés dans la même frame partagent la même couleur.
- Les étiquettes utilisent debugDrawer:drawTextAdvanced ; les boîtes sont tracées en triangles pleins + arêtes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicle_vehicleTriggerHighlight.clearHighlightedTrigger()` | Retire toutes les surbrillances de tous les véhicules. | 207 |
| `core_vehicle_vehicleTriggerHighlight.getSerializedHighlightedTriggerData()` | Exporte les surbrillances sous forme de liste sérialisable. | 211 |
| `core_vehicle_vehicleTriggerHighlight.hasHighlightedTriggers()` | Indique si au moins un trigger est en surbrillance. | 154 |
| `core_vehicle_vehicleTriggerHighlight.isHighlightedTrigger(vehId, triggerId)` | Indique si un trigger donné est en surbrillance. | 158 |
| `core_vehicle_vehicleTriggerHighlight.onUpdate(dt)` | Hook par frame : dessine chaque trigger en surbrillance (sphère ou boîte pulsante, étiquette). *(interne)* *(hook)* | 282 |
| `core_vehicle_vehicleTriggerHighlight.setHighlightedTrigger(vehId, triggerId, options)` | Ajoute un trigger à la surbrillance (n'efface pas les autres). | 164 |
| `core_vehicle_vehicleTriggerHighlight.setHighlightedTriggerByName(vehId, triggerName, options)` | Comme setHighlightedTrigger mais retrouve le trigger par son nom, son id jbeam ou son cid dans vdata.triggers du véhicule. | 189 |
| `core_vehicle_vehicleTriggerHighlight.setSerializedHighlightedTriggerData(data)` | Remplace toutes les surbrillances par celles de la liste donnée (format de getSerialized…). Accepte aussi l'ancien format d'un seul tuple {vehId, triggerId}. | 224 |
| `core_vehicle_vehicleTriggerHighlight.unhighlightTrigger(vehId, triggerId)` | Retire un trigger de la surbrillance. | 196 |

### Détail des paramètres

#### `core_vehicle_vehicleTriggerHighlight.getSerializedHighlightedTriggerData()`

Exporte les surbrillances sous forme de liste sérialisable.

- **renvoie** : table[] liste de {vehId, triggerId, options}

#### `core_vehicle_vehicleTriggerHighlight.hasHighlightedTriggers()`

Indique si au moins un trigger est en surbrillance.

- **renvoie** : boolean true s'il y en a

#### `core_vehicle_vehicleTriggerHighlight.isHighlightedTrigger(vehId, triggerId)`

Indique si un trigger donné est en surbrillance.

- `vehId` (*integer*) : véhicule
- `triggerId` (*integer|string*) : cid du trigger
- **renvoie** : boolean true si en surbrillance

#### `core_vehicle_vehicleTriggerHighlight.onUpdate(dt)`

Hook par frame : dessine chaque trigger en surbrillance (sphère ou boîte pulsante, étiquette).

- `dt` (*number*) : temps écoulé (s), sert à faire pulser l'alpha

#### `core_vehicle_vehicleTriggerHighlight.setHighlightedTrigger(vehId, triggerId, options)`

Ajoute un trigger à la surbrillance (n'efface pas les autres).

- `vehId` (*integer*) : véhicule
- `triggerId` (*integer|string*) : cid du trigger
- `options` (*table|nil*) : {showTriggerIdAsLabel = boolean}

#### `core_vehicle_vehicleTriggerHighlight.setHighlightedTriggerByName(vehId, triggerName, options)`

Comme setHighlightedTrigger mais retrouve le trigger par son nom, son id jbeam ou son cid dans vdata.triggers du véhicule.

- `vehId` (*integer*) : véhicule
- `triggerName` (*string|number*) : nom, id ou cid du trigger
- `options` (*table|nil*) : {showTriggerIdAsLabel = boolean}
- **renvoie** : boolean false si le trigger est introuvable

#### `core_vehicle_vehicleTriggerHighlight.setSerializedHighlightedTriggerData(data)`

Remplace toutes les surbrillances par celles de la liste donnée (format de getSerialized…). Accepte aussi l'ancien format d'un seul tuple {vehId, triggerId}.

- `data` (*table*) : liste de {vehId, triggerId, options}

#### `core_vehicle_vehicleTriggerHighlight.unhighlightTrigger(vehId, triggerId)`

Retire un trigger de la surbrillance.

- `vehId` (*integer*) : véhicule
- `triggerId` (*integer|string*) : cid du trigger

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua`.*
