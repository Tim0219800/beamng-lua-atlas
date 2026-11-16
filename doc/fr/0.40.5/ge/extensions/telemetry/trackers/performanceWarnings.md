# `telemetry_trackers_performanceWarnings`

*Fichier : `lua/ge/extensions/telemetry/trackers/performanceWarnings.lua` · VM : Game Engine (GE) · 35 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_performanceWarnings` : `extensions.load("telemetry_trackers_performanceWarnings")`, puis la globale `telemetry_trackers_performanceWarnings`

Suiveur de télémétrie des avertissements matériels de performance affichés au joueur : chaque avertissement (catégorie + message) n'est rapporté qu'une seule fois par session (évènement « performanceHardwareWarning » avec catégorie, message, gravité, contexte et acquittement).

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_performanceWarnings.onExtensionLoaded()` | Hook appelé au chargement : déchargement manuel. *(interne)* *(hook)* | 27 |
| `telemetry_trackers_performanceWarnings.onPerformanceHardwareWarning(category, warning)` | Hook appelé quand le jeu émet un avertissement matériel de performance ; dédoublonne par catégorie et message. *(interne)* *(hook)* | 12 |

### Détail des paramètres

#### `telemetry_trackers_performanceWarnings.onPerformanceHardwareWarning(category, warning)`

Hook appelé quand le jeu émet un avertissement matériel de performance ; dédoublonne par catégorie et message.

- `category` (*string*) : Catégorie de l'avertissement.
- `warning` (*table*) : {msg, type (gravité), context, ack}

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/performanceWarnings.lua`.*
