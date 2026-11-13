# `core_audioForest_audioForestCommon`

*Fichier : `lua/ge/extensions/core/audioForest/audioForestCommon.lua` · VM : Game Engine (GE) · 428 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_audioForest_audioForestCommon` : `extensions.load("core_audioForest_audioForestCommon")`, puis la globale `core_audioForest_audioForestCommon`

Code partagé entre l'exécution (audioForest.lua) et l'éditeur : transforme les objets d'une Forest en un nuage de noeuds audio éclaircis. Se charge avec require('core/audioForest/audioForestCommon'). L'algorithme : (1) pré-passe qui lit les items de la forêt (par blocs) et calcule volume et hauteur par modèle (shape) ; (2) classement S/M/L par volume normalisé (percentile 95) avec surcharge possible ; (3) éclaircissement glouton : on garde un item et on absorbe tous ses voisins à moins de minNodeSpacing (20 m) ; (4) construction d'un KD-tree 3D des noeuds.

## Exemple

```lua
local c = require('core/audioForest/audioForestCommon')
local cloud = c.buildNodeCloudFromForest(forestObj, toolState, nil, {})
-- cloud.nodeCount, cloud.kdNodes ...
```

## Remarques

- Config par défaut (defaultCfg) : minNodeSpacing 20 m, thinningOuterRadiusMul 1.5, nodeHeightBlend 0.5, classT0 1/3, classT1 2/3, volumeClassPercentile 0.95, pitchNormPercentile 0.95.
- Classes : 1 = petit (valeur audio 0.0), 2 = moyen (0.5), 3 = grand (1.0).
- Le volume d'un item est le volume de sa boîte englobante multiplié par son échelle.
- Seules ces fonctions sont exportées ; le reste (file de priorité de l'éclaircissement, emptyCloud, etc.) est local.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_audioForest_audioForestCommon.buildNodeCloudFromForest(forestObj, st, cfg, opts)` | Construit le nuage de noeuds audio. Termine la pré-passe si besoin, classe les modèles, éclaircit les items et construit un KD-tree (kdtreepoint3d). Renvoie un nuage vide (nodeCount 0) s'il n'y a aucun item inclus. | 231 |
| `core_audioForest_audioForestCommon.computeDefaultClassFromNormVol(normVol, classT0, classT1)` | Convertit un volume normalisé [0..1] en classe de taille : 1 sous t0, 2 sous t1, sinon 3. | 137 |
| `core_audioForest_audioForestCommon.getItemVolume(item)` | Volume (m³) de la boîte englobante d'un item de forêt, multiplié par son échelle. Renvoie 0 sans boîte. | 113 |
| `core_audioForest_audioForestCommon.startRuntimePrepass(forestObj, st)` | Prépare l'état d'une pré-passe incrémentale : récupère tous les items de la forêt (forestObj:getData():getItems()). | 170 |
| `core_audioForest_audioForestCommon.stepRuntimePrepass(p, maxSteps)` | Traite jusqu'à maxSteps items de la pré-passe : retient les items inclus et mesure le volume et la hauteur max une fois par modèle. Passe isReady à true quand tous les items ont été vus. | 190 |

### Détail des paramètres

#### `core_audioForest_audioForestCommon.buildNodeCloudFromForest(forestObj, st, cfg, opts)`

Construit le nuage de noeuds audio. Termine la pré-passe si besoin, classe les modèles, éclaircit les items et construit un KD-tree (kdtreepoint3d). Renvoie un nuage vide (nodeCount 0) s'il n'y a aucun item inclus.

- `forestObj` (*userdata*) : Objet Forest
- `st` (*table|nil*) : État d'outil : classSelByShape, classOverrideByShape, includeByShape
- `cfg` (*table|nil*) : Configuration (clés de defaultCfg, ainsi que pitchDensityPercentile)
- `opts` (*table|nil*) : Options : prepass (pré-passe déjà faite), shapeToRow + includeEditorFields (ajoute nodeTypeRow et nodeClassId pour l'éditeur)
- **renvoie** : table {minNodeSpacing, nodeCount, nodeX, nodeY, nodeZ, nodeDepth, nodeAvgNormVol, nodeSourceCount, pitchDensityInv, nodeTypeRow, nodeClassId, kdNodes}

#### `core_audioForest_audioForestCommon.computeDefaultClassFromNormVol(normVol, classT0, classT1)`

Convertit un volume normalisé [0..1] en classe de taille : 1 sous t0, 2 sous t1, sinon 3.

- `normVol` (*number*) : Volume normalisé
- `classT0` (*number|nil*) : Seuil 1/2, 1/3 par défaut
- `classT1` (*number|nil*) : Seuil 2/3, 2/3 par défaut (échangé avec t0 si t0 > t1)
- **renvoie** : integer 1, 2 ou 3

#### `core_audioForest_audioForestCommon.getItemVolume(item)`

Volume (m³) de la boîte englobante d'un item de forêt, multiplié par son échelle. Renvoie 0 sans boîte.

- `item` (*userdata|nil*) : Item de forêt (getObjBox, getScale)
- **renvoie** : number Volume

#### `core_audioForest_audioForestCommon.startRuntimePrepass(forestObj, st)`

Prépare l'état d'une pré-passe incrémentale : récupère tous les items de la forêt (forestObj:getData():getItems()).

- `forestObj` (*userdata*) : Objet Forest
- `st` (*table|nil*) : État d'outil ; utilise includeByShape (un modèle absent ou true est inclus, false est exclu)
- **renvoie** : table État de pré-passe {all, allCount, i, includeByShape, shapeVol, shapeMaxZ, includedItem, includedShape, volList, volN, itemCount, isReady}

#### `core_audioForest_audioForestCommon.stepRuntimePrepass(p, maxSteps)`

Traite jusqu'à maxSteps items de la pré-passe : retient les items inclus et mesure le volume et la hauteur max une fois par modèle. Passe isReady à true quand tous les items ont été vus.

- `p` (*table*) : État renvoyé par startRuntimePrepass
- `maxSteps` (*integer|nil*) : Nombre maximal d'items par appel, 10000 par défaut
- **renvoie** : boolean true quand la pré-passe est terminée

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/audioForest/audioForestCommon.lua`.*
