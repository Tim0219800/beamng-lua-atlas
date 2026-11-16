# `gameplay_rally_vehicleCapture`

*Fichier : `lua/ge/extensions/gameplay/rally/vehicleCapture.lua` · VM : Game Engine (GE) · 104 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/vehicleCapture")` (fichier sous extensions/ mais pas une extension classique)

Enregistreur de trajectoire du véhicule pendant la reconnaissance (recce) d'un rallye. Tous les 2 m parcourus, il capture position, orientation et braquage, met les captures en tampon et les ajoute au fichier `driveline.json` (une ligne JSON par capture) du dossier de reconnaissance de la mission. Le module renvoie un constructeur : `require(...)(vehicle, missionDir)`.

## Remarques

- Le braquage est lu via core_vehicleBridge (clé 'steering', enregistrée en notification de changement) ; il vaut nil tant qu'aucune valeur n'est en cache.
- La première capture sert seulement d'ancrage (last_dist_pos) : rien n'est mis en tampon avant d'avoir parcouru plus de interval_m.
- Le tampon n'est écrit qu'à partir de 10 captures, sauf si writeCaptures(true) est appelé.

## Classe `C`

Enregistreur lié à un véhicule. Champs : vehicle, interval_m (2), last_dist_pos, capturesBuffer, fname.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_vehicleCapture")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:capture()` | À appeler à chaque image : lit position et orientation (quatf depuis direction et vecteur haut) du véhicule et, si celui-ci s'est éloigné de plus de interval_m de la dernière capture, met en tampon {ts, pos, quat, steering}. Tente ensuite d'écrire le tampon. | 52 |
| `C:drawDebug()` | Dessine une sphère bleue semi-transparente de rayon 2 à la dernière position capturée (debugDrawer:drawSphere). | 83 |
| `C:init(vehicle, missionDir)` | Constructeur. Enregistre la notification de changement de 'steering' auprès de core_vehicleBridge et calcule le chemin du fichier driveline.json via rallyUtil.missionReccePath. | 12 |
| `C:truncateCapturesFile()` | Vide le fichier de captures (ouverture en mode "w"). Journalise une erreur si l'ouverture échoue. | 23 |
| `C:writeCaptures(force)` | Ajoute les captures du tampon au fichier (une ligne JSON chacune) puis vide le tampon. Sans force, ne fait rien tant que le tampon contient moins de 10 éléments. | 32 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/vehicleCapture.lua`.*
