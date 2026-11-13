# `editor_api_gui`

*Fichier : `lua/ge/extensions/editor/api/gui.lua` · VM : Game Engine (GE) · 2251 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_gui` : `extensions.load("editor_api_gui")`, puis la globale `editor_api_gui`

Coeur de l'interface ImGui de l'éditeur de niveau : gestion des fenêtres d'outils (enregistrement, affichage/masquage, groupes, modales, sauvegarde/chargement de l'état du layout), boucle de présentation (`presentGui` : dockspace principal puis hooks onEditorGui*), atlas d'icônes (`editor.icons`) et un grand nombre d'enveloppes `editor.ui*` autour des widgets ImGui (drag, input, slider, couleur) qui renseignent en plus un BoolPtr `editEnded` quand l'édition se termine. Un moddeur d'outil d'éditeur s'en sert pour déclarer ses fenêtres (`editor.registerWindow`, `editor.beginWindow`/`endWindow`) et dessiner ses widgets. `initialize` installe tout sur l'objet `editor`.

## Exemple

```lua
-- onEditorInitialized
editor.registerWindow("myToolWindow", imgui.ImVec2(300, 200))
-- onEditorGui
if editor.beginWindow("myToolWindow", "My Tool") then
  -- widgets...
end
editor.endWindow()
```

## Remarques

- Tout l'API est exposé comme editor.xxx (installé par initialize) ; les paramètres editEnded sont des imgui.BoolPtr optionnels.
- endWindow/endModalWindow doivent toujours être appelés, même si beginWindow a renvoyé false.
- Les fenêtres modales sont sauvegardées invisibles ; elles ne réapparaissent qu'avec openModalWindow.
- Le commentaire de showWindow dit « sets the visible boolean to false » alors que la fonction met la visibilité à true (ou à `show`).
- uiIconImageButton sans libellé génère un id automatique par frame ; passer un `id` explicite si le nombre/ordre des boutons change.
- Les helpers getTemp* partagent un tampon par type : ne pas conserver le pointeur au-delà de l'appel de widget.
- Hooks émis : onEditorGui(dtReal, dtSim, dtRaw), onEditorGuiMainMenu, onEditorGuiToolBar, onEditorGuiStatusBar, onEditorToolWindowShow/Hide/GotFocus/LostFocus(windowName), onEditorSaveWindowsState, onEditorLoadWindowsState, onEditorSaveGuiInstancerState, onEditorLoadGuiInstancerState, onWindowResized(ImVec2).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_gui.initialize(editorInstance)` | Mémorise l'éditeur, initialise l'état et installe toutes les fonctions ci-dessous sur `editor`. *(interne)* | 2206 |
| `editor_api_gui.presentGui(dtReal, dtSim, dtRaw)` | Présente toute l'interface de l'éditeur : resynchronise editor.keyModifiers depuis ImGui, crée le dockspace principal, puis émet onEditorGuiMainMenu, onEditorGuiToolBar, onEditorGui(dtReal, dtSim, dtRaw), onEditorGuiStatusBar et vérifie le redimensionnement. Appelé chaque frame par l'éditeur. *(interne)* | 466 |

### Détail des paramètres

#### `editor_api_gui.initialize(editorInstance)`

Mémorise l'éditeur, initialise l'état et installe toutes les fonctions ci-dessous sur `editor`.

- `editorInstance` (*table*) : objet `editor`

#### `editor_api_gui.presentGui(dtReal, dtSim, dtRaw)`

Présente toute l'interface de l'éditeur : resynchronise editor.keyModifiers depuis ImGui, crée le dockspace principal, puis émet onEditorGuiMainMenu, onEditorGuiToolBar, onEditorGui(dtReal, dtSim, dtRaw), onEditorGuiStatusBar et vérifie le redimensionnement. Appelé chaque frame par l'éditeur.

- `dtReal` (*number*) : delta temps réel (s)
- `dtSim` (*number*) : delta temps simulation (s)
- `dtRaw` (*number*) : delta temps brut (s)

## Classe `editor`

Fonctions ajoutées à `editor` par initialize.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.IsItemClicked(int_mouse_button)` | Vrai si le dernier item est survolé et que le bouton vient d'être cliqué. | 985 |
| `editor.IsItemDoubleClicked(int_mouse_button)` | Vrai si le dernier item est survolé et double-cliqué. | 980 |
| `editor.beginModalWindow(windowName, title, flags, noClose)` | Comme beginWindow pour une fenêtre modale : ouvre le popup si la fenêtre est marquée visible. | 1243 |
| `editor.beginWindow(windowName, title, flags, noClose)` | Équivalent de imgui.Begin pour une fenêtre enregistrée (titre##nom). Renvoie false si non enregistrée (avertissement) ou invisible. Toujours à associer à editor.endWindow(). | 1195 |
| `editor.callShowWindowHookForVisibleWindows()` | Émet onEditorToolWindowShow pour chaque fenêtre visible. | 1376 |
| `editor.checkWindowFocus(windowName)` | Détecte le gain/la perte de focus de la fenêtre ImGui courante et émet onEditorToolWindowGotFocus / onEditorToolWindowLostFocus. | 1178 |
| `editor.checkWindowResize()` | Détecte un changement de taille de la fenêtre principale et émet le hook onWindowResized(ImVec2 DisplaySize). | 426 |
| `editor.closeModalDialog()` | Ferme le dialogue modal générique et désenregistre sa fenêtre. | 1408 |
| `editor.closeModalWindow(windowName)` | Cache la fenêtre modale et ferme le popup ImGui courant. | 1274 |
| `editor.createIconAtlas()` | Charge l'atlas d'icônes de l'éditeur (JSON + image) et remplit editor.icons, editor.atlasWidth, editor.atlasHeight. Logue les icônes en double. | 70 |
| `editor.defocusFocusedWindow()` | Retire le focus aux fenêtres marquées focalisées (émet onEditorToolWindowLostFocus). | 1384 |
| `editor.drawBrush(brushType, pos, radius, numberOfSegments, color, terrainBlock, brushRatio, brushRotation, onlyTerrain)` | Dessine un pinceau (type 'ellipse' ou boîte) au sol autour de pos, collé au terrain (terrainBlock) ou à la géométrie statique par raycast. | 299 |
| `editor.endModalWindow()` | Ferme une fenêtre modale (imgui.EndPopup si elle était affichée). | 1262 |
| `editor.endWindow()` | Ferme la fenêtre ouverte par beginWindow (appelle imgui.End si Begin a été appelé). À appeler même si beginWindow a renvoyé false. | 1252 |
| `editor.getDefaultIconButtonSize()` | Renvoie la taille par défaut des boutons d'icône. | 61 |
| `editor.getFontList()` | Liste les polices ImGui disponibles. | 991 |
| `editor.getSceneViewportRightEdge(screenY)` | Renvoie la coordonnée X du bord droit de la vue 3D à la hauteur écran donnée, en tenant compte des fenêtres ancrées à droite. | 446 |
| `editor.getTempBool_BoolBool(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : bool -> pointeur bool ; nil -> bool lu. | 1795 |
| `editor.getTempBool_StringString(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : string/bool -> pointeur bool ("1" = true) ; nil -> "1" ou "0". | 1811 |
| `editor.getTempCharPtr(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : string -> pointeur char ; nil -> string. | 2071 |
| `editor.getTempFloatArray2_StringString(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : string -> pointeur/tableau de float[2] ; nil -> string. | 1912 |
| `editor.getTempFloatArray2_TableTable(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : table -> pointeur/tableau de float[2] ; nil -> table. | 1933 |
| `editor.getTempFloatArray3_TableTable(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : table -> pointeur/tableau de float[3] ; nil -> table. | 1951 |
| `editor.getTempFloatArray3_Vec3Vec3(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : vec3 -> pointeur/tableau de float[3] ; nil -> vec3. | 1969 |
| `editor.getTempFloatArray4_StringString(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : string -> pointeur/tableau de float[4] ; nil -> string. | 2007 |
| `editor.getTempFloatArray4_TableTable(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : table -> pointeur/tableau de float[4] ; nil -> table. | 1985 |
| `editor.getTempFloat_NumberNumber(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : number -> pointeur float ; nil -> number. | 1884 |
| `editor.getTempFloat_StringString(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : string -> pointeur float ; nil -> number. | 1895 |
| `editor.getTempImVec4_TableImVec4(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : table -> ImVec4 ; nil -> ImVec4. | 2093 |
| `editor.getTempImVec4_TableTable(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : table -> pointeur/tableau de float (ImVec4) ; nil -> table. | 2049 |
| `editor.getTempIntArray2_StringString(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : string -> pointeur/tableau d'int[2] ; nil -> string. | 1863 |
| `editor.getTempInt_NumberNumber(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : number -> pointeur int ; nil -> number. | 1835 |
| `editor.getTempInt_StringString(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : string -> pointeur int ; nil -> number. | 1846 |
| `editor.getTempTextureObj(value)` | Aide pour les widgets ImGui : convertit une valeur Lua en pointeur ImGui temporaire réutilisé (un seul tampon partagé par type, valable le temps d'un appel de widget). Conversion : chemin string -> objet texture ; nil -> objet texture courant. | 2082 |
| `editor.getWindowVisibleBoolPtr(windowName)` | Renvoie le imgui.BoolPtr de visibilité de la fenêtre (utilisé par imgui.Begin), ou nil. | 1084 |
| `editor.hideAllWindows()` | Cache toutes les fenêtres enregistrées visibles (émet les hooks). | 1107 |
| `editor.hideWindow(windowName)` | Cache la fenêtre et émet onEditorToolWindowLostFocus puis onEditorToolWindowHide. | 1095 |
| `editor.isViewportFocused()` | Vrai si aucun item ImGui n'est actif. | 442 |
| `editor.isViewportHovered()` | Vrai si la souris est sur la vue 3D du jeu uniquement (aucun item ni fenêtre ImGui survolé). | 438 |
| `editor.isWindowRegistered(windowName)` | Vrai si la fenêtre est enregistrée. | 1029 |
| `editor.isWindowVisible(windowName)` | Vrai si la fenêtre est enregistrée et visible ; déclenche aussi les hooks Show/Hide si la visibilité a changé (ex. fermeture par la croix). | 1072 |
| `editor.loadWindowsState(customFilename, toolName)` | Recharge l'état des fenêtres (retombe sur settings/<outil>/layouts/Default/windowsState.json si le fichier manque ou a une version différente), masque d'abord toutes les fenêtres, puis émet onEditorLoadWindowsState et onEditorLoadGuiInstancerState. | 1312 |
| `editor.modalDialogWindowUi()` | Dessine le dialogue modal générique ; appelé par l'éditeur. | 1415 |
| `editor.openModalDialog(title, windowSize, uiFunction)` | Ouvre un dialogue modal générique (fenêtre editorModalDialog) dont le contenu est dessiné par uiFunction. | 1401 |
| `editor.openModalWindow(windowName)` | Ouvre la fenêtre modale (showWindow). | 1270 |
| `editor.registerModalWindow(windowName, defaultSize, defaultPos, centered, toolName)` | Enregistre une fenêtre modale (raccourci de registerWindow avec modal = true). | 1041 |
| `editor.registerWindow(windowName, defaultSize, defaultPos, defaultVisibleBoolean, modal, centered, groupName, toolName)` | Enregistre une fenêtre d'outil (à appeler dans onEditorInitialized). Conserve la visibilité précédente si elle existe déjà. | 1013 |
| `editor.saveWindowsState(customFilename, toolName)` | Sauvegarde l'état des fenêtres (visibilité, taille, position, instances GUI) en JSON ; les modales sont sauvegardées invisibles. Émet onEditorSaveGuiInstancerState et onEditorSaveWindowsState. | 1279 |
| `editor.screenToClient(pt2i)` | Convertit un point écran en point client via le Canvas (identité si les viewports ImGui sont désactivés). | 511 |
| `editor.setDefaultIconButtonSize(size)` | Définit la taille (carrée) par défaut des boutons d'icône. | 65 |
| `editor.setKeyModifier(mod, pressed)` | Enregistre l'état d'une touche modificatrice dans editor.keyModifiers (appelé par l'action map de l'éditeur). Note : presentGui resynchronise ctrl/shift/alt chaque frame depuis ImGui. | 2133 |
| `editor.setWindowGroup(windowName, groupName)` | Change le groupe d'une fenêtre enregistrée. | 1393 |
| `editor.setWindowGroupVisibility(groupName, visible)` | Affiche ou masque toutes les fenêtres d'un groupe. | 1142 |
| `editor.setWindowVisibility(windowName, visible)` | Alias de showWindow(windowName, visible). | 1138 |
| `editor.setupWindow(windowName)` | Applique taille et position par défaut (Cond_FirstUseEver, ou centrage) ; à appeler avant imgui.Begin. Peut forcer le dépliage selon la préférence ui.general.forceExpandWindowOnFirstShow. | 1152 |
| `editor.showVizHelperWindow()` | Ouvre la fenêtre d'aide à la visibilité (editor_vizHelper) si l'extension est chargée. | 257 |
| `editor.showWindow(windowName, show)` | Affiche (ou masque si show == false) la fenêtre et émet onEditorToolWindowShow / onEditorToolWindowHide. | 1119 |
| `editor.texObj(path)` | Charge une texture et renvoie ses informations ; nil si le chargement échoue. | 40 |
| `editor.uiButtonRightAlign(string_label, ImVec2_size, bool_sameLine, id, offset)` | Bouton aligné à droite de la zone disponible. | 116 |
| `editor.uiColorButton(desc_id, col, flags, size, editEnded)` | Enveloppe de imgui.ColorButton (couleur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 957 |
| `editor.uiColorEdit3(label, col, flags, editEnded)` | Enveloppe de imgui.ColorEdit3 (couleur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 902 |
| `editor.uiColorEdit4(label, col, flags, editEnded)` | Enveloppe de imgui.ColorEdit4 (couleur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 909 |
| `editor.uiColorEdit8(label, col, flags, editEnded)` | Enveloppe de imgui.ColorEdit8 (couleur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 917 |
| `editor.uiColorPicker3(label, col, flags, editEnded)` | Enveloppe de imgui.ColorPicker3 (couleur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 943 |
| `editor.uiColorPicker4(label, col, flags, ref_col, editEnded)` | Enveloppe de imgui.ColorPicker4 (couleur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 950 |
| `editor.uiDragFloat(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Enveloppe de imgui.DragFloat (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 521 |
| `editor.uiDragFloat2(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Enveloppe de imgui.DragFloat2 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 528 |
| `editor.uiDragFloat3(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Enveloppe de imgui.DragFloat3 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 535 |
| `editor.uiDragFloat4(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Enveloppe de imgui.DragFloat4 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 542 |
| `editor.uiDragFloatRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags, editEnded)` | Enveloppe de imgui.DragFloatRange2 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 549 |
| `editor.uiDragInt(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Enveloppe de imgui.DragInt (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 556 |
| `editor.uiDragInt2(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Enveloppe de imgui.DragInt2 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 563 |
| `editor.uiDragInt3(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Enveloppe de imgui.DragInt3 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 570 |
| `editor.uiDragInt4(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Enveloppe de imgui.DragInt4 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 577 |
| `editor.uiDragIntRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags, editEnded)` | Enveloppe de imgui.DragIntRange2 (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 584 |
| `editor.uiDragScalar(label, data_type, v, v_speed, v_min, v_max, format, flags, editEnded)` | Enveloppe de imgui.DragScalar (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 591 |
| `editor.uiDragScalarN(label, data_type, v, components, v_speed, v_min, v_max, format, flags, editEnded)` | Enveloppe de imgui.DragScalarN (glisser pour modifier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 598 |
| `editor.uiHelpButton(topicName, relativeUrl, size)` | Bouton d'aide : ouvre https://documentation.beamng.com/<relativeUrl> dans le navigateur (index par défaut). | 249 |
| `editor.uiHighlightedText(text, highlightText, textColor)` | Affiche un texte en surlignant en jaune plusieurs occurrences (insensible à la casse, une dizaine au plus) de highlightText. | 158 |
| `editor.uiIconImage(icon, size, col, borderCol, label)` | Dessine une icône de l'atlas de l'éditeur (taille 32x32 par défaut, multipliée par imgui.uiscale). | 130 |
| `editor.uiIconImageButton(icon, size, col, label, backgroundCol, id, textColor, textBG, onRelease, highlightText)` | Bouton à icône (avec ou sans libellé). Sans id fourni, un id automatique par frame est généré. onRelease = clic détecté au relâchement. | 191 |
| `editor.uiInputDouble(label, v, step, step_fast, format, extra_flags, editEnded)` | Enveloppe de imgui.InputDouble (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 694 |
| `editor.uiInputFile(label, buf, width, dir, extFilter, flags, editEnded)` | Champ de chemin de fichier avec bouton '...' ouvrant editor_fileDialog.openFile ; écrit le chemin choisi dans buf. | 757 |
| `editor.uiInputFloat(label, v, step, step_fast, format, extra_flags, editEnded)` | Enveloppe de imgui.InputFloat (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 628 |
| `editor.uiInputFloat2(label, v, format, extra_flags, editEnded)` | Enveloppe de imgui.InputFloat2 (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 640 |
| `editor.uiInputFloat2Ex(label, v, step, step_fast, format, flags, editEnded)` | Variante de uiInputFloat2 avec step/step_fast gérés par l'éditeur ; renseigne editEnded. | 1639 |
| `editor.uiInputFloat3(label, v, format, extra_flags, editEnded)` | Enveloppe de imgui.InputFloat3 (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 647 |
| `editor.uiInputFloat3Ex(label, v, step, step_fast, format, flags, editEnded)` | Variante de uiInputFloat3 avec step/step_fast gérés par l'éditeur ; renseigne editEnded. | 1676 |
| `editor.uiInputFloat4(label, v, format, extra_flags, editEnded)` | Enveloppe de imgui.InputFloat4 (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 654 |
| `editor.uiInputFloat4Ex(label, v, step, step_fast, format, flags, editEnded)` | Variante de uiInputFloat4 avec step/step_fast gérés par l'éditeur ; renseigne editEnded. | 1718 |
| `editor.uiInputFloatEx(label, v, step, step_fast, format, flags, editEnded)` | Variante de uiInputFloat avec step/step_fast gérés par l'éditeur ; renseigne editEnded. | 1610 |
| `editor.uiInputInt(label, v, step, step_fast, extra_flags, editEnded)` | Enveloppe de imgui.InputInt (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 661 |
| `editor.uiInputInt2(label, v, extra_flags, editEnded)` | Enveloppe de imgui.InputInt2 (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 673 |
| `editor.uiInputInt3(label, v, extra_flags, editEnded)` | Enveloppe de imgui.InputInt3 (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 680 |
| `editor.uiInputInt4(label, v, extra_flags, editEnded)` | Enveloppe de imgui.InputInt4 (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 687 |
| `editor.uiInputScalar(label, data_type, v, step, step_fast, format, extra_flags, editEnded)` | Enveloppe de imgui.InputScalar (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 701 |
| `editor.uiInputScalarN(label, data_type, v, components, step, step_fast, format, extra_flags, editEnded)` | Enveloppe de imgui.InputScalarN (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 708 |
| `editor.uiInputSearch(label, text, width, extra_flags, editEnded)` | Champ de recherche (icône loupe + texte + bouton d'effacement) de largeur fixe. Renvoie true si le texte a changé ou a été effacé. | 715 |
| `editor.uiInputSearchTextFilter(label, txtfilter, width, extra_flags, editEnded)` | Comme uiInputSearch mais édite un ImGuiTextFilter et le reconstruit (ImGuiTextFilter_Build) à chaque changement. | 747 |
| `editor.uiInputText(label, buf, buf_size, flags, callback, user_data, editEnded)` | Enveloppe de imgui.InputText (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 607 |
| `editor.uiInputTextMultiline(label, buf, buf_size, size, flags, callback, user_data, editEnded)` | Enveloppe de imgui.InputTextMultiline (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 614 |
| `editor.uiInputTextMultilineReadOnly(label, buf, size, flags, callback, user_data, editEnded)` | Enveloppe de imgui.InputTextMultilineReadOnly (saisie clavier) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui ; renvoie true si la valeur a changé. | 621 |
| `editor.uiPlotLines1(string_label, float_values, int_values_count, int_values_offset, string_overlay_text, float_scale_min, float_scale_max, ImVec2_graph_size, int_stride, auto_resize)` | Enveloppe de imgui.PlotLines1 : courbe de floats ; valeurs par défaut offset 0, échelle FLT_MAX, stride sizeof(float) ; auto_resize adapte la taille à la fenêtre. | 965 |
| `editor.uiRenderAlternateRows(lineHeight, mOddColor, mEvenColor)` | Dessine des lignes de fond de couleurs alternées dans la fenêtre/l'enfant courant (technique de ocornut/imgui#2668). Doit être entouré de Begin/BeginChild ... End/EndChild. | 2148 |
| `editor.uiSliderAngle(label, v_rad, v_degrees_min, v_degrees_max, editEnded)` | Enveloppe de imgui.SliderAngle (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 830 |
| `editor.uiSliderFloat(label, v, v_min, v_max, format, power, editEnded)` | Enveloppe de imgui.SliderFloat (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 802 |
| `editor.uiSliderFloat2(label, v, v_min, v_max, format, power, editEnded)` | Enveloppe de imgui.SliderFloat2 (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 809 |
| `editor.uiSliderFloat3(label, v, v_min, v_max, format, power, editEnded)` | Enveloppe de imgui.SliderFloat3 (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 816 |
| `editor.uiSliderFloat4(label, v, v_min, v_max, format, power, editEnded)` | Enveloppe de imgui.SliderFloat4 (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 823 |
| `editor.uiSliderInt(label, v, v_min, v_max, format, editEnded)` | Enveloppe de imgui.SliderInt (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 837 |
| `editor.uiSliderInt2(label, v, v_min, v_max, format, editEnded)` | Enveloppe de imgui.SliderInt2 (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 844 |
| `editor.uiSliderInt3(label, v, v_min, v_max, format, editEnded)` | Enveloppe de imgui.SliderInt3 (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 851 |
| `editor.uiSliderInt4(label, v, v_min, v_max, format, editEnded)` | Enveloppe de imgui.SliderInt4 (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 858 |
| `editor.uiSliderScalar(label, data_type, v, v_min, v_max, format, power, editEnded)` | Enveloppe de imgui.SliderScalar (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 865 |
| `editor.uiSliderScalarN(label, data_type, v, components, v_min, v_max, format, power, editEnded)` | Enveloppe de imgui.SliderScalarN (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 872 |
| `editor.uiTextColoredWithFont(color, text, fontName)` | Affiche un texte (coloré si color non nil) avec une police ImGui nommée. | 106 |
| `editor.uiTextUnformattedRightAlign(string_label, bool_sameLine, offset)` | Affiche un texte aligné à droite de la zone disponible. | 97 |
| `editor.uiVSliderFloat(label, size, v, v_min, v_max, format, power, editEnded)` | Enveloppe de imgui.VSliderFloat (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 879 |
| `editor.uiVSliderInt(label, size, v, v_min, v_max, format, editEnded)` | Enveloppe de imgui.VSliderInt (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 886 |
| `editor.uiVSliderScalar(label, size, data_type, v, v_min, v_max, format, power, editEnded)` | Enveloppe de imgui.VSliderScalar (curseur) qui renseigne editEnded en plus. Mêmes paramètres qu'ImGui. | 893 |
| `editor.uiVertSeparator(float_height, vec2_offset, width)` | Dessine un séparateur vertical sur la ligne courante. | 263 |
| `editor.unregisterWindow(windowName)` | Désenregistre une fenêtre pour qu'elle ne soit plus dans l'état sauvegardé. À appeler juste après imgui.Begin si la fenêtre n'est plus visible ; pour simplement la cacher, utiliser hideWindow. | 1068 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorGui` — écouté par 103 module(s)
- `onEditorGuiMainMenu` — écouté par 1 module(s)
- `onEditorGuiStatusBar`
- `onEditorGuiToolBar` — écouté par 2 module(s)
- `onEditorLoadGuiInstancerState` — écouté par 2 module(s)
- `onEditorLoadWindowsState`
- `onEditorSaveGuiInstancerState` — écouté par 2 module(s)
- `onEditorSaveWindowsState`
- `onEditorToolWindowGotFocus` — écouté par 4 module(s)
- `onEditorToolWindowHide` — écouté par 10 module(s)
- `onEditorToolWindowLostFocus` — écouté par 2 module(s)
- `onEditorToolWindowShow` — écouté par 3 module(s)
- `onWindowResized` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `debugDrawer:` `drawQuadSolid`
- `scenetree.` `findObject`
- `ui_imgui.` `GetIO`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/gui.lua`.*
