---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/imguiUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Boîte à outils ImGui de haut niveau (ui_imguiUtils) : changement d'échelle d'UI, chargement de textures, boutons-menus déroulants (DropdownButton/Selectable/Select), affichage récursif d'une table Lua en arbre ou en colonnes clé/valeur, petite appli clé/valeur, et affichage d'un flottant échantillonné avec min/max (SampleFloatDisplay). Utile pour les outils de debug en ImGui d'un moddeur. Tout passe par ui_imgui ; certaines fonctions supposent la présence de l'éditeur (editor.uiIconImageButton).
--- Accès : extension `ui_imguiUtils` : `extensions.load("ui_imguiUtils")`, puis la globale `ui_imguiUtils`
---@class ui_imguiUtils
---@field sampleFloatDisplayState table États des affichages échantillonnés, indexés par id ImGui.
ui_imguiUtils = {}

--- Crée une fenêtre ImGui simple avec un TreeNode qui affiche une table Lua clé/valeur.
---Source : lua/common/extensions/ui/imguiUtils.lua:305
---@param window string Titre de la fenêtre.
---@param section string Titre du TreeNode.
---@param tbl table Table à afficher.
---@param callback function|nil Appelé quand le TreeNode est ouvert, avant l'affichage.
function ui_imguiUtils.CreateKeyValApp(window, section, tbl, callback) end

--- Crée un afficheur de flottant échantillonné : l'objet renvoyé a une méthode draw(newValue) qui montre la valeur échantillonnée toutes les sampleTime secondes, avec infobulle (dernière, échantillonnée, min, max).
---Source : lua/common/extensions/ui/imguiUtils.lua:548
---@param sampleTimeInSeconds number|nil Intervalle d'échantillonnage, 1 par défaut.
---@param startingValue number|nil Valeur initiale, 0 par défaut.
---@param precision integer|nil Décimales, 6 par défaut.
---@return table  ValueSampler avec precision et draw.
function ui_imguiUtils.CreateSampleFloatDisplay(sampleTimeInSeconds, startingValue, precision) end

--- Affiche un bouton (texte ou icône) qui ouvre un popup listant des items DropdownItem, à placer sous le bouton ou à sa droite (horizontal).
---Source : lua/common/extensions/ui/imguiUtils.lua:61
---@param label string Texte du bouton.
---@param size ImVec2|nil Taille du bouton.
---@param items table Liste d'items DropdownItem.
---@param icon any|nil Icône ; sinon bouton texte.
---@param horizontal boolean|nil Popup à droite plutôt qu'en dessous, items sur une ligne.
---@return boolean  Voir le code : renvoie false dans les chemins observés.
function ui_imguiUtils.DropdownButton(label, size, items, icon, horizontal) end

--- Crée un élément pour DropdownButton.
---Source : lua/common/extensions/ui/imguiUtils.lua:43
---@param label string Texte.
---@param icon any|nil Icône.
---@param func function Callback appelé à la sélection.
---@param tooltip string|nil Infobulle.
---@return table  {label, icon, func, tooltip}.
function ui_imguiUtils.DropdownItem(label, icon, func, tooltip) end

--- Liste déroulante : le bouton affiche l'item courant items[selectedItem[0]] ; le popup permet d'en choisir un autre.
---Source : lua/common/extensions/ui/imguiUtils.lua:194
---@param label string Identifiant ImGui (ajouté après ##).
---@param size ImVec2|nil Taille du bouton.
---@param selectedItem table Pointeur entier (IntPtr), indice [0] = item sélectionné.
---@param items table Liste d'items avec label et icon.
---@param horizontal boolean|nil Popup à droite.
---@param excludeCurrent boolean|nil Masque l'item courant dans la liste (déduit du nom).
---@return boolean  Voir le code ; false par défaut.
function ui_imguiUtils.DropdownSelect(label, size, selectedItem, items, horizontal, excludeCurrent) end

--- Bouton ouvrant un popup d'items à cocher (DropdownSelectableItem) ; le clic droit peut ouvrir un second menu (itemsRMB).
---Source : lua/common/extensions/ui/imguiUtils.lua:114
---@param label string Texte du bouton.
---@param items table Items DropdownSelectableItem.
---@param icon any|nil Icône, sinon SmallButton.
---@param iconSize ImVec2|nil Taille d'icône avant échelle UI, 32x32 par défaut.
---@param popupWidth number|nil Largeur du popup.
---@param onChangeFunc function|nil Callback de changement.
---@param tooltip string|nil Infobulle.
---@param itemsRMB table|nil Items du menu clic droit.
---@return boolean  false dans les chemins observés.
function ui_imguiUtils.DropdownSelectable(label, items, icon, iconSize, popupWidth, onChangeFunc, tooltip, itemsRMB) end

--- Crée un élément pour DropdownSelectable.
---Source : lua/common/extensions/ui/imguiUtils.lua:52
---@param label string Texte.
---@param active boolean État sélectionné.
---@param func function Callback appelé à la sélection.
---@param tooltip string|nil Infobulle.
---@return table  {label, active, func, tooltip}.
function ui_imguiUtils.DropdownSelectableItem(label, active, func, tooltip) end

--- Teste si la souris est dans un rectangle de fenêtre donné (position + taille).
---Source : lua/common/extensions/ui/imguiUtils.lua:276
---@param windowPos ImVec2 Position, ex. im.GetWindowPos().
---@param windowSize table Taille sous forme de pointeur : windowSize[0].x / .y utilisés.
---@return boolean  Vrai si la souris est strictement à l'intérieur.
function ui_imguiUtils.IsWindowHovered(windowPos, windowSize) end

--- Version à une seule ligne de CreateSampleFloatDisplay : crée l'afficheur à la première utilisation (clé = imgui.GetID1(id)), puis le dessine avec value.
---Source : lua/common/extensions/ui/imguiUtils.lua:607
---@param id string Identifiant unique de l'affichage.
---@param value number Valeur courante.
---@param sampleTimeInSeconds number|nil Intervalle (première création).
---@param precision integer|nil Décimales (première création).
function ui_imguiUtils.SampleFloatDisplay(id, value, sampleTimeInSeconds, precision) end

--- Affiche n'importe quelle valeur Lua : tables en arbre ou en colonnes, booléens/nombres/chaînes colorés, float3, fonctions (noms des variables locales), autres types avec tostring.
---Source : lua/common/extensions/ui/imguiUtils.lua:418
---@param data any Valeur à afficher.
---@param fullpath string Chemin courant ; le nombre de « / » donne la profondeur.
---@param noColumns boolean|nil Force l'arbre plutôt que les colonnes.
---@param highlightCallback function|nil Callback de survol.
---@param itemCallback function|nil Callback begin/end par entrée.
function ui_imguiUtils.addRecursiveTreeTable(data, fullpath, noColumns, highlightCallback, itemCallback) end

--- Affiche deux textes dans deux cellules de colonne (Text puis NextColumn deux fois).
---Source : lua/common/extensions/ui/imguiUtils.lua:487
---@param a string Texte colonne 1.
---@param b string Texte colonne 2.
function ui_imguiUtils.cell(a, b) end

--- Définit l'échelle d'interface ImGui (imgui.uiscale[0]) et la FontGlobalScale de l'IO, en tenant compte de la mise à l'échelle DPI de la fenêtre selon la préférence de l'éditeur.
---Source : lua/common/extensions/ui/imguiUtils.lua:10
---@param uiscale number Échelle souhaitée (1 = 100 %).
function ui_imguiUtils.changeUIScale(uiscale) end

--- Affiche les paires clé : valeur d'une table Lua ; les sous-tables deviennent des TreeNode récursifs.
---Source : lua/common/extensions/ui/imguiUtils.lua:286
---@param tbl table|nil Table à afficher.
function ui_imguiUtils.displayKeyValues(tbl) end

--- Dessine une petite croix rouge (8 px) à une position d'écran, par défaut la position actuelle du curseur ImGui ; sert à déboguer le placement.
---Source : lua/common/extensions/ui/imguiUtils.lua:26
---@param posX number|nil X écran ; défaut : position de fenêtre + curseur X.
---@param posY number|nil Y écran ; défaut : position de fenêtre + curseur Y.
function ui_imguiUtils.drawCursorPos(posX, posY) end

--- Affiche une table en deux colonnes (clés triées / valeurs récursives).
---Source : lua/common/extensions/ui/imguiUtils.lua:351
---@param data table Table.
---@param fullpath string Chemin courant (ex. '/root'), utilisé pour les ids ImGui.
---@param highlightCallback function|nil Appelé (path, key, value) quand un élément est survolé.
---@param itemCallback function|nil Appelé (begin, path, key, value) avant (true) puis après (false) chaque entrée ; le retour de l'appel begin décide si l'entrée est affichée.
function ui_imguiUtils.keyValueTable(data, fullpath, highlightCallback, itemCallback) end

--- Charge une texture via ImTextureHandler et renvoie une table utilisable avec ImGui.
---Source : lua/common/extensions/ui/imguiUtils.lua:33
---@param path string Chemin de l'image, ex. '/ui/...png'.
---@return table  {file = nom du fichier, path, tex = ImTextureHandler, texId (hérité, ne pas utiliser), size = taille}.
function ui_imguiUtils.texObj(path) end

--- Objet interne renvoyé par CreateSampleFloatDisplay : mesure le temps, mémorise la valeur échantillonnée st et le min/max observés.
---@class ui_imguiUtils_ValueSampler
local ui_imguiUtils_ValueSampler = {}

--- Ajoute le temps écoulé, met à jour min/max avec l'échantillon, et renvoie la valeur échantillonnée.
---Source : lua/common/extensions/ui/imguiUtils.lua:523
---@param sample number Valeur courante.
---@return number  Valeur échantillonnée (mise à jour toutes les sampleTime secondes).
---@return number  Minimum observé.
---@return number  Maximum observé.
function ui_imguiUtils_ValueSampler:get(sample) end

--- Remet min/max, valeur échantillonnée et temps à zéro.
---Source : lua/common/extensions/ui/imguiUtils.lua:534
function ui_imguiUtils_ValueSampler:reset() end

