---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/imgui_luaintf.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fichier généré (≈ 2200 lignes, ~485 fonctions) qui expose presque toute l'API Dear ImGui en Lua sous forme de wrappers très fins vers Engine.imgui (binding C++ du jeu) : NewFrame/Render, fenêtres, widgets (Text, Button, Slider*, Drag*, Input*, Combo, Tree*, Table*, Plot*), ImDrawList_*, styles (PushStyleColor*, PushStyleVar*), IO, polices, et les enums sous forme de constantes M.Xxx_Yyy (ex. WindowFlags_NoTitleBar, Col_Text, Key_*). Ce n'est pas une extension : il renvoie une fonction qui reçoit la table M d'imgui_api. Les suffixes numériques (Button/SmallButton, TreeNode1/TreeNode2, Combo1, PushStyleColor2…) correspondent aux surcharges C++ d'une même fonction.
--- Accès : `require("extensions/ui/imgui_luaintf")` (fichier sous extensions/ mais pas une extension classique)
---@class ui_imgui_luaintf
ui_imgui_luaintf = {}

--- Ouvre une fenêtre (flags 0 par défaut dans cette version ; la version custom met NoFocusOnAppearing). (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param string_name string Titre (ne peut pas être nil).
---@param bool_p_open table|nil BoolPtr optionnel.
---@param ImGuiWindowFlags_flags integer|nil Flags de fenêtre.
---@return boolean  Vrai si la fenêtre est visible.
function ui_imgui_luaintf.Begin(string_name, bool_p_open, ImGuiWindowFlags_flags) end

--- Termine la frame ImGui (géré par le moteur). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
function ui_imgui_luaintf.EndFrame() end

--- Renvoie le contexte ImGui courant. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@return userdata  Contexte.
function ui_imgui_luaintf.GetCurrentContext() end

--- Convertit une touche en index (imgui.GetKeyIndex) ; remplacée par une version no-op dans imgui_custom_luaintf. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param ImGuiKey_key integer Touche ImGui.
---@return integer  Index de touche.
function ui_imgui_luaintf.GetKeyIndex(ImGuiKey_key) end

--- Renvoie la version de Dear ImGui. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@return string  Version.
function ui_imgui_luaintf.GetVersion() end

--- Démarre une nouvelle frame ImGui (normalement géré par le moteur). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
function ui_imgui_luaintf.NewFrame() end

--- Finalise le rendu ImGui (géré par le moteur). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
function ui_imgui_luaintf.Render() end

--- Affiche la fenêtre « À propos » d'ImGui. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param bool_p_open table|nil BoolPtr optionnel.
function ui_imgui_luaintf.ShowAboutWindow(bool_p_open) end

--- Affiche la fenêtre de log de debug d'ImGui. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param bool_p_open table|nil BoolPtr optionnel.
function ui_imgui_luaintf.ShowDebugLogWindow(bool_p_open) end

--- Affiche la fenêtre de démonstration d'ImGui. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param bool_p_open table|nil BoolPtr optionnel.
function ui_imgui_luaintf.ShowDemoWindow(bool_p_open) end

--- Affiche un sélecteur de police. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param string_label string Libellé (ne peut pas être nil).
function ui_imgui_luaintf.ShowFontSelector(string_label) end

--- Affiche la fenêtre de métriques d'ImGui. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param bool_p_open table|nil BoolPtr optionnel.
function ui_imgui_luaintf.ShowMetricsWindow(bool_p_open) end

--- Affiche l'outil de pile d'ID d'ImGui. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param bool_p_open table|nil BoolPtr optionnel.
function ui_imgui_luaintf.ShowStackToolWindow(bool_p_open) end

--- Affiche l'éditeur de style d'ImGui. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param ImGuiStyle_ref userdata|nil Style à éditer, optionnel.
function ui_imgui_luaintf.ShowStyleEditor(ImGuiStyle_ref) end

--- Affiche un sélecteur de style. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param string_label string Libellé (ne peut pas être nil).
---@return boolean  Vrai si le style a changé.
function ui_imgui_luaintf.ShowStyleSelector(string_label) end

--- Affiche le guide utilisateur d'ImGui. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
function ui_imgui_luaintf.ShowUserGuide() end

--- Applique le thème classique. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param ImGuiStyle_dst userdata|nil Style cible, optionnel.
function ui_imgui_luaintf.StyleColorsClassic(ImGuiStyle_dst) end

--- Applique le thème sombre. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param ImGuiStyle_dst userdata|nil Style cible, optionnel.
function ui_imgui_luaintf.StyleColorsDark(ImGuiStyle_dst) end

--- Applique le thème clair. (assignée dynamiquement)
---Source : lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param ImGuiStyle_dst userdata|nil Style cible, optionnel.
function ui_imgui_luaintf.StyleColorsLight(ImGuiStyle_dst) end

