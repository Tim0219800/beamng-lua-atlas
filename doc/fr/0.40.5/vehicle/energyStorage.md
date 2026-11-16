# `energyStorage`

*Fichier : `lua/vehicle/energyStorage.lua` · VM : Véhicule · 320 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `energyStorage`

Gestionnaire des réservoirs d'énergie du véhicule (carburant, batterie, N2O, air comprimé…). Au init il charge dynamiquement chaque type depuis lua/vehicle/energyStorage/<type>.lua pour chaque entrée de la section jbeam `energyStorage`, enregistre les stockages auprès des périphériques du groupe motopropulseur (device.energyStorage), met à jour `remainingRatio` à chaque frame et relaie les événements de rupture de poutre, d'attelage et de condition de pièce. Un moddeur l'utilise pour retrouver un stockage par son nom (getStorage/getStorageSafe) et lire/modifier son énergie stockée.

## Exemple

```lua
local tank = energyStorage.getStorage("mainTank")
if tank then
  print(tank.storedEnergy, tank.remainingRatio)
end
-- appel sans risque d'erreur : renvoie un faux objet si le nom n'existe pas
energyStorage.getStorageSafe("nope"):setRemainingVolume(0)
```

## Remarques

- Chaque stockage est créé par `<factory>.new(jbeamData)` avec jbeamData = entrée jbeam fusionnée avec la section jbeam du même nom (v.data[name]). Le champ `type` choisit le fichier (electricBattery, fuelTank, n2oTank, pressureTank, ou tout .lua du dossier energyStorage).
- Un type inconnu provoque un log d'erreur et un `return` immédiat de init : les stockages suivants et le câblage des périphériques ne sont alors pas initialisés.
- Chaque stockage expose au minimum name, storedEnergy, initialStoredEnergy et remainingRatio (recalculé ici à chaque frame = storedEnergy / initialStoredEnergy, ou 0 si l'énergie initiale est 0). Méthodes optionnelles reconnues : updateGFX, reset, onBreak, onCouplerFound, onCouplerAttached, onCouplerDetached, setPartCondition, getPartCondition, serialize.
- breakTriggerBeam (nom ou liste de noms de poutres) : à la rupture de l'une d'elles, beamBroke appelle storage:onBreak() et marque damageTracker('energyStorage', name) à true.
- M.updateGFX vaut nop tant qu'aucun stockage n'existe ; init le remplace par la vraie fonction seulement si storageCount > 0.
- onDeserialize est vide (le code de restauration est commenté) : l'état sérialisé par onSerialize n'est pas relu.
- onCouplerAttached reçoit attachSpeed mais ne le transmet pas aux stockages (ils reçoivent nodeId, obj2id, obj2nodeId, attachEnergy).
- getPartCondition ne fournit jamais de condition visuelle (canProvideVisualCondition reste false).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `energyStorage.beamBroke(id)` | Appelé par le moteur quand une poutre casse. Si la poutre est un déclencheur d'un stockage, appelle storage:onBreak() et marque le dommage dans damageTracker. *(interne)* | 170 |
| `energyStorage.getPartCondition(partTypeData)` | Agrège la condition d'intégrité des stockages liés à la pièce (types 'energyStorage:<nom>'). integrityValue est le minimum des valeurs des stockages, integrityState une table par nom. *(interne)* | 258 |
| `energyStorage.getStorage(name)` | Renvoie le stockage portant ce nom, ou nil s'il n'existe pas. | 214 |
| `energyStorage.getStorageSafe(name)` | Comme getStorage mais renvoie nilStorage (objet qui absorbe tous les accès et appels) si le nom est inconnu, avec un log de debug. | 218 |
| `energyStorage.getStorages()` | Renvoie la table de tous les stockages indexée par nom. | 210 |
| `energyStorage.init()` | Appelé à l'initialisation du véhicule : découvre les types disponibles, instancie les stockages du jbeam, les enregistre dans les périphériques du powertrain, construit la table des poutres déclencheuses de rupture et crée nilStorage. *(interne)* | 30 |
| `energyStorage.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy)` | Hook appelé quand un coupleur s'attache ; relayé à storage:onCouplerAttached sans attachSpeed. *(interne)* *(hook)* | 192 |
| `energyStorage.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook appelé quand un coupleur se détache ; relayé à storage:onCouplerDetached. *(interne)* *(hook)* | 201 |
| `energyStorage.onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist)` | Hook appelé quand un coupleur trouve un partenaire proche ; relayé à storage:onCouplerFound. *(interne)* *(hook)* | 183 |
| `energyStorage.onDeserialize(data)` | Hook de désérialisation (sauvegarde) ; actuellement sans effet (code commenté). *(interne)* *(hook)* | 278 |
| `energyStorage.onSerialize()` | Hook de sérialisation : renvoie {nom = storage:serialize()} pour les stockages qui ont serialize(). *(interne)* *(hook)* | 289 |
| `energyStorage.reset()` | Appelé au reset du véhicule : appelle reset() de chaque stockage, remet leur dommage à false dans damageTracker et ré-enregistre les stockages auprès des périphériques. *(interne)* | 147 |
| `energyStorage.setPartCondition(partTypeData, odometer, integrity, visual)` | Applique la condition de pièce (odomètre, intégrité, visuel) aux stockages liés à la pièce ; si integrity est une table avec la clé energyStorage, la valeur du stockage est prise par son nom. *(interne)* | 243 |

### Détail des paramètres

#### `energyStorage.beamBroke(id)`

Appelé par le moteur quand une poutre casse. Si la poutre est un déclencheur d'un stockage, appelle storage:onBreak() et marque le dommage dans damageTracker.

- `id` (*integer*) : Identifiant (cid) de la poutre cassée.

#### `energyStorage.getPartCondition(partTypeData)`

Agrège la condition d'intégrité des stockages liés à la pièce (types 'energyStorage:<nom>'). integrityValue est le minimum des valeurs des stockages, integrityState une table par nom.

- `partTypeData` (*table<integer, string>*) : Liste de types de pièce, ex. {"energyStorage:mainTank"}.
- **renvoie** : table {integrityValue, integrityState, visualValue, visualState}.
- **renvoie** : boolean true si au moins un stockage sait fournir une condition d'intégrité.
- **renvoie** : boolean Condition visuelle disponible (toujours false).

#### `energyStorage.getStorage(name)`

Renvoie le stockage portant ce nom, ou nil s'il n'existe pas.

- `name` (*string*) : Nom du stockage (champ name du jbeam).
- **renvoie** : table|nil Le stockage ou nil.

#### `energyStorage.getStorageSafe(name)`

Comme getStorage mais renvoie nilStorage (objet qui absorbe tous les accès et appels) si le nom est inconnu, avec un log de debug.

- `name` (*string*) : Nom du stockage.
- **renvoie** : table Le stockage ou nilStorage.

#### `energyStorage.getStorages()`

Renvoie la table de tous les stockages indexée par nom.

- **renvoie** : table<string, table> Stockages par nom.

#### `energyStorage.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy)`

Hook appelé quand un coupleur s'attache ; relayé à storage:onCouplerAttached sans attachSpeed.

- `nodeId` (*integer*) : Nœud du coupleur.
- `obj2id` (*integer*) : Autre véhicule.
- `obj2nodeId` (*integer*) : Nœud de l'autre véhicule.
- `attachSpeed` (*number*) : Vitesse d'attache (non transmise).
- `attachEnergy` (*number*) : Énergie d'attache.

#### `energyStorage.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook appelé quand un coupleur se détache ; relayé à storage:onCouplerDetached.

- `nodeId` (*integer*) : Nœud du coupleur.
- `obj2id` (*integer*) : Autre véhicule.
- `obj2nodeId` (*integer*) : Nœud de l'autre véhicule.
- `breakForce` (*number*) : Force de rupture.

#### `energyStorage.onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist)`

Hook appelé quand un coupleur trouve un partenaire proche ; relayé à storage:onCouplerFound.

- `nodeId` (*integer*) : Nœud du coupleur de ce véhicule.
- `obj2id` (*integer*) : Identifiant de l'autre véhicule.
- `obj2nodeId` (*integer*) : Nœud de l'autre véhicule.
- `nodeDist` (*number*) : Distance entre les deux nœuds (m).

#### `energyStorage.onDeserialize(data)`

Hook de désérialisation (sauvegarde) ; actuellement sans effet (code commenté).

- `data` (*table*) : Données sérialisées.

#### `energyStorage.onSerialize()`

Hook de sérialisation : renvoie {nom = storage:serialize()} pour les stockages qui ont serialize().

- **renvoie** : table<string, any> Données sérialisées par nom de stockage.

#### `energyStorage.setPartCondition(partTypeData, odometer, integrity, visual)`

Applique la condition de pièce (odomètre, intégrité, visuel) aux stockages liés à la pièce ; si integrity est une table avec la clé energyStorage, la valeur du stockage est prise par son nom.

- `partTypeData` (*table<integer, string>*) : Types de pièce 'energyStorage:<nom>'.
- `odometer` (*number*) : Odomètre de la pièce (déduit du code).
- `integrity` (*number|table*) : Intégrité ou table {energyStorage = {nom = valeur}}.
- `visual` (*any*) : Condition visuelle transmise telle quelle.

## Champs

| Champ | Type | Description |
|---|---|---|
| `nilStorage` | table | Faux stockage 'magique' créé dans init : toute indexation ou tout appel renvoie lui-même, l'écriture est ignorée. Renvoyé par getStorageSafe quand le nom n'existe pas. Vaut {} (sans métatable) avant le premier init. |
| `updateGFX` | function | Vaut nop (variable globale nop) tant qu'il n'y a aucun stockage ; remplacé dans init par la fonction de mise à jour par frame. (Le .md d'extraction signale nop comme non défini : c'est une globale du moteur.) |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/energyStorage.lua`.*
