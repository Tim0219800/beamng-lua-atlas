# `gameplay_rally_cameraPathPlayer`

*Fichier : `lua/ge/extensions/gameplay/rally/cameraPathPlayer.lua` · VM : Game Engine (GE) · 174 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/cameraPathPlayer")` (fichier sous extensions/ mais pas une extension classique)

Lit une trajectoire de caméra qui suit la route du rallye. À partir des points d'une 'snaproad' (pointsForCameraPath), il construit un chemin de caméra (copie adaptée de core_paths.loadPath) et le joue avec core_paths.playPath. Paramètres fixes dans play : 40 m avant, 20 m après, 2 m de hauteur, FOV 70, vitesse de lecture 80 km/h. Le module renvoie un constructeur : require(...)(snaproad).

## Remarques

- Le temps de chaque marqueur = distance cumulée / vitesse de lecture (m/s) : la caméra avance à vitesse constante, indépendamment de l'espacement des points.
- Dans loadPath, 'movingStart or true' et 'movingEnd or true' valent toujours true (une valeur false serait ignorée).
- La fonction locale loadPath renvoie une table de chemin sans l'enregistrer (addPath est commenté).

## Classe `C`

Lecteur de chemin caméra renvoyé par le constructeur du module.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_cameraPathPlayer")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(snaproad)` | Mémorise la snaproad utilisée pour produire les points du chemin. | 11 |
| `C:play()` | Demande les points à la snaproad (40 m avant, 20 m après), construit le chemin caméra et le lance avec core_paths.playPath. Ne fait rien si aucun point n'est renvoyé. | 146 |
| `C:stop()` | Arrête le chemin caméra en cours (core_paths.stopCurrentPath). | 162 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/cameraPathPlayer.lua`.*
