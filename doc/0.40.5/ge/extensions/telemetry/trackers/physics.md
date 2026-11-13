# `telemetry_trackers_physics`

*Fichier : `lua/ge/extensions/telemetry/trackers/physics.lua` · VM : Game Engine (GE) · 54 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_physics` : `extensions.load("telemetry_trackers_physics")`, puis la globale `telemetry_trackers_physics`

Suiveur de télémétrie physique : rapporte les instabilités physiques avec assez de contexte pour les reproduire (évènement « physicsInstability » : modèle, config, mod d'origine, niveau, vitesse de simulation, nombre de véhicules, position et somme des dégâts de sections du véhicule) puis demande l'écriture du rapport.

## Remarques

- Ce suiveur ne fait qu'observer : il ne met jamais instabilityHandled, donc n'interfère pas avec ce qui traite l'instabilité.
- Si telemetry_vehicleInfo ne connaît pas le véhicule, rien n'est envoyé.

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_physics.onExtensionLoaded()` | Hook appelé au chargement : déchargement manuel. *(interne)* *(hook)* | 46 |
| `telemetry_trackers_physics.onInstabilityDetected(vid, returnData)` | Hook appelé quand une instabilité physique est détectée sur un véhicule : construit et envoie l'évènement, puis appelle telemetry_core.triggerReportWrite(). *(interne)* *(hook)* | 18 |

### Détail des paramètres

#### `telemetry_trackers_physics.onInstabilityDetected(vid, returnData)`

Hook appelé quand une instabilité physique est détectée sur un véhicule : construit et envoie l'évènement, puis appelle telemetry_core.triggerReportWrite().

- `vid` (*integer*) : Id du véhicule instable.
- `returnData` (*table*) : Table de retour des gestionnaires d'instabilité (non utilisée ici).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

## Appels vers le moteur (C++)

- `be:` `getSimulationTimeScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/physics.lua`.*
