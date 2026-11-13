# `util_screenshotCreator_framing_configured`

*Fichier : `lua/ge/extensions/util/screenshotCreator/framing/configured.lua` · VM : Game Engine (GE) · 97 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_framing_configured` : `extensions.load("util_screenshotCreator_framing_configured")`, puis la globale `util_screenshotCreator_framing_configured`

Mode de cadrage « Configured camera » de screenshotCreator : utilise une caméra personnalisée enregistrée dans la configuration de vignette du véhicule (par config, sinon par modèle) et la convertit en position/rotation monde à partir des décalages stockés (rewindCameraOffsets). Si aucune caméra configurée n'est utilisable, retombe sur le cadrage procédural. Il s'enregistre dans la liste des modes via le hook onScreenshotCreatorCollectFramingModes (id « configured », ordre 200).

## Remarques

- Priorité : caméra de la config (configCamEnabled), puis caméra du modèle (modelCamEnabled), puis cadrage procédural.
- resolveOverride renvoie nil sans erreur quand aucune caméra configurée ne s'applique, et (nil, message) si context.vehicle est absent.
- frame est un alias de resolve.

**Dépendances (chargées avant) :** `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_framing_procedural`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_framing_configured.frame(context)` | Alias de resolve. | 75 |
| `util_screenshotCreator_framing_configured.onScreenshotCreatorCollectFramingModes(modes)` | Hook de collecte des modes de cadrage : ajoute à la liste le mode {id = 'configured', label = 'Configured camera', order = 200, resolve}. *(interne)* *(hook)* | 82 |
| `util_screenshotCreator_framing_configured.resolve(context)` | Résout la caméra pour le contexte : essaie la caméra configurée, sinon délègue à util_screenshotCreator_framing_procedural.resolve. | 75 |
| `util_screenshotCreator_framing_configured.resolveOverride(context)` | Résout uniquement la caméra configurée par l'utilisateur (config puis modèle) sans repli procédural. | 37 |

### Détail des paramètres

#### `util_screenshotCreator_framing_configured.frame(context)`

Alias de resolve.

- `context` (*table*) : Voir resolve
- **renvoie** : table|nil Voir resolve
- **renvoie** : string|nil Message d'erreur

#### `util_screenshotCreator_framing_configured.onScreenshotCreatorCollectFramingModes(modes)`

Hook de collecte des modes de cadrage : ajoute à la liste le mode {id = 'configured', label = 'Configured camera', order = 200, resolve}.

- `modes` (*table[]*) : Liste de modes à compléter

#### `util_screenshotCreator_framing_configured.resolve(context)`

Résout la caméra pour le contexte : essaie la caméra configurée, sinon délègue à util_screenshotCreator_framing_procedural.resolve.

- `context` (*table*) : Contexte de cadrage : vehicle (obligatoire), configName, et les champs lus par le cadrage procédural
- **renvoie** : table|nil {pos, rot, name, debugData} ou nil en cas d'erreur
- **renvoie** : string|nil Message d'erreur

#### `util_screenshotCreator_framing_configured.resolveOverride(context)`

Résout uniquement la caméra configurée par l'utilisateur (config puis modèle) sans repli procédural.

- `context` (*table*) : Contexte de cadrage avec vehicle et configName
- **renvoie** : table|nil {pos, rot, name = 'config camera' ou 'model camera', debugData} ou nil si aucune caméra configurée
- **renvoie** : string|nil Message d'erreur si le contexte est invalide

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/framing/configured.lua`.*
