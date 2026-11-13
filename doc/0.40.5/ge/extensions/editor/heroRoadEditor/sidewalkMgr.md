# `editor_heroRoadEditor_sidewalkMgr`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua` · VM : Game Engine (GE) · 131 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_sidewalkMgr` : `extensions.load("editor_heroRoadEditor_sidewalkMgr")`, puis la globale `editor_heroRoadEditor_sidewalkMgr`

Trottoirs/bordures procéduraux d'un groupe du Hero Road Editor. Fine couche au-dessus du balayage partagé toolUtilities/walkRibbon : lit les bords réels inclinés du maillage (meshEdgeL/R, meshEdgeDirL/R) et balaie bordure + dallage le long de chaque côté activé (group.sidewalkLeft / sidewalkRight). Pendant l'édition c'est un ProceduralMesh transitoire 'HeroWalk_<id>' ; le bake l'écrit en .dae et pose un TSStatic persistant à sa place.

## Remarques

- Les deux côtés sont fusionnés dans UN seul maillage (deux draws au total).
- La hauteur Z du trottoir est celle du bord de chaussée (p.z), pas p.z + d.z*décalage, pour qu'il reste à niveau malgré le dévers.
- Le décalage depuis le bord est group.sidewalkOffsetM (>= 0, défaut 0) ; la largeur vient de walkRibbon.width(). Les passages piétons (group.crossings) abaissent la bordure à fleur via walkRibbon.crossingDips.
- Le maillage est collidable (meshPart.emitObject avec collision) mais non sauvegardé (canSave=false) tant que la route est en édition.
- Le trottoir cuit n'a qu'un niveau de détail (NEAR_PX = 400) ; collisionType 'Collision Mesh', decalType 'Visible Mesh Final'.
- Les enregistrements runtime (maillage, parts) sont gardés dans le module, indexés par group.id, et jamais sur le groupe.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_sidewalkMgr.burnGroup(group, dir)` | Bake : écrit le trottoir en <dir>/HeroWalk_<id>.dae (centré sur son propre centre) et pose un TSStatic persistant (canSave=true) à sa place, après avoir supprimé le maillage procédural qui porte le même nom. En cas d'échec d'écriture, logue une erreur ('heroSidewalk') et le trottoir disparaît de ce bake. | 95 |
| `editor_heroRoadEditor_sidewalkMgr.removeGroup(group)` | Supprime le maillage de trottoir du groupe et l'oublie. | 61 |
| `editor_heroRoadEditor_sidewalkMgr.tris(group)` | Nombre de triangles du trottoir du groupe, pour le décompte de l'outil. | 87 |
| `editor_heroRoadEditor_sidewalkMgr.updateGroup(group)` | (Re)construit les trottoirs du groupe d'après le bord de maillage actuel et les bascules sidewalkLeft/sidewalkRight. Appelé juste après la reconstruction du maillage. Ne fait rien sans dossier de scène (sceneTreeFolderId) ; ne crée rien si aucun triangle n'est produit. | 70 |

### Détail des paramètres

#### `editor_heroRoadEditor_sidewalkMgr.burnGroup(group, dir)`

Bake : écrit le trottoir en <dir>/HeroWalk_<id>.dae (centré sur son propre centre) et pose un TSStatic persistant (canSave=true) à sa place, après avoir supprimé le maillage procédural qui porte le même nom. En cas d'échec d'écriture, logue une erreur ('heroSidewalk') et le trottoir disparaît de ce bake.

- `group` (*table*) : Groupe Hero Road.
- `dir` (*string*) : Dossier de bake (créé s'il n'existe pas), avec slash final.
- **renvoie** : string[] Manifeste des noms d'objets de scène créés (vide si rien à cuire) ; sert à retirer le statique au unbake.

#### `editor_heroRoadEditor_sidewalkMgr.removeGroup(group)`

Supprime le maillage de trottoir du groupe et l'oublie.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_sidewalkMgr.tris(group)`

Nombre de triangles du trottoir du groupe, pour le décompte de l'outil.

- `group` (*table|nil*) : Groupe Hero Road.
- **renvoie** : integer Nombre de triangles, 0 si aucun trottoir.

#### `editor_heroRoadEditor_sidewalkMgr.updateGroup(group)`

(Re)construit les trottoirs du groupe d'après le bord de maillage actuel et les bascules sidewalkLeft/sidewalkRight. Appelé juste après la reconstruction du maillage. Ne fait rien sans dossier de scène (sceneTreeFolderId) ; ne crée rien si aucun triangle n'est produit.

- `group` (*table*) : Groupe Hero Road.

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua`.*
