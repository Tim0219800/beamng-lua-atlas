# `telemetry_performanceSpatialDetector`

*Fichier : `lua/ge/extensions/telemetry/performanceSpatialDetector.lua` · VM : Game Engine (GE) · 123 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_performanceSpatialDetector` : `extensions.load("telemetry_performanceSpatialDetector")`, puis la globale `telemetry_performanceSpatialDetector`

Détecteur de chutes de performance (« dips ») pour le tracker performanceSpatial. Il suit une moyenne mobile exponentielle du temps de frame (baseline, alpha 0,05) et ouvre un épisode quand les FPS passent sous un seuil absolu ou quand le temps de frame dépasse baseline * ratio. L'épisode se termine au retour à la normale et ne produit un événement que s'il a duré assez longtemps. Un délai de repos et un plafond d'événements par session limitent le bruit.

## Remarques

- Les temps sont en millisecondes. Un épisode est découpé automatiquement après maxEpisodeMs (1 800 000 ms par défaut).
- Le champ 'trigger' de l'événement vaut 'absolute', 'relative' ou 'both'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_performanceSpatialDetector.new(config)` | Crée un détecteur. | 107 |

### Détail des paramètres

#### `telemetry_performanceSpatialDetector.new(config)`

Crée un détecteur.

- `config` (*table*) : dipFpsThreshold, dipFrameTimeRatio, dipMinDurationMs, dipCooldownSeconds, maxDipEventsPerSession, maxEpisodeMs (facultatif).
- **renvoie** : Detector Instance du détecteur.

## Classe `Detector`

Détecteur renvoyé par new(config).

| Méthode | Description | Ligne |
|---|---|---|
| `Detector:canReport(nowMs)` | Vrai si le délai de repos est écoulé et si le plafond d'événements de la session n'est pas atteint. | 58 |
| `Detector:finish(nowMs)` | Force la fin de l'épisode ouvert et renvoie son événement s'il a duré au moins dipMinDurationMs. | 62 |
| `Detector:reset()` | Oublie la baseline et l'épisode en cours. | 53 |
| `Detector:update(nowMs, fps, frameMs, absoluteAllowed)` | Traite un échantillon. Renvoie un booléen « capturer cette frame » (début d'épisode ou nouveau pire temps de frame) puis éventuellement l'événement d'un épisode terminé. Hors épisode, met à jour la baseline. | 66 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/performanceSpatialDetector.lua`.*
