# `scenario_raceMarkers_attention`

*Fichier : `lua/ge/extensions/scenario/raceMarkers/attention.lua` · VM : Game Engine (GE) · 194 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/scenario/raceMarkers/attention")` (fichier sous extensions/ mais pas une extension classique)

Marqueur de checkpoint « flèche d'attention » : une flèche bleue (modèle s_mm_arrow_ribbon_down.dae) qui flotte au-dessus du point, tournée vers la caméra, avec un balancement vertical. Le module renvoie un constructeur : require('scenario/raceMarkers/attention')(id) donne un objet de la classe C. Utilisé via scenario_race_marker (setupMarkers avec le nom 'attention') ou directement.

## Remarques

- setToCheckpoint(wp) lit wp.pos (vec3) et wp.radius (échelle de la flèche, 1.5 par défaut).
- La couleur est fixe (0, 0.4, 1) quel que soit le mode ; le mode ne sert qu'à masquer (mode 'hidden') ou afficher.
- En marche à pied (gameplay_walk.isWalking), la flèche monte de 1 m quand la caméra est à moins de 4 m du marqueur.
- La flèche est un TSStatic nommé cylinder_marker_left<id> ajouté à ScenarioObjectsGroup, avec useInstanceRenderData.
- La méthode update a pour signature réelle (dt, dtSim) ; la page extraite l'affiche (dtSim) à cause de la déclaration avec ':'.
- Le commentaire de setToCheckpoint décrit des modes (default, branch, next, lap, finish, start) qui ne sont pas utilisés par ce marqueur.

## Classe `C`

Marqueur flèche d'attention.

Le module renvoie un constructeur : `local obj = require("scenario_raceMarkers_attention")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearMarkers()` | Supprime les objets créés par ce marqueur. | 177 |
| `C:createMarkers()` | Supprime les anciens objets puis crée la flèche. | 166 |
| `C:createObject(shapeName, objectName)` | Crée un objet TSStatic caché (shapeName, couleur d'instance, non sauvegardable) enregistré sous objectName et ajouté à ScenarioObjectsGroup s'il existe. | 144 |
| `C:hide()` | Appelle setVisibility(false). | 140 |
| `C:init(id)` | Constructeur : initialise l'état (invisible, mode 'hidden', lisseur de hauteur). | 29 |
| `C:setMode(mode)` | Change le mode : 'hidden' masque, tout autre mode affiche. Remet le minuteur de couleur à zéro. | 116 |
| `C:setToCheckpoint(wp)` | Place le marqueur sur un checkpoint. | 106 |
| `C:setVisibility(v)` | Affiche ou cache la flèche. | 131 |
| `C:show()` | Appelle setVisibility(true). | 141 |
| `C:update(dt, dtSim)` | Appel par image. Masque le marqueur une fois le fondu terminé en mode 'hidden', oriente la flèche vers la caméra (core_camera.getPosition), la fait osciller et applique la couleur. | 53 |

## Appels vers le moteur (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceMarkers/attention.lua`.*
