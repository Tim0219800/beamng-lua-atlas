---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/decal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Logique côté Lua de l'écran des décalques de l'éditeur de livrées. Il enveloppe editor_api_dynamicDecals : pile de couches (liste, sélection, surbrillance, visibilité, duplication, suppression, réordonnancement), peinture et miroir d'un décalque, et mode de transformation (échelle, inclinaison, rotation, projection, placement à la souris) pour un nouveau décalque ou pour un décalque existant. Il envoie son état à l'interface par guihooks (évènements liveries_decal_layersUpdated, liveries_decal_selectionChanged, liveries_decal_transformUpdated). Les hooks de route de routeLifecycleCallbacks l'appellent.
--- Accès : extension `ui_liveries_decal` : `extensions.load("ui_liveries_decal")`, puis la globale `ui_liveries_decal`
---@class ui_liveries_decal
---@field dependencies string[] Extensions chargées avant celle-ci : editor_api_dynamicDecals, ui_liveries, ui_liveries_camera, ui_liveries_paint, ui_liveries_textures.
ui_liveries_decal = {}

--- Ouvre une session de retransformation d'un décalque existant : mémorise une copie de la couche, son état de surbrillance et un indicateur applied. Remplace toute session précédente. Refuse si la couche est introuvable, n'est pas un décalque ou n'est pas centrée.
---Source : lua/ge/extensions/ui/liveries/decal.lua:710
---@param layerUid string Uid du décalque.
---@return boolean  true si la session est ouverte.
function ui_liveries_decal.beginExistingTransform(layerUid) end

--- Valide la transformation en cours. Sans session de retransformation, place un nouveau décalque (placeSelectedDecal) ; sinon appelle api.replaceDecalTransformFromCurrentProjection, marque la session comme appliquée et navigue vers « liveries.edit.decals ».
---Source : lua/ge/extensions/ui/liveries/decal.lua:874
---@return string|boolean|nil  Uid du nouveau décalque, ou true/false pour une retransformation.
function ui_liveries_decal.commitTransform() end

--- Supprime une couche via api.removeLayer.
---Source : lua/ge/extensions/ui/liveries/decal.lua:371
---@param layerUid string Uid de la couche.
function ui_liveries_decal.deleteLayer(layerUid) end

--- Duplique une couche via api.duplicateLayer à partir de son index et de son parent.
---Source : lua/ge/extensions/ui/liveries/decal.lua:362
---@param layerUid string Uid de la couche.
function ui_liveries_decal.duplicateLayer(layerUid) end

--- Hook appelé par editor_api_dynamicDecals quand une couche est déplacée ; même traitement que dynamicDecals_onLayerAdded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/decal.lua:1109
function ui_liveries_decal.dynamicDecals_moveLayer() end

--- Hook appelé par editor_api_dynamicDecals quand une couche est ajoutée. Reconstruit la liste (en marquant la nouvelle couche comme focus) et notifie l'interface. À ne pas appeler soi-même.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/decal.lua:1109
function ui_liveries_decal.dynamicDecals_onLayerAdded() end

--- Hook appelé par editor_api_dynamicDecals quand une couche est supprimée ; même traitement que dynamicDecals_onLayerAdded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/decal.lua:1109
function ui_liveries_decal.dynamicDecals_onLayerDeleted() end

--- Hook appelé par editor_api_dynamicDecals quand une couche est modifiée ; même traitement que dynamicDecals_onLayerAdded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/decal.lua:1109
function ui_liveries_decal.dynamicDecals_onLayerUpdated() end

--- Ferme la session de retransformation : cache le curseur et, si rien n'a été appliqué, rétablit la visibilité d'origine de la couche et sa surbrillance, puis rafraîchit la liste.
---Source : lua/ge/extensions/ui/liveries/decal.lua:806
function ui_liveries_decal.endExistingTransform() end

--- Renvoie les indicateurs de miroir d'un décalque validé ; le décalage du plan de miroir (mirrorOffset) est global à l'éditeur, pas par couche.
---Source : lua/ge/extensions/ui/liveries/decal.lua:514
---@param layerUid string Uid de la couche.
---@return table|nil  Table layerUid, mirrored, flipMirroredDecal, mirrorOffset.
function ui_liveries_decal.getLayerMirror(layerUid) end

--- Indique si le verrouillage du ratio est actif pour l'échelle et l'inclinaison.
---Source : lua/ge/extensions/ui/liveries/decal.lua:970
---@return boolean  État du verrou.
function ui_liveries_decal.getLockRatio() end

--- Renvoie les réglages de miroir courants de l'API : mirrored, flipMirroredDecal, mirrorOffset.
---Source : lua/ge/extensions/ui/liveries/decal.lua:947
---@return table|nil  nil si l'API est absente.
function ui_liveries_decal.getMirrorSnapshot() end

--- Renvoie la peinture d'une couche (ui_liveries_paint.getLayerPaint). Module actif requis.
---Source : lua/ge/extensions/ui/liveries/decal.lua:478
---@param layerUid string Uid de la couche.
---@return table|nil  Table layerUid, color, metallic, roughness, presets.
function ui_liveries_decal.getPaint(layerUid) end

--- Indique si le mode « petits incréments » est actif (vitesses multipliées par 0,1, aussi pour la caméra libre).
---Source : lua/ge/extensions/ui/liveries/decal.lua:952
---@return boolean  État du mode.
function ui_liveries_decal.getSmallIncrements() end

--- Renvoie la peinture du décalque en cours de transformation : couleur, métallisation et rugosité courantes de l'API, présets du véhicule, et layerUid de la couche en édition (ou « transform-preview » pour un nouveau décalque).
---Source : lua/ge/extensions/ui/liveries/decal.lua:553
---@return table|nil  Table de peinture, nil si l'API est absente.
function ui_liveries_decal.getTransformPaint() end

--- Renvoie l'état de transformation envoyé à l'interface : scale {x, y}, skew {x, y}, rotation (degrés), projection (clé de libellé), smallIncrements, lockRatio. Les nombres sont des chaînes.
---Source : lua/ge/extensions/ui/liveries/decal.lua:942
---@return table|nil  nil si l'API est absente.
function ui_liveries_decal.getTransformSnapshot() end

--- Termine le mode transformation : retire la table d'actions, remet les entrées à zéro, arrête la transformation de caméra, rend le décalque transparent (alpha 0), coupe la projection et restaure le réglage de souris si besoin.
---Source : lua/ge/extensions/ui/liveries/decal.lua:661
function ui_liveries_decal.hideSelectedCursor() end

--- Indique si le placement du décalque à la souris est actif (api.isUseMousePos).
---Source : lua/ge/extensions/ui/liveries/decal.lua:988
---@return boolean  false aussi si l'API est absente.
function ui_liveries_decal.isUseMousePos() end

--- Renvoie à l'interface la liste des couches et la sélection courante.
---Source : lua/ge/extensions/ui/liveries/decal.lua:286
function ui_liveries_decal.notifyUi() end

--- Hook appelé à chaque image avec dtReal (secondes réelles). Tant que la table d'actions de transformation est active, applique les entrées d'échelle, d'inclinaison et de rotation au décalque et notifie l'interface en cas de changement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/decal.lua:1051
---@param dtReal number Durée réelle de l'image en secondes.
function ui_liveries_decal.onUpdate(dtReal) end

--- Valide un nouveau décalque avec api.addDecal à partir de la texture sélectionnée, le déplace éventuellement au-dessus de la cible de startAddDecal, vide la sélection de texture et navigue vers « liveries.edit.decals ». Renvoie nil avec avertissement si aucune texture n'est sélectionnée.
---Source : lua/ge/extensions/ui/liveries/decal.lua:829
---@return string|nil  Uid de la nouvelle couche.
function ui_liveries_decal.placeSelectedDecal() end

--- Applique un nouvel ordre de couches racine, à condition qu'il corresponde au déplacement d'un seul décalque. Retrouve la couche déplacée, calcule l'index cible en tenant compte de la couche de remplissage et appelle api.moveLayer ; le rafraîchissement revient par le hook dynamicDecals_moveLayer.
---Source : lua/ge/extensions/ui/liveries/decal.lua:414
---@param orderedUids string[] Uids des couches racine dans l'ordre affiché (premier = dessus).
---@return boolean  false avec avertissement si l'ordre est invalide, la couche n'est pas un décalque racine ou aucun voisin d'ancrage n'existe.
function ui_liveries_decal.reorderLayers(orderedUids) end

--- Repousse la table d'actions de transformation si elle n'est pas active.
---Source : lua/ge/extensions/ui/liveries/decal.lua:697
function ui_liveries_decal.resumeTransformActionMap() end

--- Sélectionne une couche (et la met en surbrillance), ou désélectionne si layerUid est nil. Notifie l'interface du changement.
---Source : lua/ge/extensions/ui/liveries/decal.lua:291
---@param layerUid string|nil Uid de la couche, ou nil pour désélectionner.
---@return boolean  false si l'API est absente ou la couche introuvable, sinon true.
function ui_liveries_decal.select(layerUid) end

--- Inverse ou non le décalque miroir (api.setFlipMirroredDecal).
---Source : lua/ge/extensions/ui/liveries/decal.lua:1027
---@param value boolean Nouvel état.
---@return boolean  false si value n'est pas un booléen.
function ui_liveries_decal.setFlipMirroredDecal(value) end

--- Met à jour mirrored et flipMirroredDecal d'une couche, sur une copie passée à setLayer pour ne pas toucher à l'historique de l'API.
---Source : lua/ge/extensions/ui/liveries/decal.lua:532
---@param layerUid string Uid de la couche.
---@param mirror table Table avec mirrored et flipMirroredDecal (booléens ; tout ce qui n'est pas true vaut false).
---@return boolean  true si la mise à jour a été faite.
function ui_liveries_decal.setLayerMirror(layerUid, mirror) end

--- Active ou coupe le verrouillage du ratio et notifie l'interface si la valeur change.
---Source : lua/ge/extensions/ui/liveries/decal.lua:974
---@param value boolean Nouvel état.
---@return boolean  false si value n'est pas un booléen.
function ui_liveries_decal.setLockRatio(value) end

--- Règle le décalage du plan de miroir, borné entre -1 et 1 (api.setMirrorOffset).
---Source : lua/ge/extensions/ui/liveries/decal.lua:1039
---@param value number Décalage.
---@return boolean  false si value n'est pas un nombre.
function ui_liveries_decal.setMirrorOffset(value) end

--- Active ou coupe le miroir du décalque en cours de pose (api.setMirrored).
---Source : lua/ge/extensions/ui/liveries/decal.lua:1015
---@param value boolean Nouvel état.
---@return boolean  false si value n'est pas un booléen.
function ui_liveries_decal.setMirrored(value) end

--- Applique une peinture à une couche (ui_liveries_paint.setLayerPaint). Module actif requis.
---Source : lua/ge/extensions/ui/liveries/decal.lua:487
---@param layerUid string Uid de la couche.
---@param paint table color {r, g, b, a}, metallic, roughness, normalisés entre 0 et 1.
---@return boolean  true si la mise à jour a été faite.
function ui_liveries_decal.setPaint(layerUid, paint) end

--- Définit l'entrée de rotation vers la gauche (gâchette) ; la rotation appliquée est droite moins gauche.
---Source : lua/ge/extensions/ui/liveries/decal.lua:911
---@param value number|nil Valeur d'axe, nil vaut 0.
function ui_liveries_decal.setRotateLeft(value) end

--- Définit l'entrée de rotation vers la droite (gâchette).
---Source : lua/ge/extensions/ui/liveries/decal.lua:915
---@param value number|nil Valeur d'axe, nil vaut 0.
function ui_liveries_decal.setRotateRight(value) end

--- Définit l'entrée d'axe d'échelle horizontale (appliquée dans onUpdate).
---Source : lua/ge/extensions/ui/liveries/decal.lua:895
---@param value number|nil Valeur d'axe, nil vaut 0.
function ui_liveries_decal.setScaleHorizontal(value) end

--- Définit l'entrée d'axe d'échelle verticale (appliquée dans onUpdate).
---Source : lua/ge/extensions/ui/liveries/decal.lua:899
---@param value number|nil Valeur d'axe, nil vaut 0.
function ui_liveries_decal.setScaleVertical(value) end

--- Définit l'entrée d'axe d'inclinaison horizontale (appliquée dans onUpdate).
---Source : lua/ge/extensions/ui/liveries/decal.lua:903
---@param value number|nil Valeur d'axe, nil vaut 0.
function ui_liveries_decal.setSkewHorizontal(value) end

--- Définit l'entrée d'axe d'inclinaison verticale (appliquée dans onUpdate).
---Source : lua/ge/extensions/ui/liveries/decal.lua:907
---@param value number|nil Valeur d'axe, nil vaut 0.
function ui_liveries_decal.setSkewVertical(value) end

--- Active ou coupe les petits incréments et notifie l'interface si la valeur change.
---Source : lua/ge/extensions/ui/liveries/decal.lua:956
---@param value boolean Nouvel état.
---@return boolean  false si value n'est pas un booléen.
function ui_liveries_decal.setSmallIncrements(value) end

--- Applique color (RGBA normalisé, l'alpha sert d'opacité), metallic et roughness au décalque en cours de transformation, puis appelle api.onUpdate_.
---Source : lua/ge/extensions/ui/liveries/decal.lua:565
---@param paint table color {r, g, b, a}, metallic, roughness (facultatifs, 0 à 1).
---@return boolean  false si l'API est absente ou si paint n'est pas une table.
function ui_liveries_decal.setTransformPaint(paint) end

--- Active ou coupe le placement à la souris (bascule le réglage UseMousePos de l'API si nécessaire). Pendant une transformation, l'activer force la caméra en mode orbite.
---Source : lua/ge/extensions/ui/liveries/decal.lua:993
---@param value boolean Nouvel état.
---@return boolean  false si value n'est pas un booléen ou si l'API est absente.
function ui_liveries_decal.setUseMousePos(value) end

--- Choisit la projection selon la normale de surface (true) ou selon la caméra (false) et notifie l'interface si la valeur change.
---Source : lua/ge/extensions/ui/liveries/decal.lua:919
---@param value boolean Mode de projection.
---@return boolean  false si value n'est pas un booléen ou si l'API est absente.
function ui_liveries_decal.setUseSurfaceNormal(value) end

--- Active le module : efface la sélection, la cible d'ajout et la surbrillance, puis reconstruit la liste des couches.
---Source : lua/ge/extensions/ui/liveries/decal.lua:259
function ui_liveries_decal.setup() end

--- Affiche le curseur du décalque existant : masque la couche d'origine, copie sa texture, couleur, échelle, inclinaison, rotation, projection et miroir dans l'API, projette le décalque, pousse la table d'actions et démarre ui_liveries_camera.startTransformAtLayer. Avertit s'il n'y a pas de session.
---Source : lua/ge/extensions/ui/liveries/decal.lua:751
function ui_liveries_decal.showExistingCursor() end

--- Prépare la pose d'un nouveau décalque : utilise la texture sélectionnée comme texture couleur, projette le décalque, remet transformation et miroir par défaut, pousse la table d'actions de transformation et démarre ui_liveries_camera.startTransform. Si une manette est utilisée, désactive le placement à la souris. Avertit si aucune texture n'est sélectionnée.
---Source : lua/ge/extensions/ui/liveries/decal.lua:617
function ui_liveries_decal.showSelectedCursor() end

--- Prépare l'ajout d'un décalque au-dessus d'un décalque existant (ou en haut de pile si l'uid n'est pas un décalque) puis navigue vers la route « liveries.edit.decals.camera ».
---Source : lua/ge/extensions/ui/liveries/decal.lua:823
---@param targetLayerUid string|nil Uid du décalque au-dessus duquel insérer.
function ui_liveries_decal.startAddDecal(targetLayerUid) end

--- Retire la table d'actions de transformation et remet les entrées à zéro (utilisé quand on ouvre les réglages).
---Source : lua/ge/extensions/ui/liveries/decal.lua:684
function ui_liveries_decal.suspendTransformActionMap() end

--- Désactive le module : termine la transformation d'un décalque existant, cache le curseur, vide la sélection, la texture sélectionnée (ui_liveries_textures.clearSelectedItem) et la liste des couches, et coupe la surbrillance.
---Source : lua/ge/extensions/ui/liveries/decal.lua:271
function ui_liveries_decal.teardown() end

--- Met en surbrillance la couche si elle ne l'est pas déjà (seulement si elle est activée), sinon coupe la surbrillance. Rafraîchit la liste.
---Source : lua/ge/extensions/ui/liveries/decal.lua:348
---@param layerUid string Uid de la couche.
function ui_liveries_decal.toggleLayerHighlight(layerUid) end

--- Active ou désactive l'affichage d'une couche (champ enabled), sur une copie de la couche passée à setLayer, puis rafraîchit la liste.
---Source : lua/ge/extensions/ui/liveries/decal.lua:333
---@param layerUid string Uid de la couche.
function ui_liveries_decal.toggleLayerVisibility(layerUid) end

--- Inverse le mode de projection (surface ou caméra). Sans effet hors transformation.
---Source : lua/ge/extensions/ui/liveries/decal.lua:935
function ui_liveries_decal.toggleProjectionMode() end

