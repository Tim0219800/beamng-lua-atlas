# `telemetry_trackers_traffic`

*Fichier : `lua/ge/extensions/telemetry/trackers/traffic.lua` · VM : Game Engine (GE) · 65 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_traffic` : `extensions.load("telemetry_trackers_traffic")`, puis la globale `telemetry_trackers_traffic`

Traceur de télémétrie du trafic. Il répond à la question « combien de trafic est réellement utilisé » : il ouvre l'activité `trafficActive` quand le trafic démarre et la ferme quand il s'arrête, en y joignant le pic de véhicules actifs. Dépend de `telemetry_core` et ne sert qu'à la collecte de statistiques, pas au gameplay.

## Remarques

- Le nombre de véhicules n'est volontairement pas lu au démarrage ni à l'arrêt du trafic : ces hooks arrivent une frame après le premier ou le dernier véhicule, quand le compte n'est pas encore stable. Seul le pic (`peakAmount`) est conservé via onTrafficAmountChanged.
- L'activité est aussi fermée sur onClientEndMission, onExit et onExtensionUnloaded, car le trafic ne s'arrête pas toujours proprement lors d'un changement de niveau et un rechargement Lua ne déclenche pas onExit.
- L'extension se met en déchargement manuel (`setExtensionUnloadMode(M, "manual")`) au chargement.

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_traffic.onClientEndMission()` | Hook appelé à la fin de la mission/du niveau côté client. Ferme l'activité de trafic si elle est ouverte (même code que onTrafficStopped). *(interne)* *(hook)* | 46 |
| `telemetry_trackers_traffic.onExit()` | Hook appelé à la fermeture du jeu. Alias de onClientEndMission : ferme l'activité de trafic. *(interne)* *(hook)* | 46 |
| `telemetry_trackers_traffic.onExtensionLoaded()` | Hook appelé au chargement de l'extension. Passe l'extension en déchargement manuel. *(interne)* *(hook)* | 50 |
| `telemetry_trackers_traffic.onExtensionUnloaded()` | Hook appelé au déchargement de l'extension (par exemple lors d'un rechargement Lua, qui ne passe pas par onExit). Ferme l'activité de trafic. *(interne)* *(hook)* | 46 |
| `telemetry_trackers_traffic.onTrafficAmountChanged(activeAmount)` | Hook appelé chaque fois que des véhicules entrent ou sortent du pool de trafic. Ne garde que le maximum, sans créer d'événement. *(interne)* *(hook)* | 39 |
| `telemetry_trackers_traffic.onTrafficStarted()` | Hook appelé quand le trafic démarre. Remet le pic à 0 et ouvre l'activité `trafficActive` avec le niveau courant (`getCurrentLevelIdentifier()` ou "unknown"). *(interne)* *(hook)* | 22 |
| `telemetry_trackers_traffic.onTrafficStopped()` | Hook appelé quand le trafic s'arrête. Ne fait rien si le trafic n'était pas en cours ; sinon ferme l'activité `trafficActive` avec `peakAmount`. *(interne)* *(hook)* | 31 |

### Détail des paramètres

#### `telemetry_trackers_traffic.onTrafficAmountChanged(activeAmount)`

Hook appelé chaque fois que des véhicules entrent ou sortent du pool de trafic. Ne garde que le maximum, sans créer d'événement.

- `activeAmount` (*integer*) : Nombre de véhicules de trafic actifs.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions à charger avant celle-ci : `{'telemetry_core'}`. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/traffic.lua`.*
