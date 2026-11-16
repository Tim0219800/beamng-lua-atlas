# `energyStorage_fuelTank`

*Fichier : `lua/vehicle/energyStorage/fuelTank.lua` · VM : Véhicule · 159 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de stockage d'énergie `fuelTank`, accessible par `energyStorage.getStorage("nom")`

Type de stockage d'énergie 'fuelTank' : réservoir de carburant liquide (essence, diesel, kérosène). L'énergie est stockée en joules à partir du volume en litres, de la masse volumique et de la densité énergétique ; la masse des nœuds d'engine group est ajustée selon le niveau, et une fuite peut vider le réservoir en 60 s s'il est percé. Instancié par energyStorage.lua pour `type = "fuelTank"`.

## Exemple

```lua
local tank = energyStorage.getStorage("mainTank")
tank:setRemainingVolume(20)   -- 20 litres restants
print(tank.remainingVolume, tank.remainingRatio)
```

## Remarques

- Champs jbeam lus : name, type, energyType ('gasoline' défaut, 'diesel', 'kerosene'), fuelCapacity (L), startingFuelCapacity (L, limité à fuelCapacity), energyDensity (J/kg), fuelLiquidDensity (kg/L), breakTriggerBeam, fuel._engineGroup_nodes (nœuds dont la masse varie avec le carburant).
- Valeurs par défaut : essence 41,5 MJ/kg et 0,75 kg/L ; diesel 43 MJ/kg et 0,84 kg/L ; kérosène 43 MJ/kg et 0,80 kg/L. Un energyType inconnu sans energyDensity/fuelLiquidDensity dans le jbeam donne 0 et provoquera des divisions par zéro dans updateGFX.
- Unités : storedEnergy et energyCapacity en J, remainingVolume en L, brokenLeakRate = capacité / 60 (L/s, vidange en 60 s).
- Les nœuds de fuelNodes reçoivent chaque frame la masse = masse initiale + storedEnergy * fuelNodeMassCoef (1 / (energyDensity * nombre de nœuds), donc masse de carburant répartie).
- La fuite après rupture n'est pas sauvegardée : getPartCondition renvoie toujours currentLeakRate = 0 dans l'état mais integrityValue = 0 si le réservoir fuit.
- Utilise la globale `v` (données du véhicule) et `obj:setNodeMass` du moteur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `energyStorage_fuelTank.new(jbeamData)` | Crée l'instance de réservoir à partir de l'entrée jbeam et applique tout de suite la masse de carburant aux nœuds concernés. *(interne)* | 87 |

### Détail des paramètres

#### `energyStorage_fuelTank.new(jbeamData)`

Crée l'instance de réservoir à partir de l'entrée jbeam et applique tout de suite la masse de carburant aux nœuds concernés.

- `jbeamData` (*table*) : Données jbeam fusionnées du stockage.
- **renvoie** : table Instance de stockage (classe 'storage').

## Classe `storage`

Instance renvoyée par new(jbeamData). Champs publics notables : name, type, energyType, storedEnergy (J), energyCapacity (J), initialStoredEnergy (J), capacity (L), startingCapacity (L), remainingVolume (L), remainingRatio (0 à 1), currentLeakRate (L/s), brokenLeakRate, energyDensity, fuelLiquidDensity, assignedDevices.

Objet `storage` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `storage:deserialize(data)` | Restaure remainingVolume depuis des données sérialisées (si présent). | 77 |
| `storage:getPartCondition()` | Renvoie l'intégrité (0 si fuite, 1 sinon) et l'état {storedEnergy, currentLeakRate = 0}. | 55 |
| `storage:onBreak()` | Appelé quand une poutre breakTriggerBeam casse : active la fuite (currentLeakRate = brokenLeakRate). | 31 |
| `storage:registerDevice(device)` | Enregistre un périphérique dans assignedDevices. | 35 |
| `storage:reset()` | Remplit le réservoir au niveau de départ, supprime la fuite et réapplique la masse aux nœuds. | 65 |
| `storage:serialize()` | Renvoie {remainingVolume} pour la sauvegarde. | 83 |
| `storage:setPartCondition(odometer, integrity, visual)` | Restaure l'état depuis la condition de pièce (nombre = fraction du réservoir, avec fuite si 0 ; ou table {storedEnergy, currentLeakRate}). | 39 |
| `storage:setRemainingRatio(ratio)` | Fixe storedEnergy à energyCapacity * ratio (ratio borné entre 0 et 1). | 27 |
| `storage:setRemainingVolume(volume)` | Fixe le volume restant (borné entre 0 et capacity) et met à jour storedEnergy. | 23 |
| `storage:updateGFX(dt)` | Appelé chaque frame : recalcule remainingVolume/remainingRatio, applique la masse aux nœuds et retire du carburant si currentLeakRate > 0. | 10 |

## Appels vers le moteur (C++)

- `obj:` `setNodeMass`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/energyStorage/fuelTank.lua`.*
