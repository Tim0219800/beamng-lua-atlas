# `ui_pause_providers_routeData_environment`

*Fichier : `lua/ge/extensions/ui/pause/providers/routeData/environment.lua` · VM : Game Engine (GE) · 247 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_routeData_environment` : `extensions.load("ui_pause_providers_routeData_environment")`, puis la globale `ui_pause_providers_routeData_environment`

Fournisseur de données du menu pause pour la page Environnement : résumé (météo, circulation, autres), page météo/heure, page simulation (gravité, vitesse) et page circulation. Il décide si l'édition est permise (freeroam, multiplayer, freeroamTutorial, ou si le réglage restrictScenarios est désactivé) et tient compte des capacités de la session First Drive. Les mods peuvent ajouter des boutons à la page via le hook onEnvironmentGetOtherButtons.

## Exemple

```lua
function M.onEnvironmentGetOtherButtons(buttons, actionState)
  table.insert(buttons, {id = "monBouton", label = "Mon outil", icon = "wrench", callback = function() return true end})
end
```

## Remarques

- Le hook onEnvironmentGetOtherButtons(candidates, actionState) n'est émis que si showOther est vrai (donc pas pendant une session First Drive). Chaque bouton candidat doit avoir id, label et callback, sinon une erreur est loguée et il est ignoré ; icon et routeTarget sont facultatifs.
- Les « autres » boutons sont triés par label (comparaison de chaînes) ; le bouton Simulation en fait partie.
- getEnvironmentWeatherData et getEnvironmentTrafficData appellent core_environment sans test de nil (getTimeOfDayOptions, getInitState).

**Dépendances (chargées avant) :** `ui_pause_providers_trafficControls`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_routeData_environment.getEnvironmentData(context)` | Renvoie la page résumé Environnement : composant PauseEnvironmentDigest avec boutons météo, circulation et autres (simulation incluse), états d'action, options d'heure du jour, valeurs initiales du niveau et nom du niveau courant. | 79 |
| `ui_pause_providers_routeData_environment.getEnvironmentSimulationData(context)` | Renvoie la page simulation (composant PauseEnvironmentSimulation). Pendant une session First Drive, renvoie une page vide non éditable. | 194 |
| `ui_pause_providers_routeData_environment.getEnvironmentTrafficData(context)` | Renvoie la page circulation (composant PauseEnvironmentTraffic) avec les données de ui_pause_providers_trafficControls.getData({editable = ...}). | 217 |
| `ui_pause_providers_routeData_environment.getEnvironmentWeatherData(context)` | Renvoie la page météo/heure (composant PauseEnvironmentWeather) avec gravityPresets, simSpeedPresets, timeOfDayOptions et levelDefaults de core_environment. | 163 |
| `ui_pause_providers_routeData_environment.requestEnvironmentTrafficPayload(payload)` | Redirige vers ui_pause_providers_trafficControls.getData(payload), pour rafraîchir uniquement les données de circulation. | 242 |

### Détail des paramètres

#### `ui_pause_providers_routeData_environment.getEnvironmentData(context)`

Renvoie la page résumé Environnement : composant PauseEnvironmentDigest avec boutons météo, circulation et autres (simulation incluse), états d'action, options d'heure du jour, valeurs initiales du niveau et nom du niveau courant.

- `context` (*table*) : Contexte pause (champ lu : mode).
- **renvoie** : table {editable, mainPanelContent, actions, timeOfDayOptions, levelDefaults, currentLevelName}

#### `ui_pause_providers_routeData_environment.getEnvironmentSimulationData(context)`

Renvoie la page simulation (composant PauseEnvironmentSimulation). Pendant une session First Drive, renvoie une page vide non éditable.

- `context` (*table*) : Contexte pause.
- **renvoie** : table {editable, disabledReason, mainPanelContent}

#### `ui_pause_providers_routeData_environment.getEnvironmentTrafficData(context)`

Renvoie la page circulation (composant PauseEnvironmentTraffic) avec les données de ui_pause_providers_trafficControls.getData({editable = ...}).

- `context` (*table*) : Contexte pause.
- **renvoie** : table {editable, disabledReason, traffic, mainPanelContent}

#### `ui_pause_providers_routeData_environment.getEnvironmentWeatherData(context)`

Renvoie la page météo/heure (composant PauseEnvironmentWeather) avec gravityPresets, simSpeedPresets, timeOfDayOptions et levelDefaults de core_environment.

- `context` (*table*) : Contexte pause.
- **renvoie** : table {editable, disabledReason, mainCardClass, mainPanelContent, gravityPresets, simSpeedPresets, timeOfDayOptions, levelDefaults}

#### `ui_pause_providers_routeData_environment.requestEnvironmentTrafficPayload(payload)`

Redirige vers ui_pause_providers_trafficControls.getData(payload), pour rafraîchir uniquement les données de circulation.

- `payload` (*table*) : Charge utile transmise (champ lu : editable).
- **renvoie** : table Données de circulation.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_pause_providers_trafficControls"} |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEnvironmentGetOtherButtons`

## Appels vers le moteur (C++)

- `core_environment.` `getInitState`, `getTimeOfDayOptions`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/routeData/environment.lua`.*
