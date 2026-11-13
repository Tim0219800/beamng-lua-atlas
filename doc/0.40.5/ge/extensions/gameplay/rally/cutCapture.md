# `gameplay_rally_cutCapture`

*Fichier : `lua/ge/extensions/gameplay/rally/cutCapture.lua` · VM : Game Engine (GE) · 85 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/cutCapture")` (fichier sous extensions/ mais pas une extension classique)

Enregistre les 'coupures' (cuts) pendant la reconnaissance (recce) d'un rallye : à chaque capture, la position, l'orientation et l'angle de volant du véhicule sont ajoutés en ligne JSON dans le fichier cuts.json du dossier recce de la mission. Gère aussi le fichier transcripts.json associé. Le module renvoie un constructeur : require(...)(vehicle, missionDir).

## Remarques

- Le fichier cuts.json contient un objet JSON par ligne (JSON Lines), ouvert en ajout.
- La position est celle du véhicule (le code indique qu'elle est centrée au-dessus du haut du pare-brise).
- La valeur 'steering' est lue depuis le cache de core_vehicleBridge ; elle reste nil tant qu'aucune valeur n'a été reçue.
- Les fichiers sont ouverts sans vérification d'erreur : si io.open échoue, self.f est nil et l'appel plante.

## Classe `C`

Objet de capture renvoyé par le constructeur du module. Attributs : vehicle, fname, fname_transcripts, cut_id.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_cutCapture")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:capture()` | Capture l'état courant du véhicule (id incrémental, horodatage rallyUtil.getTime(), pos {x,y,z}, quat {x,y,z,w} calculé depuis les vecteurs direction/haut, steering) et l'écrit via writeCut. | 40 |
| `C:init(vehicle, missionDir)` | Initialise : mémorise le véhicule, s'abonne aux changements de la valeur 'steering' (core_vehicleBridge) et calcule les chemins cuts.json et transcripts.json. L'identifiant de coupure repart à 1. | 12 |
| `C:truncateCapturesFile()` | Vide le fichier cuts.json (ouverture en écriture). | 22 |
| `C:truncateTranscriptsFile()` | Vide le fichier transcripts.json. | 27 |
| `C:writeCut(cutCapture)` | Ajoute une capture encodée en JSON, suivie d'un saut de ligne, à cuts.json. | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/cutCapture.lua`.*
