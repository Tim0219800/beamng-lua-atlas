# `telemetry_trackers_hardware`

*Fichier : `lua/ge/extensions/telemetry/trackers/hardware.lua` · VM : Game Engine (GE) · 315 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_hardware` : `extensions.load("telemetry_trackers_hardware")`, puis la globale `telemetry_trackers_hardware`

Suiveur de télémétrie matérielle : collecte les informations système, graphiques, d'affichage, audio, stockage et périphériques d'entrée pour les décisions de configuration minimale et d'optimisation. L'enquête « hardwareSurvey » est volumineuse et change peu : elle n'est envoyée que tous les 30 jours (24*30 h par défaut, modifiable via la config serveur). Les changements de manettes, de sortie audio et de mode d'affichage sont des évènements ponctuels distincts.

## Remarques

- Contenu de l'enquête : type d'appareil (desktop, laptop, steamdeck, unknown), OS (dont langues OS/Steam/appliquée), CPU, GPU (nom, pilote, API, mémoires), mémoire, écrans (résolutions, DPI, HDR, mode vidéo), audio, VR (OpenXR), Steam (langue, branche, état), espace disque, présence d'OneDrive dans le chemin utilisateur, nombre de fichiers cache.*, et un indicateur piracy si la variable globale sailingTheHighSeas existe.
- Au chargement, un évènement « gpuMemorySnapshot » est émis par GPU qui renseigne l'utilisation mémoire.
- La dernière enquête envoyée est conservée dans surveys/hardwareSurvey.json ; sa date de modification est la date d'envoi. Réduire surveyIntervalHours côté serveur fait réenquêter tous les clients, tout comme un changement de surveyVersion (3 actuellement).
- Les liaisons d'entrée se chargent sur onFirstUpdate, que main.lua déclenche avant que settings.finalizeInit charge la télémétrie : les périphériques sont donc déjà énumérés au démarrage de ce suiveur.
- Dépend des sous-modules telemetry/hardwareAudio, hardwareChanges et hardwareInput.

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_hardware.onAudioOutputDeviceChanged()` | Hook appelé quand la sortie audio change : émet « audioOutputChanged » (fréquence d'échantillonnage, mode d'enceintes, canaux). *(interne)* *(hook)* | 197 |
| `telemetry_trackers_hardware.onDeviceChanged()` | Hook appelé quand un périphérique d'entrée change : compare aux manettes connues et émet un évènement « inputDeviceConnection » par différence. *(interne)* *(hook)* | 185 |
| `telemetry_trackers_hardware.onDisplayModeChanged(from, to)` | Hook appelé au changement de mode d'affichage : émet « displayModeChanged » seulement pour les transitions suivies. *(interne)* *(hook)* | 208 |
| `telemetry_trackers_hardware.onExtensionLoaded()` | Hook appelé au chargement : mémorise les manettes connectées, émet les instantanés mémoire GPU, envoie l'enquête matérielle si elle est due, puis passe en déchargement manuel. *(interne)* *(hook)* | 278 |

### Détail des paramètres

#### `telemetry_trackers_hardware.onDisplayModeChanged(from, to)`

Hook appelé au changement de mode d'affichage : émet « displayModeChanged » seulement pour les transitions suivies.

- `from` (*string*) : Ancien mode.
- `to` (*string*) : Nouveau mode.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

## Appels vers le moteur (C++)

- `FS:` `findFiles`, `getUserPath`, `isGamePathCaseSensitive`, `isUserPathCaseSensitive`, `stat`
- `Lua:` `getOSLanguage`, `getSelectedLanguage`, `getSteamLanguage`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/hardware.lua`.*
