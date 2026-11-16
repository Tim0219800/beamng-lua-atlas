# `ui_liveries_decal`

*Fichier : `lua/ge/extensions/ui/liveries/decal.lua` · VM : Game Engine (GE) · 1121 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_liveries_decal` : `extensions.load("ui_liveries_decal")`, puis la globale `ui_liveries_decal`

Logique côté Lua de l'écran des décalques de l'éditeur de livrées. Il enveloppe editor_api_dynamicDecals : pile de couches (liste, sélection, surbrillance, visibilité, duplication, suppression, réordonnancement), peinture et miroir d'un décalque, et mode de transformation (échelle, inclinaison, rotation, projection, placement à la souris) pour un nouveau décalque ou pour un décalque existant. Il envoie son état à l'interface par guihooks (évènements liveries_decal_layersUpdated, liveries_decal_selectionChanged, liveries_decal_transformUpdated). Les hooks de route de routeLifecycleCallbacks l'appellent.

## Exemple

```lua
ui_liveries_decal.setup()
ui_liveries_decal.select(layerUid)
ui_liveries_decal.setPaint(layerUid, {color = {1, 0, 0, 1}, metallic = 0.5, roughness = 0.3})
```

## Remarques

- Le module n'est actif qu'entre setup et teardown (isActive) ; getPaint, setPaint, getLayerMirror et setLayerMirror refusent (avertissement + nil ou false) s'il n'est pas actif.
- La pile affichée contient seulement les couches de type decal, linkedSet et group ; la couche la plus récente est placée en premier dans l'arbre envoyé à l'interface.
- Le premier élément racine de la pile est la couche de remplissage : un décalque ne peut pas être déplacé sous elle (FIRST_MOVABLE_ROOT_INDEX = 2). Seuls les décalques racine peuvent être réordonnés.
- Vitesses de la transformation par seconde à pleine déviation : échelle 0,5 ; inclinaison 2 (bornée à ±2) ; rotation π rad (valeur wrappée sur [0, 2π[). L'échelle minimale est 0,01. L'option « petits incréments » multiplie ces vitesses par 0,1 ; « lock ratio » applique la somme des deltas horizontal et vertical aux deux axes.
- Dans les snapshots envoyés à l'interface, l'échelle x correspond à scale.x et y à scale.z de l'API ; la rotation est en degrés (1 décimale), les nombres sont des chaînes formatées.
- Un décalque existant ne peut être retransformé que si son curseur UV (cursorPosScreenUv) est centré à 0,01 près autour de (0,5 ; 0,5), sinon beginExistingTransform refuse et renvoie false.
- L'alpha de la couleur du décalque sert aussi d'opacité ; le curseur de transformation est affiché avec alpha 1 et masqué avec alpha 0.
- La table d'actions « LiveriesDecalTransform » est poussée pendant la transformation, et retirée à la sortie ou quand on ouvre les réglages (suspendTransformActionMap).
- Les fonctions dynamicDecals_* sont des hooks appelés par editor_api_dynamicDecals ; il ne faut pas les appeler soi-même.
- api est capturé une seule fois au chargement du fichier (local api = extensions.editor_api_dynamicDecals) ; si l'extension n'était pas encore chargée à ce moment, api reste nil et la plupart des fonctions ne font rien.

**Dépendances (chargées avant) :** `editor_api_dynamicDecals`, `ui_liveries`, `ui_liveries_camera`, `ui_liveries_paint`, `ui_liveries_textures`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_liveries_decal.beginExistingTransform(layerUid)` | Ouvre une session de retransformation d'un décalque existant : mémorise une copie de la couche, son état de surbrillance et un indicateur applied. Remplace toute session précédente. Refuse si la couche est introuvable, n'est pas un décalque ou n'est pas centrée. | 710 |
| `ui_liveries_decal.commitTransform()` | Valide la transformation en cours. Sans session de retransformation, place un nouveau décalque (placeSelectedDecal) ; sinon appelle api.replaceDecalTransformFromCurrentProjection, marque la session comme appliquée et navigue vers « liveries.edit.decals ». | 874 |
| `ui_liveries_decal.deleteLayer(layerUid)` | Supprime une couche via api.removeLayer. | 371 |
| `ui_liveries_decal.duplicateLayer(layerUid)` | Duplique une couche via api.duplicateLayer à partir de son index et de son parent. | 362 |
| `ui_liveries_decal.dynamicDecals_moveLayer()` | Hook appelé par editor_api_dynamicDecals quand une couche est déplacée ; même traitement que dynamicDecals_onLayerAdded. *(interne)* | 1109 |
| `ui_liveries_decal.dynamicDecals_onLayerAdded()` | Hook appelé par editor_api_dynamicDecals quand une couche est ajoutée. Reconstruit la liste (en marquant la nouvelle couche comme focus) et notifie l'interface. À ne pas appeler soi-même. *(interne)* | 1109 |
| `ui_liveries_decal.dynamicDecals_onLayerDeleted()` | Hook appelé par editor_api_dynamicDecals quand une couche est supprimée ; même traitement que dynamicDecals_onLayerAdded. *(interne)* | 1109 |
| `ui_liveries_decal.dynamicDecals_onLayerUpdated()` | Hook appelé par editor_api_dynamicDecals quand une couche est modifiée ; même traitement que dynamicDecals_onLayerAdded. *(interne)* | 1109 |
| `ui_liveries_decal.endExistingTransform()` | Ferme la session de retransformation : cache le curseur et, si rien n'a été appliqué, rétablit la visibilité d'origine de la couche et sa surbrillance, puis rafraîchit la liste. | 806 |
| `ui_liveries_decal.getLayerMirror(layerUid)` | Renvoie les indicateurs de miroir d'un décalque validé ; le décalage du plan de miroir (mirrorOffset) est global à l'éditeur, pas par couche. | 514 |
| `ui_liveries_decal.getLockRatio()` | Indique si le verrouillage du ratio est actif pour l'échelle et l'inclinaison. | 970 |
| `ui_liveries_decal.getMirrorSnapshot()` | Renvoie les réglages de miroir courants de l'API : mirrored, flipMirroredDecal, mirrorOffset. | 947 |
| `ui_liveries_decal.getPaint(layerUid)` | Renvoie la peinture d'une couche (ui_liveries_paint.getLayerPaint). Module actif requis. | 478 |
| `ui_liveries_decal.getSmallIncrements()` | Indique si le mode « petits incréments » est actif (vitesses multipliées par 0,1, aussi pour la caméra libre). | 952 |
| `ui_liveries_decal.getTransformPaint()` | Renvoie la peinture du décalque en cours de transformation : couleur, métallisation et rugosité courantes de l'API, présets du véhicule, et layerUid de la couche en édition (ou « transform-preview » pour un nouveau décalque). | 553 |
| `ui_liveries_decal.getTransformSnapshot()` | Renvoie l'état de transformation envoyé à l'interface : scale {x, y}, skew {x, y}, rotation (degrés), projection (clé de libellé), smallIncrements, lockRatio. Les nombres sont des chaînes. | 942 |
| `ui_liveries_decal.hideSelectedCursor()` | Termine le mode transformation : retire la table d'actions, remet les entrées à zéro, arrête la transformation de caméra, rend le décalque transparent (alpha 0), coupe la projection et restaure le réglage de souris si besoin. | 661 |
| `ui_liveries_decal.isUseMousePos()` | Indique si le placement du décalque à la souris est actif (api.isUseMousePos). | 988 |
| `ui_liveries_decal.notifyUi()` | Renvoie à l'interface la liste des couches et la sélection courante. | 286 |
| `ui_liveries_decal.onUpdate(dtReal)` | Hook appelé à chaque image avec dtReal (secondes réelles). Tant que la table d'actions de transformation est active, applique les entrées d'échelle, d'inclinaison et de rotation au décalque et notifie l'interface en cas de changement. *(interne)* *(hook)* | 1051 |
| `ui_liveries_decal.placeSelectedDecal()` | Valide un nouveau décalque avec api.addDecal à partir de la texture sélectionnée, le déplace éventuellement au-dessus de la cible de startAddDecal, vide la sélection de texture et navigue vers « liveries.edit.decals ». Renvoie nil avec avertissement si aucune texture n'est sélectionnée. | 829 |
| `ui_liveries_decal.reorderLayers(orderedUids)` | Applique un nouvel ordre de couches racine, à condition qu'il corresponde au déplacement d'un seul décalque. Retrouve la couche déplacée, calcule l'index cible en tenant compte de la couche de remplissage et appelle api.moveLayer ; le rafraîchissement revient par le hook dynamicDecals_moveLayer. | 414 |
| `ui_liveries_decal.resumeTransformActionMap()` | Repousse la table d'actions de transformation si elle n'est pas active. | 697 |
| `ui_liveries_decal.select(layerUid)` | Sélectionne une couche (et la met en surbrillance), ou désélectionne si layerUid est nil. Notifie l'interface du changement. | 291 |
| `ui_liveries_decal.setFlipMirroredDecal(value)` | Inverse ou non le décalque miroir (api.setFlipMirroredDecal). | 1027 |
| `ui_liveries_decal.setLayerMirror(layerUid, mirror)` | Met à jour mirrored et flipMirroredDecal d'une couche, sur une copie passée à setLayer pour ne pas toucher à l'historique de l'API. | 532 |
| `ui_liveries_decal.setLockRatio(value)` | Active ou coupe le verrouillage du ratio et notifie l'interface si la valeur change. | 974 |
| `ui_liveries_decal.setMirrorOffset(value)` | Règle le décalage du plan de miroir, borné entre -1 et 1 (api.setMirrorOffset). | 1039 |
| `ui_liveries_decal.setMirrored(value)` | Active ou coupe le miroir du décalque en cours de pose (api.setMirrored). | 1015 |
| `ui_liveries_decal.setPaint(layerUid, paint)` | Applique une peinture à une couche (ui_liveries_paint.setLayerPaint). Module actif requis. | 487 |
| `ui_liveries_decal.setRotateLeft(value)` | Définit l'entrée de rotation vers la gauche (gâchette) ; la rotation appliquée est droite moins gauche. | 911 |
| `ui_liveries_decal.setRotateRight(value)` | Définit l'entrée de rotation vers la droite (gâchette). | 915 |
| `ui_liveries_decal.setScaleHorizontal(value)` | Définit l'entrée d'axe d'échelle horizontale (appliquée dans onUpdate). | 895 |
| `ui_liveries_decal.setScaleVertical(value)` | Définit l'entrée d'axe d'échelle verticale (appliquée dans onUpdate). | 899 |
| `ui_liveries_decal.setSkewHorizontal(value)` | Définit l'entrée d'axe d'inclinaison horizontale (appliquée dans onUpdate). | 903 |
| `ui_liveries_decal.setSkewVertical(value)` | Définit l'entrée d'axe d'inclinaison verticale (appliquée dans onUpdate). | 907 |
| `ui_liveries_decal.setSmallIncrements(value)` | Active ou coupe les petits incréments et notifie l'interface si la valeur change. | 956 |
| `ui_liveries_decal.setTransformPaint(paint)` | Applique color (RGBA normalisé, l'alpha sert d'opacité), metallic et roughness au décalque en cours de transformation, puis appelle api.onUpdate_. | 565 |
| `ui_liveries_decal.setUseMousePos(value)` | Active ou coupe le placement à la souris (bascule le réglage UseMousePos de l'API si nécessaire). Pendant une transformation, l'activer force la caméra en mode orbite. | 993 |
| `ui_liveries_decal.setUseSurfaceNormal(value)` | Choisit la projection selon la normale de surface (true) ou selon la caméra (false) et notifie l'interface si la valeur change. | 919 |
| `ui_liveries_decal.setup()` | Active le module : efface la sélection, la cible d'ajout et la surbrillance, puis reconstruit la liste des couches. | 259 |
| `ui_liveries_decal.showExistingCursor()` | Affiche le curseur du décalque existant : masque la couche d'origine, copie sa texture, couleur, échelle, inclinaison, rotation, projection et miroir dans l'API, projette le décalque, pousse la table d'actions et démarre ui_liveries_camera.startTransformAtLayer. Avertit s'il n'y a pas de session. | 751 |
| `ui_liveries_decal.showSelectedCursor()` | Prépare la pose d'un nouveau décalque : utilise la texture sélectionnée comme texture couleur, projette le décalque, remet transformation et miroir par défaut, pousse la table d'actions de transformation et démarre ui_liveries_camera.startTransform. Si une manette est utilisée, désactive le placement à la souris. Avertit si aucune texture n'est sélectionnée. | 617 |
| `ui_liveries_decal.startAddDecal(targetLayerUid)` | Prépare l'ajout d'un décalque au-dessus d'un décalque existant (ou en haut de pile si l'uid n'est pas un décalque) puis navigue vers la route « liveries.edit.decals.camera ». | 823 |
| `ui_liveries_decal.suspendTransformActionMap()` | Retire la table d'actions de transformation et remet les entrées à zéro (utilisé quand on ouvre les réglages). | 684 |
| `ui_liveries_decal.teardown()` | Désactive le module : termine la transformation d'un décalque existant, cache le curseur, vide la sélection, la texture sélectionnée (ui_liveries_textures.clearSelectedItem) et la liste des couches, et coupe la surbrillance. | 271 |
| `ui_liveries_decal.toggleLayerHighlight(layerUid)` | Met en surbrillance la couche si elle ne l'est pas déjà (seulement si elle est activée), sinon coupe la surbrillance. Rafraîchit la liste. | 348 |
| `ui_liveries_decal.toggleLayerVisibility(layerUid)` | Active ou désactive l'affichage d'une couche (champ enabled), sur une copie de la couche passée à setLayer, puis rafraîchit la liste. | 333 |
| `ui_liveries_decal.toggleProjectionMode()` | Inverse le mode de projection (surface ou caméra). Sans effet hors transformation. | 935 |

### Détail des paramètres

#### `ui_liveries_decal.beginExistingTransform(layerUid)`

Ouvre une session de retransformation d'un décalque existant : mémorise une copie de la couche, son état de surbrillance et un indicateur applied. Remplace toute session précédente. Refuse si la couche est introuvable, n'est pas un décalque ou n'est pas centrée.

- `layerUid` (*string*) : Uid du décalque.
- **renvoie** : boolean true si la session est ouverte.

#### `ui_liveries_decal.commitTransform()`

Valide la transformation en cours. Sans session de retransformation, place un nouveau décalque (placeSelectedDecal) ; sinon appelle api.replaceDecalTransformFromCurrentProjection, marque la session comme appliquée et navigue vers « liveries.edit.decals ».

- **renvoie** : string|boolean|nil Uid du nouveau décalque, ou true/false pour une retransformation.

#### `ui_liveries_decal.deleteLayer(layerUid)`

Supprime une couche via api.removeLayer.

- `layerUid` (*string*) : Uid de la couche.

#### `ui_liveries_decal.duplicateLayer(layerUid)`

Duplique une couche via api.duplicateLayer à partir de son index et de son parent.

- `layerUid` (*string*) : Uid de la couche.

#### `ui_liveries_decal.getLayerMirror(layerUid)`

Renvoie les indicateurs de miroir d'un décalque validé ; le décalage du plan de miroir (mirrorOffset) est global à l'éditeur, pas par couche.

- `layerUid` (*string*) : Uid de la couche.
- **renvoie** : table|nil Table layerUid, mirrored, flipMirroredDecal, mirrorOffset.

#### `ui_liveries_decal.getLockRatio()`

Indique si le verrouillage du ratio est actif pour l'échelle et l'inclinaison.

- **renvoie** : boolean État du verrou.

#### `ui_liveries_decal.getMirrorSnapshot()`

Renvoie les réglages de miroir courants de l'API : mirrored, flipMirroredDecal, mirrorOffset.

- **renvoie** : table|nil nil si l'API est absente.

#### `ui_liveries_decal.getPaint(layerUid)`

Renvoie la peinture d'une couche (ui_liveries_paint.getLayerPaint). Module actif requis.

- `layerUid` (*string*) : Uid de la couche.
- **renvoie** : table|nil Table layerUid, color, metallic, roughness, presets.

#### `ui_liveries_decal.getSmallIncrements()`

Indique si le mode « petits incréments » est actif (vitesses multipliées par 0,1, aussi pour la caméra libre).

- **renvoie** : boolean État du mode.

#### `ui_liveries_decal.getTransformPaint()`

Renvoie la peinture du décalque en cours de transformation : couleur, métallisation et rugosité courantes de l'API, présets du véhicule, et layerUid de la couche en édition (ou « transform-preview » pour un nouveau décalque).

- **renvoie** : table|nil Table de peinture, nil si l'API est absente.

#### `ui_liveries_decal.getTransformSnapshot()`

Renvoie l'état de transformation envoyé à l'interface : scale {x, y}, skew {x, y}, rotation (degrés), projection (clé de libellé), smallIncrements, lockRatio. Les nombres sont des chaînes.

- **renvoie** : table|nil nil si l'API est absente.

#### `ui_liveries_decal.isUseMousePos()`

Indique si le placement du décalque à la souris est actif (api.isUseMousePos).

- **renvoie** : boolean false aussi si l'API est absente.

#### `ui_liveries_decal.onUpdate(dtReal)`

Hook appelé à chaque image avec dtReal (secondes réelles). Tant que la table d'actions de transformation est active, applique les entrées d'échelle, d'inclinaison et de rotation au décalque et notifie l'interface en cas de changement.

- `dtReal` (*number*) : Durée réelle de l'image en secondes.

#### `ui_liveries_decal.placeSelectedDecal()`

Valide un nouveau décalque avec api.addDecal à partir de la texture sélectionnée, le déplace éventuellement au-dessus de la cible de startAddDecal, vide la sélection de texture et navigue vers « liveries.edit.decals ». Renvoie nil avec avertissement si aucune texture n'est sélectionnée.

- **renvoie** : string|nil Uid de la nouvelle couche.

#### `ui_liveries_decal.reorderLayers(orderedUids)`

Applique un nouvel ordre de couches racine, à condition qu'il corresponde au déplacement d'un seul décalque. Retrouve la couche déplacée, calcule l'index cible en tenant compte de la couche de remplissage et appelle api.moveLayer ; le rafraîchissement revient par le hook dynamicDecals_moveLayer.

- `orderedUids` (*string[]*) : Uids des couches racine dans l'ordre affiché (premier = dessus).
- **renvoie** : boolean false avec avertissement si l'ordre est invalide, la couche n'est pas un décalque racine ou aucun voisin d'ancrage n'existe.

#### `ui_liveries_decal.select(layerUid)`

Sélectionne une couche (et la met en surbrillance), ou désélectionne si layerUid est nil. Notifie l'interface du changement.

- `layerUid` (*string|nil*) : Uid de la couche, ou nil pour désélectionner.
- **renvoie** : boolean false si l'API est absente ou la couche introuvable, sinon true.

#### `ui_liveries_decal.setFlipMirroredDecal(value)`

Inverse ou non le décalque miroir (api.setFlipMirroredDecal).

- `value` (*boolean*) : Nouvel état.
- **renvoie** : boolean false si value n'est pas un booléen.

#### `ui_liveries_decal.setLayerMirror(layerUid, mirror)`

Met à jour mirrored et flipMirroredDecal d'une couche, sur une copie passée à setLayer pour ne pas toucher à l'historique de l'API.

- `layerUid` (*string*) : Uid de la couche.
- `mirror` (*table*) : Table avec mirrored et flipMirroredDecal (booléens ; tout ce qui n'est pas true vaut false).
- **renvoie** : boolean true si la mise à jour a été faite.

#### `ui_liveries_decal.setLockRatio(value)`

Active ou coupe le verrouillage du ratio et notifie l'interface si la valeur change.

- `value` (*boolean*) : Nouvel état.
- **renvoie** : boolean false si value n'est pas un booléen.

#### `ui_liveries_decal.setMirrorOffset(value)`

Règle le décalage du plan de miroir, borné entre -1 et 1 (api.setMirrorOffset).

- `value` (*number*) : Décalage.
- **renvoie** : boolean false si value n'est pas un nombre.

#### `ui_liveries_decal.setMirrored(value)`

Active ou coupe le miroir du décalque en cours de pose (api.setMirrored).

- `value` (*boolean*) : Nouvel état.
- **renvoie** : boolean false si value n'est pas un booléen.

#### `ui_liveries_decal.setPaint(layerUid, paint)`

Applique une peinture à une couche (ui_liveries_paint.setLayerPaint). Module actif requis.

- `layerUid` (*string*) : Uid de la couche.
- `paint` (*table*) : color {r, g, b, a}, metallic, roughness, normalisés entre 0 et 1.
- **renvoie** : boolean true si la mise à jour a été faite.

#### `ui_liveries_decal.setRotateLeft(value)`

Définit l'entrée de rotation vers la gauche (gâchette) ; la rotation appliquée est droite moins gauche.

- `value` (*number|nil*) : Valeur d'axe, nil vaut 0.

#### `ui_liveries_decal.setRotateRight(value)`

Définit l'entrée de rotation vers la droite (gâchette).

- `value` (*number|nil*) : Valeur d'axe, nil vaut 0.

#### `ui_liveries_decal.setScaleHorizontal(value)`

Définit l'entrée d'axe d'échelle horizontale (appliquée dans onUpdate).

- `value` (*number|nil*) : Valeur d'axe, nil vaut 0.

#### `ui_liveries_decal.setScaleVertical(value)`

Définit l'entrée d'axe d'échelle verticale (appliquée dans onUpdate).

- `value` (*number|nil*) : Valeur d'axe, nil vaut 0.

#### `ui_liveries_decal.setSkewHorizontal(value)`

Définit l'entrée d'axe d'inclinaison horizontale (appliquée dans onUpdate).

- `value` (*number|nil*) : Valeur d'axe, nil vaut 0.

#### `ui_liveries_decal.setSkewVertical(value)`

Définit l'entrée d'axe d'inclinaison verticale (appliquée dans onUpdate).

- `value` (*number|nil*) : Valeur d'axe, nil vaut 0.

#### `ui_liveries_decal.setSmallIncrements(value)`

Active ou coupe les petits incréments et notifie l'interface si la valeur change.

- `value` (*boolean*) : Nouvel état.
- **renvoie** : boolean false si value n'est pas un booléen.

#### `ui_liveries_decal.setTransformPaint(paint)`

Applique color (RGBA normalisé, l'alpha sert d'opacité), metallic et roughness au décalque en cours de transformation, puis appelle api.onUpdate_.

- `paint` (*table*) : color {r, g, b, a}, metallic, roughness (facultatifs, 0 à 1).
- **renvoie** : boolean false si l'API est absente ou si paint n'est pas une table.

#### `ui_liveries_decal.setUseMousePos(value)`

Active ou coupe le placement à la souris (bascule le réglage UseMousePos de l'API si nécessaire). Pendant une transformation, l'activer force la caméra en mode orbite.

- `value` (*boolean*) : Nouvel état.
- **renvoie** : boolean false si value n'est pas un booléen ou si l'API est absente.

#### `ui_liveries_decal.setUseSurfaceNormal(value)`

Choisit la projection selon la normale de surface (true) ou selon la caméra (false) et notifie l'interface si la valeur change.

- `value` (*boolean*) : Mode de projection.
- **renvoie** : boolean false si value n'est pas un booléen ou si l'API est absente.

#### `ui_liveries_decal.startAddDecal(targetLayerUid)`

Prépare l'ajout d'un décalque au-dessus d'un décalque existant (ou en haut de pile si l'uid n'est pas un décalque) puis navigue vers la route « liveries.edit.decals.camera ».

- `targetLayerUid` (*string|nil*) : Uid du décalque au-dessus duquel insérer.

#### `ui_liveries_decal.toggleLayerHighlight(layerUid)`

Met en surbrillance la couche si elle ne l'est pas déjà (seulement si elle est activée), sinon coupe la surbrillance. Rafraîchit la liste.

- `layerUid` (*string*) : Uid de la couche.

#### `ui_liveries_decal.toggleLayerVisibility(layerUid)`

Active ou désactive l'affichage d'une couche (champ enabled), sur une copie de la couche passée à setLayer, puis rafraîchit la liste.

- `layerUid` (*string*) : Uid de la couche.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant celle-ci : editor_api_dynamicDecals, ui_liveries, ui_liveries_camera, ui_liveries_paint, ui_liveries_textures. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/liveries/decal.lua`.*
