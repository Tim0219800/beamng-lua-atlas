# `telemetry_trackers_performance`

*Fichier : `lua/ge/extensions/telemetry/trackers/performance.lua` · VM : Game Engine (GE) · 76 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_performance` : `extensions.load("telemetry_trackers_performance")`, puis la globale `telemetry_trackers_performance`

Suiveur de télémétrie des performances : rapporte le framerate des joueurs à partir de ce que le moteur mesure déjà pour la surcouche cyclée par Ctrl+F ($fps::avg, min, p99, cpuTime, gpuTime). Un évènement « performance » par lecture, sans moyenne ni jugement : c'est le serveur qui décide quel framerate est trop bas. L'intervalle (sampleIntervalSeconds, 300 s par défaut, borné entre 5 et 3600) vient de la config serveur.

## Remarques

- Les lectures sont faites partout, menus compris ; chacune indique d'où elle vient : level est nil dans les menus et paused est défini quand la simulation est arrêtée.
- La lecture est ignorée si $fps::avg est absent ou <= 0.
- L'évènement contient fpsAvg, fpsMin, fpsP99, cpuMs, gpuMs et limitedBy (facteur limitant selon performanceMetrics).

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_performance.onExtensionLoaded()` | Hook appelé au chargement : lit sampleIntervalSeconds dans la config du module « performance » et passe en déchargement manuel. *(interne)* *(hook)* | 64 |
| `telemetry_trackers_performance.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque image : un seul appel d'horloge et une comparaison ; prend une lecture quand l'intervalle est écoulé. *(interne)* *(hook)* | 56 |

### Détail des paramètres

#### `telemetry_trackers_performance.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque image : un seul appel d'horloge et une comparaison ; prend une lecture quand l'intervalle est écoulé.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s) ; <= 0 marque la lecture comme paused.
- `dtRaw` (*number*) : Delta temps brut (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/performance.lua`.*
