# `energyStorage_n2oTank`

*Fichier : `lua/vehicle/energyStorage/n2oTank.lua` · VM : Véhicule · 148 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de stockage d'énergie `n2oTank`, accessible par `energyStorage.getStorage("nom")`

Type de stockage d'énergie 'n2oTank' : bouteille de protoxyde d'azote (nitrous). Capacité exprimée en masse (kg), l'énergie stockée étant la masse multipliée par une densité énergétique fictive. Fonctionne comme fuelTank (masse des nœuds ajustée, fuite en 60 s si la poutre déclencheuse casse). Instancié par energyStorage.lua pour `type = "n2oTank"`.

## Exemple

```lua
local n2o = energyStorage.getStorage("n2oTank")
n2o:setRemainingMass(5)  -- 5 kg restants
```

## Remarques

- Champs jbeam lus : name, type, capacity (kg, défaut 0), startingCapacity (kg, limité à capacity), energyDensity, breakTriggerBeam, nodes._engineGroup_nodes.
- energyDensity par défaut = 41,5e6 / 5 (rapport carburant:N2O de 1:5, pour que les deux réservoirs perdent la même énergie). Le commentaire du code dit MJ/kg mais la valeur est en J/kg.
- energyType est fixé à 'n2o'. brokenLeakRate = capacity / 60 (kg/s).
- Utilise la globale `v` et `obj:setNodeMass` du moteur ; les nœuds reçoivent masse initiale + storedEnergy * nodeMassCoef.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `energyStorage_n2oTank.new(jbeamData)` | Crée l'instance de bouteille N2O à partir de l'entrée jbeam. *(interne)* | 84 |

### Détail des paramètres

#### `energyStorage_n2oTank.new(jbeamData)`

Crée l'instance de bouteille N2O à partir de l'entrée jbeam.

- `jbeamData` (*table*) : Données jbeam fusionnées du stockage.
- **renvoie** : table Instance de stockage (classe 'storage').

## Classe `storage`

Instance renvoyée par new(jbeamData). Champs notables : name, type, energyType ('n2o'), storedEnergy (J), energyCapacity (J), initialStoredEnergy, capacity (kg), startingCapacity (kg), remainingMass (kg), remainingRatio, currentLeakRate (kg/s), brokenLeakRate, energyDensity, assignedDevices.

Objet `storage` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `storage:deserialize(data)` | Restaure remainingMass si présent. | 74 |
| `storage:getPartCondition()` | Renvoie l'intégrité (toujours 1) et {storedEnergy}. | 53 |
| `storage:onBreak()` | Appelé à la rupture d'une poutre déclencheuse : active la fuite. | 31 |
| `storage:registerDevice(device)` | Enregistre un périphérique dans assignedDevices. | 35 |
| `storage:reset()` | Remplit la bouteille au niveau de départ, supprime la fuite et réapplique la masse aux nœuds. | 62 |
| `storage:serialize()` | Renvoie {remainingMass}. | 80 |
| `storage:setPartCondition(odometer, integrity, visual)` | Restaure l'état depuis la condition de pièce (nombre = fraction, ou table {storedEnergy}). | 39 |
| `storage:setRemainingMass(mass)` | Fixe la masse restante (bornée entre 0 et capacity). | 23 |
| `storage:setRemainingRatio(ratio)` | Fixe storedEnergy à energyCapacity * ratio (ratio borné entre 0 et 1). | 27 |
| `storage:updateGFX(dt)` | Appelé chaque frame : recalcule remainingMass/remainingRatio, applique la masse aux nœuds et applique la fuite si active. | 10 |

## Appels vers le moteur (C++)

- `obj:` `setNodeMass`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/energyStorage/n2oTank.lua`.*
