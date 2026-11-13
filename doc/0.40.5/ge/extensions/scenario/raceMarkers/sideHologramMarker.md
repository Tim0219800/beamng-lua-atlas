# `scenario_raceMarkers_sideHologramMarker`

*Fichier : `lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua` · VM : Game Engine (GE) · 546 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/scenario/raceMarkers/sideHologramMarker")` (fichier sous extensions/ mais pas une extension classique)

Marqueur de checkpoint « portique hologramme » : deux piliers (portail gauche et droit), chacun avec un cône au sol, une colonne haute, un cylindre fin qui relie le sol au cône, plus une flèche flottante au centre qui pointe vers le checkpoint suivant. Les pieds des piliers sont posés sur le sol par lancer de rayon (Engine.castRay, collision des arbres de la forêt temporairement coupée). Le module renvoie un constructeur : require('scenario/raceMarkers/sideHologramMarker')(id) donne un objet de la classe C.

## Remarques

- setToCheckpoint(wp) lit wp.pos, wp.radius (demi-écart entre piliers), wp.normal (défaut (1,1,0) normalisé), wp.nextPos (position du checkpoint suivant, oriente la flèche), wp.fadeNear, wp.fadeFar, wp.minAlpha.
- Couleurs de pilier par mode : default bleu (0, 0.4, 1), next noir (piliers amincis à 0.75), start et lap vert (0.4, 1, 0.2), recovery jaune, final bleu (0.1, 0.3, 1), branch orange, hidden amincit à 0. Fondu de 0.8 s entre deux modes.
- Le dernier checkpoint n'a pas de flèche orientée tant que wp.nextPos est absent : la flèche garde alors sa dernière orientation.
- Le lancer de rayon part de 6 m au-dessus et descend de 25 m ; si le sol est plus de 1 m sous la position d'origine, la position d'origine est conservée (cas des ponts).
- Les 9 objets créés sont des TSStatic nommés cylinder_marker_<rôle><id>, ajoutés à ScenarioObjectsGroup si présent.
- La page extraite affiche update(dtSim) ; la signature réelle est update(dt, dtSim).
- update référence self.leftPillarPos : si update est appelé avant setToCheckpoint (position nil), l'appel plante ; scenario_race_marker appelle toujours setToCheckpoint avant render.

## Classe `C`

Marqueur portique avec piliers, cônes, colonnes et flèche.

Le module renvoie un constructeur : `local obj = require("scenario_raceMarkers_sideHologramMarker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearMarker(id)` | Supprime un objet à partir de son identifiant. | 509 |
| `C:clearMarkers()` | Supprime tous les objets créés. | 517 |
| `C:createMarkers()` | Supprime les anciens objets puis crée les 9 objets. | 495 |
| `C:createObject(shapeName, objectName)` | Crée un TSStatic caché enregistré sous objectName et ajouté à ScenarioObjectsGroup. | 473 |
| `C:hide()` | Appelle setVisibility(false). | 469 |
| `C:init(id)` | Constructeur : initialise l'état et les couleurs. | 105 |
| `C:setMode(mode)` | Change de mode : affiche (sauf 'hidden') et lance le fondu. | 413 |
| `C:setToCheckpoint(wp)` | Calcule les positions au sol des deux piliers par lancers de rayon et place tous les objets. | 300 |
| `C:setVisibility(v)` | Affiche ou cache les 9 objets. | 425 |
| `C:show()` | Appelle setVisibility(true). | 470 |
| `C:update(dt, dtSim)` | Appel par image : balancement vertical, fondu de couleur, taille des colonnes selon la distance, orientation de la flèche vers nextPos. | 145 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua`.*
