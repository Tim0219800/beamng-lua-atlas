# `telemetry_trackers_ui`

*Fichier : `lua/ge/extensions/telemetry/trackers/ui.lua` · VM : Game Engine (GE) · 95 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_ui` : `extensions.load("telemetry_trackers_ui")`, puis la globale `telemetry_trackers_ui`

Traceur de télémétrie de l'interface. Il suit les écrans (routes UI) que le joueur ouvre et quitte : chaque écran est une activité `uiScreen` dont la durée est le temps passé dessus, avec le champ `from` (écran d'origine) pour reconstituer le parcours dans les menus. Seuls les noms de routes sont rapportés, jamais les paramètres d'écran. Dépend de `telemetry_core`.

## Remarques

- Le temps de chargement de l'écran (`loadMs`, `loadToMount`) est joint à la fin de l'activité plutôt que d'être un événement séparé, pour limiter le volume de données (uiScreen est déjà le plus fréquent).
- `loadEnterMs` et `loadReadyMs` ne sont ajoutés que si le total de chargement atteint `loadDetailMs` (250 ms).
- Une navigation annulée ou expirée n'appelle jamais onRouteTiming : cet écran est rapporté sans temps de chargement.
- Le code utilise le hook moderne onAfterRouteChange et non l'ancien hook de compatibilité onUiChangedState.

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_ui.onAfterRouteChange(entry)` | Hook appelé par le routeur UI une fois une navigation terminée : l'écran affiché est alors `entry.request.name`. Ferme l'activité de l'écran précédent puis ouvre `uiScreen` avec `screen` et `from` (`entry.origin.route`). Sans nom d'écran, ne fait rien. *(interne)* *(hook)* | 56 |
| `telemetry_trackers_ui.onExit()` | Hook appelé à la fermeture du jeu. Ferme l'écran ouvert, sinon le dernier n'aurait pas de durée. *(interne)* *(hook)* | 82 |
| `telemetry_trackers_ui.onExtensionLoaded()` | Hook appelé au chargement de l'extension. Passe l'extension en déchargement manuel. *(interne)* *(hook)* | 77 |
| `telemetry_trackers_ui.onExtensionUnloaded()` | Hook appelé au déchargement de l'extension (un rechargement Lua ne passe pas par onExit). Ferme l'écran ouvert. *(interne)* *(hook)* | 32 |
| `telemetry_trackers_ui.onRouteTiming(routeName, timings)` | Hook appelé par le routeur après qu'il a validé la route, donc juste après l'ouverture de l'activité. Mémorise les temps si la route correspond à l'écran courant ; ils sont envoyés à la fermeture. *(interne)* *(hook)* | 72 |

### Détail des paramètres

#### `telemetry_trackers_ui.onAfterRouteChange(entry)`

Hook appelé par le routeur UI une fois une navigation terminée : l'écran affiché est alors `entry.request.name`. Ferme l'activité de l'écran précédent puis ouvre `uiScreen` avec `screen` et `from` (`entry.origin.route`). Sans nom d'écran, ne fait rien.

- `entry` (*table*) : Entrée de navigation du routeur ; champs lus : `request.name` et `origin.route`.

#### `telemetry_trackers_ui.onRouteTiming(routeName, timings)`

Hook appelé par le routeur après qu'il a validé la route, donc juste après l'ouverture de l'activité. Mémorise les temps si la route correspond à l'écran courant ; ils sont envoyés à la fermeture.

- `routeName` (*string*) : Nom de la route concernée.
- `timings` (*table*) : Temps de la navigation ; champs lus : total, mountAcked, enter, ready.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions à charger avant celle-ci : `{'telemetry_core'}`. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/ui.lua`.*
