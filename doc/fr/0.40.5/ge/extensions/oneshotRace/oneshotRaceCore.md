# `oneshotRace_oneshotRaceCore`

*Fichier : `lua/ge/extensions/oneshotRace/oneshotRaceCore.lua` · VM : Game Engine (GE) · 283 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `oneshotRace_oneshotRaceCore` : `extensions.load("oneshotRace_oneshotRaceCore")`, puis la globale `oneshotRace_oneshotRaceCore`

Cœur commun des assistants (wizards) de course « one shot » : à partir d'un descripteur, createConfigurator() renvoie un objet qui garde la sélection (niveau, piste/« middle », réglages, véhicule), la résume pour l'interface (getConfiguration), fournit les meilleurs scores et démarre la course. Utilisé par quickraceConfigurator et lightrunnerConfigurator ; un moddeur peut s'en servir pour créer un nouvel assistant de sélection.

## Exemple

```lua
local cfg = require("ge/extensions/oneshotRace/oneshotRaceCore").createConfigurator(descripteur)
cfg.selectLevel("glow_city"); cfg.selectMiddle("glow_city", "maPiste"); cfg.selectVehicle("sbr", "powerglow"); cfg.start()
```

## Remarques

- Contrat du descripteur : logTag (string) ; gridBackendName (backend ui_gridSelector source des niveaux et pistes) ; routeDataKey (clé dans les données de route du routeur) ; vehicleRestrictionMode (facultatif, passé à ui_vehicleSelector_general.setVehicleRestrictionMode pendant la route véhicule) ; defaultSettings() -> table ; onSelectMiddle(settings, middle) ; onUpdateSetting(settings, key, value, middle) (facultatif) ; extraSettingKeys (facultatif, clés acceptées en plus de celles de defaultSettings) ; buildLevelSummary(level) ; buildMiddleSummary(middle, selection) (doit contenir un champ settings) ; getHighscoreKey(selection, middle) -> {levelName, scenarioName, configKey} ou nil ; start(level, middle, settings, vehicleFile, selection) ; getDefaultSelection(selector) (facultatif, appelé une fois à la première entrée dans l'assistant, renvoie {levelName, middleName, vehicle = {model, config}} ou nil).
- Dans selectVehicle, une config inconnue est remplacée par la config par défaut (default_pc) du modèle.
- updateSetting refuse une clé qui n'existe pas dans les réglages courants ni dans extraSettingKeys. Un réglage dont la valeur initiale est nil (comme seed) doit donc figurer dans extraSettingKeys.
- start() échoue (false) si niveau, piste ou modèle de véhicule ne sont pas sélectionnés.
- Les trois premiers hooks d'entrée de route retirent toute restriction de véhicule ; seul onWizardVehicleRouteEnter applique vehicleRestrictionMode.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `oneshotRace_oneshotRaceCore.createConfigurator(descriptor)` | Crée un configurateur lié à un descripteur. L'objet renvoyé (Cfg) possède : getSelection, selectLevel(levelName), selectMiddle(levelName, middleName), selectVehicle(model, config, additionalData), updateSetting(key, value), toggleShowLapRecords(), getHighscores(), getConfiguration(), onWizardRouteEnter / onWizardLevelRouteEnter / onWizardMiddleRouteEnter / onWizardVehicleRouteEnter(context, toRoute, fromRoute, data), start(). | 78 |

### Détail des paramètres

#### `oneshotRace_oneshotRaceCore.createConfigurator(descriptor)`

Crée un configurateur lié à un descripteur. L'objet renvoyé (Cfg) possède : getSelection, selectLevel(levelName), selectMiddle(levelName, middleName), selectVehicle(model, config, additionalData), updateSetting(key, value), toggleShowLapRecords(), getHighscores(), getConfiguration(), onWizardRouteEnter / onWizardLevelRouteEnter / onWizardMiddleRouteEnter / onWizardVehicleRouteEnter(context, toRoute, fromRoute, data), start().

- `descriptor` (*table*) : Descripteur respectant le contrat décrit dans les notes.
- **renvoie** : table Configurateur (Cfg). getConfiguration renvoie {level, middle, vehicle, highscores, showLapRecords, isDisabled, todOptionKeys} ; isDisabled est vrai tant que niveau, piste et véhicule ne sont pas tous définis.

## Champs

| Champ | Type | Description |
|---|---|---|
| `todNames` | string[] | Noms des heures du jour proposées (night, sunrise, morning, earlyNoon, noon, lateNoon, afternoon, evening, sunset), indexées à partir de 1 (tod = 3 correspond à morning). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/oneshotRace/oneshotRaceCore.lua`.*
