# `oneshotRace_quickRaceConfiguratorDescriptor`

*Fichier : `lua/ge/extensions/oneshotRace/quickRaceConfiguratorDescriptor.lua` · VM : Game Engine (GE) · 118 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `oneshotRace_quickRaceConfiguratorDescriptor` : `extensions.load("oneshotRace_quickRaceConfiguratorDescriptor")`, puis la globale `oneshotRace_quickRaceConfiguratorDescriptor`

Fabrique le descripteur commun aux configurateurs de course rapide (quickrace, Light Runner). Le descripteur est consommé par oneshotRaceCore.createConfigurator : il définit les réglages par défaut (reverse, rollingStart, lapCount, tod, seed), la façon de résumer niveau et piste pour l'interface, la clé de meilleurs scores et le démarrage via scenario_quickRaceLoader.startQuickrace.

## Exemple

```lua
local descriptor = require("ge/extensions/oneshotRace/quickRaceConfiguratorDescriptor").build({logTag = "monConfigurateur", gridBackendName = "quickraceSelector", routeDataKey = "quickraceWizard"})
```

## Remarques

- Réglages par défaut : reverse false, rollingStart false, lapCount 1, tod 3, seed nil ; seed est la seule clé supplémentaire acceptée (extraSettingKeys).
- Si lapCount passe à 0 et que la piste autorise le départ lancé (allowRollingStart), rollingStart est forcé à true.
- À la sélection d'une piste : reverse et rollingStart valent false (`track.reversible and false` donne nil si la piste n'est pas réversible, ou false), lapCount, tod et seed (pistes procédurales) viennent de la piste.
- Clé de meilleurs scores : « standing » ou « rolling » (départ lancé, lapCount > 0 et pas d'affichage des records au tour), suffixée « Reverse » si inversé, puis le nombre de tours (0 pour les records au tour).
- Au démarrage, le niveau et la piste sont copiés (deepcopy), tracks est retiré du niveau, et reverse/rollingStart/lapCount/tod/seed sont écrits dans la copie de la piste ; opts.raceType est passé comme type de course.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `oneshotRace_quickRaceConfiguratorDescriptor.build(opts)` | Construit le descripteur de configurateur de course rapide. | 13 |

### Détail des paramètres

#### `oneshotRace_quickRaceConfiguratorDescriptor.build(opts)`

Construit le descripteur de configurateur de course rapide.

- `opts` (*table*) : {logTag, gridBackendName, routeDataKey, vehicleRestrictionMode (facultatif), getDefaultSelection (facultatif), raceType (facultatif)}
- **renvoie** : table Descripteur pour oneshotRaceCore.createConfigurator.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/oneshotRace/quickRaceConfiguratorDescriptor.lua`.*
