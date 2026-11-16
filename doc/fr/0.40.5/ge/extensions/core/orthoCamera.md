# `core_orthoCamera`

*Fichier : `lua/ge/extensions/core/orthoCamera.lua` · VM : Game Engine (GE) · 208 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_orthoCamera` : `extensions.load("core_orthoCamera")`, puis la globale `core_orthoCamera`

Extension GE `core_orthoCamera` : active une vue orthographique (sans perspective) sur la vue principale de l'objet OnlyGui, via scenetree.OnlyGui:setOrthoMainView. On définit les plans proches et lointains et la taille de la fenêtre orthographique (soit left/right/top/bottom, soit une taille `size` avec le ratio de la fenêtre). Contient aussi une fenêtre ImGui de débogage (debugMode, désactivé en dur).

## Exemple

```lua
core_orthoCamera.enable(true, {size = 20, nearClip = 1, farClip = 5000})
-- puis
core_orthoCamera.enable(false)
```

## Remarques

- Avec useWindowAspectRatio (vrai par défaut), left/right/top/bottom sont recalculés à partir de `size` : hauteur = size, largeur = size * ratio de la résolution du réglage GraphicDisplayResolutions (1280x720 si absent). Le ratio est recalculé à chaque onWindowResized.
- Si useWindowAspectRatio est faux, les bornes left/right/top/bottom données à enable sont utilisées telles quelles (défauts -1, 1, 1, -1).
- Valeurs par défaut de enable : nearClip 1, farClip 5000, size 1. setOptions ne modifie ni les bornes ni l'état activé, seulement size, nearClip et farClip, puis recalcule les bornes si le ratio fenêtre est utilisé.
- Les unités des tailles et plans de clip sont les unités du monde (mètres), déduit du code.
- Aucun code de désactivation spécifique : enable(false) envoie simplement enabled = false à setOrthoMainView. Avant le premier enable, les hooks ne font rien (enabled == nil).
- Bug potentiel : updateAspectRatio fait w, h = resolutionString:match(...) puis tonumber(w) ; si la chaîne ne correspond pas au motif, w est nil et le calcul w / h échoue.
- Le paramètre `size` du hook onWindowResized masque la variable locale `size` du module (non utilisé).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_orthoCamera.enable(_enabled, options)` | Active ou désactive la vue orthographique principale et fixe ses paramètres (bornes, plans de clip, taille). | 52 |
| `core_orthoCamera.getSize()` | Renvoie la taille verticale courante de la vue orthographique. | 85 |
| `core_orthoCamera.onUpdate(dtReal, dtSim, dtRaw)` | Hook par frame : affiche la fenêtre de débogage ImGui 'OnlyGui OrthoMainView' uniquement si debugMode est vrai (faux dans le code livré, donc inactif). *(interne)* *(hook)* | 106 |
| `core_orthoCamera.onWindowResized(size)` | Hook appelé quand la fenêtre est redimensionnée : recalcule le ratio et réapplique la vue. *(interne)* *(hook)* | 89 |
| `core_orthoCamera.setOptions(options)` | Met à jour size, nearClip et farClip (défauts 1, 1, 5000) et réapplique la vue orthographique si elle a déjà été configurée. | 75 |

### Détail des paramètres

#### `core_orthoCamera.enable(_enabled, options)`

Active ou désactive la vue orthographique principale et fixe ses paramètres (bornes, plans de clip, taille).

- `_enabled` (*boolean*) : true pour activer.
- `options` (*table|nil*) : { left, right, top, bottom, nearClip, farClip, size, useWindowAspectRatio } ; useWindowAspectRatio vaut true si absent.

#### `core_orthoCamera.getSize()`

Renvoie la taille verticale courante de la vue orthographique.

- **renvoie** : number size (1 par défaut).

#### `core_orthoCamera.onUpdate(dtReal, dtSim, dtRaw)`

Hook par frame : affiche la fenêtre de débogage ImGui 'OnlyGui OrthoMainView' uniquement si debugMode est vrai (faux dans le code livré, donc inactif).

- `dtReal` (*number*) : Non utilisé.
- `dtSim` (*number*) : Non utilisé.
- `dtRaw` (*number*) : Non utilisé.

#### `core_orthoCamera.onWindowResized(size)`

Hook appelé quand la fenêtre est redimensionnée : recalcule le ratio et réapplique la vue.

- `size` (*any*) : Nouvelle taille de fenêtre (non utilisée).

#### `core_orthoCamera.setOptions(options)`

Met à jour size, nearClip et farClip (défauts 1, 1, 5000) et réapplique la vue orthographique si elle a déjà été configurée.

- `options` (*table|nil*) : { size, nearClip, farClip }

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/orthoCamera.lua`.*
