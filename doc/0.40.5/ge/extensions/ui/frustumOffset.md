# `ui_frustumOffset`

*Fichier : `lua/ge/extensions/ui/frustumOffset.lua` · VM : Game Engine (GE) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_frustumOffset` : `extensions.load("ui_frustumOffset")`, puis la globale `ui_frustumOffset`

Décale le centre du frustum de la caméra (scenetree.OnlyGui:setFrustumCameraCenterOffset) pour que la vue 3D soit recentrée quand des panneaux UI recouvrent une partie de l'écran (voir BngFrustumMover.js). Accepte un décalage brut en unités moteur et/ou un décalage en fraction de demi-écran, converti en tenant compte du ratio d'écran et du FoV.

## Remarques

- Le décalage moteur est une pente en espace caméra : décalage écran = offset / (aspect * tan(vFov/2)).
- Le FoV utilisé est borné à 10 degrés minimum, comme le moteur.
- Les décalages écran sont recalculés dans onUpdate dès que le FoV change.
- Signes : une valeur positive de screenX/screenY déplace le centre de la vue vers la droite/le haut.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_frustumOffset.onUpdate()` | Hook par frame : si un décalage écran est actif et que le FoV a changé depuis la dernière application, réapplique le décalage. *(interne)* *(hook)* | 44 |
| `ui_frustumOffset.set(newRawX, newRawY, newScreenX, newScreenY)` | Définit les décalages et les applique immédiatement. Toute valeur absente vaut 0. | 38 |

### Détail des paramètres

#### `ui_frustumOffset.set(newRawX, newRawY, newScreenX, newScreenY)`

Définit les décalages et les applique immédiatement. Toute valeur absente vaut 0.

- `newRawX` (*number|nil*) : Décalage horizontal brut (unités moteur), transmis tel quel.
- `newRawY` (*number|nil*) : Décalage vertical brut (unités moteur), transmis tel quel.
- `newScreenX` (*number|nil*) : Décalage horizontal en fraction de la demi-largeur d'écran.
- `newScreenY` (*number|nil*) : Décalage vertical en fraction de la demi-hauteur d'écran.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/frustumOffset.lua`.*
