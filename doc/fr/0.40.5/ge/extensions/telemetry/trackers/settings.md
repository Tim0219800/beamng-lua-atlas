# `telemetry_trackers_settings`

*Fichier : `lua/ge/extensions/telemetry/trackers/settings.lua` · VM : Game Engine (GE) · 129 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_settings` : `extensions.load("telemetry_trackers_settings")`, puis la globale `telemetry_trackers_settings`

Suiveur de télémétrie des réglages : enregistre les réglages déclarés du jeu (settings.impl.defaults) avec leur valeur courante et leur valeur par défaut, pour lire framerate et plantages en regard de ce que le joueur a demandé. Les adresses locales, chemins et listes/préréglages créés par l'utilisateur sont exclus. Un changement est rapporté au démarrage suivant ; un jeu inchangé est renvoyé tous les surveyIntervalHours (7 jours par défaut).

## Remarques

- Réglages jamais rapportés : IngameConsoleLogBlacklist/Whitelist, WinConsoleLogBlacklist/Whitelist, mpCustomServiceURL, protocols_motionSim_address, protocols_outgauge_address, rallyCodriverVoicepackMRU, shaderGenCachePath, userColorPresets, userPaintPresets.
- La reconnaissance d'un changement utilise un SHA-256 d'une sérialisation canonique (clés triées) des réglages et des valeurs par défaut ; l'empreinte est stockée avec la dernière enquête dans surveys/settingsSurvey.json (sa date de modification est la date d'envoi).
- L'évènement s'appelle « settings » (surveyVersion 2) et contient settings et defaults.

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_settings.onExtensionLoaded()` | Hook appelé au chargement : passe en déchargement manuel, collecte les réglages et envoie l'enquête si elle est due ou si les réglages ont changé. *(interne)* *(hook)* | 94 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

## Appels vers le moteur (C++)

- `FS:` `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/settings.lua`.*
