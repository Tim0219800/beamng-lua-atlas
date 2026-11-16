# `core_cameraModes_unicycle`

*Fichier : `lua/ge/extensions/core/cameraModes/unicycle.lua` · VM : Game Engine (GE) · 263 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/unicycle")` (fichier sous extensions/ mais pas une extension classique)

Caméra à la première personne du personnage à pied (« unicycle » : le véhicule joueur à pied). Masquée. La rotation de la tête vient des entrées de lacet/tangage (tangage limité à ±89.9 degrés), le zoom de data.unicycleZoom (FOV de 55 à 27). La position suit le nœud de tête du véhicule (core_camera.getDriverData). Envoie la rotation de caméra au contrôleur du véhicule (playerController.setCameraControlData). Supporte le snap turn OpenXR. setCustomData fixe la position (posée au sol à 1.6 m des yeux) et la direction de départ. Renvoie un constructeur.

## Remarques

- Constantes : hauteur humaine 1.6 m, hanche 0.45 * hauteur, accroupi 0.7 ; chute max 10 m, gravité -2 m/s2 dans attemptToWalk, qui est local au fichier et jamais appelée dans ce fichier (code inutilisé).
- getEyePosition utilise la variable `crouching` qui n'existe pas dans la portée (nil) : l'accroupissement n'est donc jamais pris en compte.
- onCameraChanged ne fait rien si le véhicule joueur est lui-même un unicycle ; sinon charge la disposition d'apps « unicycle » au gain de focus et redemande l'état de jeu à la perte.
- getRotVecFromFrontUp force un tangage horizontal (rotVec.y = 180) : le commentaire du code dit « the math below is broken ».
- Réglages : openXRsnapTurnUnicycle, openXRsnapTurnUnicycleDegrees.

## Classe `C`

Mode caméra piéton. Champs : pos (vec3), rotVec (vec3 degrés, y = 180 pour regarder à l'horizontale).

Le module renvoie un constructeur : `local obj = require("core_cameraModes_unicycle")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:getPosRot()` | Position et rotation courantes de la caméra. | 164 |
| `C:init()` | Prépare le lissage du zoom et lit les réglages. | 20 |
| `C:onCameraChanged(focused)` | Hook : charge ou quitte la disposition d'interface « unicycle » (voir notes). | 33 |
| `C:onSettingsChanged()` | Hook : relit les réglages snap turn OpenXR. | 28 |
| `C:reset()` | Remet le lissage du zoom à zéro. | 47 |
| `C:setCustomData(customData)` | Fixe la position et/ou l'orientation initiales ; appelé par setGlobalCameraByName. | 153 |
| `C:update(data)` | Applique rotation, zoom et position, et envoie la rotation au contrôleur du joueur. | 173 |

**Évènements UI (guihooks.trigger) :** `appContainer:loadLayoutByType`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/unicycle.lua`.*
