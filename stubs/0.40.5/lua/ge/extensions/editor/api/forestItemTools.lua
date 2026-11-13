---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/forestItemTools.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils partagés de l'éditeur pour placer, sélectionner, déplacer et annuler des items de forêt (Forest / ForestData), extraits de forestEditor.lua pour qu'un second outil (l'éditeur d'intérieurs parallax) réutilise la même mécanique. Tout est paramétré par le handle `forest`/`forestData` (pas d'état de scène dans le module) ; la sélection est le store global `editor.selection.forestItem`, et les modifications passent par `editor.history` (annulables). Contient aussi l'empaquetage des données par-instance des fenêtres « parallax » (customData entier 32 bits) et des filtres sur le préfixe `parallax_` des datablocks ForestItemData.
--- Accès : extension `editor_api_forestItemTools` : `extensions.load("editor_api_forestItemTools")`, puis la globale `editor_api_forestItemTools`
---@class editor_api_forestItemTools
---@field PARALLAX_ITEM_PREFIX string Préfixe "parallax_" du nom (ou internalName) d'un datablock ForestItemData identifiant une fenêtre parallax ; l'éditeur parallax ne touche que ces items, l'éditeur de forêt les autres.
editor_api_forestItemTools = {}

--- Ajoute des items de façon annulable (action "AddForestItems") ; le redo sélectionne les items ajoutés.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:139
---@param forestData userdata ForestData
---@param items table items à ajouter
---@param dontCallRedo boolean|nil true si les items existent déjà (n'exécute pas le redo) ; défaut false
---@return any  résultat de editor.history:commitAction
function editor_api_forestItemTools.addItems(forestData, items, dontCallRedo) end

--- Désélectionne tous les items de forêt sélectionnés, reconstruit les données d'instances et vide la sélection.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:70
---@param forestData userdata ForestData
function editor_api_forestItemTools.clearSelection(forestData) end

--- Renvoie une nouvelle liste contenant les items pour lesquels keep(item) est vrai (liste nil = liste vide).
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:679
---@param items table|nil liste d'items
---@param keep function function(item) -> boolean
---@return table  liste filtrée
function editor_api_forestItemTools.filterItems(items, keep) end

--- Renvoie la sélection courante d'items de forêt (editor.selection.forestItem) ou une table vide.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:43
---@return table  liste d'items
function editor_api_forestItemTools.getSelection() end

--- Pilote et dessine le gizmo d'axes pour la sélection courante (translation avec accrochage terrain, rotation autour du centroïde, échelle uniforme, duplication par Shift). Enregistre l'action annulable "SetForestItemTransform" (ou "AddForestItems" pour un duplicata) à la fin du glissement. À appeler une fois par frame depuis le onUpdate de l'outil. Ne fait rien sans sélection.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:295
---@param forest userdata objet Forest
function editor_api_forestItemTools.handleGizmo(forest) end

--- Même test sur un objet datablock ForestItemData (issu de scenetree.findObject), pour filtrer la palette de meshes.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:667
---@param cobj userdata|nil datablock
---@return boolean  true si name/internalName commence par parallax_
function editor_api_forestItemTools.isParallaxDataObject(cobj) end

--- Prédicat pratique pour les filtres de sélection : l'item est-il une fenêtre parallax (préfixe parallax_) ?
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:660
---@param item userdata item de forêt
---@return boolean  résultat
function editor_api_forestItemTools.isParallaxItem(item) end

--- Ligne de liste de meshes partagée : icône de datablock + sélectionnable pleine largeur, surligné si sélectionné. Renvoie true au clic ; l'appelant gère l'état de sélection.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:625
---@param uniqueId any id du datablock (distingue l'id ImGui)
---@param label string texte affiché
---@param isSelected boolean surligner
---@param icon any|nil icône de remplacement (défaut editor.icons.forest_brushelement)
---@return boolean  true si cliqué
function editor_api_forestItemTools.itemDataSelectable(uniqueId, label, isSelected, icon) end

--- Vrai si le nom (ou l'internalName) du datablock de l'item commence par prefix.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:647
---@param item userdata item de forêt
---@param prefix string préfixe
---@return boolean  résultat
function editor_api_forestItemTools.itemMatchesPrefix(item, prefix) end

--- Liste les datablocks ForestItemData filtrés par préfixe de nom (ou internalName). matchPrefix = true : seulement ceux qui commencent par prefix (éditeur parallax) ; false : tous les autres (éditeur de forêt). Triée par nom sans casse.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:601
---@param prefix string préfixe (utilisé dans un motif Lua "^"..prefix)
---@param matchPrefix boolean true = garder ceux qui correspondent, false = les autres
---@return table[]  liste de {id, name}
function editor_api_forestItemTools.listItemDatas(prefix, matchPrefix) end

--- Encode (setId, emissive) en customData. setId < 0 ou nil donne -1 (désactivé ; le C++ ne sauvegarde pas customData < 0).
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:709
---@param setId integer|nil id du jeu de textures (24 bits)
---@param emissive boolean|nil drapeau emissive
---@return integer  customData
function editor_api_forestItemTools.packParallaxData(setId, emissive) end

--- Renvoie l'item de forêt rendu sous la souris (rayon caméra-souris), ou nil ; filterFn peut rejeter les items qui ne sont pas à l'outil.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:186
---@param forest userdata objet Forest
---@param rayRange number portée du rayon en mètres
---@param filterFn function|nil function(item) -> boolean
---@return userdata|nil  item touché
function editor_api_forestItemTools.pick(forest, rayRange, filterFn) end

--- Instancie un item à partir d'un datablock à la transformation donnée et renvoie le handle final. N'enregistre PAS d'historique : l'appelant commite (typiquement via addItems). afterCreate peut modifier l'item neuf (ex. customData parallax) et renvoyer le handle final à garder.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:173
---@param forest userdata objet Forest
---@param itemData userdata datablock ForestItemData
---@param transform MatrixF transformation monde
---@param scale number échelle
---@param afterCreate function|nil function(item, forestData) -> item|nil
---@return userdata  handle de l'item créé
function editor_api_forestItemTools.place(forest, itemData, transform, scale, afterCreate) end

--- Calcule la base de placement du tableau et l'orientation de chaque item : (right, up, forward) unitaires. Colonnes de la transformation : X = right, Y = forward (face de la fenêtre), Z = up ; le tableau avance selon right (colonnes) et up (lignes). Mode monde : axes monde tournés de yawRad autour de Z. alignToNormal : la face suit la normale de la surface, le tableau est dans le plan de la surface et yawRad est une rotation dans ce plan. flip inverse la face.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:453
---@param hitNormal vec3 normale de la surface touchée
---@param yawRad number rotation en radians
---@param alignToNormal boolean aligner sur la normale
---@param flip boolean inverser la face
---@return vec3  right
---@return vec3  up
---@return vec3  forward
function editor_api_forestItemTools.placementBasis(hitNormal, yawRad, alignToNormal, flip) end

--- Supprime des items de façon annulable (action "RemoveForestItems"). Ne fait rien si la liste est vide.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:145
---@param forestData userdata ForestData
---@param items table items à supprimer
---@param dontCallRedo boolean|nil true = ne pas exécuter maintenant ; défaut false
---@return any  résultat de commitAction
function editor_api_forestItemTools.removeItems(forestData, items, dontCallRedo) end

--- Sélectionne les items donnés (nil ou vide = effacer). Place le gizmo d'axes (sur l'item en mode local avec un seul item, sinon sur le centroïde), reconstruit les instances et émet onEditorObjectSelectionChanged. Ne déclenche pas l'aperçu du mesh de l'éditeur de forêt.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:83
---@param forestData userdata ForestData
---@param forestItems table|nil items à sélectionner
---@param addToSelection boolean|nil true = garder la sélection actuelle
function editor_api_forestItemTools.select(forestData, forestItems, addToSelection) end

--- Décode le customData en (setId, emissive). setId vaut -1 si aucun jeu parallax n'est assigné.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:698
---@param customData integer|nil entier 32 bits de l'item
---@return integer  id du jeu de textures, -1 si désactivé
---@return boolean  drapeau emissive
function editor_api_forestItemTools.unpackParallaxData(customData) end

--- Une frame de l'interaction « instancier un item » : raycast sous le curseur, aperçu (sphère, boîte englobante réelle du mesh, ligne de face ; cellule pivot en orange) et, au clic gauche, création d'un tableau cols x rows d'items du datablock itemDataId (échelle opts.scale, 1 par défaut), commité en UNE action annulable. Renvoie la liste des items créés au clic, sinon nil.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:494
---@param forest userdata objet Forest
---@param itemDataId integer id du datablock ForestItemData
---@param opts table|nil rayRange (préférence par défaut), cols/rows (1x1), colGap/rowGap (m, bord à bord sur les bornes du mesh, 0), yaw (degrés), alignToNormal, flipNormal, normalOffset (m, décalage le long de la face), scale (1), afterCreate(item, forestData, index) (index 1-based)
---@return table|nil  items placés (au clic) ou nil
function editor_api_forestItemTools.updateInstantiateMode(forest, itemDataId, opts) end

--- Une frame de l'interaction « sélectionner des items de forêt » (outil Select de l'éditeur de forêt) : survol en blanc, clic = sélection (Ctrl ajoute, clic dans le vide efface), rectangle de sélection (Ctrl ajoute), dessin des boîtes de la sélection (orange) et gizmo de transformation. Restreint aux items passant filterFn.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:327
---@param forest userdata|nil objet Forest (rien n'est fait si nil)
---@param filterFn function|nil function(item) -> boolean ; nil = tous
---@param rayRange number|nil portée du rayon (défaut : préférence de distance de travail)
function editor_api_forestItemTools.updateSelectMode(forest, filterFn, rayRange) end

