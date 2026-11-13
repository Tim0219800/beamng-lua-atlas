---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/transformNumericInput.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit tampon de saisie numérique au clavier pour les opérations de transformation d'Easy Object Select (comme dans Blender : taper « 2.5 » pendant un déplacement). Lit les touches chiffres (rangée du haut et pavé numérique), point/virgule décimale, moins (inverse le signe) et retour arrière via ImGui, et maintient une chaîne dans un état {text, active}.
--- Accès : extension `editor_ezObjectSelect_transformNumericInput` : `extensions.load("editor_ezObjectSelect_transformNumericInput")`, puis la globale `editor_ezObjectSelect_transformNumericInput`
---@class editor_ezObjectSelect_transformNumericInput
editor_ezObjectSelect_transformNumericInput = {}

--- Vide le texte et désactive la saisie.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformNumericInput.lua:30
---@param state table État créé par newState.
function editor_ezObjectSelect_transformNumericInput.clear(state) end

--- Crée un état de saisie vide.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformNumericInput.lua:26
---@return table  {text = "", active = false}.
function editor_ezObjectSelect_transformNumericInput.newState() end

--- Traite les touches pressées cette frame : chiffres, un seul point décimal (préfixé d'un 0 si le texte est vide ou « - »), moins qui bascule le signe, retour arrière.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformNumericInput.lua:40
---@param state table État de saisie, modifié en place.
---@param ignoreTopRowFour boolean|nil Si true, ignore la touche 4 de la rangée du haut pour cette frame (utile quand elle sert à autre chose).
---@return boolean  true si le texte a changé.
function editor_ezObjectSelect_transformNumericInput.update(state, ignoreTopRowFour) end

--- Convertit le texte saisi en nombre.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformNumericInput.lua:77
---@param state table État de saisie.
---@return number|nil  Valeur, ou nil si inactif, vide, « - » ou « . ».
function editor_ezObjectSelect_transformNumericInput.value(state) end

