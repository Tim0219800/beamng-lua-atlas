# `editor_cameraV2_zoom`

*Fichier : `lua/ge/extensions/editor/cameraV2/zoom.lua` · VM : Game Engine (GE) · 267 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_cameraV2_zoom` : `extensions.load("editor_cameraV2_zoom")`, puis la globale `editor_cameraV2_zoom`

Zoom de Camera V2 : remplace le mouvement de molette standard par un dolly lissé le long du centre de la vue. Chaque cran de molette change la distance au point focal de façon proportionnelle (en espace logarithmique), avec lissage exponentiel et collision contre le terrain et la géométrie statique pour ne pas traverser le décor. Lit les préférences camera.cameraV2.zoomMinDistance, zoomMaxDistance, zoomFactorPerNotch et zoomResponse.

## Remarques

- Le point focal est le point touché par Engine.castRay depuis la caméra vers l'avant (portée 100000 m) ; sans impact, il est placé à 50 m (limité entre min et max) devant la caméra.
- Distance max codée en dur à 2500 m (clamp sur zoomMaxDistance). Réponse : amount = 1 - exp(-zoomResponse * dt), dt limité à 0,05 s.
- Le zoom est annulé si le bouton droit ou milieu de la souris est enfoncé, ou si la caméra a été déplacée/tournée par ailleurs de façon incompatible (reconcileCameraTranslation).
- Incohérence : zoomAnchor renvoie toujours terrainOnly = false et onMouseWheel met terrainOnly = false avec un focus fixe ; la branche clampDistanceToTerrainOnly et lastZoomUsedTerrainOnly() ne peuvent donc jamais être vraies dans cette version.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_cameraV2_zoom.cancel()` | Abandonne le zoom en cours. | 254 |
| `editor_cameraV2_zoom.isActive()` | Indique si un zoom lissé est en cours. | 258 |
| `editor_cameraV2_zoom.lastZoomUsedTerrainOnly()` | Indique si le dernier zoom utilisait seulement la collision avec le terrain (voir notes : toujours false dans le code actuel). | 262 |
| `editor_cameraV2_zoom.onMouseWheel(value, fixedFocus)` | Démarre ou prolonge un zoom : calcule le point focal, la distance courante et la distance cible (distance * facteur^-value, bornée), puis mémorise l'état que update() fait converger. Les crans successifs dans le même sens s'accumulent. *(hook)* | 171 |
| `editor_cameraV2_zoom.update(deltaTime)` | Fait avancer le zoom lissé d'une frame : déplace la caméra le long de la direction vers le focus. Met fin au zoom (état annulé) en cas de geste souris, de pose incohérente ou de collision. *(interne)* | 234 |

### Détail des paramètres

#### `editor_cameraV2_zoom.isActive()`

Indique si un zoom lissé est en cours.

- **renvoie** : boolean true si un état de zoom existe

#### `editor_cameraV2_zoom.lastZoomUsedTerrainOnly()`

Indique si le dernier zoom utilisait seulement la collision avec le terrain (voir notes : toujours false dans le code actuel).

- **renvoie** : boolean dernier terrainOnly

#### `editor_cameraV2_zoom.onMouseWheel(value, fixedFocus)`

Démarre ou prolonge un zoom : calcule le point focal, la distance courante et la distance cible (distance * facteur^-value, bornée), puis mémorise l'état que update() fait converger. Les crans successifs dans le même sens s'accumulent.

- `value` (*number*) : Crans de molette ; > 0 rapproche (zoom avant), < 0 éloigne. |value| <= 0,0001 est ignoré
- `fixedFocus` (*vec3|nil*) : Point focal imposé (s'il est raisonnable) à la place du raycast central
- **renvoie** : boolean false si la valeur est négligeable, true sinon (événement traité, même en cas d'échec de validation)

#### `editor_cameraV2_zoom.update(deltaTime)`

Fait avancer le zoom lissé d'une frame : déplace la caméra le long de la direction vers le focus. Met fin au zoom (état annulé) en cas de geste souris, de pose incohérente ou de collision.

- `deltaTime` (*number|nil*) : Secondes ; limité à [0 ; 0,05], à défaut ui_imgui.GetIO().DeltaTime

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `ui_imgui.` `GetIO`, `IsMouseDown`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/cameraV2/zoom.lua`.*
