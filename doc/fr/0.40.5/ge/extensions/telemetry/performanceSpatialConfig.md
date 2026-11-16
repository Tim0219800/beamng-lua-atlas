# `telemetry_performanceSpatialConfig`

*Fichier : `lua/ge/extensions/telemetry/performanceSpatialConfig.lua` · VM : Game Engine (GE) · 54 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_performanceSpatialConfig` : `extensions.load("telemetry_performanceSpatialConfig")`, puis la globale `telemetry_performanceSpatialConfig`

Module utilitaire (chargé par require) qui lit et valide la configuration serveur du tracker performanceSpatial. Les nombres sont bornés (NaN/infini remplacés par la valeur par défaut) ; toutes les options de collecte avancée sont désactivées par défaut et doivent être activées explicitement.

## Remarques

- spatialSampleIntervalSeconds : 0 désactive l'échantillonnage, sinon borné à 1..3600 s.
- levels : au plus 64 noms (<= 128 caractères, [%w_.-]) convertis en table de recherche nom -> true.
- Seuils de détection de chute (uniquement si dipTrackingEnabled) : dipFpsThreshold 30 (1..360), dipFrameTimeRatio 2 (1.1..10), dipMinDurationMs 250 (50..10000), dipCooldownSeconds 5 (0..3600), maxDipEventsPerSession 100 (1..1000).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_performanceSpatialConfig.read(config)` | Renvoie la configuration normalisée : sampleIntervalSeconds, les booléens dipTrackingEnabled, recoveryTrackingEnabled, gameplayExitTrackingEnabled, shaderGenerationTrackingEnabled, sceneComplexityTrackingEnabled, renderTimingTrackingEnabled, éventuellement levels (table de recherche) et detector (seuils de chute). | 17 |

### Détail des paramètres

#### `telemetry_performanceSpatialConfig.read(config)`

Renvoie la configuration normalisée : sampleIntervalSeconds, les booléens dipTrackingEnabled, recoveryTrackingEnabled, gameplayExitTrackingEnabled, shaderGenerationTrackingEnabled, sceneComplexityTrackingEnabled, renderTimingTrackingEnabled, éventuellement levels (table de recherche) et detector (seuils de chute).

- `config` (*table|nil*) : Configuration brute du module (une valeur non table est traitée comme {}).
- **renvoie** : table Configuration validée.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/performanceSpatialConfig.lua`.*
