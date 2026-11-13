---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/fenceStyles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Styles de clôture déclaratifs pour les outils de l'éditeur (clôtures, rambardes). Chaque style donne la hauteur de poteau (qui choisit la forme cuite fence_post_sq_*), la bande de hauteur des lisses, le nombre de lisses et l'espacement par défaut des poteaux. Fournit aussi le calcul des hauteurs de lisses selon un préréglage de disposition.
--- Accès : extension `editor_toolUtilities_fenceStyles` : `extensions.load("editor_toolUtilities_fenceStyles")`, puis la globale `editor_toolUtilities_fenceStyles`
---@class editor_toolUtilities_fenceStyles
---@field styleOrder string[] Ordre d'affichage des styles : { 'postrail', 'deck' }.
---@field styles table<string, table> Définitions des styles indexées par id ('postrail', 'deck'). Champs : id, name, postHeight, railCountDefault/Min/Max, railBottom, railTop, spacingDefault.
editor_toolUtilities_fenceStyles = {}

--- Renvoie le style d'id donné, ou le style 'postrail' si l'id est inconnu.
---Source : lua/ge/extensions/editor/toolUtilities/fenceStyles.lua:84
---@param id string Id du style ('postrail' ou 'deck').
---@return table  Table du style.
function editor_toolUtilities_fenceStyles.get(id) end

--- Calcule les positions fractionnaires des lisses dans [0,1] (0 = bas, 1 = haut) pour un préréglage de disposition. Avec une seule lisse, elle est à 0.5. Les dispositions de groupe plafonnent pitchFrac à 0.9/max(1,count-2).
---Source : lua/ge/extensions/editor/toolUtilities/fenceStyles.lua:41
---@param count integer Nombre de lisses (minimum 1).
---@param layout string|nil 'pinned' (défaut, réparties de 0 à 1), 'even', 'topGroup', 'bottomGroup' ou 'split'.
---@param out table Tableau de sortie, vidé puis rempli.
---@param pitchFrac number|nil Pas fractionnaire entre lisses groupées (défaut 0.18).
---@return table  Le tableau out.
function editor_toolUtilities_fenceStyles.railFractions(count, layout, out, pitchFrac) end

--- Calcule les hauteurs Z (m) du centre des lisses pour un style, un nombre de lisses et une disposition. Pour les dispositions de groupe, le haut de la bande est relevé pour que la lisse du haut arrive juste sous le chapeau du poteau.
---Source : lua/ge/extensions/editor/toolUtilities/fenceStyles.lua:71
---@param style table Style (voir get).
---@param count integer|nil Nombre de lisses ; défaut style.railCountDefault.
---@param layout string|nil Préréglage de disposition (voir railFractions).
---@param out table Tableau de sortie.
---@param railH number|nil Hauteur d'une lisse (m) ; sert à calculer le pas des groupes (railH * 1.25).
---@param postH number|nil Hauteur du poteau (m) ; sert à relever le haut de bande pour les dispositions de groupe.
---@return table  Le tableau out, rempli de hauteurs Z.
function editor_toolUtilities_fenceStyles.railHeights(style, count, layout, out, railH, postH) end

