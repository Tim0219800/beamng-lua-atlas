# `telemetry_reporters_jsonFileReporter`

*Fichier : `lua/ge/extensions/telemetry/reporters/jsonFileReporter.lua` · VM : Game Engine (GE) · 147 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_reporters_jsonFileReporter` : `extensions.load("telemetry_reporters_jsonFileReporter")`, puis la globale `telemetry_reporters_jsonFileReporter`

Envoyeur de télémétrie : au chargement, une tâche du jobsystem attend 5 s puis envoie au serveur (appel core_online s11/v2/telemetryReports) les fichiers de session /telemetry/sessions/*.jsonl écrits par telemetry_core, groupés en un seul envoi. L'envoi n'a lieu que si la plus ancienne session en attente date de plus de l'intervalle configuré (reportIntervalHours, 12 h par défaut, avec jitter aléatoire de 1x à 2x). Le fichier de la session en cours est ignoré.

## Remarques

- En cas de succès (response.result == 'ok'), les fichiers envoyés sont supprimés. En cas d'échec, ils restent pour le prochain démarrage ; au-delà de 20 fichiers en attente, les plus anciens sont supprimés.
- Un fichier de session illisible ou sans évènement valide est supprimé sans être envoyé.
- Les données envoyées : userID anonyme (telemetry_userIdentity), version de télémétrie, et la liste des sessions (tableaux d'évènements).
- L'extension se déclare en déchargement manuel (setExtensionUnloadMode manual).
- Attention : trimPendingFiles est appelée avec la liste des fichiers qui viennent d'être envoyés, pas avec tous les fichiers en attente.

**Dépendances (chargées avant) :** `telemetry_core`, `telemetry_configManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_reporters_jsonFileReporter.onExtensionLoaded()` | Hook appelé au chargement : passe l'extension en déchargement manuel et lance la tâche d'envoi (jobsystem, priorité 0,5). *(interne)* *(hook)* | 139 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core et telemetry_configManager. |

## Appels vers le moteur (C++)

- `FS:` `findFiles`, `removeFile`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/reporters/jsonFileReporter.lua`.*
