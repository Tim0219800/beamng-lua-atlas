# `util_screenshotCreator_capture`

*Fichier : `lua/ge/extensions/util/screenshotCreator/capture.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_capture` : `extensions.load("util_screenshotCreator_capture")`, puis la globale `util_screenshotCreator_capture`

Sous-module de capture de l'outil screenshotCreator : prend une capture hors écran d'un véhicule depuis une caméra donnée, via une vue de rendu dédiée (render_renderViews, vue « thumbnailScreenshot »). L'interface et les marqueurs ne sont pas affichés ; la vue de rendu reprend l'exposition de la vue principale et attend 1 s par défaut pour que les effets de post-traitement convergent. La capture est rendue à résolution × sur-échantillonnage puis réduite.

## Remarques

- captureFramedThumbnail doit être appelée depuis une coroutine : elle attend avec coroutine.yield jusqu'à la fin de la capture ou au délai maximal.
- Résolution par défaut 500x281, sur-échantillonnage par défaut 4, champ de vision par défaut 20 degrés, plan proche par défaut 0,1.
- Le fichier existant est supprimé avant la capture. Le message « Saved screenshot » est logué avant que la capture soit terminée.
- Le masque de vue de rendu (bit 63) est celui de la carte de réflexion.

**Dépendances (chargées avant) :** `render_renderViews`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_capture.captureFramedThumbnail(filepath, camera, options)` | Capture une vignette hors écran et attend sa fin (coroutine). Utilise la distance de plan éloigné de la vue principale pour que les effets basés sur la profondeur (flou de profondeur) restent cohérents. | 16 |
| `util_screenshotCreator_capture.takeThumbnailScreenshot(filepath, camera, callback, uniqueId, options)` | Lance la capture via render_renderViews.takeScreenshot sans attendre (asynchrone). Avertit et appelle le callback sans argument si filepath ou camera (pos et rot) sont invalides. | 33 |

### Détail des paramètres

#### `util_screenshotCreator_capture.captureFramedThumbnail(filepath, camera, options)`

Capture une vignette hors écran et attend sa fin (coroutine). Utilise la distance de plan éloigné de la vue principale pour que les effets basés sur la profondeur (flou de profondeur) restent cohérents.

- `filepath` (*string*) : Fichier image de sortie
- `camera` (*table*) : Caméra {pos, rot, ...}
- `options` (*table*) : resolution {largeur, hauteur}, supersampling, fov, nearPlane, captureTimeout (secondes, défaut 5, minimum 0,1)
- **renvoie** : boolean true si la capture a réussi et si le fichier existe avec une taille non nulle

#### `util_screenshotCreator_capture.takeThumbnailScreenshot(filepath, camera, callback, uniqueId, options)`

Lance la capture via render_renderViews.takeScreenshot sans attendre (asynchrone). Avertit et appelle le callback sans argument si filepath ou camera (pos et rot) sont invalides.

- `filepath` (*string*) : Fichier image de sortie
- `camera` (*table*) : Caméra {pos, rot, fov?, nearPlane?, screenshotDelay?}
- `callback` (*function|nil*) : Appelé à la fin avec le résultat de la capture
- `uniqueId` (*any*) : Non utilisé dans cette fonction
- `options` (*table|nil*) : resolution, supersampling, fov, nearPlane, farClip

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `fileSize`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/capture.lua`.*
