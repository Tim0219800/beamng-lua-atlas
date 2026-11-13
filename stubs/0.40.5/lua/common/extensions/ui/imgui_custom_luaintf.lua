---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/imgui_custom_luaintf.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ajouts écrits à la main à l'API ImGui (par opposition à imgui_luaintf.lua, généré). Le fichier renvoie une fonction qui reçoit la table M d'imgui_api et y définit : constructeurs de valeurs/pointeurs (ImVec2, ImVec4, BoolPtr, IntPtr, FloatPtr, DoublePtr, ArrayChar, ArrayInt, ArrayFloat), versions personnalisées de Begin/InputText/InputTextMultiline/Combo1/OpenPopup/SetDragDropPayload, gestion de polices, d'échelle, de textures, aides (ShowHelpMarker, tooltip, tooltipWrapped, HighlightText, HeaderText, BeginDisabled), wrappers de moniteur/ini, et les widgets Knob. Il est chargé après imgui_luaintf, donc ses définitions écrasent celles du fichier généré.
--- Accès : `require("extensions/ui/imgui_custom_luaintf")` (fichier sous extensions/ mais pas une extension classique)
---@class ui_imgui_custom_luaintf
ui_imgui_custom_luaintf = {}

--- Crée un tampon texte (string.buffer) de taille len, éventuellement pré-rempli avec val. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param len integer Taille en octets.
---@param val string|nil Texte initial.
---@return userdata  string.buffer.
function ui_imgui_custom_luaintf.ArrayChar(len, val) end

--- Tableau de flottants indexé depuis 0, initialisé à 0. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param size integer Taille.
---@return table  Tableau [0..size-1].
function ui_imgui_custom_luaintf.ArrayFloat(size) end

--- Tableau d'entiers indexé depuis 0, initialisé à 0. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param size integer Taille.
---@return table  Tableau [0..size-1].
function ui_imgui_custom_luaintf.ArrayInt(size) end

--- Ouvre une fenêtre ImGui. Flags par défaut : WindowFlags_NoFocusOnAppearing. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param string_name string Titre/identifiant.
---@param bool_p_open table|nil BoolPtr pour la croix de fermeture.
---@param ImGuiWindowFlags_flags integer|nil Flags de fenêtre.
---@return boolean  Vrai si le contenu doit être dessiné.
function ui_imgui_custom_luaintf.Begin(string_name, bool_p_open, ImGuiWindowFlags_flags) end

--- Début d'une zone désactivée (true par défaut). (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param disable boolean|nil Désactive si vrai ou nil.
function ui_imgui_custom_luaintf.BeginDisabled(disable) end

--- Crée un pointeur booléen {[0]=bool} (0/1 convertis, autre type -> false). (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param x boolean|number Valeur initiale.
---@return table  {[0]=bool}
function ui_imgui_custom_luaintf.BoolPtr(x) end

--- Liste déroulante sur un tableau de chaînes ; items_count calculé avec #items si nil, hauteur max -1 par défaut. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param label string Libellé.
---@param current_item table IntPtr de l'élément courant.
---@param items table Tableau de chaînes.
---@param items_count integer|nil Nombre d'éléments.
---@param popup_max_height_in_items integer|nil -1 par défaut.
---@return boolean  Vrai si changé.
function ui_imgui_custom_luaintf.Combo1(label, current_item, items, items_count, popup_max_height_in_items) end

--- Crée un pointeur double {[0]=n}. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param x number Valeur initiale.
---@return table  {[0]=n}
function ui_imgui_custom_luaintf.DoublePtr(x) end

--- Fin de zone désactivée. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
function ui_imgui_custom_luaintf.EndDisabled() end

--- Crée un pointeur flottant {[0]=n} (0 si x n'est pas un nombre). (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param x number Valeur initiale.
---@return table  {[0]=n}
function ui_imgui_custom_luaintf.FloatPtr(x) end

--- Largeur disponible (GetContentRegionAvail().x). (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@return number  Largeur.
function ui_imgui_custom_luaintf.GetContentRegionAvailWidth() end

--- Affiche un texte d'en-tête avec la police cairo_regular_medium ; couleur par défaut ImVec4(1,0.6,0,8,0.75). (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param text string Texte.
---@param color ImVec4|nil Couleur.
function ui_imgui_custom_luaintf.HeaderText(text, color) end

--- Comme HighlightText mais dessine en plus un fond de surbrillance quand l'élément est survolé (Col_HeaderHovered/HeaderActive) ou sélectionné (Col_Header). Ne renvoie rien. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param label string Texte.
---@param highlightText string Sous-chaîne.
---@param selected boolean État sélectionné.
function ui_imgui_custom_luaintf.HighlightSelectable(label, highlightText, selected) end

--- Affiche label avec la sous-chaîne highlightText en orange (matchColor). Si highlightText est vide, tout le label est coloré. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param label string Texte.
---@param highlightText string Sous-chaîne à surligner.
function ui_imgui_custom_luaintf.HighlightText(label, highlightText) end

--- Crée un ImColor depuis des composantes 0-255 (alpha 255 par défaut) et renseigne Value en 0-1. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param r number Rouge 0-255.
---@param g number Vert 0-255.
---@param b number Bleu 0-255.
---@param a number|nil Alpha 0-255.
---@return ImColor  Couleur.
function ui_imgui_custom_luaintf.ImColorByRGB(r, g, b, a) end

--- Écrit io.FontGlobalScale. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param io userdata Résultat de GetIO().
---@param value number Échelle.
function ui_imgui_custom_luaintf.ImGuiIO_FontGlobalScale(io, value) end

--- Crée un handler de texture et lui affecte path comme identifiant. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param path string Chemin de la texture.
---@return userdata  ImTextureHandler (méthodes getID, getSize…).
function ui_imgui_custom_luaintf.ImTextureHandler(path) end

--- Indique si la texture est déjà en cache. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param path string Chemin.
---@return boolean  Vrai si en cache.
function ui_imgui_custom_luaintf.ImTextureHandlerIsCached(path) end

--- Crée un ImVec2 (x, y). (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param x number X.
---@param y number Y.
---@return ImVec2  Vecteur.
function ui_imgui_custom_luaintf.ImVec2(x, y) end

--- Crée un ImVec4 (x, y, z, w). (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param x number X / R.
---@param y number Y / G.
---@param z number Z / B.
---@param w number W / A.
---@return ImVec4  Vecteur.
function ui_imgui_custom_luaintf.ImVec4(x, y, z, w) end

--- Champ texte sur un tampon ArrayChar ; taille par défaut 2^32, flags 0. Le callback est ignoré. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param label string Libellé.
---@param buf userdata Tampon ArrayChar.
---@param buf_size integer|nil Taille max.
---@param flags integer|nil InputTextFlags.
---@param callback any Ignoré.
---@param user_data any Données utilisateur.
---@param editEnded any Non utilisé.
---@return boolean  Vrai si modifié.
function ui_imgui_custom_luaintf.InputText(label, buf, buf_size, flags, callback, user_data, editEnded) end

--- Champ texte multiligne ; taille (0,0) et flags 0 par défaut. Le callback est ignoré. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param label string Libellé.
---@param buf userdata Tampon ArrayChar.
---@param buf_size integer|nil Taille max.
---@param size ImVec2|nil Taille.
---@param flags integer|nil Flags.
---@param callback any Ignoré.
---@param user_data any Données utilisateur.
---@return boolean  Vrai si modifié.
function ui_imgui_custom_luaintf.InputTextMultiline(label, buf, buf_size, size, flags, callback, user_data) end

--- Crée un pointeur entier {[0]=n} (0 si x n'est pas un nombre). (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param x number Valeur initiale.
---@return table  {[0]=n}
function ui_imgui_custom_luaintf.IntPtr(x) end

--- Bouton rotatif (knob) pour un flottant. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param string_label string Libellé.
---@param floatPtr_value table FloatPtr.
---@param float_v_min number Min.
---@param float_v_max number Max.
---@param float_speed number|nil Vitesse.
---@param string_format string|nil Format d'affichage.
---@param ImGuiKnobVariant_variant integer|nil KnobVariant_*.
---@param float_size number|nil Taille.
---@param ImGuiKnobFlags_flags integer|nil KnobFlags_*.
---@param int_steps integer|nil Nombre de crans.
---@return boolean  Vrai si la valeur change.
function ui_imgui_custom_luaintf.Knob(string_label, floatPtr_value, float_v_min, float_v_max, float_speed, string_format, ImGuiKnobVariant_variant, float_size, ImGuiKnobFlags_flags, int_steps) end

--- Knob pour un entier ; mêmes paramètres que Knob avec un IntPtr. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param string_label string Libellé.
---@param intPtr_value table IntPtr.
---@param int_v_min integer Min.
---@param int_v_max integer Max.
---@param float_speed number|nil Vitesse.
---@param string_format string|nil Format.
---@param ImGuiKnobVariant_variant integer|nil KnobVariant_*.
---@param float_size number|nil Taille.
---@param ImGuiKnobFlags_flags integer|nil KnobFlags_*.
---@param int_steps integer|nil Crans.
---@return boolean  Vrai si la valeur change.
function ui_imgui_custom_luaintf.KnobInt(string_label, intPtr_value, int_v_min, int_v_max, float_speed, string_format, ImGuiKnobVariant_variant, float_size, ImGuiKnobFlags_flags, int_steps) end

--- Définit le payload de glisser-déposer ; erreur loguée si type ou data est nil ; cond 0 par défaut. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param string_type string Type de payload.
---@param void_data any Données.
---@param size_t_sz integer Taille.
---@param ImGuiCond_cond integer|nil Condition.
---@return boolean  Résultat d'imgui.SetDragDropPayload.
function ui_imgui_custom_luaintf.SetDragDropPayload(string_type, void_data, size_t_sz, ImGuiCond_cond) end

--- Affiche « (?) » grisé ; au survol, infobulle avec desc sur 35 caractères de large. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param desc string Texte d'aide.
---@param sameLine boolean|nil Si true, SameLine avant.
function ui_imgui_custom_luaintf.ShowHelpMarker(desc, sameLine) end

--- Renvoie la taille du moniteur courant. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@return ImVec2  Taille en pixels.
function ui_imgui_custom_luaintf.getCurrentMonitorSize() end

--- Id du viewport principal. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@return integer  Id.
function ui_imgui_custom_luaintf.getMainViewPortId() end

--- Index du moniteur (imgui.getMonitorIndex). (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@return integer  Index.
function ui_imgui_custom_luaintf.getMonitorIndex() end

--- Charge les réglages ImGui (.ini) depuis un fichier. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param filename string Chemin.
function ui_imgui_custom_luaintf.loadIniSettingsFromDisk(filename) end

--- Enregistre les réglages ImGui (.ini) dans un fichier. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param filename string Chemin.
function ui_imgui_custom_luaintf.saveIniSettingsToDisk(filename) end

--- Si l'élément précédent est survolé, affiche message en infobulle (SetTooltip). (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param message string Texte.
function ui_imgui_custom_luaintf.tooltip(message) end

--- Comme tooltip mais avec retour à la ligne à wrapWidth pixels (350 par défaut, multiplié par uiscale[0]). (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param message string Texte.
---@param wrapWidth number|nil Largeur de retour à la ligne.
function ui_imgui_custom_luaintf.tooltipWrapped(message, wrapWidth) end

