# `editor_toolUtilities_siteDecals`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteDecals.lua` · VM : Game Engine (GE) · 144 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteDecals` : `extensions.load("editor_toolUtilities_siteDecals")`, puis la globale `editor_toolUtilities_siteDecals`

Décalques estampillés tels qu'un site les porte : flèches de circulation, texte EXIT peint, rustines de réparation d'asphalte. Ce sont des glyphes pris dans une planche (atlas) et posés en un point, orientés dans une direction, et non de la peinture tracée le long d'une ligne (c'est ce qui les distingue de siteMarks). Le module crée les DecalData (modèles), pose les instances via l'éditeur, les convertit vers/depuis le format du manifeste et les rend persistantes.

## Remarques

- Un enregistrement de décalque (plan) : { mat, rows, cols, prio, tplSize (taille du modèle), x, y, a (angle en radians), size, frame (cellule de l'atlas), lift (surélévation en m) }.
- Les modèles sont nommés « SiteDecal_<tag>_<n> » par site, car graver un site rend persistants ses propres modèles et ne doit pas faire de même pour ceux d'un voisin.
- localise arrondit les coordonnées au millimètre et écrit l'orientation en angle, de sorte que tourner le site est une addition par décalque.
- Les instances sont créées par editor.addDecalInstanceWithTan avec la normale vers le haut, le z du terrain obtenu par terrainZ(x, y) + lift. Les deux derniers arguments de l'appel (3, 1) sont des constantes du code.
- Les décalques sont retirés par editor.deleteDecalInstance ; commit marque les modèles « sales » dans decalPersistMan pour qu'ils survivent à la sauvegarde du niveau.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteDecals.build(plan, tag, terrainZ)` | Estampille tout un plan d'un coup, en créant les modèles requis. tag distingue ces modèles de ceux des autres sites. Renvoie les instances et les identifiants de modèles, deux choses à nettoyer différemment : une instance part avec le site, un modèle est partagé par tous les décalques du site. | 90 |
| `editor_toolUtilities_siteDecals.commit(tplIds)` | Donne les modèles au niveau, ce qui fait survivre à la sauvegarde les décalques posés d'après eux : le gestionnaire de persistance garde les instances contre leur modèle, donc marquer les quelques modèles « sales » écrit tous les décalques. Sans effet si decalPersistMan n'existe pas. | 119 |
| `editor_toolUtilities_siteDecals.emit(tpl, rec, terrainZ)` | Pose un décalque depuis son enregistrement : position (x, y) à la hauteur du terrain plus lift, normale vers le haut, tangente dirigée selon l'angle a. | 36 |
| `editor_toolUtilities_siteDecals.facing(tx, ty)` | Angle de cap d'un décalque (atan2(ty, tx)) à partir du vecteur direction qu'un constructeur a déjà. | 130 |
| `editor_toolUtilities_siteDecals.localise(plan, ox, oy)` | Convertit un plan de décalques au format du manifeste, local à l'origine de cuisson (ox, oy). Groupés par modèle (même mat, rows, cols, prio). Renvoie nil si le plan est vide. | 49 |
| `editor_toolUtilities_siteDecals.place(rec, px, py, yaw, ox, oy)` | L'inverse de localise : les décalques du manifeste comme plan, posés là où se trouve un placement et tournés sur son cap. (ox, oy) est le point du repère du site autour duquel le placement tourne. | 69 |
| `editor_toolUtilities_siteDecals.remove(objs)` | Retire des décalques posés (editor.deleteDecalInstance). | 110 |
| `editor_toolUtilities_siteDecals.template(name, spec)` | Récupère ou crée le DecalData d'un groupe de décalques, nommé d'après le site qui le dresse. Champs posés : material, frame, texRows, texCols, size, renderPriority (défaut 5). | 20 |

### Détail des paramètres

#### `editor_toolUtilities_siteDecals.build(plan, tag, terrainZ)`

Estampille tout un plan d'un coup, en créant les modèles requis. tag distingue ces modèles de ceux des autres sites. Renvoie les instances et les identifiants de modèles, deux choses à nettoyer différemment : une instance part avec le site, un modèle est partagé par tous les décalques du site.

- `plan` (*table|nil*) : Liste d'enregistrements de décalques.
- `tag` (*string*) : Étiquette du site.
- `terrainZ` (*function*) : terrainZ(x, y) renvoie la hauteur du terrain.
- **renvoie** : table Instances de décalques.
- **renvoie** : integer[] Identifiants des modèles DecalData créés.

#### `editor_toolUtilities_siteDecals.commit(tplIds)`

Donne les modèles au niveau, ce qui fait survivre à la sauvegarde les décalques posés d'après eux : le gestionnaire de persistance garde les instances contre leur modèle, donc marquer les quelques modèles « sales » écrit tous les décalques. Sans effet si decalPersistMan n'existe pas.

- `tplIds` (*integer[]|nil*) : Identifiants de modèles renvoyés par build.

#### `editor_toolUtilities_siteDecals.emit(tpl, rec, terrainZ)`

Pose un décalque depuis son enregistrement : position (x, y) à la hauteur du terrain plus lift, normale vers le haut, tangente dirigée selon l'angle a.

- `tpl` (*userdata*) : Modèle DecalData.
- `rec` (*table*) : { x, y, a, size, frame, lift }.
- `terrainZ` (*function*) : terrainZ(x, y) renvoie la hauteur du terrain.
- **renvoie** : any Instance de décalque renvoyée par editor.addDecalInstanceWithTan.

#### `editor_toolUtilities_siteDecals.facing(tx, ty)`

Angle de cap d'un décalque (atan2(ty, tx)) à partir du vecteur direction qu'un constructeur a déjà.

- `tx` (*number*) : Composante x de la direction.
- `ty` (*number*) : Composante y de la direction.
- **renvoie** : number Angle en radians.

#### `editor_toolUtilities_siteDecals.localise(plan, ox, oy)`

Convertit un plan de décalques au format du manifeste, local à l'origine de cuisson (ox, oy). Groupés par modèle (même mat, rows, cols, prio). Renvoie nil si le plan est vide.

- `plan` (*table|nil*) : Liste d'enregistrements de décalques.
- `ox` (*number*) : x de l'origine de cuisson.
- `oy` (*number*) : y de l'origine de cuisson.
- **renvoie** : table|nil { tpls = { {mat, rows, cols, prio, size}, ... }, items = { {t, x, y, a, size, frame, lift}, ... } }.

#### `editor_toolUtilities_siteDecals.place(rec, px, py, yaw, ox, oy)`

L'inverse de localise : les décalques du manifeste comme plan, posés là où se trouve un placement et tournés sur son cap. (ox, oy) est le point du repère du site autour duquel le placement tourne.

- `rec` (*table|nil*) : Enregistrement du manifeste { tpls, items }.
- `px` (*number*) : x du placement.
- `py` (*number*) : y du placement.
- `yaw` (*number|nil*) : Cap en radians (défaut 0).
- `ox` (*number|nil*) : x du pivot dans le repère du site (défaut 0).
- `oy` (*number|nil*) : y du pivot (défaut 0).
- **renvoie** : table|nil Plan de décalques en coordonnées monde, ou nil s'il est vide.

#### `editor_toolUtilities_siteDecals.remove(objs)`

Retire des décalques posés (editor.deleteDecalInstance).

- `objs` (*table|nil*) : Instances renvoyées par build.

#### `editor_toolUtilities_siteDecals.template(name, spec)`

Récupère ou crée le DecalData d'un groupe de décalques, nommé d'après le site qui le dresse. Champs posés : material, frame, texRows, texCols, size, renderPriority (défaut 5).

- `name` (*string*) : Nom d'objet du modèle.
- `spec` (*table*) : { mat, frame, rows, cols, size, prio }.
- **renvoie** : userdata|nil Objet DecalData, ou nil si la création échoue.

## Appels vers le moteur (C++)

- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteDecals.lua`.*
