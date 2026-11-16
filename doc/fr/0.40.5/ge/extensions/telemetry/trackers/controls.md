# `telemetry_trackers_controls`

*Fichier : `lua/ge/extensions/telemetry/trackers/controls.lua` · VM : Game Engine (GE) · 67 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_controls` : `extensions.load("telemetry_trackers_controls")`, puis la globale `telemetry_trackers_controls`

Suiveur de télémétrie des commandes : signale la méthode de direction utilisée (évènement ponctuel « controlsUsed ») et, à la fermeture du jeu, le nombre d'utilisations de chaque action liée (« inputActionUse », via ActionMap.getActionUseCounts). Les périphériques connectés relèvent du relevé matériel (tracker hardware), pas de celui-ci.

## Remarques

- controlsUsed est un évènement ponctuel, pas une durée : la méthode ne change presque jamais dans une session. Elle est signalée par véhicule, donc un changement de véhicule la signale de nouveau.
- L'extension se décharge avant que telemetry_core ne vide son tampon, donc l'évènement inputActionUse arrive encore dans le fichier.
- Lors d'un rechargement Lua (onSerialize avec reason == « reload »), le rapport d'actions est sauté pour éviter les doublons ; il n'est rapporté qu'une fois par vie de l'extension.

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_controls.onExtensionLoaded()` | Hook appelé au chargement : déchargement manuel. *(interne)* *(hook)* | 45 |
| `telemetry_trackers_controls.onExtensionUnloaded()` | Hook appelé au déchargement : envoie le décompte d'utilisation des actions (sauf rechargement Lua ou si déjà fait). *(interne)* *(hook)* | 50 |
| `telemetry_trackers_controls.onSerialize(reason)` | Hook appelé avant déchargement/rechargement : retient si la raison est un rechargement Lua. *(interne)* *(hook)* | 56 |
| `telemetry_trackers_controls.onSteeringFilterChanged(method)` | Hook appelé quand le filtre de direction du véhicule change : enregistre l'évènement controlsUsed avec la méthode. *(interne)* *(hook)* | 22 |

### Détail des paramètres

#### `telemetry_trackers_controls.onSerialize(reason)`

Hook appelé avant déchargement/rechargement : retient si la raison est un rechargement Lua.

- `reason` (*string*) : Raison de la sérialisation (« reload » en cas de rechargement).

#### `telemetry_trackers_controls.onSteeringFilterChanged(method)`

Hook appelé quand le filtre de direction du véhicule change : enregistre l'évènement controlsUsed avec la méthode.

- `method` (*string*) : Méthode de direction (déduit du code : nom du filtre/mode de direction).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/controls.lua`.*
