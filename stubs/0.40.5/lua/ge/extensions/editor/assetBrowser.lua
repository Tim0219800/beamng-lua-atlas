---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assetBrowser.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Asset Browser » de l'éditeur de monde : explore l'arborescence des assets du niveau courant (dossier du niveau), de art/ commun et de vehicles/, affiche miniatures, matériaux, meshes et jeux de textures, et permet de les glisser dans la scène. L'objet sélectionné est stocké dans editor.selection["asset"] et affiché par l'inspecteur (type « asset »). Un moddeur s'en sert surtout via selectFileByPath / getAssetByPath pour localiser un fichier depuis un autre outil (ex. menu « Locate in Asset Browser » de l'arbre de scène pour les TSStatic).
--- Accès : extension `editor_assetBrowser` : `extensions.load("editor_assetBrowser")`, puis la globale `editor_assetBrowser`
---@class editor_assetBrowser
editor_assetBrowser = {}

--- Désélectionne l'asset courant : remet selectedInABView (et selected si l'asset a un type) à false, vide editor.selection["asset"] et oublie l'entrée d'historique de sélection correspondante.
---Source : lua/ge/extensions/editor/assetBrowser.lua:813
function editor_assetBrowser.clearSelectedAsset() end

--- Retrouve l'asset de l'arborescence chargée correspondant à un chemin virtuel (ex. 'levels/<niveau>/art/shapes/x.dae'). Détermine la racine (dossier du niveau ou dossier racine du même nom que le premier segment), descend jusqu'au dossier puis cherche le fichier.
---Source : lua/ge/extensions/editor/assetBrowser.lua:1736
---@param path string Chemin virtuel complet du fichier
---@return table|nil  Entrée d'asset de l'Asset Browser, ou nil si la racine est introuvable (suite de la recherche : déduit du code)
function editor_assetBrowser.getAssetByPath(path) end

--- Renvoie l'asset actuellement sélectionné dans l'Asset Browser (editor.selection["asset"]).
---Source : lua/ge/extensions/editor/assetBrowser.lua:809
---@return table|nil  Asset sélectionné ou nil
function editor_assetBrowser.getSelectedAsset() end

--- Déplace l'index de sélection dans la liste affichée d'un cran vers le haut ou le bas (borné entre 1 et var.maxListIndexVal) ; sert à la navigation au clavier (action map AssetBrowser). Sans effet si aucun index courant.
---Source : lua/ge/extensions/editor/assetBrowser.lua:5819
---@param up boolean true pour monter (index - 1), false/nil pour descendre (index + 1)
function editor_assetBrowser.moveSelectionIndex(up) end

--- Hook appelé à l'activation de l'éditeur. Si l'asset sélectionné est un mesh ou un matériau, rafraîchit l'aperçu (meshPreview / matPreview).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetBrowser.lua:5255
function editor_assetBrowser.onEditorActivated() end

--- Hook appelé à chaque frame d'interface de l'éditeur : dessine la fenêtre Asset Browser, la fenêtre d'inspection d'image et les dialogues modaux de collections.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetBrowser.lua:5407
function editor_assetBrowser.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : enregistre le gestionnaire d'inspecteur 'asset', les fenêtres (assetBrowser, image inspector, dialogues de collections), le mode d'édition assetBrowserEditMode, le menu Window > Asset Browser et l'entrée « Locate in Asset Browser » de l'arbre de scène (valide pour les TSStatic).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetBrowser.lua:5213
function editor_assetBrowser.onEditorInitialized() end

--- Hook appelé quand une préférence de l'éditeur change ; recopie les valeurs 'assetBrowser.general.*' (taille des miniatures, filtres, tri, regroupement, vitesse de défilement, etc.) dans les options internes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetBrowser.lua:5595
---@param path string Chemin de la préférence, ex. 'assetBrowser.general.thumbnailSize'
---@param value any Nouvelle valeur
function editor_assetBrowser.onEditorPreferenceValueChanged(path, value) end

--- Hook appelé pour déclarer les préférences de l'Asset Browser (catégorie 'assetBrowser', sous-catégorie 'general') : skipMainFolder, skipImposters, fullPathSearch, thumbnailSize, scrollSpeed, etc.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetBrowser.lua:5651
---@param prefsRegistry table Registre de préférences de l'éditeur
function editor_assetBrowser.onEditorRegisterPreferences(prefsRegistry) end

--- Hook appelé quand une fenêtre d'outil prend le focus ; si c'est l'Asset Browser, empile l'action map 'AssetBrowser'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetBrowser.lua:5624
---@param windowName string Nom de la fenêtre
function editor_assetBrowser.onEditorToolWindowGotFocus(windowName) end

--- Hook appelé quand une fenêtre d'outil perd le focus ; si c'est l'Asset Browser, retire l'action map 'AssetBrowser'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetBrowser.lua:5630
---@param windowName string Nom de la fenêtre
function editor_assetBrowser.onEditorToolWindowLostFocus(windowName) end

--- Hook appelé quand un fichier change sur disque. Une fois l'arborescence chargée, met à jour le dossier concerné pour les fichiers sous /levels/<niveau courant>/ ou /art/ : 'modified' ajoute/rafraîchit l'asset (imposters, .cdae et .dae.png ignorés), 'deleted' le retire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetBrowser.lua:5313
---@param path string Chemin virtuel du fichier
---@param type string 'modified' ou 'deleted' (seules valeurs traitées)
function editor_assetBrowser.onFileChanged(path, type) end

--- Interface publique : ouvre le dossier du fichier dans l'Asset Browser, sélectionne le fichier et fait défiler jusqu'à lui. Ouvre la fenêtre si elle n'est pas visible.
---Source : lua/ge/extensions/editor/assetBrowser.lua:1673
---@param path string Chemin virtuel du fichier, ex. 'levels/<niveau>/art/shapes/x.dae'
function editor_assetBrowser.selectFileByPath(path) end

