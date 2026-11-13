# `editor_drivePathEditor_playback`

*Fichier : `lua/ge/extensions/editor/drivePathEditor/playback.lua` · VM : Game Engine (GE) · 205 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_drivePathEditor_playback` : `extensions.load("editor_drivePathEditor_playback")`, puis la globale `editor_drivePathEditor_playback`

Lecture des chemins (splines) du Drive Path Editor : associe chaque véhicule à sa spline liée, le replace au départ, puis, une fois le délai de la spline écoulé, envoie au véhicule une commande vLua ai.driveUsingPath générée depuis la spline. Deux modes : libre (script de nœuds x,y,z,r[,v|vl] après lissage Catmull-Rom et simplification RDP, tolérance 1.0) ou graphe de navigation (wpTargetList et wpSpeeds).

## Remarques

- Un véhicule n'est pris en compte que si sa spline est liée (isVehicleLink), a l'id du lien (vehicle.linkSplineId), le bon linkVehId == vehicle.vid, et isEnabled.
- Le démarrage réel se fait dans handlePlayback, appelé chaque frame : startPlayback ne lance pas encore l'IA.
- Mode libre : les largeurs sont divisées par 2 (demi-largeurs) ; en boucle (isLoop) le premier nœud de départ est ajouté à la fin ; noOfLaps n'est transmis que pour les boucles.
- speedProfileMode : 0 aucun profil, 1 vitesses v par nœud, 2 limites de vitesse vl par nœud (mode libre) ; en mode graphe seul le mode 1 produit wpSpeeds.
- driveInLane n'est transmis qu'en mode graphe (mode libre : chaîne vide, avec commentaire du code).
- Les arguments passés à ai.driveUsingPath incluent aggression, routeSpeed/routeSpeedMode (si différent de off) et avoidCars.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_drivePathEditor_playback.getPlaybackTime()` | Temps écoulé depuis le début de la lecture. | 25 |
| `editor_drivePathEditor_playback.handlePlayback()` | À appeler chaque frame : démarre l'IA des véhicules dont le delayTime est atteint (une seule fois par véhicule) puis fait avancer le temps de lecture. *(interne)* | 77 |
| `editor_drivePathEditor_playback.startPlayback(splines, vehicles)` | Prépare la lecture : vide la table des lectures en cours, y met chaque véhicule ayant une spline liée et activée, replace ces véhicules à leur pose de départ (splineMgr.resetVehiclePose), puis remet les compteurs de temps à zéro. | 30 |
| `editor_drivePathEditor_playback.stopPlayback()` | Envoie ai.setState({mode = "stop"}) à chaque véhicule en cours de lecture, les replace à leur pose de départ, puis vide la table et remet les compteurs à zéro. | 58 |

### Détail des paramètres

#### `editor_drivePathEditor_playback.getPlaybackTime()`

Temps écoulé depuis le début de la lecture.

- **renvoie** : number secondes

#### `editor_drivePathEditor_playback.startPlayback(splines, vehicles)`

Prépare la lecture : vide la table des lectures en cours, y met chaque véhicule ayant une spline liée et activée, replace ces véhicules à leur pose de départ (splineMgr.resetVehiclePose), puis remet les compteurs de temps à zéro.

- `splines` (*table*) : splines de chemin (champs id, isVehicleLink, linkVehId, isEnabled, delayTime…)
- `vehicles` (*table*) : véhicules de la scène (champs vid, veh, linkSplineId)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/drivePathEditor/playback.lua`.*
