---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/gui.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Coeur de l'interface ImGui de l'éditeur de niveau : gestion des fenêtres d'outils (enregistrement, affichage/masquage, groupes, modales, sauvegarde/chargement de l'état du layout), boucle de présentation (`presentGui` : dockspace principal puis hooks onEditorGui*), atlas d'icônes (`editor.icons`) et un grand nombre d'enveloppes `editor.ui*` autour des widgets ImGui (drag, input, slider, couleur) qui renseignent en plus un BoolPtr `editEnded` quand l'édition se termine. Un moddeur d'outil d'éditeur s'en sert pour déclarer ses fenêtres (`editor.registerWindow`, `editor.beginWindow`/`endWindow`) et dessiner ses widgets. `initialize` installe tout sur l'objet `editor`.
--- Accès : extension `editor_api_gui` : `extensions.load("editor_api_gui")`, puis la globale `editor_api_gui`
---@class editor_api_gui
editor_api_gui = {}

--- Mémorise l'éditeur, initialise l'état et installe toutes les fonctions ci-dessous sur `editor`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/gui.lua:2206
---@param editorInstance table objet `editor`
function editor_api_gui.initialize(editorInstance) end

--- Présente toute l'interface de l'éditeur : resynchronise editor.keyModifiers depuis ImGui, crée le dockspace principal, puis émet onEditorGuiMainMenu, onEditorGuiToolBar, onEditorGui(dtReal, dtSim, dtRaw), onEditorGuiStatusBar et vérifie le redimensionnement. Appelé chaque frame par l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/gui.lua:466
---@param dtReal number delta temps réel (s)
---@param dtSim number delta temps simulation (s)
---@param dtRaw number delta temps brut (s)
function editor_api_gui.presentGui(dtReal, dtSim, dtRaw) end

--- Fonctions ajoutées à `editor` par initialize.
---@class editor_api_gui_editor
local editor_api_gui_editor = {}

--- Vrai si le dernier item est survolé et que le bouton vient d'être cliqué.
---Source : lua/ge/extensions/editor/api/gui.lua:985
---@param int_mouse_button integer|nil bouton (0 par défaut)
---@return boolean  résultat
function editor_api_gui_editor.IsItemClicked(int_mouse_button) end

--- Vrai si le dernier item est survolé et double-cliqué.
---Source : lua/ge/extensions/editor/api/gui.lua:980
---@param int_mouse_button integer|nil bouton (0 par défaut)
---@return boolean  résultat
function editor_api_gui_editor.IsItemDoubleClicked(int_mouse_button) end

--- Comme beginWindow pour une fenêtre modale : ouvre le popup si la fenêtre est marquée visible.
---Source : lua/ge/extensions/editor/api/gui.lua:1243
---@param windowName string nom enregistré
---@param title string titre
---@param flags integer|nil flags
---@param noClose boolean|nil sans croix
---@return boolean  true si le contenu doit être dessiné
function editor_api_gui_editor.beginModalWindow(windowName, title, flags, noClose) end

--- Équivalent de imgui.Begin pour une fenêtre enregistrée (titre##nom). Renvoie false si non enregistrée (avertissement) ou invisible. Toujours à associer à editor.endWindow().
---Source : lua/ge/extensions/editor/api/gui.lua:1195
---@param windowName string nom enregistré
---@param title string titre affiché
---@param flags integer|nil flags de fenêtre ImGui
---@param noClose boolean|nil true = pas de bouton de fermeture
---@return boolean  true si le contenu doit être dessiné
function editor_api_gui_editor.beginWindow(windowName, title, flags, noClose) end

--- Émet onEditorToolWindowShow pour chaque fenêtre visible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/gui.lua:1376
function editor_api_gui_editor.callShowWindowHookForVisibleWindows() end

--- Détecte le gain/la perte de focus de la fenêtre ImGui courante et émet onEditorToolWindowGotFocus / onEditorToolWindowLostFocus.
---Source : lua/ge/extensions/editor/api/gui.lua:1178
---@param windowName string nom
function editor_api_gui_editor.checkWindowFocus(windowName) end

--- Détecte un changement de taille de la fenêtre principale et émet le hook onWindowResized(ImVec2 DisplaySize).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/gui.lua:426
function editor_api_gui_editor.checkWindowResize() end

--- Ferme le dialogue modal générique et désenregistre sa fenêtre.
---Source : lua/ge/extensions/editor/api/gui.lua:1408
function editor_api_gui_editor.closeModalDialog() end

--- Cache la fenêtre modale et ferme le popup ImGui courant.
---Source : lua/ge/extensions/editor/api/gui.lua:1274
---@param windowName string nom
function editor_api_gui_editor.closeModalWindow(windowName) end

--- Charge l'atlas d'icônes de l'éditeur (JSON + image) et remplit editor.icons, editor.atlasWidth, editor.atlasHeight. Logue les icônes en double.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/gui.lua:70
function editor_api_gui_editor.createIconAtlas() end

--- Retire le focus aux fenêtres marquées focalisées (émet onEditorToolWindowLostFocus).
---Source : lua/ge/extensions/editor/api/gui.lua:1384
function editor_api_gui_editor.defocusFocusedWindow() end

--- Dessine un pinceau (type 'ellipse' ou boîte) au sol autour de pos, collé au terrain (terrainBlock) ou à la géométrie statique par raycast.
---Source : lua/ge/extensions/editor/api/gui.lua:299
---@param brushType string 'ellipse' ou autre (boîte)
---@param pos vec3 centre (rien n'est fait si nil)
---@param radius number rayon (rien si nil)
---@param numberOfSegments integer|nil segments (128)
---@param color ColorF|nil couleur (blanc)
---@param terrainBlock userdata|nil TerrainBlock pour la hauteur
---@param brushRatio number|nil rapport d'aspect (1)
---@param brushRotation number|nil rotation en degrés (0)
---@param onlyTerrain boolean|nil suivre uniquement le terrain
function editor_api_gui_editor.drawBrush(brushType, pos, radius, numberOfSegments, color, terrainBlock, brushRatio, brushRotation, onlyTerrain) end

--- Ferme une fenêtre modale (imgui.EndPopup si elle était affichée).
---Source : lua/ge/extensions/editor/api/gui.lua:1262
function editor_api_gui_editor.endModalWindow() end

--- Ferme la fenêtre ouverte par beginWindow (appelle imgui.End si Begin a été appelé). À appeler même si beginWindow a renvoyé false.
---Source : lua/ge/extensions/editor/api/gui.lua:1252
function editor_api_gui_editor.endWindow() end

--- Renvoie la taille par défaut des boutons d'icône.
---Source : lua/ge/extensions/editor/api/gui.lua:61
---@return ImVec2  taille
function editor_api_gui_editor.getDefaultIconButtonSize() end

--- Liste les polices ImGui disponibles.
---Source : lua/ge/extensions/editor/api/gui.lua:991
---@return table[]  liste de {name}
function editor_api_gui_editor.getFontList() end

--- Renvoie la coordonnée X du bord droit de la vue 3D à la hauteur écran donnée, en tenant compte des fenêtres ancrées à droite.
---Source : lua/ge/extensions/editor/api/gui.lua:446
---@param screenY number ordonnée écran
---@return number  abscisse du bord droit
function editor_api_gui_editor.getSceneViewportRightEdge(screenY) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : bool -> pointeur bool ; nil -> bool lu.
---Source : lua/ge/extensions/editor/api/gui.lua:1795
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempBool_BoolBool(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : string/bool -> pointeur bool ("1" = true) ; nil -> "1" ou "0".
---Source : lua/ge/extensions/editor/api/gui.lua:1811
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempBool_StringString(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : string -> pointeur char ; nil -> string.
---Source : lua/ge/extensions/editor/api/gui.lua:2071
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempCharPtr(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : string -> pointeur/tableau de float[2] ; nil -> string.
---Source : lua/ge/extensions/editor/api/gui.lua:1912
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempFloatArray2_StringString(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : table -> pointeur/tableau de float[2] ; nil -> table.
---Source : lua/ge/extensions/editor/api/gui.lua:1933
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempFloatArray2_TableTable(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : table -> pointeur/tableau de float[3] ; nil -> table.
---Source : lua/ge/extensions/editor/api/gui.lua:1951
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempFloatArray3_TableTable(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : vec3 -> pointeur/tableau de float[3] ; nil -> vec3.
---Source : lua/ge/extensions/editor/api/gui.lua:1969
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempFloatArray3_Vec3Vec3(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : string -> pointeur/tableau de float[4] ; nil -> string.
---Source : lua/ge/extensions/editor/api/gui.lua:2007
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempFloatArray4_StringString(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : table -> pointeur/tableau de float[4] ; nil -> table.
---Source : lua/ge/extensions/editor/api/gui.lua:1985
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempFloatArray4_TableTable(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : number -> pointeur float ; nil -> number.
---Source : lua/ge/extensions/editor/api/gui.lua:1884
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempFloat_NumberNumber(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : string -> pointeur float ; nil -> number.
---Source : lua/ge/extensions/editor/api/gui.lua:1895
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempFloat_StringString(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : table -> ImVec4 ; nil -> ImVec4.
---Source : lua/ge/extensions/editor/api/gui.lua:2093
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempImVec4_TableImVec4(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : table -> pointeur/tableau de float (ImVec4) ; nil -> table.
---Source : lua/ge/extensions/editor/api/gui.lua:2049
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempImVec4_TableTable(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : string -> pointeur/tableau d'int[2] ; nil -> string.
---Source : lua/ge/extensions/editor/api/gui.lua:1863
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempIntArray2_StringString(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : number -> pointeur int ; nil -> number.
---Source : lua/ge/extensions/editor/api/gui.lua:1835
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempInt_NumberNumber(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : string -> pointeur int ; nil -> number.
---Source : lua/ge/extensions/editor/api/gui.lua:1846
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempInt_StringString(value) end

--- Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : chemin string -> objet texture ; nil -> objet texture courant.
---Source : lua/ge/extensions/editor/api/gui.lua:2082
---@param value any valeur à convertir, ou nil pour relire la valeur du tampon
function editor_api_gui_editor.getTempTextureObj(value) end

--- Renvoie le imgui.BoolPtr de visibilité de la fenêtre (utilisé par imgui.Begin), ou nil.
---Source : lua/ge/extensions/editor/api/gui.lua:1084
---@param windowName string nom
---@return imgui.BoolPtr|nil  pointeur
function editor_api_gui_editor.getWindowVisibleBoolPtr(windowName) end

--- Cache toutes les fenêtres enregistrées visibles (émet les hooks).
---Source : lua/ge/extensions/editor/api/gui.lua:1107
function editor_api_gui_editor.hideAllWindows() end

--- Cache la fenêtre et émet onEditorToolWindowLostFocus puis onEditorToolWindowHide.
---Source : lua/ge/extensions/editor/api/gui.lua:1095
---@param windowName string nom
function editor_api_gui_editor.hideWindow(windowName) end

--- Vrai si aucun item ImGui n'est actif.
---Source : lua/ge/extensions/editor/api/gui.lua:442
---@return boolean  résultat
function editor_api_gui_editor.isViewportFocused() end

--- Vrai si la souris est sur la vue 3D du jeu uniquement (aucun item ni fenêtre ImGui survolé).
---Source : lua/ge/extensions/editor/api/gui.lua:438
---@return boolean  résultat
function editor_api_gui_editor.isViewportHovered() end

--- Vrai si la fenêtre est enregistrée.
---Source : lua/ge/extensions/editor/api/gui.lua:1029
---@param windowName string nom
---@return boolean  résultat
function editor_api_gui_editor.isWindowRegistered(windowName) end

--- Vrai si la fenêtre est enregistrée et visible ; déclenche aussi les hooks Show/Hide si la visibilité a changé (ex. fermeture par la croix).
---Source : lua/ge/extensions/editor/api/gui.lua:1072
---@param windowName string nom
---@return boolean  visible
function editor_api_gui_editor.isWindowVisible(windowName) end

--- Recharge l'état des fenêtres (retombe sur settings/<outil>/layouts/Default/windowsState.json si le fichier manque ou a une version différente), masque d'abord toutes les fenêtres, puis émet onEditorLoadWindowsState et onEditorLoadGuiInstancerState.
---Source : lua/ge/extensions/editor/api/gui.lua:1312
---@param customFilename string|nil fichier
---@param toolName string|nil outil à charger seulement
function editor_api_gui_editor.loadWindowsState(customFilename, toolName) end

--- Dessine le dialogue modal générique ; appelé par l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/gui.lua:1415
function editor_api_gui_editor.modalDialogWindowUi() end

--- Ouvre un dialogue modal générique (fenêtre editorModalDialog) dont le contenu est dessiné par uiFunction.
---Source : lua/ge/extensions/editor/api/gui.lua:1401
---@param title string titre
---@param windowSize ImVec2 taille
---@param uiFunction function function() appelée à chaque frame pour dessiner le contenu
function editor_api_gui_editor.openModalDialog(title, windowSize, uiFunction) end

--- Ouvre la fenêtre modale (showWindow).
---Source : lua/ge/extensions/editor/api/gui.lua:1270
---@param windowName string nom
function editor_api_gui_editor.openModalWindow(windowName) end

--- Enregistre une fenêtre modale (raccourci de registerWindow avec modal = true).
---Source : lua/ge/extensions/editor/api/gui.lua:1041
---@param windowName string nom
---@param defaultSize ImVec2|nil taille
---@param defaultPos ImVec2|nil position
---@param centered boolean|nil centrée
---@param toolName string|nil outil
function editor_api_gui_editor.registerModalWindow(windowName, defaultSize, defaultPos, centered, toolName) end

--- Enregistre une fenêtre d'outil (à appeler dans onEditorInitialized). Conserve la visibilité précédente si elle existe déjà.
---Source : lua/ge/extensions/editor/api/gui.lua:1013
---@param windowName string nom unique
---@param defaultSize ImVec2|nil taille initiale
---@param defaultPos ImVec2|nil position initiale
---@param defaultVisibleBoolean boolean|nil visibilité initiale
---@param modal boolean|nil fenêtre modale
---@param centered boolean|nil centrée
---@param groupName string|nil groupe (ouvrir/fermer en bloc)
---@param toolName string|nil outil propriétaire
function editor_api_gui_editor.registerWindow(windowName, defaultSize, defaultPos, defaultVisibleBoolean, modal, centered, groupName, toolName) end

--- Sauvegarde l'état des fenêtres (visibilité, taille, position, instances GUI) en JSON ; les modales sont sauvegardées invisibles. Émet onEditorSaveGuiInstancerState et onEditorSaveWindowsState.
---Source : lua/ge/extensions/editor/api/gui.lua:1279
---@param customFilename string|nil fichier (défaut : fichier d'état de l'éditeur)
---@param toolName string|nil ne sauver que les fenêtres de cet outil
function editor_api_gui_editor.saveWindowsState(customFilename, toolName) end

--- Convertit un point écran en point client via le Canvas (identité si les viewports ImGui sont désactivés).
---Source : lua/ge/extensions/editor/api/gui.lua:511
---@param pt2i Point2I point écran
---@return Point2I  point client
function editor_api_gui_editor.screenToClient(pt2i) end

--- Définit la taille (carrée) par défaut des boutons d'icône.
---Source : lua/ge/extensions/editor/api/gui.lua:65
---@param size number côté en pixels
function editor_api_gui_editor.setDefaultIconButtonSize(size) end

--- Enregistre l'état d'une touche modificatrice dans editor.keyModifiers (appelé par l'action map de l'éditeur). Note : presentGui resynchronise ctrl/shift/alt chaque frame depuis ImGui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/gui.lua:2133
---@param mod string modificateur (ex. ctrl, shift, alt)
---@param pressed boolean appuyée ou non
function editor_api_gui_editor.setKeyModifier(mod, pressed) end

--- Change le groupe d'une fenêtre enregistrée.
---Source : lua/ge/extensions/editor/api/gui.lua:1393
---@param windowName string nom
---@param groupName string groupe
function editor_api_gui_editor.setWindowGroup(windowName, groupName) end

--- Affiche ou masque toutes les fenêtres d'un groupe.
---Source : lua/ge/extensions/editor/api/gui.lua:1142
---@param groupName string groupe
---@param visible boolean visibilité
function editor_api_gui_editor.setWindowGroupVisibility(groupName, visible) end

--- Alias de showWindow(windowName, visible).
---Source : lua/ge/extensions/editor/api/gui.lua:1138
---@param windowName string nom
---@param visible boolean visibilité
function editor_api_gui_editor.setWindowVisibility(windowName, visible) end

--- Applique taille et position par défaut (Cond_FirstUseEver, ou centrage) ; à appeler avant imgui.Begin. Peut forcer le dépliage selon la préférence ui.general.forceExpandWindowOnFirstShow.
---Source : lua/ge/extensions/editor/api/gui.lua:1152
---@param windowName string nom
function editor_api_gui_editor.setupWindow(windowName) end

--- Ouvre la fenêtre d'aide à la visibilité (editor_vizHelper) si l'extension est chargée.
---Source : lua/ge/extensions/editor/api/gui.lua:257
function editor_api_gui_editor.showVizHelperWindow() end

--- Affiche (ou masque si show == false) la fenêtre et émet onEditorToolWindowShow / onEditorToolWindowHide.
---Source : lua/ge/extensions/editor/api/gui.lua:1119
---@param windowName string nom
---@param show boolean|nil false pour masquer ; nil = afficher
function editor_api_gui_editor.showWindow(windowName, show) end

--- Charge une texture et renvoie ses informations ; nil si le chargement échoue.
---Source : lua/ge/extensions/editor/api/gui.lua:40
---@param path string chemin de l'image
---@return table|nil  {file, path, tex, texId (hérité, à ne pas utiliser), size, format}
function editor_api_gui_editor.texObj(path) end

--- Bouton aligné à droite de la zone disponible.
---Source : lua/ge/extensions/editor/api/gui.lua:116
---@param string_label string libellé
---@param ImVec2_size ImVec2|nil taille
---@param bool_sameLine boolean|nil même ligne
---@param id string|nil suffixe d'id ImGui
---@param offset number|nil décalage
---@return boolean|nil  true si cliqué
function editor_api_gui_editor.uiButtonRightAlign(string_label, ImVec2_size, bool_sameLine, id, offset) end

--- Enveloppe de imgui.ColorButton (couleur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:957
---@param desc_id any
---@param col any
---@param flags any
---@param size any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié / cliqué
function editor_api_gui_editor.uiColorButton(desc_id, col, flags, size, editEnded) end

--- Enveloppe de imgui.ColorEdit3 (couleur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:902
---@param label any
---@param col any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié / cliqué
function editor_api_gui_editor.uiColorEdit3(label, col, flags, editEnded) end

--- Enveloppe de imgui.ColorEdit4 (couleur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:909
---@param label any
---@param col any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié / cliqué
function editor_api_gui_editor.uiColorEdit4(label, col, flags, editEnded) end

--- Enveloppe de imgui.ColorEdit8 (couleur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:917
---@param label any
---@param col any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié / cliqué
function editor_api_gui_editor.uiColorEdit8(label, col, flags, editEnded) end

--- Enveloppe de imgui.ColorPicker3 (couleur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:943
---@param label any
---@param col any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié / cliqué
function editor_api_gui_editor.uiColorPicker3(label, col, flags, editEnded) end

--- Enveloppe de imgui.ColorPicker4 (couleur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:950
---@param label any
---@param col any
---@param flags any
---@param ref_col any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié / cliqué
function editor_api_gui_editor.uiColorPicker4(label, col, flags, ref_col, editEnded) end

--- Enveloppe de imgui.DragFloat (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:521
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiDragFloat(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Enveloppe de imgui.DragFloat2 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:528
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiDragFloat2(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Enveloppe de imgui.DragFloat3 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:535
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiDragFloat3(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Enveloppe de imgui.DragFloat4 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:542
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiDragFloat4(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Enveloppe de imgui.DragFloatRange2 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:549
---@param label string libellé / id ImGui du widget
---@param v_current_min any
---@param v_current_max any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param format_max any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiDragFloatRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags, editEnded) end

--- Enveloppe de imgui.DragInt (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:556
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiDragInt(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Enveloppe de imgui.DragInt2 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:563
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiDragInt2(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Enveloppe de imgui.DragInt3 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:570
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiDragInt3(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Enveloppe de imgui.DragInt4 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:577
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiDragInt4(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Enveloppe de imgui.DragIntRange2 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:584
---@param label string libellé / id ImGui du widget
---@param v_current_min any
---@param v_current_max any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param format_max any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiDragIntRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags, editEnded) end

--- Enveloppe de imgui.DragScalar (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:591
---@param label string libellé / id ImGui du widget
---@param data_type any
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiDragScalar(label, data_type, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Enveloppe de imgui.DragScalarN (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:598
---@param label string libellé / id ImGui du widget
---@param data_type any
---@param v any
---@param components any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiDragScalarN(label, data_type, v, components, v_speed, v_min, v_max, format, flags, editEnded) end

--- Bouton d'aide : ouvre https://documentation.beamng.com/<relativeUrl> dans le navigateur (index par défaut).
---Source : lua/ge/extensions/editor/api/gui.lua:249
---@param topicName string sujet (id du bouton et info-bulle)
---@param relativeUrl string|nil chemin relatif
---@param size ImVec2|nil taille
function editor_api_gui_editor.uiHelpButton(topicName, relativeUrl, size) end

--- Affiche un texte en surlignant en jaune plusieurs occurrences (insensible à la casse, une dizaine au plus) de highlightText.
---Source : lua/ge/extensions/editor/api/gui.lua:158
---@param text string texte
---@param highlightText string|nil sous-chaîne
---@param textColor ImVec4|nil couleur
function editor_api_gui_editor.uiHighlightedText(text, highlightText, textColor) end

--- Dessine une icône de l'atlas de l'éditeur (taille 32x32 par défaut, multipliée par imgui.uiscale).
---Source : lua/ge/extensions/editor/api/gui.lua:130
---@param icon table entrée de editor.icons
---@param size ImVec2|nil taille
---@param col ImVec4|nil teinte
---@param borderCol ImVec4|nil bordure
---@param label string|nil texte à droite
---@return boolean|nil  true si l'image a renvoyé un clic
function editor_api_gui_editor.uiIconImage(icon, size, col, borderCol, label) end

--- Bouton à icône (avec ou sans libellé). Sans id fourni, un id automatique par frame est généré. onRelease = clic détecté au relâchement.
---Source : lua/ge/extensions/editor/api/gui.lua:191
---@param icon table entrée de editor.icons
---@param size ImVec2|nil taille (défaut editor.getDefaultIconButtonSize)
---@param col ImVec4|nil teinte
---@param label string|nil texte
---@param backgroundCol ImVec4|nil fond
---@param id string|nil id ImGui
---@param textColor ImVec4|nil couleur du texte
---@param textBG ImU32|nil fond du texte
---@param onRelease boolean|nil cliquer au relâchement
---@param highlightText string|nil sous-chaîne à surligner
---@return boolean  true si cliqué
function editor_api_gui_editor.uiIconImageButton(icon, size, col, label, backgroundCol, id, textColor, textBG, onRelease, highlightText) end

--- Enveloppe de imgui.InputDouble (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:694
---@param label string libellé / id ImGui du widget
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputDouble(label, v, step, step_fast, format, extra_flags, editEnded) end

--- Champ de chemin de fichier avec bouton '...' ouvrant editor_fileDialog.openFile ; écrit le chemin choisi dans buf.
---Source : lua/ge/extensions/editor/api/gui.lua:757
---@param label string libellé (aussi clé du contexte du dialogue)
---@param buf cdata buffer ArrayChar du chemin
---@param width number|nil largeur du champ
---@param dir string|nil dossier initial (défaut : dossier du chemin actuel)
---@param extFilter table|string|nil filtre d'extensions du dialogue
---@param flags integer|nil flags InputText
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si le texte ou le fichier a changé
function editor_api_gui_editor.uiInputFile(label, buf, width, dir, extFilter, flags, editEnded) end

--- Enveloppe de imgui.InputFloat (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:628
---@param label string libellé / id ImGui du widget
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputFloat(label, v, step, step_fast, format, extra_flags, editEnded) end

--- Enveloppe de imgui.InputFloat2 (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:640
---@param label string libellé / id ImGui du widget
---@param v any
---@param format any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputFloat2(label, v, format, extra_flags, editEnded) end

--- Variante de uiInputFloat2 avec step/step_fast gérés par l'éditeur ; renseigne editEnded.
---Source : lua/ge/extensions/editor/api/gui.lua:1639
---@param label string libellé / id ImGui du widget
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputFloat2Ex(label, v, step, step_fast, format, flags, editEnded) end

--- Enveloppe de imgui.InputFloat3 (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:647
---@param label string libellé / id ImGui du widget
---@param v any
---@param format any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputFloat3(label, v, format, extra_flags, editEnded) end

--- Variante de uiInputFloat3 avec step/step_fast gérés par l'éditeur ; renseigne editEnded.
---Source : lua/ge/extensions/editor/api/gui.lua:1676
---@param label string libellé / id ImGui du widget
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputFloat3Ex(label, v, step, step_fast, format, flags, editEnded) end

--- Enveloppe de imgui.InputFloat4 (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:654
---@param label string libellé / id ImGui du widget
---@param v any
---@param format any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputFloat4(label, v, format, extra_flags, editEnded) end

--- Variante de uiInputFloat4 avec step/step_fast gérés par l'éditeur ; renseigne editEnded.
---Source : lua/ge/extensions/editor/api/gui.lua:1718
---@param label string libellé / id ImGui du widget
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputFloat4Ex(label, v, step, step_fast, format, flags, editEnded) end

--- Variante de uiInputFloat avec step/step_fast gérés par l'éditeur ; renseigne editEnded.
---Source : lua/ge/extensions/editor/api/gui.lua:1610
---@param label string libellé / id ImGui du widget
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputFloatEx(label, v, step, step_fast, format, flags, editEnded) end

--- Enveloppe de imgui.InputInt (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:661
---@param label string libellé / id ImGui du widget
---@param v any
---@param step any
---@param step_fast any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputInt(label, v, step, step_fast, extra_flags, editEnded) end

--- Enveloppe de imgui.InputInt2 (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:673
---@param label string libellé / id ImGui du widget
---@param v any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputInt2(label, v, extra_flags, editEnded) end

--- Enveloppe de imgui.InputInt3 (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:680
---@param label string libellé / id ImGui du widget
---@param v any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputInt3(label, v, extra_flags, editEnded) end

--- Enveloppe de imgui.InputInt4 (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:687
---@param label string libellé / id ImGui du widget
---@param v any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputInt4(label, v, extra_flags, editEnded) end

--- Enveloppe de imgui.InputScalar (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:701
---@param label string libellé / id ImGui du widget
---@param data_type any
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputScalar(label, data_type, v, step, step_fast, format, extra_flags, editEnded) end

--- Enveloppe de imgui.InputScalarN (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:708
---@param label string libellé / id ImGui du widget
---@param data_type any
---@param v any
---@param components any
---@param step any
---@param step_fast any
---@param format any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputScalarN(label, data_type, v, components, step, step_fast, format, extra_flags, editEnded) end

--- Champ de recherche (icône loupe + texte + bouton d'effacement) de largeur fixe. Renvoie true si le texte a changé ou a été effacé.
---Source : lua/ge/extensions/editor/api/gui.lua:715
---@param label string|nil info-bulle
---@param text cdata buffer ImGui ArrayChar
---@param width number largeur en pixels
---@param extra_flags integer|nil flags InputText
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputSearch(label, text, width, extra_flags, editEnded) end

--- Comme uiInputSearch mais édite un ImGuiTextFilter et le reconstruit (ImGuiTextFilter_Build) à chaque changement.
---Source : lua/ge/extensions/editor/api/gui.lua:747
---@param label string|nil info-bulle
---@param txtfilter cdata ImGuiTextFilter
---@param width number largeur
---@param extra_flags integer|nil flags
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputSearchTextFilter(label, txtfilter, width, extra_flags, editEnded) end

--- Enveloppe de imgui.InputText (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:607
---@param label string libellé / id ImGui du widget
---@param buf any
---@param buf_size any
---@param flags any
---@param callback any
---@param user_data any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputText(label, buf, buf_size, flags, callback, user_data, editEnded) end

--- Enveloppe de imgui.InputTextMultiline (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:614
---@param label string libellé / id ImGui du widget
---@param buf any
---@param buf_size any
---@param size any
---@param flags any
---@param callback any
---@param user_data any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputTextMultiline(label, buf, buf_size, size, flags, callback, user_data, editEnded) end

--- Enveloppe de imgui.InputTextMultilineReadOnly (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé.
---Source : lua/ge/extensions/editor/api/gui.lua:621
---@param label string libellé / id ImGui du widget
---@param buf any
---@param size any
---@param flags any
---@param callback any
---@param user_data any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiInputTextMultilineReadOnly(label, buf, size, flags, callback, user_data, editEnded) end

--- Enveloppe de imgui.PlotLines1 : courbe de floats ; valeurs par défaut offset 0, échelle FLT_MAX, stride sizeof(float) ; auto_resize adapte la taille à la fenêtre.
---Source : lua/ge/extensions/editor/api/gui.lua:965
---@param string_label string libellé
---@param float_values cdata tableau de floats
---@param int_values_count integer nombre de valeurs
---@param int_values_offset any
---@param string_overlay_text any
---@param float_scale_min any
---@param float_scale_max any
---@param ImVec2_graph_size any
---@param int_stride any
---@param auto_resize boolean|nil remplir la fenêtre si graph_size est nil
function editor_api_gui_editor.uiPlotLines1(string_label, float_values, int_values_count, int_values_offset, string_overlay_text, float_scale_min, float_scale_max, ImVec2_graph_size, int_stride, auto_resize) end

--- Dessine des lignes de fond de couleurs alternées dans la fenêtre/l'enfant courant (technique de ocornut/imgui#2668). Doit être entouré de Begin/BeginChild ... End/EndChild.
---Source : lua/ge/extensions/editor/api/gui.lua:2148
---@param lineHeight number hauteur d'une ligne
---@param mOddColor ImVec4|nil couleur des lignes impaires
---@param mEvenColor ImVec4|nil couleur des lignes paires
function editor_api_gui_editor.uiRenderAlternateRows(lineHeight, mOddColor, mEvenColor) end

--- Enveloppe de imgui.SliderAngle (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:830
---@param label string libellé / id ImGui du widget
---@param v_rad any
---@param v_degrees_min any
---@param v_degrees_max any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiSliderAngle(label, v_rad, v_degrees_min, v_degrees_max, editEnded) end

--- Enveloppe de imgui.SliderFloat (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:802
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiSliderFloat(label, v, v_min, v_max, format, power, editEnded) end

--- Enveloppe de imgui.SliderFloat2 (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:809
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiSliderFloat2(label, v, v_min, v_max, format, power, editEnded) end

--- Enveloppe de imgui.SliderFloat3 (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:816
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiSliderFloat3(label, v, v_min, v_max, format, power, editEnded) end

--- Enveloppe de imgui.SliderFloat4 (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:823
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiSliderFloat4(label, v, v_min, v_max, format, power, editEnded) end

--- Enveloppe de imgui.SliderInt (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:837
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiSliderInt(label, v, v_min, v_max, format, editEnded) end

--- Enveloppe de imgui.SliderInt2 (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:844
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiSliderInt2(label, v, v_min, v_max, format, editEnded) end

--- Enveloppe de imgui.SliderInt3 (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:851
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiSliderInt3(label, v, v_min, v_max, format, editEnded) end

--- Enveloppe de imgui.SliderInt4 (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:858
---@param label string libellé / id ImGui du widget
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiSliderInt4(label, v, v_min, v_max, format, editEnded) end

--- Enveloppe de imgui.SliderScalar (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:865
---@param label string libellé / id ImGui du widget
---@param data_type any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiSliderScalar(label, data_type, v, v_min, v_max, format, power, editEnded) end

--- Enveloppe de imgui.SliderScalarN (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:872
---@param label string libellé / id ImGui du widget
---@param data_type any
---@param v any
---@param components any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiSliderScalarN(label, data_type, v, components, v_min, v_max, format, power, editEnded) end

--- Affiche un texte (coloré si color non nil) avec une police ImGui nommée.
---Source : lua/ge/extensions/editor/api/gui.lua:106
---@param color ImVec4|nil couleur
---@param text string texte
---@param fontName string nom de police (voir getFontList)
function editor_api_gui_editor.uiTextColoredWithFont(color, text, fontName) end

--- Affiche un texte aligné à droite de la zone disponible.
---Source : lua/ge/extensions/editor/api/gui.lua:97
---@param string_label string texte
---@param bool_sameLine boolean|nil true = sur la même ligne
---@param offset number|nil décalage en pixels
function editor_api_gui_editor.uiTextUnformattedRightAlign(string_label, bool_sameLine, offset) end

--- Enveloppe de imgui.VSliderFloat (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:879
---@param label string libellé / id ImGui du widget
---@param size any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiVSliderFloat(label, size, v, v_min, v_max, format, power, editEnded) end

--- Enveloppe de imgui.VSliderInt (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:886
---@param label string libellé / id ImGui du widget
---@param size any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiVSliderInt(label, size, v, v_min, v_max, format, editEnded) end

--- Enveloppe de imgui.VSliderScalar (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui.
---Source : lua/ge/extensions/editor/api/gui.lua:893
---@param label string libellé / id ImGui du widget
---@param size any
---@param data_type any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil si fourni, reçoit true quand l'édition vient de se terminer (IsItemDeactivatedAfterEdit)
---@return boolean  true si modifié ce frame
function editor_api_gui_editor.uiVSliderScalar(label, size, data_type, v, v_min, v_max, format, power, editEnded) end

--- Dessine un séparateur vertical sur la ligne courante.
---Source : lua/ge/extensions/editor/api/gui.lua:263
---@param float_height number|nil hauteur (taille de police par défaut)
---@param vec2_offset ImVec2|nil décalage
---@param width number|nil épaisseur (1)
function editor_api_gui_editor.uiVertSeparator(float_height, vec2_offset, width) end

--- Désenregistre une fenêtre pour qu'elle ne soit plus dans l'état sauvegardé. À appeler juste après imgui.Begin si la fenêtre n'est plus visible ; pour simplement la cacher, utiliser hideWindow.
---Source : lua/ge/extensions/editor/api/gui.lua:1068
---@param windowName string nom
function editor_api_gui_editor.unregisterWindow(windowName) end

