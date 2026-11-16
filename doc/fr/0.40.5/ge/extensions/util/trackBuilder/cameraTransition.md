# `util_trackBuilder_cameraTransition`

*Fichier : `lua/ge/extensions/util/trackBuilder/cameraTransition.lua` · VM : Game Engine (GE) · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_cameraTransition` : `extensions.load("util_trackBuilder_cameraTransition")`, puis la globale `util_trackBuilder_cameraTransition`

Petit utilitaire du Track Builder qui déplace en douceur la caméra libre vers une position et une rotation cibles. Il interpole position (linéaire) et rotation (nlerp) avec une courbe d'accélération quadratique inversée (1-(1-t)²), à chaque onPreRender, via core_camera.setPosRot.

## Exemple

```lua
util_trackBuilder_cameraTransition.lerpTo(vec3(0,0,50), quatFromEuler(0,0,0), 2)
```

## Remarques

- L'interpolation n'est appliquée que si commands.isFreeCamera() est vrai (caméra libre) ; sinon la transition se déroule sans effet visible.
- Bug : dans lerpTo, la branche time <= 0 passe quat.w (le champ de la classe quat, probablement nil) au lieu de rot.w à core_camera.setPosRot.
- currentQuat est initialisé avec vec3(0,0,0) mais reçoit ensuite un quat ; sans conséquence puisqu'il est écrasé avant usage.
- Les arguments pos et rot sont stockés par référence (pas de copie).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_cameraTransition.lerpTo(pos, rot, time)` | Lance une transition de la caméra actuelle vers (pos, rot) en time secondes. Si time <= 0, place la caméra immédiatement. | 39 |
| `util_trackBuilder_cameraTransition.onPreRender(dt)` | Hook appelé avant chaque rendu : fait avancer la transition, calcule position et rotation interpolées et les applique à la caméra libre. *(interne)* *(hook)* | 22 |

### Détail des paramètres

#### `util_trackBuilder_cameraTransition.lerpTo(pos, rot, time)`

Lance une transition de la caméra actuelle vers (pos, rot) en time secondes. Si time <= 0, place la caméra immédiatement.

- `pos` (*vec3*) : Position cible dans le monde.
- `rot` (*quat*) : Rotation cible.
- `time` (*number*) : Durée en secondes ; 0 ou moins pour un saut immédiat.

#### `util_trackBuilder_cameraTransition.onPreRender(dt)`

Hook appelé avant chaque rendu : fait avancer la transition, calcule position et rotation interpolées et les applique à la caméra libre.

- `dt` (*number*) : Temps écoulé depuis la frame précédente (s).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/cameraTransition.lua`.*
