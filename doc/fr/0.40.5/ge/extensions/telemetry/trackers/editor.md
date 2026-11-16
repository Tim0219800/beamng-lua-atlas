# `telemetry_trackers_editor`

*Fichier : `lua/ge/extensions/telemetry/trackers/editor.lua` · VM : Game Engine (GE) · 59 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_editor` : `extensions.load("telemetry_trackers_editor")`, puis la globale `telemetry_trackers_editor`

Suiveur de télémétrie de l'éditeur de monde : mesure la durée d'ouverture de l'éditeur (activité « editorActive ») et enregistre les fenêtres d'outils ouvertes (évènement « editorToolWindowOpened » avec nom d'outil et point d'entrée). Seuls les noms d'outils sont rapportés, jamais les chemins de niveaux ou d'assets. Le constructeur de pistes est suivi par un autre suiveur de gameplay.

## Remarques

- Si l'éditeur est déjà actif au chargement de l'extension (editor.active), l'activité démarre immédiatement.
- onExit et onExtensionUnloaded sont la même fonction : elle ferme l'activité ouverte, sinon la dernière n'aurait pas de durée.

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_editor.onEditorActivated()` | Hook appelé à l'activation de l'éditeur : démarre l'activité editorActive (sans effet si déjà ouverte). *(interne)* *(hook)* | 19 |
| `telemetry_trackers_editor.onEditorDeactivated()` | Hook appelé à la fermeture de l'éditeur : termine l'activité editorActive. *(interne)* *(hook)* | 25 |
| `telemetry_trackers_editor.onEditorToolWindowOpened(toolName, entryPoint)` | Hook appelé à l'ouverture d'une fenêtre d'outil : enregistre l'évènement. *(interne)* *(hook)* | 31 |
| `telemetry_trackers_editor.onExit()` | Hook appelé à la fermeture du jeu : ferme l'activité éditeur ouverte. *(interne)* *(hook)* | 45 |
| `telemetry_trackers_editor.onExtensionLoaded()` | Hook appelé au chargement : déchargement manuel, et démarre l'activité si l'éditeur est déjà actif. *(interne)* *(hook)* | 39 |
| `telemetry_trackers_editor.onExtensionUnloaded()` | Hook appelé au déchargement : ferme l'activité éditeur ouverte (même fonction que onExit). *(interne)* *(hook)* | 45 |

### Détail des paramètres

#### `telemetry_trackers_editor.onEditorToolWindowOpened(toolName, entryPoint)`

Hook appelé à l'ouverture d'une fenêtre d'outil : enregistre l'évènement.

- `toolName` (*string*) : Nom de l'outil.
- `entryPoint` (*string*) : Point d'entrée (menu, raccourci, etc., déduit du code).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/editor.lua`.*
