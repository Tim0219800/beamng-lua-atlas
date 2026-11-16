# `controller_braking_retarderControl`

*Fichier : `lua/vehicle/controller/braking/retarderControl.lua` · VM : Véhicule · 260 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `braking/retarderControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire qui commande un ralentisseur (retarder) du powertrain. Une liste de réglages ordonnée (auto facultatif, off, puis niveaux manuels) détermine le coefficient envoyé à `retarder:setRetarderCoef`. En mode auto, le ralentisseur suit `brake_input` ; il est coupé quand l'ABS est actif, pendant un changement de rapport, ou (par défaut) quand l'accélérateur est appliqué. Ajoute un sous-menu au menu radial.

## Exemple

```lua
local r = controller.getControllerSafe("retarderControl")
r.setRetarderMode("off")
r.changeRetarderSettingIndex(1)
```

## Remarques

- Clés jbeam lues par init : `controlledRetarder` ("retarder"), `electricsNameActual`, `electricsNameSetting`, `electricsNameIsEnabled`, `electricsNameLevelIndex` (par défaut `<retarder>_actual|_setting|_isEnabled|_levelIndex`), `retarderManualLevels` ({0.2, 0.4, 0.6, 0.8, 1.0}), `throttleDisableElectricsName` ("throttle"), `throttleDisableThreshold` (0.001), `disableWhenThrottleApplied` (true), `hasAutoMode` (false).
- Liste des réglages : ["auto" si hasAutoMode], "off", puis les niveaux manuels. Au démarrage le mode est "off".
- Si le périphérique est introuvable ou n'a pas `setRetarderCoef`, init logue une erreur et remplace `updateGFX` par `nop`.
- Les electrics `<retarder>_setting` et `_actual` reçoivent la même valeur dans ce fichier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_braking_retarderControl.changeRetarderSettingIndex(indexChange)` | Décale l'index de réglage (borné aux limites de la liste) et l'applique. | 83 |
| `controller_braking_retarderControl.getState()` | Renvoie l'index de réglage actif sous la clé `<nom>_settingIndex`. | 230 |
| `controller_braking_retarderControl.init(jbeamData)` | Retrouve le ralentisseur, construit la liste des réglages et le menu radial (une seule fois). *(interne)* | 128 |
| `controller_braking_retarderControl.reset(jbeamData)` | Force la prochaine transmission du coefficient au ralentisseur. *(interne)* | 124 |
| `controller_braking_retarderControl.setRetarderMode(newMode)` | Cherche un réglage égal à `newMode` dans la liste et l'applique ; avertissement dans le log sinon. | 73 |
| `controller_braking_retarderControl.setRetarderSettingIndex(settingIndex, silent)` | Applique le réglage situé à cet index de la liste (auto, off ou niveau manuel) ; ignoré si l'index n'existe pas. | 65 |
| `controller_braking_retarderControl.setState(data)` | Restaure l'index de réglage s'il est valide (silencieusement). | 237 |
| `controller_braking_retarderControl.updateGFX(dt)` | Chaque frame : calcule le coefficient (selon le mode, l'ABS, le passage de rapports et l'accélérateur), le transmet au ralentisseur quand il change et publie les electrics. *(interne)* | 88 |

### Détail des paramètres

#### `controller_braking_retarderControl.changeRetarderSettingIndex(indexChange)`

Décale l'index de réglage (borné aux limites de la liste) et l'applique.

- `indexChange` (*integer*) : Variation d'index (+1, -1...).

#### `controller_braking_retarderControl.getState()`

Renvoie l'index de réglage actif sous la clé `<nom>_settingIndex`.

- **renvoie** : table Table d'état.

#### `controller_braking_retarderControl.init(jbeamData)`

Retrouve le ralentisseur, construit la liste des réglages et le menu radial (une seule fois).

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_braking_retarderControl.reset(jbeamData)`

Force la prochaine transmission du coefficient au ralentisseur.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_braking_retarderControl.setRetarderMode(newMode)`

Cherche un réglage égal à `newMode` dans la liste et l'applique ; avertissement dans le log sinon.

- `newMode` (*string|number*) : "auto", "off" ou un niveau manuel de la liste.

#### `controller_braking_retarderControl.setRetarderSettingIndex(settingIndex, silent)`

Applique le réglage situé à cet index de la liste (auto, off ou niveau manuel) ; ignoré si l'index n'existe pas.

- `settingIndex` (*integer*) : Index (1 = premier de la liste de réglages).
- `silent` (*boolean|nil*) : true pour ne pas afficher de message.

#### `controller_braking_retarderControl.setState(data)`

Restaure l'index de réglage s'il est valide (silencieusement).

- `data` (*table|nil*) : Table d'état.

#### `controller_braking_retarderControl.updateGFX(dt)`

Chaque frame : calcule le coefficient (selon le mode, l'ABS, le passage de rapports et l'accélérateur), le transmet au ralentisseur quand il change et publie les electrics.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/braking/retarderControl.lua`.*
