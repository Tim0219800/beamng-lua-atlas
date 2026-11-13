# `controller_controllerTemplate`

*Fichier : `lua/vehicle/controller/controllerTemplate.lua` · VM : Véhicule · 120 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `controllerTemplate` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Modèle de départ pour écrire un contrôleur de véhicule. Un contrôleur est un module Lua placé dans lua/vehicle/controller/, déclaré dans le jbeam (section `controller` avec `fileName`, et éventuellement `name`) et chargé par `controller.lua`. Cycle de vie : `init(jbeamData)` à la création (jbeamData = déclaration fusionnée avec les données jbeam portant le nom du contrôleur), puis `initSecondStage`, `initSounds`, `initLastStage` (facultatifs) une fois les autres systèmes prêts ; au reset, `reset(jbeamData)` (ou, s'il est absent, `init` rappelé) ainsi que `resetLastStage` et `resetSounds`. En fonctionnement : `update(dt)` à chaque pas physique, `updateWheelsIntermediate(dt)`, `updateFixedStep(dt)` à pas fixe de 100 Hz, `updateGFX(dt)` à chaque frame graphique. Seules les fonctions réellement exportées dans M sont appelées. Autres hooks facultatifs : debugDraw, beamBroken, beamDeformed, nodeCollision, onCouplerFound/Attached/Detached, onGameplayEvent, settingsChanged, serialize/deserialize.

## Exemple

```lua
local M = {}
M.type = "auxiliary"
local function init(jbeamData)
  -- lire jbeamData.maCle
end
local function updateGFX(dt)
end
M.init = init
M.reset = init
M.updateGFX = updateGFX
return M
```

## Remarques

- `M.type` : "auxiliary" pour un contrôleur ordinaire ; "main" désigne le contrôleur principal (un seul par véhicule, jamais chargeable à chaud).
- controller.lua ajoute lui-même `name`, `typeName`, `hasCustomName`, `manualOrder` (clé jbeam `manualOrder`) et `order` au module après init. Un contrôleur peut définir `M.relevantDevice` (nom d'un périphérique du powertrain) ou `M.defaultOrder` pour influencer l'ordre d'appel.
- Le hook de casse de poutre doit s'appeler `beamBroken` (et non beamBroke) pour être détecté.
- Dans le modèle, onCouplerFound et onCouplerAttached sont commentés avec moins d'arguments que ceux réellement transmis par controller.lua (nodeDist pour Found ; attachSpeed, attachEnergy pour Attached).
- Si un contrôleur ajoute ou retire dynamiquement `M.update` & co, il doit appeler `controller.cacheAllControllerFunctions()`.
- Les fonctions commentées du modèle ne sont pas exportées ; seuls init, reset et updateGFX sont actifs.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_controllerTemplate.init(jbeamData)` | Appelée par controller.lua à la création du contrôleur (et au reset si `reset` n'existe pas). Corps vide dans le modèle ; c'est ici qu'on lit les clés jbeam. *(interne)* | 64 |
| `controller_controllerTemplate.reset(jbeamData)` | Appelée au reset du véhicule (étape resetSecondStage de controller.lua). Corps vide dans le modèle. *(interne)* | 55 |
| `controller_controllerTemplate.updateGFX(dt)` | Appelée à chaque frame graphique. Corps vide dans le modèle. Les variantes `update` (pas physique), `updateWheelsIntermediate` et `updateFixedStep` (100 Hz) sont fournies en commentaire. *(interne)* | 22 |

### Détail des paramètres

#### `controller_controllerTemplate.init(jbeamData)`

Appelée par controller.lua à la création du contrôleur (et au reset si `reset` n'existe pas). Corps vide dans le modèle ; c'est ici qu'on lit les clés jbeam.

- `jbeamData` (*table*) : Données jbeam du contrôleur (fileName, name, clés personnalisées…).

#### `controller_controllerTemplate.reset(jbeamData)`

Appelée au reset du véhicule (étape resetSecondStage de controller.lua). Corps vide dans le modèle.

- `jbeamData` (*table*) : Mêmes données jbeam que pour init.

#### `controller_controllerTemplate.updateGFX(dt)`

Appelée à chaque frame graphique. Corps vide dans le modèle. Les variantes `update` (pas physique), `updateWheelsIntermediate` et `updateFixedStep` (100 Hz) sont fournies en commentaire.

- `dt` (*number*) : Durée du pas en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary" dans le modèle (contrôleur annexe). "main" pour le contrôleur principal du véhicule. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/controllerTemplate.lua`.*
