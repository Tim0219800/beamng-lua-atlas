# `telemetry_trackers_mods`

*Fichier : `lua/ge/extensions/telemetry/trackers/mods.lua` · VM : Game Engine (GE) · 92 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_mods` : `extensions.load("telemetry_trackers_mods")`, puis la globale `telemetry_trackers_mods`

Suiveur de télémétrie des mods : rapporte quels mods sont installés et actifs, pour distinguer plantages et performances entre installations modées et propres. Seuls le nom, le type, l'identifiant du dépôt (modID), l'état actif et si le mod est décompressé sont envoyés, jamais les chemins de fichiers (évènement « modSurvey » avec les décomptes du gestionnaire de mods).

## Remarques

- La liste n'est renvoyée que tous les surveyIntervalHours (7 jours par défaut) si elle est inchangée ; une liste modifiée est rapportée au démarrage suivant. La comparaison utilise un SHA-256 des couples (nom, actif).
- La base de données des mods n'est remplie qu'une fois le gestionnaire de mods prêt, bien après le démarrage de la télémétrie : l'enquête se fait donc dans onModManagerReady et non dans onExtensionLoaded.
- La dernière enquête envoyée est conservée dans surveys/modSurvey.json ; sa date de modification est la date d'envoi.
- modID est absent quand le mod ne vient pas du dépôt officiel.

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_mods.onExtensionLoaded()` | Hook appelé au chargement : déchargement manuel. *(interne)* *(hook)* | 84 |
| `telemetry_trackers_mods.onModManagerReady()` | Hook appelé quand le gestionnaire de mods est prêt : collecte la liste triée des mods et envoie l'enquête si nécessaire (une fois par session). *(interne)* *(hook)* | 57 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

## Appels vers le moteur (C++)

- `FS:` `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/mods.lua`.*
