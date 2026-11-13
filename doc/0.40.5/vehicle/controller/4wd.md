# `controller_4wd`

*Fichier : `lua/vehicle/controller/4wd.lua` · VM : Véhicule · 216 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `4wd` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire qui donne au conducteur la commande du 4x4 sélectionnable : arbre 4WD (connecté/déconnecté), boîte de gamme (haute/basse) et différentiels. Il agit soit via des contrôleurs `driveModes` (si leurs noms sont listés dans le jbeam), soit directement via l'API `powertrain` pour les anciens véhicules. Il écrit `electrics.values.mode4WD` et `modeRangeBox` (1 ou 0) et ajoute des entrées au menu radial.

## Exemple

```lua
controller.getControllerSafe("4wd").toggle4WD()
controller.getControllerSafe("4wd").setRangeMode("low")
```

## Remarques

- Clés jbeam lues par init : `shaftName` (arbre du transfert, périphérique powertrain dont `mode` vaut "connected" ou "disconnected"), `rangeBoxName` (boîte de gamme, mode "low" ou "high"). Lues par initLastStage : `driveModesRangeNames`, `driveModesTransfercaseNames`, `driveModesDifferentialNames` (tables de noms de contrôleurs driveModes).
- `M.relevantDevice = "transfercase"` : sert à trier ce contrôleur par rapport au périphérique powertrain du même nom.
- L'action d'entrée appelle toggleDiffs/toggle4WD/toggleRange si un contrôleur 4wd existe ; sinon elle appelle directement l'API powertrain (code de compatibilité cité dans le fichier).
- La construction du menu radial est faite une seule fois (flag hasBuiltPie) ; elle capture l'objet `shaft`/`rangeBox` du premier init.
- Il n'y a pas de fonction `reset` : controller.reset rappelle donc init à chaque reset.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_4wd.deserialize(data)` | Restaure les modes 4WD et gamme depuis les données de serialize. *(interne)* | 81 |
| `controller_4wd.init(jbeamData)` | Retrouve les périphériques powertrain (`shaftName`, `rangeBoxName`), initialise les valeurs electrics et ajoute les entrées du menu radial (une seule fois). *(interne)* | 92 |
| `controller_4wd.initLastStage(jbeamData)` | Retrouve les contrôleurs driveModes nommés dans `driveModesRangeNames`, `driveModesTransfercaseNames` et `driveModesDifferentialNames` (ceux qui existent). *(interne)* | 171 |
| `controller_4wd.serialize()` | Renvoie l'état sauvegardé : {mode4WD, modeRange}. *(interne)* | 74 |
| `controller_4wd.set4WDMode(mode)` | Impose le mode de l'arbre 4WD, sauf s'il est physiquement déconnecté. | 68 |
| `controller_4wd.setRangeMode(mode)` | Impose le mode de la boîte de gamme (powertrain.setDeviceMode). Sans effet s'il n'y a pas de boîte de gamme. | 49 |
| `controller_4wd.toggle4WD()` | Passe au mode suivant des contrôleurs driveModes de transfert ; sinon bascule l'arbre 4WD, sauf s'il est physiquement déconnecté (`isPhysicallyDisconnected`). | 55 |
| `controller_4wd.toggleDiffs()` | Passe au mode suivant de chaque contrôleur driveModes de différentiels ; sinon appelle powertrain.toggleDefaultDiffs(). | 24 |
| `controller_4wd.toggleRange()` | Passe au mode suivant des contrôleurs driveModes de gamme ; sinon bascule le mode de la boîte de gamme via powertrain.toggleDeviceMode. | 36 |
| `controller_4wd.updateGFX(dt)` | Chaque frame : écrit electrics.values.modeRangeBox (1 si gamme basse) et mode4WD (1 si arbre connecté). *(interne)* | 19 |

### Détail des paramètres

#### `controller_4wd.deserialize(data)`

Restaure les modes 4WD et gamme depuis les données de serialize.

- `data` (*table|nil*) : Données retournées par serialize.

#### `controller_4wd.init(jbeamData)`

Retrouve les périphériques powertrain (`shaftName`, `rangeBoxName`), initialise les valeurs electrics et ajoute les entrées du menu radial (une seule fois).

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_4wd.initLastStage(jbeamData)`

Retrouve les contrôleurs driveModes nommés dans `driveModesRangeNames`, `driveModesTransfercaseNames` et `driveModesDifferentialNames` (ceux qui existent).

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_4wd.serialize()`

Renvoie l'état sauvegardé : {mode4WD, modeRange}.

- **renvoie** : table {mode4WD = string|nil, modeRange = string|nil}.

#### `controller_4wd.set4WDMode(mode)`

Impose le mode de l'arbre 4WD, sauf s'il est physiquement déconnecté.

- `mode` (*string*) : "connected" ou "disconnected".

#### `controller_4wd.setRangeMode(mode)`

Impose le mode de la boîte de gamme (powertrain.setDeviceMode). Sans effet s'il n'y a pas de boîte de gamme.

- `mode` (*string*) : "low" ou "high" (valeurs vues dans le code).

#### `controller_4wd.updateGFX(dt)`

Chaque frame : écrit electrics.values.modeRangeBox (1 si gamme basse) et mode4WD (1 si arbre connecté).

- `dt` (*number*) : Pas de temps en secondes (non utilisé).

## Champs

| Champ | Type | Description |
|---|---|---|
| `relevantDevice` | string | "transfercase" : nom du périphérique powertrain utilisé pour l'ordre d'appel. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/4wd.lua`.*
