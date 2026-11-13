# `editor_masterSpline_layerMgr`

*Fichier : `lua/ge/extensions/editor/masterSpline/layerMgr.lua` · VM : Game Engine (GE) · 251 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_masterSpline_layerMgr` : `extensions.load("editor_masterSpline_layerMgr")`, puis la globale `editor_masterSpline_layerMgr`

Gestionnaire des couches (layers) d'une Master Spline. Une couche relie la Master Spline à une spline enfant d'un autre outil (mesh, assembly, decal, road, tree) et lui envoie une copie décalée latéralement de la géométrie discrétisée, simplifiée par RDP (tolérance 0.25). Ce module crée, met à jour, supprime, copie et (dé)sérialise les couches.

## Remarques

- Une couche contient : name, id (UUID), isDirty, isLink, linkType, linkedSplineId, linkedSplineName, isFlip, isTrackWidth, position (décalage latéral, multiplié par la demi-largeur locale).
- Si la Master Spline a moins de 2 nœuds, la spline liée reçoit des tableaux vides afin que ses objets soient nettoyés.
- Si isFlip est vrai, la géométrie simplifiée est envoyée en ordre inverse.
- addNewLayer ne fixe pas isTrackWidth (nil, donc faux) ; deserializeLayer le force en booléen.
- Valeurs par défaut des sliders (getSliderDefaults) : defaultPaintMargin 0, defaultLateralPosition 0, defaultDOI 20, defaultTerraMargin 1, defaultTerraFalloff 3, defaultTerraRoughness 0, defaultTerraScale 0, defaultTerraSmooth 2, defaultBankStrength 0.5, defaultAutoBankFalloff 0.6.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_masterSpline_layerMgr.addNewLayer(spline)` | Ajoute une couche « New Layer N » (UUID généré, isDirty vrai, non liée, type de lien par défaut = mesh, position par défaut). | 189 |
| `editor_masterSpline_layerMgr.deepCopyAllLayers(layers)` | Copie profonde d'un tableau de couches. | 72 |
| `editor_masterSpline_layerMgr.deepCopyLayer(layer)` | Copie profonde d'une couche (via string.buffer encode/decode). | 69 |
| `editor_masterSpline_layerMgr.deserializeLayer(data)` | Reconstruit une couche à partir de données sérialisées ; isDirty est mis à true, un UUID est généré si id manque, valeurs par défaut sinon. | 219 |
| `editor_masterSpline_layerMgr.getSliderDefaults()` | Renvoie la table des valeurs par défaut des curseurs, pour l'interface de l'outil. | 66 |
| `editor_masterSpline_layerMgr.removeAllLayers(masterSpline)` | Supprime toutes les couches et leurs splines liées. | 177 |
| `editor_masterSpline_layerMgr.removeLayer(idx, masterSpline)` | Supprime la couche d'indice idx ; si elle a une spline liée, celle-ci est supprimée dans son outil. | 167 |
| `editor_masterSpline_layerMgr.serializeLayer(layer)` | Convertit une couche en table simple (name, id, isLink, linkType, linkedSplineId, linkedSplineName, isFlip, isTrackWidth, position), sans les tampons internes. | 204 |
| `editor_masterSpline_layerMgr.updateAllLayers(masterSpline)` | Envoie la géométrie de la Master Spline à la spline liée de chaque couche, dirty ou non, et remet isDirty à false. | 148 |
| `editor_masterSpline_layerMgr.updateOnlyDirtyLayers(masterSpline)` | Comme updateAllLayers mais seulement pour les couches avec isDirty vrai. | 155 |

### Détail des paramètres

#### `editor_masterSpline_layerMgr.addNewLayer(spline)`

Ajoute une couche « New Layer N » (UUID généré, isDirty vrai, non liée, type de lien par défaut = mesh, position par défaut).

- `spline` (*table*) : Master Spline qui reçoit la couche.

#### `editor_masterSpline_layerMgr.deepCopyAllLayers(layers)`

Copie profonde d'un tableau de couches.

- `layers` (*table*) : Tableau de couches.
- **renvoie** : table Copie indépendante.

#### `editor_masterSpline_layerMgr.deepCopyLayer(layer)`

Copie profonde d'une couche (via string.buffer encode/decode).

- `layer` (*table*) : Couche à copier.
- **renvoie** : table Copie indépendante.

#### `editor_masterSpline_layerMgr.deserializeLayer(data)`

Reconstruit une couche à partir de données sérialisées ; isDirty est mis à true, un UUID est généré si id manque, valeurs par défaut sinon.

- `data` (*table*) : Table produite par serializeLayer.
- **renvoie** : table Couche.

#### `editor_masterSpline_layerMgr.getSliderDefaults()`

Renvoie la table des valeurs par défaut des curseurs, pour l'interface de l'outil.

- **renvoie** : table<string, number> Valeurs par défaut (defaultDOI, defaultTerraMargin, defaultBankStrength…).

#### `editor_masterSpline_layerMgr.removeAllLayers(masterSpline)`

Supprime toutes les couches et leurs splines liées.

- `masterSpline` (*table*) : Master Spline.

#### `editor_masterSpline_layerMgr.removeLayer(idx, masterSpline)`

Supprime la couche d'indice idx ; si elle a une spline liée, celle-ci est supprimée dans son outil.

- `idx` (*integer*) : Indice de la couche (à partir de 1).
- `masterSpline` (*table*) : Master Spline propriétaire.

#### `editor_masterSpline_layerMgr.serializeLayer(layer)`

Convertit une couche en table simple (name, id, isLink, linkType, linkedSplineId, linkedSplineName, isFlip, isTrackWidth, position), sans les tampons internes.

- `layer` (*table*) : Couche.
- **renvoie** : table Données sérialisables.

#### `editor_masterSpline_layerMgr.updateAllLayers(masterSpline)`

Envoie la géométrie de la Master Spline à la spline liée de chaque couche, dirty ou non, et remet isDirty à false.

- `masterSpline` (*table*) : Master Spline (nodes, divPoints, divWidths, binormals, normals, layers, isLoop, isConformToTerrain).

#### `editor_masterSpline_layerMgr.updateOnlyDirtyLayers(masterSpline)`

Comme updateAllLayers mais seulement pour les couches avec isDirty vrai.

- `masterSpline` (*table*) : Master Spline.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/masterSpline/layerMgr.lua`.*
