# `editor_toolUtilities_siteMarks`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteMarks.lua` · VM : Game Engine (GE) · 161 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteMarks` : `extensions.load("editor_toolUtilities_siteMarks")`, puis la globale `editor_toolUtilities_siteMarks`

Marquages routiers tels qu'un site les porte : lignes de places, hachures, barres de cédez-le-passage, lignes d'axe d'allée, traces d'usure de pneus, fissures et zébras. Chacun est un DecalRoad, c'est-à-dire de la peinture posée SUR le sol et non de la géométrie : rien n'entre dans une coque, donc un parking cuit porte ce qu'il faut peindre et le repeint là où on le pose (même arrangement que pour l'eau). Le module crée les DecalRoad, convertit le plan vers/depuis le format du manifeste et les remet au niveau.

## Remarques

- Enregistrement de marque (plan) : { pts = {{x,y},...} (au moins 2), mat, texLen, prio, lift, over, width (nombre ou liste par nœud, pour une trace qui s'amincit), closed, fade = {début, fin}, z (hauteur d'une dalle) }.
- Les DecalRoad sont créés avec canSave = false et improvedSpline = true, drivability = -1 ; commit les rend sauvables (canSave et cansave à true) : elles sont alors au niveau et l'outil ne doit plus les supprimer.
- localise regroupe par style (mat, texLen, prio, lift, width, over, z) : un lot peint un millier de marques en environ quatre styles, donc un indice par run au lieu de cinq champs. Les points sortent à plat { x1, y1, x2, y2, ... } arrondis au millimètre.
- Le z d'une marque posée sur une dalle est relatif à oz dans le manifeste et à pz dans place.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteMarks.build(plan, folder, terrainZ)` | Peint tout un plan d'un coup. Renvoie les objets créés, pour que le demandeur puisse les remettre au niveau ou les retirer. Liste vide si plan ou folder manque. | 54 |
| `editor_toolUtilities_siteMarks.commit(objs)` | Remet les marques au niveau. Peintes par l'outil, elles n'appartenaient à rien et n'étaient pas écrites ; à partir de là elles sont celles du niveau et l'outil ne doit plus les supprimer. | 66 |
| `editor_toolUtilities_siteMarks.emit(folder, rec, terrainZ)` | Crée un DecalRoad depuis son enregistrement et l'ajoute à folder. Chaque nœud est à la hauteur du terrain (ou de rec.z pour une marque sur dalle) plus lift ; si closed, le premier point est rajouté à la fin. Renvoie nil s'il y a moins de 2 points ou si la création échoue. | 20 |
| `editor_toolUtilities_siteMarks.localise(plan, ox, oy, oz)` | Le plan tel qu'un manifeste le porte, local à l'origine de cuisson. Renvoie { styles, runs } ou nil si rien. Chaque run : { s = indice de style, pts = plat, closed, fade, w (largeurs par nœud) }. | 82 |
| `editor_toolUtilities_siteMarks.place(rec, px, py, yaw, ox, oy, pz)` | L'inverse : les marques du manifeste comme plan, posées là où se trouve un placement et tournées sur son cap. (ox, oy) est le point du repère du site autour duquel le placement tourne (le milieu de son empreinte, pas l'origine de cuisson dans un coin). pz est la hauteur du placement, utile seulement aux marques posées sur l'une de ses propres dalles. | 129 |

### Détail des paramètres

#### `editor_toolUtilities_siteMarks.build(plan, folder, terrainZ)`

Peint tout un plan d'un coup. Renvoie les objets créés, pour que le demandeur puisse les remettre au niveau ou les retirer. Liste vide si plan ou folder manque.

- `plan` (*table|nil*) : Liste d'enregistrements de marques.
- `folder` (*userdata|nil*) : Groupe de scène parent.
- `terrainZ` (*function*) : terrainZ(x, y) renvoie la hauteur du terrain.
- **renvoie** : table Liste des DecalRoad créés.

#### `editor_toolUtilities_siteMarks.commit(objs)`

Remet les marques au niveau. Peintes par l'outil, elles n'appartenaient à rien et n'étaient pas écrites ; à partir de là elles sont celles du niveau et l'outil ne doit plus les supprimer.

- `objs` (*table|nil*) : DecalRoad renvoyés par build.

#### `editor_toolUtilities_siteMarks.emit(folder, rec, terrainZ)`

Crée un DecalRoad depuis son enregistrement et l'ajoute à folder. Chaque nœud est à la hauteur du terrain (ou de rec.z pour une marque sur dalle) plus lift ; si closed, le premier point est rajouté à la fin. Renvoie nil s'il y a moins de 2 points ou si la création échoue.

- `folder` (*userdata*) : Groupe de scène parent.
- `rec` (*table*) : Enregistrement de marque.
- `terrainZ` (*function*) : terrainZ(x, y) renvoie la hauteur du terrain.
- **renvoie** : userdata|nil Objet DecalRoad.

#### `editor_toolUtilities_siteMarks.localise(plan, ox, oy, oz)`

Le plan tel qu'un manifeste le porte, local à l'origine de cuisson. Renvoie { styles, runs } ou nil si rien. Chaque run : { s = indice de style, pts = plat, closed, fade, w (largeurs par nœud) }.

- `plan` (*table|nil*) : Liste d'enregistrements de marques.
- `ox` (*number*) : x de l'origine.
- `oy` (*number*) : y de l'origine.
- `oz` (*number|nil*) : z de l'origine (pour les marques sur dalle).
- **renvoie** : table|nil { styles = {...}, runs = {...} }.

#### `editor_toolUtilities_siteMarks.place(rec, px, py, yaw, ox, oy, pz)`

L'inverse : les marques du manifeste comme plan, posées là où se trouve un placement et tournées sur son cap. (ox, oy) est le point du repère du site autour duquel le placement tourne (le milieu de son empreinte, pas l'origine de cuisson dans un coin). pz est la hauteur du placement, utile seulement aux marques posées sur l'une de ses propres dalles.

- `rec` (*table|nil*) : Enregistrement du manifeste { styles, runs }.
- `px` (*number*) : x du placement.
- `py` (*number*) : y du placement.
- `yaw` (*number|nil*) : Cap en radians (défaut 0).
- `ox` (*number|nil*) : x du pivot (défaut 0).
- `oy` (*number|nil*) : y du pivot (défaut 0).
- `pz` (*number|nil*) : Hauteur du placement (défaut 0).
- **renvoie** : table|nil Plan de marques en coordonnées monde, nil s'il est vide.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteMarks.lua`.*
