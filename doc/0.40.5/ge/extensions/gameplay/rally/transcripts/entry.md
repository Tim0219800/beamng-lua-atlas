# `gameplay_rally_transcripts_entry`

*Fichier : `lua/ge/extensions/gameplay/rally/transcripts/entry.lua` · VM : Game Engine (GE) · 534 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/transcripts/entry")` (fichier sous extensions/ mais pas une extension classique)

Une transcription individuelle de la reconnaissance de rallye : le texte reconnu de la voix du copilote, sa source, son horodatage et les données du véhicule au moment de la phrase (position, orientation, et captures de braquage). Sert surtout à l'éditeur de rallye pour afficher en debug une voiture 3D, colorer la trajectoire selon l'angle de braquage (appel de virage) et lancer un parcours caméra. Le module renvoie un constructeur : `require(...)(path, name, forceId)` ; l'objet est un élément de `sortedList` (id, name, sortOrder).

## Remarques

- Le champ vehicle_data est un conteneur : vehicle_data.vehicle_data contient {pos, quat} du véhicule et vehicle_data.capture_data contient {captures, cornerAnglesStyle} ; plusieurs méthodes (vehiclePos, vehicleQuat, capture_data) plantent si vehicle_data vaut nil (avant onDeserialized).
- get_grouped_captures met le résultat en cache dans grouped_captures et exige editor_rallyEditor (fenêtre de transcriptions) pour obtenir les angles de virage ; sans l'éditeur, sortedAngles reste nil et rallyUtil.determineCornerCall n'a pas de liste à parcourir.
- rallyUtil.determineCornerCall renvoie nil si le braquage ne tombe dans aucune plage ; le code accède ensuite à cap.calc.angle_data.color sans test.
- debugDrawText concatène sans test : si text vaut nil et is_hovered, erreur.
- Dimensions de la voiture de debug : hauteur 1,6 m, largeur 1,8 m, longueur 4,4 m ; pos est supposée au centre de la voiture. Couleur teal, blanche au survol, teal clair à la sélection.

## Classe `C`

Transcription. Champs : path, id, name, sortOrder (999999), show (true), text, success, src, file, beamng_file, timestamp, vehicle_data, grouped_captures.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_transcripts_entry")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:capture_data()` | Données de captures de braquage associées (vehicle_data.capture_data). | 61 |
| `C:debugDrawText(hovered)` | Texte affiché au-dessus de la voiture de debug : text, suivi de « (click to copy) » au survol. | 43 |
| `C:drawDebug(is_hovered, is_selected)` | Dessine la voiture de debug puis, si survolée ou sélectionnée, les captures de braquage. | 249 |
| `C:drawDebugCaptureData(is_hovered, is_selected)` | Pour une entrée survolée ou sélectionnée : sphère de rayon 0,5 colorée par angle pour chaque capture et étiquette de l'appel de virage par groupe. | 331 |
| `C:drawDebugVehicleData(is_hovered, is_selected)` | Dessine une voiture stylisée (prisme carré + 4 sphères de roues) à la position/orientation enregistrées, avec le texte de la transcription. | 254 |
| `C:get_grouped_captures()` | Regroupe les captures consécutives qui ont le même appel de virage (ex. « 3L », « C »). Trie les angles du style choisi, leur attribue un dégradé rouge-jaune-vert (blanc pour le centre), calcule pour chaque capture un champ calc {angle_pct, angle_data, cornerCallStr}, et fixe un point d'étiquette au milieu de chaque groupe. Résultat mis en cache. | 95 |
| `C:init(path, name, forceId)` | Constructeur : id imposé ou fourni par path:getNextUniqueIdentifier(), nom par défaut `t_<id>`, affichage actif. | 11 |
| `C:isUsable()` | Vrai si la transcription a des données véhicule et est affichée. | 39 |
| `C:lookAtMe()` | Centre la caméra de l'éditeur sur la position du véhicule (rallyUtil.setCameraTarget). | 523 |
| `C:onDeserialized(data, oldIdMap)` | Restaure les champs avec des valeurs par défaut (chaînes vides, 0.0, table vide). show est forcé à false si la position du véhicule est absente. | 233 |
| `C:onSerialize()` | Renvoie {oldId, name, show, text, success, src, file, beamng_file, timestamp, vehicle_data}. | 215 |
| `C:playCameraPath()` | Construit un parcours caméra (1 m au-dessus de chaque capture, FOV 60, temps relatif au premier ts, corrige le signe des quaternions) et le joue via core_paths.playPath. | 517 |
| `C:setShow(val)` | Fixe l'indicateur d'affichage. | 35 |
| `C:toggleShow()` | Inverse l'indicateur d'affichage show. | 31 |
| `C:vehiclePos()` | Position du véhicule lors de la transcription. | 51 |
| `C:vehicleQuat()` | Orientation du véhicule lors de la transcription. | 56 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/transcripts/entry.lua`.*
