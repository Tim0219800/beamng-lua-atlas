# `controller_driveModes`

*Fichier : `lua/vehicle/controller/driveModes.lua` · VM : Véhicule · 450 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `driveModes` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de modes de conduite (Eco, Sport, Neige, etc., ou modes de différentiel/gamme pour un 4x4). Chaque mode est un ensemble de réglages typés qui sont appliqués d'un coup quand on change de mode : échappement, turbo, compresseur, boîte automatique, paramètres d'un autre contrôleur (`setParameters`), mode d'un périphérique powertrain, valeur electrics, entrée de menu radial et bouton du panneau de contrôle simplifié. On peut en instancier plusieurs (un par fonction : conduite, différentiel, gamme...). Le mode par défaut est appliqué dans initLastStage.

## Exemple

```lua
local dm = controller.getControllerSafe("driveModes")
dm.nextDriveMode()
print(dm.getCurrentDriveModeKey())
dm.setDriveMode("sport", true)
```

## Remarques

- Clés jbeam de l'instance : `uiName`, `quickAccessTitle` ("ui.radialmenu2.ESC"), `quickAccessIcon`, `quickAccessLevel` ("/vehicleFeatures/"), `radialIcon`, `defaultMode` (clé du mode initial), `defaultSettings` (table d'en-tête de réglages appliqués à tous les modes). Toutes les clés commençant par `modes` (par ex. modes, modes_sport) sont fusionnées en une seule table de modes ; toutes celles commençant par `enabledModes` listent les clés de modes réellement utilisables.
- Un mode : `{name, order, settings}` où settings est une table d'en-tête de réglages. Types de réglage reconnus par applyDriveMode : "exhaust" (name, mufflingOffset, gainOffset), "turbocharger" (name, wastegateOffset), "supercharger" (name, bypassPressure), "transmission" (defaultForwardMode, appelle `controller.mainController.setDefaultForwardMode`), "quickAccess" (icon, title), "simpleControlButton" (buttonId, uiName, icon, color, offColor, offColorElectric, onClick, remove), "controller" (controllerName + autres champs passés à `setParameters` du contrôleur cible), "powertrainDeviceMode" (deviceName, mode), "electricsValue" (electricsName, value).
- Clé d'un réglage = `key`, sinon deviceName, electricsName, controllerName ou type. Un réglage d'un mode remplace celui de `defaultSettings` de même clé. Ordre d'application : les réglages de clé `yawControl` et `tractionControl` sont triés en premier (rang 0), tous les autres ont le rang 1 (ordre relatif entre eux non garanti).
- Anomalie : le test de doublon d'ordre dans init regarde `driveModes[mode.order]` alors que la table est indexée par clé de mode, il ne détecte donc normalement rien.
- Les tables `driveModes` et `enabledDriveModes` sont de niveau module et ne sont pas vidées dans init.
- `reset` ne réinitialise que le titre et l'icône du menu radial ; le mode actif est réappliqué par resetLastStage.
- État sauvegardé : `getState` renvoie la clé sous `<nom>ActiveMode`; `serialize` renvoie {activeDriveModeKey, activeDriveModeIndex}.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_driveModes.deserialize(data)` | Restaure le mode actif depuis serialize. *(interne)* | 237 |
| `controller_driveModes.getCurrentDriveModeKey()` | Renvoie la clé du mode actif. | 208 |
| `controller_driveModes.getDriveModeData(modeKey)` | Renvoie les données d'un mode (key, name, order, settings, settingsOrder). | 214 |
| `controller_driveModes.getState()` | Renvoie la clé du mode actif sous `<nom>ActiveMode`. | 246 |
| `controller_driveModes.init(jbeamData)` | Lit les modes (clés `modes*`), les modes activés (`enabledModes*`) et les réglages par défaut depuis le jbeam, trie les modes et enregistre l'entrée du menu radial. *(interne)* | 295 |
| `controller_driveModes.initLastStage(jbeamData)` | Choisit le mode par défaut (`defaultMode` s'il est activé, sinon le premier) et l'applique. *(interne)* | 409 |
| `controller_driveModes.nextDriveMode()` | Passe au mode activé suivant, avec retour au premier à la fin. | 190 |
| `controller_driveModes.previousDriveMode()` | Passe au mode activé précédent, avec retour au dernier au début. | 199 |
| `controller_driveModes.reset(jbeamData)` | Restaure le titre et l'icône du menu radial lus dans le jbeam. *(interne)* | 220 |
| `controller_driveModes.resetLastStage()` | Réapplique le mode actif après le reset. *(interne)* | 225 |
| `controller_driveModes.serialize()` | Renvoie le mode actif pour la sauvegarde. *(interne)* | 231 |
| `controller_driveModes.setDriveMode(modeKey, silent)` | Active le mode de clé donnée : retrouve son index parmi les modes activés, applique tous ses réglages et affiche un message UI sauf si silent. Clé inconnue ou nil : ne fait rien. | 164 |
| `controller_driveModes.setSimpleControlButton(id, buttonUIName, icon, color, offColor, offColorElectric, onClick, remove)` | Crée, met à jour ou supprime un bouton du panneau de contrôle simplifié (`ui_simplePowertrainControl`). Le clic par défaut appelle `nextDriveMode()` de ce contrôleur. | 75 |
| `controller_driveModes.setState(data)` | Active silencieusement le mode donné s'il existe et diffère du mode actif. | 253 |
| `controller_driveModes.updateGFX(dt)` | Chaque frame : met à jour la couleur (active ou éteinte) des boutons de contrôle simplifié selon leur electrics `offColorElectric`. *(interne)* | 154 |
| `controller_driveModes.updateSimpleControlButtons()` | Renvoie l'état de tous les boutons au panneau de contrôle simplifié (appelée par controller.updateSimpleControlButtons). | 94 |

### Détail des paramètres

#### `controller_driveModes.deserialize(data)`

Restaure le mode actif depuis serialize.

- `data` (*table|nil*) : Données de serialize.

#### `controller_driveModes.getCurrentDriveModeKey()`

Renvoie la clé du mode actif.

- **renvoie** : string|nil Clé du mode actif, nil si aucun.

#### `controller_driveModes.getDriveModeData(modeKey)`

Renvoie les données d'un mode (key, name, order, settings, settingsOrder).

- `modeKey` (*string|nil*) : Clé du mode.
- **renvoie** : table|nil Données du mode, nil si inconnu.

#### `controller_driveModes.getState()`

Renvoie la clé du mode actif sous `<nom>ActiveMode`.

- **renvoie** : table Table d'état.

#### `controller_driveModes.init(jbeamData)`

Lit les modes (clés `modes*`), les modes activés (`enabledModes*`) et les réglages par défaut depuis le jbeam, trie les modes et enregistre l'entrée du menu radial.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_driveModes.initLastStage(jbeamData)`

Choisit le mode par défaut (`defaultMode` s'il est activé, sinon le premier) et l'applique.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_driveModes.reset(jbeamData)`

Restaure le titre et l'icône du menu radial lus dans le jbeam.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_driveModes.serialize()`

Renvoie le mode actif pour la sauvegarde.

- **renvoie** : table|nil {activeDriveModeKey, activeDriveModeIndex}, nil si aucun mode.

#### `controller_driveModes.setDriveMode(modeKey, silent)`

Active le mode de clé donnée : retrouve son index parmi les modes activés, applique tous ses réglages et affiche un message UI sauf si silent. Clé inconnue ou nil : ne fait rien.

- `modeKey` (*string|nil*) : Clé du mode.
- `silent` (*boolean|nil*) : true pour ne pas afficher de message.

#### `controller_driveModes.setSimpleControlButton(id, buttonUIName, icon, color, offColor, offColorElectric, onClick, remove)`

Crée, met à jour ou supprime un bouton du panneau de contrôle simplifié (`ui_simplePowertrainControl`). Le clic par défaut appelle `nextDriveMode()` de ce contrôleur.

- `id` (*string*) : Identifiant du bouton.
- `buttonUIName` (*string*) : Nom affiché.
- `icon` (*string*) : Icône.
- `color` (*string*) : Couleur (hexadécimal) quand actif.
- `offColor` (*string|nil*) : Couleur éteinte (défaut "343434").
- `offColorElectric` (*string|nil*) : Nom d'electrics : à 1 ou plus, le bouton prend `offColor`.
- `onClick` (*string|nil*) : Code Lua exécuté au clic.
- `remove` (*boolean|nil*) : true pour supprimer le bouton.

#### `controller_driveModes.setState(data)`

Active silencieusement le mode donné s'il existe et diffère du mode actif.

- `data` (*table|nil*) : Table d'état.

#### `controller_driveModes.updateGFX(dt)`

Chaque frame : met à jour la couleur (active ou éteinte) des boutons de contrôle simplifié selon leur electrics `offColorElectric`.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/driveModes.lua`.*
