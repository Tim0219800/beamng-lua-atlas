# `util_screenshotCreator_framing_isometric`

*Fichier : `lua/ge/extensions/util/screenshotCreator/framing/isometric.lua` · VM : Game Engine (GE) · 147 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_framing_isometric` : `extensions.load("util_screenshotCreator_framing_isometric")`, puis la globale `util_screenshotCreator_framing_isometric`

Mode de cadrage « Fixed isometric » de screenshotCreator : place la caméra à distance fixe (15 m) du centre du véhicule, dans la direction locale (-1, -1, 0.75) normalisée selon les axes de référence du véhicule, regardant le centre. La position est ensuite recentrée de façon orthogonale (jusqu'à 8 itérations) pour que le projeté des points de cadrage soit centré dans la zone utile de l'image, en tenant compte des marges éventuelles. Il s'enregistre via onScreenshotCreatorCollectFramingModes (id « fixedIsometric », ordre 150).

## Remarques

- Résolution par défaut 500x281 et champ de vision par défaut 20 degrés quand le contexte n'en fournit pas.
- Les marges ne sont utilisées que si useFramingMargins (ou useMargins) est vrai.
- Le résultat contient framingData.boundBy = 'fixed distance' et framingData.fit (distance, décalages, position, rotation). frame est un alias de resolve.
- Le mode déclare supportsFixedRotation = false et fixedDistance = 15.

**Dépendances (chargées avant) :** `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_framing_procedural`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_framing_isometric.frame(context)` | Alias de resolve. | 81 |
| `util_screenshotCreator_framing_isometric.onScreenshotCreatorCollectFramingModes(modes)` | Hook de collecte des modes de cadrage : ajoute à la liste le mode {id = 'fixedIsometric', label = 'Fixed isometric', order = 150, fixedDistance, supportsFixedRotation = false, resolve}. *(interne)* *(hook)* | 131 |
| `util_screenshotCreator_framing_isometric.resolve(context)` | Calcule la caméra isométrique fixe pour le véhicule du contexte. | 81 |

### Détail des paramètres

#### `util_screenshotCreator_framing_isometric.frame(context)`

Alias de resolve.

- `context` (*table*) : Voir resolve
- **renvoie** : table|nil Voir resolve
- **renvoie** : string|nil Message d'erreur

#### `util_screenshotCreator_framing_isometric.onScreenshotCreatorCollectFramingModes(modes)`

Hook de collecte des modes de cadrage : ajoute à la liste le mode {id = 'fixedIsometric', label = 'Fixed isometric', order = 150, fixedDistance, supportsFixedRotation = false, resolve}.

- `modes` (*table[]*) : Liste de modes à compléter

#### `util_screenshotCreator_framing_isometric.resolve(context)`

Calcule la caméra isométrique fixe pour le véhicule du contexte.

- `context` (*table*) : Contexte : vehicle (obligatoire), configName, resolution, fov/fieldOfView, margin, useFramingMargins
- **renvoie** : table|nil {pos, rot, name = 'fixed isometric camera', debugData, framingData} ou nil en cas d'erreur
- **renvoie** : string|nil Message d'erreur si context.vehicle est absent

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/framing/isometric.lua`.*
