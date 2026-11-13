# `energyStorage_electricBattery`

*Fichier : `lua/vehicle/energyStorage/electricBattery.lua` · VM : Véhicule · 87 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de stockage d'énergie `electricBattery`, accessible par `energyStorage.getStorage("nom")`

Type de stockage d'énergie 'electricBattery' : batterie de véhicule électrique. L'énergie est gardée en joules (energyType 'electricEnergy') et configurée en kWh dans le jbeam. Instanciée par energyStorage.lua à partir d'une entrée jbeam de `type = "electricBattery"` ; les moteurs électriques la consomment via les périphériques du powertrain.

## Exemple

```lua
-- jbeam
-- "energyStorage": [["name","type","batteryCapacity","startingCapacity"],["mainBattery","electricBattery",60,60]]
```

## Remarques

- Champs jbeam lus : name, type, batteryCapacity (kWh, défaut 0), startingCapacity (kWh, défaut = batteryCapacity).
- Conversion : 1 kWh = 3 600 000 J. storedEnergy, energyCapacity, initialStoredEnergy sont en joules.
- Anomalie de nommage : remainingVolume contient storedEnergy / 3600000, c'est-à-dire l'énergie en kWh, pas un volume.
- updateGFX réécrit storedEnergy via setStoredEnergy chaque frame pour recalculer remainingVolume et remainingRatio ; aucune limite (clamp) n'est appliquée à storedEnergy à ce stade.
- setRemainingRatio ne met à jour que storedEnergy (le reste est recalculé à la frame suivante).
- Pas de fuite, pas de onBreak, pas de serialize/deserialize pour ce type.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `energyStorage_electricBattery.new(jbeamData)` | Crée un stockage de type batterie électrique à partir de l'entrée jbeam. Le stockage renvoyé est une table avec name, type, energyType, assignedDevices, capacity (kWh), startingCapacity (kWh), energyCapacity (J), initialStoredEnergy (J), storedEnergy, remainingRatio, remainingVolume, jbeamData et les méthodes listées dans la classe 'storage'. *(interne)* | 52 |

### Détail des paramètres

#### `energyStorage_electricBattery.new(jbeamData)`

Crée un stockage de type batterie électrique à partir de l'entrée jbeam. Le stockage renvoyé est une table avec name, type, energyType, assignedDevices, capacity (kWh), startingCapacity (kWh), energyCapacity (J), initialStoredEnergy (J), storedEnergy, remainingRatio, remainingVolume, jbeamData et les méthodes listées dans la classe 'storage'.

- `jbeamData` (*table*) : Données jbeam fusionnées du stockage.
- **renvoie** : table Instance de stockage (classe 'storage').

## Classe `storage`

Instance renvoyée par new(jbeamData). Les méthodes s'appellent avec la syntaxe `storage:methode(...)`.

Objet `storage` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `storage:getPartCondition()` | Renvoie l'intégrité (toujours 1) et l'état {storedEnergy}. | 39 |
| `storage:registerDevice(device)` | Enregistre un périphérique du powertrain dans assignedDevices (par son nom). | 23 |
| `storage:reset()` | Restaure la charge de départ (startingCapacity en kWh convertie en J). | 48 |
| `storage:setPartCondition(odometer, integrity, visual)` | Restaure l'état depuis la condition de pièce : un nombre est interprété comme fraction de energyCapacity, une table doit contenir storedEnergy. | 27 |
| `storage:setRemainingRatio(ratio)` | Fixe l'énergie à energyCapacity * ratio (ratio borné entre 0 et 1). | 15 |
| `storage:setStoredEnergy(energy)` | Fixe l'énergie stockée et recalcule remainingVolume (kWh) et remainingRatio. | 9 |
| `storage:updateGFX(dt)` | Appelé chaque frame par energyStorage.updateGFX : recalcule les valeurs dérivées. | 19 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/energyStorage/electricBattery.lua`.*
