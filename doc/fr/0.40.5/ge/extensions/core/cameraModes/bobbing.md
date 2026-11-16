# `core_cameraModes_bobbing`

*Fichier : `lua/ge/extensions/core/cameraModes/bobbing.lua` · VM : Game Engine (GE) · 71 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/bobbing")` (fichier sous extensions/ mais pas une extension classique)

Filtre de caméra (isFilter = true, hidden = true) : ajoute un balancement réaliste de la caméra (tête qui oscille en marchant, respiration à l'arrêt) en modifiant la position (légère montée) et l'orientation (tangage, roulis, lacet) du résultat de la caméra. Non sélectionnable : il est instancié par d'autres modes (cameraModes/external.lua, cameraModes/steadycam.lua) ou par du code comme gameplay/rallyStartClock.lua (require('core/cameraModes/bobbing')()). Désactivé quand une session OpenXR tourne. L'intensité vient des réglages cameraSteadycamWalkBob et cameraSteadycamStandingBob (0 à 2). Le module renvoie un constructeur : require('core/cameraModes/bobbing')(options).

## Exemple

```lua
local bobbing = require('core/cameraModes/bobbing')()
-- chaque frame, après avoir calculé data.res :
bobbing:update(data, walkAmount01, dt)
```

## Remarques

- L'index automatique donne update(walkAmt, dt) : la vraie signature est update(data, walkAmt, dt).
- walkAmt est une intensité de marche dans [0..1] (bornée) ; elle accélère la phase de pas (4 + 6*walkAmt rad/s) et amplifie le balancement. Le balancement est modéré par un facteur interne 0.6.
- Angles de sway en radians (passés à quatFromEuler(swayPitch, swayRoll, swayYaw)), montée verticale en mètres (jusqu'à environ 0.035 m en marche).
- update ajoute à data.res.pos un vec3(0,0,bobUp) et multiplie data.res.rot par un quaternion de sway ; il doit donc être appelé après que la caméra a rempli data.res.
- update renvoie true même quand il ne fait rien (OpenXR actif, dt <= 0 ou amplitude nulle).

## Classe `C`

Objet filtre renvoyé par le constructeur. Champs : walkBobScale, standingBobScale, t, bobPhase, phase (vec3 de phases aléatoires).

Le module renvoie un constructeur : `local obj = require("core_cameraModes_bobbing")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Initialise : isFilter et hidden à true, lit les réglages, remet à zéro. Appelé par le constructeur. | 8 |
| `C:onSettingsChanged()` | Relit les réglages cameraSteadycamWalkBob et cameraSteadycamStandingBob (bornés à 0..2, défaut 1). Appelé par camera.lua quand les réglages changent, ou par le mode propriétaire. | 15 |
| `C:reset()` | Remet le temps et la phase à zéro et tire de nouvelles phases aléatoires pour le balancement. | 20 |
| `C:update(data, walkAmt, dt)` | Applique le balancement à data.res.pos et data.res.rot. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/bobbing.lua`.*
