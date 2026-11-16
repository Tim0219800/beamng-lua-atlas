# `energyStorage_pressureTank`

*Fichier : `lua/vehicle/energyStorage/pressureTank.lua` · VM : Véhicule · 399 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de stockage d'énergie `pressureTank`, accessible par `energyStorage.getStorage("nom")`

Type de stockage d'énergie 'pressureTank' : réservoir de gaz sous pression (air comprimé des camions, remorques, suspensions pneumatiques). L'énergie vaut P·V (loi des gaz parfaits, tient compte de la pression et température ambiantes du powertrain), le réservoir peut fuir (rupture de poutre ou déformation) et peut alimenter ou être alimenté par un autre véhicule via un coupleur (pneumatic PTO, synchronisation par electrics). Instancié par energyStorage.lua pour `type = "pressureTank"`.

## Exemple

```lua
local tank = energyStorage.getStorage("airTank")
local relativePressurePa = electrics.values[tank.pressureElectricName]  -- "airTank_pressureRelative"
tank:toggleConsumerPressureCoef()  -- coupe/rétablit l'alimentation de la remorque
```

## Remarques

- Champs jbeam lus : name, type, energyType (défaut 'air'), gasMolarMass (g/mol, défaut 28,9647), capacity (volume en m³), maxPressure (Pa, défaut 1 000 000), startingPressure (Pa relatif, ajoute la pression ambiante), isPrimarySupply, breakTriggerBeam, tankDamageDeformGroup, showDebugGraph, nodes._engineGroup_nodes, pneumaticPTOPressureBaseSyncName, pneumaticPTOFlowBaseSyncName, pneumaticPTOSupplyCouplerNodeNames, pneumaticPTOConsumerCouplerNodeNames, consumerPressureDiffFlowRateCoef (défaut 1e-6).
- Électricité publiée : <nom>_pressureRelative (pression - pression ambiante, Pa), <nom>_pressureConsumer (pression envoyée aux consommateurs), <nom>_pressureConsumerCoef, et les clés de synchronisation <base>_<objectId> (pneumaticPTOPressure_<id>, pneumaticPTOFlow_<id>).
- Rôles : une citerne avec isPrimarySupply est source (supplyPressure = pression propre). Au couplage sur un nœud de pneumaticPTOSupplyCouplerNodeNames elle devient consommatrice d'un autre véhicule, sur un nœud de pneumaticPTOConsumerCouplerNodeNames elle devient fournisseur. Un seul consommateur par fournisseur est supporté (TODO dans le code).
- Unités : storedEnergy et energyCapacity en J (= Pa·m³), capacity en m³, pression en Pa, remainingMass en kg, maxLeakRate = capacity / 3 (m³/s, le commentaire du code dit 5 secondes).
- Les fuites sont signalées dans damageTracker : groupe 'pressureTank', noms 'breakLeak' et 'deformationLeak'.
- Anomalie : setConsumerPressureCoef utilise `coef > 0` (valeur non bornée) pour le message d'activation alors que la valeur stockée est bornée entre 0 et 1.
- Anomalie : onCouplerAttached déclare le dernier paramètre `attachForce`, mais energyStorage.lua lui transmet attachEnergy.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `energyStorage_pressureTank.new(jbeamData)` | Crée l'instance de réservoir sous pression, calcule énergie, masse et noms d'electrics, et initialise les valeurs electrics et dommages. *(interne)* | 268 |

### Détail des paramètres

#### `energyStorage_pressureTank.new(jbeamData)`

Crée l'instance de réservoir sous pression, calcule énergie, masse et noms d'electrics, et initialise les valeurs electrics et dommages.

- `jbeamData` (*table*) : Données jbeam fusionnées du stockage.
- **renvoie** : table Instance de stockage (classe 'storage').

## Classe `storage`

Instance renvoyée par new(jbeamData). Champs notables : name, type, energyType, capacity (m³), storedEnergy (J), energyCapacity (J), initialStoredEnergy, remainingMass (kg), remainingRatio, currentPressure (Pa absolu), supplyPressure, maxWorkingPressure, currentLeakRate, maxLeakRate, consumerPressureCoef (0 à 1), pressureElectricName, pressureConsumerElectricName, pressureConsumerCoefElectricName.

Objet `storage` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `storage:deserialize(data)` | Restaure remainingMass si présent. | 258 |
| `storage:getPartCondition()` | Renvoie l'intégrité (toujours 1) et {storedEnergy}. | 215 |
| `storage:getRemainingMass()` | Renvoie la masse de gaz restante. | 166 |
| `storage:onBreak()` | Appelé à la rupture d'une poutre déclencheuse : fuite maximale et dommage 'breakLeak'. | 194 |
| `storage:onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce)` | Hook de couplage : si le nœud est un nœud d'alimentation, crée les noms electrics de synchronisation avec le véhicule fournisseur et demande l'export de la pression ; si c'est un nœud consommateur, initialise pression et débit et demande l'export du débit. | 116 |
| `storage:onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook de détachement : supprime les electrics de synchronisation côté consommateur (supplyPressure remis à 0) ou le débit côté fournisseur. | 142 |
| `storage:registerDevice(device)` | Enregistre un périphérique dans assignedDevices. | 199 |
| `storage:reset()` | Remet le réservoir à sa pression de départ, supprime fuites et synchronisations, réinitialise les electrics et les dommages. | 224 |
| `storage:serialize()` | Renvoie {remainingMass}. | 264 |
| `storage:setConsumerPressureCoef(coef)` | Fixe le coefficient de pression envoyée aux consommateurs (borné 0 à 1) et affiche un message UI (trailerAir enabled/disabled). | 185 |
| `storage:setPartCondition(odometer, integrity, visual)` | Restaure storedEnergy depuis la condition de pièce (nombre = fraction de energyCapacity, ou table {storedEnergy}). | 203 |
| `storage:setRemainingMass(mass)` | Fixe la masse de gaz (convertie en moles puis en énergie). | 170 |
| `storage:setRemainingRatio(ratio)` | Fixe le taux de remplissage par rapport à la pression maximale. | 179 |
| `storage:toggleConsumerPressureCoef()` | Bascule entre 0 et 1 pour consumerPressureCoef. | 190 |
| `storage:updateEnergy(molarQuantity)` | Recalcule storedEnergy, remainingMass et remainingRatio à la température ambiante courante. Sans argument, déduit la quantité de gaz de l'énergie actuelle et de l'ancienne température. | 101 |
| `storage:updateGFX(dt)` | Appelé chaque frame : calcule la pression, synchronise avec les fournisseurs/consommateurs, applique la fuite (rupture ou déformation), met à jour énergie et masse des nœuds et publie la pression relative dans electrics. | 58 |
| `storage:updateTankSync(dt)` | Côté consommateur : équilibre l'énergie avec la pression d'alimentation du fournisseur et publie le débit ; côté fournisseur : publie la pression envoyée au consommateur et retire l'énergie correspondant au débit reçu. | 16 |

## Appels vers le moteur (C++)

- `obj:` `setNodeMass`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/energyStorage/pressureTank.lua`.*
