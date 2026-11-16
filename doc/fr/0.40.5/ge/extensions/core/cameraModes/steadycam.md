# `core_cameraModes_steadycam`

*Fichier : `lua/ge/extensions/core/cameraModes/steadycam.lua` · VM : Game Engine (GE) · 242 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/steadycam")` (fichier sous extensions/ mais pas une extension classique)

Steadycam : caméra à pied à la première personne du groupe « world » (ordre 30, après free et smoothFree, masquée). Marche aux touches de déplacement, regard à la souris, course avec le modificateur rapide, saut avec la barre d'espace (action map « Steadycam »). Gravité et rayon vers le bas gardent l'opérateur au sol (marches jusqu'à 0.4 m franchies, plus haut = mur, chute plus basse = il tombe). Avec groundWalk = false, c'est un vol vertical libre. Balancement de marche via le filtre bobbing. Renvoie un constructeur.

## Remarques

- Constantes : vitesse de marche 2.45 m/s (réglable 1 à 12), course x2, gravité 14 m/s2, saut 5.5 m/s (environ 1.1 m), rayon du corps 0.35 m, hauteur des yeux 1.7 m (réglage cameraSteadycamEyeHeight, 1.0 à 2.5), FOV réglage cameraSteadycamFov (60).
- Sans sol sous la caméra (vide), elle flotte au lieu de tomber indéfiniment.
- data.res.collisionCompatible = false.

## Classe `C`

Mode steadycam. Champs : pos (vec3 yeux), yaw, pitch (radians), vel, vz, grounded, walkSpeed, groundWalk, eyeHeight, manualzoom, bobbing.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_steadycam")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:deserialize(s)` | Restaure l'état (accepte l'ancienne clé bob). | 129 |
| `C:init()` | Définit groupe, constantes de sensation et crée zoom et bobbing. | 30 |
| `C:listParams()` | Réglages UI : height, walkSpeed, walkBob, standingBob, groundWalk, fov. | 104 |
| `C:onCameraChanged(focused)` | Hook : pousse l'action map « Steadycam » au gain de focus et la retire à la perte. | 94 |
| `C:onSettingsChanged()` | Hook : relit hauteur des yeux, FOV et réglages de bobbing. | 55 |
| `C:reset()` | Annule vitesses, saut et état au sol, réinitialise bobbing et zoom. | 65 |
| `C:serialize()` | État pour les vues flux vidéo. | 124 |
| `C:setFOV(fov)` | Fixe le FOV configuré (10 à 140). | 87 |
| `C:setParam(key, value)` | Modifie un réglage de listParams. | 115 |
| `C:setPosition(p)` | Place la caméra (alimenté à l'entrée du groupe de caméras pour ne pas sauter) et annule la vitesse. | 80 |
| `C:setRotation(q)` | Oriente le regard depuis un quaternion (la caméra regarde vers +Y). | 81 |
| `C:update(data)` | Intègre regard, marche, gravité, saut et écrit data.res (pos, rot, fov, targetPos 10 m devant). | 139 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/steadycam.lua`.*
