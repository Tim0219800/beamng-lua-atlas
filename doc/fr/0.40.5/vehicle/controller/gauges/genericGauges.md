# `controller_gauges_genericGauges`

*Fichier : `lua/vehicle/controller/gauges/genericGauges.lua` · VM : Véhicule · 260 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `gauges/genericGauges` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire qui affiche un tableau de bord HTML sur un matériau 3D (htmlTexture) et lui envoie en continu des données : valeurs electrics, propriétés de dispositifs de powertrain et données de modules personnalisés (contrôleurs dans gauges/customModules/). Un moddeur l'utilise pour créer un combiné d'instruments HTML en déclarant le contrôleur dans le jbeam avec materialName, htmlPath, displayWidth/displayHeight et displayData. Les données ne sont envoyées que si un joueur est assis dans le véhicule et que le drapeau de mise à jour UI du moteur est levé.

## Exemple

```lua
-- jbeam (extrait) :
-- "controller": [["fileName"], ["gauges/genericGauges", {
--   "configuration": {"materialName": "@dash_screen", "htmlPath": "local://local/vehicles/xyz/dash.html", "displayWidth": 1024, "displayHeight": 512, "hasPopupMessageSupport": true},
--   "displayData": {
--     "electrics": ["rpmTacho", "wheelspeed"],
--     "powertrain": [["deviceName", "property"], ["mainEngine", "outputTorque1"]],
--     "customModules": [["moduleName", "property"], ["tireData", "pressure"]]
--   }}]]
local g = controller.getControllerSafe('gauges/genericGauges')
if g then g.displayPopupMessage('Hello', 'info', 3, '#ff0000') end
```

## Remarques

- Clés jbeam lues : configuration (table) fusionnée avec toute clé nommée "configuration_xxx" (permet d'ajouter des morceaux depuis des sous-parts) ; configuration.materialName (obligatoire), htmlPath (obligatoire), displayWidth, displayHeight, hasPopupMessageSupport (défaut false) ; displayData.electrics (liste de noms de valeurs electrics), displayData.powertrain (table d'en-tête : deviceName, property), displayData.customModules (table d'en-tête : moduleName, property facultatif).
- Les unités de l'interface (uiUnitLength, uiUnitTemperature, uiUnitWeight, uiUnitTorque, uiUnitPower, uiUnitEnergy, uiUnitConsumptionRate, uiUnitVolume, uiUnitPressure, uiUnitDate) viennent des réglages du joueur et sont envoyées à la page HTML par l'appel JS "setup" avec le reste de configuration ; la page doit définir setup, updateData, updateMode et éventuellement messageQueue, messageClearById, messageClearAll.
- Un module personnalisé doit exposer setupGaugeData(propriétés, htmlTexture) et updateGaugeData(tableDeDonnées, dt) ; sinon une erreur est journalisée ("Can't find controller").
- Les valeurs electrics ou propriétés absentes sont envoyées à 0. Les données sont envoyées avec streamJS("updateData") ; le dt passé aux mises à jour est le temps accumulé depuis le dernier envoi.
- M.init = nop utilise la fonction globale nop fournie par l'environnement Lua du jeu (non définie dans ce fichier). Fragilité : initSecondStage lit displayData.electrics sans garde, donc une erreur Lua survient si displayData manque dans le jbeam.
- setPartCondition et getPartCondition sont définies localement mais non exportées ; setPartCondition écrit une globale odometerOffset (reste d'un code d'odomètre).
- initSecondStage ne vérifie pas que gaugeHTMLTexture existe pour setParameters/displayPopupMessage : ne les appeler qu'après initialisation réussie.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_gauges_genericGauges.clearAllPopupMessages()` | Supprime tous les messages popup (appel JS messageClearAll). | 54 |
| `controller_gauges_genericGauges.clearPopupMessage(msgId)` | Supprime un message popup par identifiant (appel JS messageClearById). | 47 |
| `controller_gauges_genericGauges.displayPopupMessage(message, iconId, timeout, highlightColor)` | Met en file un message popup dans la page HTML (appel JS messageQueue). Sans effet si hasPopupMessageSupport est faux. | 30 |
| `controller_gauges_genericGauges.initSecondStage(jbeamData)` | Lit la configuration, crée la texture HTML (htmlTexture.new à 60 FPS), prépare les listes electrics/powertrain/customModules et envoie la configuration (unités de l'UI + configuration jbeam) à la page via callJS("setup"). *(interne)* | 164 |
| `controller_gauges_genericGauges.reset()` | Ne fait rien. *(interne)* | 161 |
| `controller_gauges_genericGauges.setParameters(parameters)` | Si parameters contient modeName et modeColor, transmet les paramètres à la page HTML (appel JS updateMode). | 229 |
| `controller_gauges_genericGauges.updateGFX(dt)` | À chaque image graphique : si un joueur est assis et que l'UI doit être mise à jour, rafraîchit les données electrics, powertrain et modules puis les envoie à la page HTML. *(interne)* | 81 |

### Détail des paramètres

#### `controller_gauges_genericGauges.clearPopupMessage(msgId)`

Supprime un message popup par identifiant (appel JS messageClearById).

- `msgId` (*string*) : Identifiant renvoyé par displayPopupMessage.

#### `controller_gauges_genericGauges.displayPopupMessage(message, iconId, timeout, highlightColor)`

Met en file un message popup dans la page HTML (appel JS messageQueue). Sans effet si hasPopupMessageSupport est faux.

- `message` (*string*) : Texte du message.
- `iconId` (*string*) : Identifiant de l'icône (déduit du code).
- `timeout` (*number*) : Durée d'affichage en secondes (durationSec).
- `highlightColor` (*string*) : Couleur de mise en avant (déduit du code).
- **renvoie** : string|nil Identifiant du message ("test" + nombre aléatoire), nil si les popups ne sont pas supportés.

#### `controller_gauges_genericGauges.initSecondStage(jbeamData)`

Lit la configuration, crée la texture HTML (htmlTexture.new à 60 FPS), prépare les listes electrics/powertrain/customModules et envoie la configuration (unités de l'UI + configuration jbeam) à la page via callJS("setup").

- `jbeamData` (*table*) : Données jbeam (voir notes).

#### `controller_gauges_genericGauges.setParameters(parameters)`

Si parameters contient modeName et modeColor, transmet les paramètres à la page HTML (appel JS updateMode).

- `parameters` (*table*) : Table avec au moins modeName et modeColor.

#### `controller_gauges_genericGauges.updateGFX(dt)`

À chaque image graphique : si un joueur est assis et que l'UI doit être mise à jour, rafraîchit les données electrics, powertrain et modules puis les envoie à la page HTML.

- `dt` (*number*) : Pas de temps graphique (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `init` | function | Alias de nop (rien à faire à l'init). |
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getUpdateUIflag`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/gauges/genericGauges.lua`.*
