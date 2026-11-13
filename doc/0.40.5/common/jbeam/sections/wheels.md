# `wheels`

*Fichier : `lua/common/jbeam/sections/wheels.lua` · VM : Commun (GE + véhicule) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `wheels`

Répartiteur de la construction des roues lors du chargement d'un véhicule jbeam. Il parcourt les sections de roues du véhicule (wheels, monoHubWheels, hubWheelsTSV, hubWheelsTSI, hubWheels, pressureWheels) dans cet ordre, appelle pour chaque roue le gestionnaire du type (fichier jbeam/sections/wheelTypes/<section>.lua) qui crée nœuds, poutres et triangles, puis range toutes les roues dans vehicle.wheels avec un identifiant wheelID. processRotators ajoute ensuite les rotators (roues sans pneu) et renumérote les roues. Appelé par le chargeur jbeam, pas par un mod courant.

## Exemple

```lua
-- usage interne du chargeur jbeam (jbeam/loader), dans cet ordre :
local wheels = require('jbeam/sections/wheels')
wheels.processWheels(vehicle)
wheels.processRotators(vehicle)
```

## Remarques

- L'ordre des sections (wheels, monoHubWheels, hubWheelsTSV, hubWheelsTSI, hubWheels, pressureWheels) fixe les wheelID et les cid de nœuds ; le code dit 'do not reorder'. Le nom du fichier de gestionnaire doit être identique au nom de la section jbeam (c'est ainsi que le répartiteur le trouve par require).
- Une roue dont numRays vaut 0 (ou négatif) est ignorée : elle reste dans sa section d'origine (pas de wheelID). Chaque roue traitée est copiée dans vehicle.wheels[wheelID] avec wheelSection = nom de la section, et supprimée de sa section d'origine.
- processRotators supprime aussi les roues sans nœud (wheel.nodes nil ou vide) avec un avertissement, puis renumérote cid de 0 à N-1 : à appeler APRÈS processWheels. Il utilise wheel.name dans le message d'avertissement (erreur Lua si name est nil).
- addWheelAttachments (fonction locale) ne fait rien par défaut : addStrapsToEverything vaut false (code de test inactif qui ajouterait un flexbody de sangle tire_02c_22x10_39strap autour des pneus).
- Les tables vehicle.wheels, vehicle.nodes, etc. sont indexées à partir de 0 (parcourues avec tableSizeC).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `wheels.processRotators(vehicle)` | Ajoute les rotators (vehicle.rotators) comme roues supplémentaires (wheelID, jbeamUtils.addRotator), retire les roues sans nœuds et renumérote vehicle.wheels / cid. *(interne)* | 105 |
| `wheels.processWheels(vehicle)` | Construit toutes les roues du véhicule : réinitialise vehicle.wheels, traite chaque section de roues non vide via le gestionnaire du type de roue (require chargé à la demande puis mis en cache), assigne wheelID et range le résultat dans vehicle.wheels. *(interne)* | 81 |

### Détail des paramètres

#### `wheels.processRotators(vehicle)`

Ajoute les rotators (vehicle.rotators) comme roues supplémentaires (wheelID, jbeamUtils.addRotator), retire les roues sans nœuds et renumérote vehicle.wheels / cid.

- `vehicle` (*table*) : données du véhicule

#### `wheels.processWheels(vehicle)`

Construit toutes les roues du véhicule : réinitialise vehicle.wheels, traite chaque section de roues non vide via le gestionnaire du type de roue (require chargé à la demande puis mis en cache), assigne wheelID et range le résultat dans vehicle.wheels.

- `vehicle` (*table*) : données du véhicule en cours de construction (nodes, beams, maxIDs, sections de roues, flexbodies…)
- **renvoie** : boolean toujours true

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/wheels.lua`.*
