# `editor_heroRoadEditor_barrierMgr`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua` · VM : Game Engine (GE) · 182 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_barrierMgr` : `extensions.load("editor_heroRoadEditor_barrierMgr")`, puis la globale `editor_heroRoadEditor_barrierMgr`

Gestionnaire du mobilier de bord de route (glissières, clôtures, lampadaires) d'un groupe du Hero Road Editor. Il lit les bords de maillage du groupe (meshEdgeL/R, meshEdgeDirL/R, meshEdgeUp) et pose des pièces via editor/toolUtilities/roadsideProps (pools transitoires identifiés par id..'bL', 'fL', 'lL'…). Il gère les rails de toute la route (onglet Furniture) et les segments de barrière placés (onglet Features, group.barriers).

## Remarques

- Décalage vertical (enfouissement) par type de barrière : guardrail -0.35 m, jersey 0.0, plastic -0.15 m ; s'ajoute au zOffsetM du segment.
- Valeurs par défaut du groupe : barrierOffsetM 0.5, fenceOffsetM 0.7, lampOffsetM 1.0 (mètres, décalage latéral vers l'extérieur depuis le bord).
- Les types valent 'none' si absents ; 'none' ne pose rien. Les lampadaires sont ancrés aux deux extrémités (lockEnds) avec espacement group.lampSpacingM.
- Une route cuite (baked) n'a plus de pièces dans les pools : counts renvoie alors 0.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_barrierMgr.burnGroup(group)` | « Burn » : rend persistantes (canSave=true) les pièces actuelles via props.commitPool et les détache des pools transitoires. Renvoie le manifeste des noms, que exportMgr stocke lors du bake. | 159 |
| `editor_heroRoadEditor_barrierMgr.counts(group)` | Nombre de pièces actuellement posées pour le groupe, par catégorie, côtés cumulés. Lit les pools transitoires (donc l'aperçu éditable). | 146 |
| `editor_heroRoadEditor_barrierMgr.removeGroup(group)` | Supprime tout le mobilier posé du groupe (démontage ou moins de 2 nœuds). | 131 |
| `editor_heroRoadEditor_barrierMgr.updateGroup(group)` | (Re)construit barrières, clôtures et lampadaires du groupe d'après les bords du maillage actuel et les sélections. Appelé après la reconstruction du maillage ; ne fait rien si le groupe n'a pas de dossier scenetree (sceneTreeFolderId). | 111 |

### Détail des paramètres

#### `editor_heroRoadEditor_barrierMgr.burnGroup(group)`

« Burn » : rend persistantes (canSave=true) les pièces actuelles via props.commitPool et les détache des pools transitoires. Renvoie le manifeste des noms, que exportMgr stocke lors du bake.

- `group` (*table*) : Groupe Hero Road.
- **renvoie** : table Tableau des identifiants/noms d'objets de scène créés (vide si le groupe est invalide).

#### `editor_heroRoadEditor_barrierMgr.counts(group)`

Nombre de pièces actuellement posées pour le groupe, par catégorie, côtés cumulés. Lit les pools transitoires (donc l'aperçu éditable).

- `group` (*table*) : Groupe Hero Road.
- **renvoie** : integer Nombre de barrières.
- **renvoie** : integer Nombre de clôtures.
- **renvoie** : integer Nombre de lampadaires.

#### `editor_heroRoadEditor_barrierMgr.removeGroup(group)`

Supprime tout le mobilier posé du groupe (démontage ou moins de 2 nœuds).

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_barrierMgr.updateGroup(group)`

(Re)construit barrières, clôtures et lampadaires du groupe d'après les bords du maillage actuel et les sélections. Appelé après la reconstruction du maillage ; ne fait rien si le groupe n'a pas de dossier scenetree (sceneTreeFolderId).

- `group` (*table*) : Groupe Hero Road (id, sceneTreeFolderId, meshEdgeL/R, barrierLeftType, fenceLeftType, lampLeftType, barriers…).

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua`.*
