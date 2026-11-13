---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionLabelOverlay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dessine les étiquettes (panneaux sombres à bordure colorée) de l'outil Easy Select avec la drawList imgui. Les étiquettes « followMouse » sont empilées près du curseur (décalage 18 px, côté gauche si elles sortent du viewport) ; les autres sont ancrées au-dessus de leur position écran. Les étiquettes prioritaires (label.priority == true) passent en premier.
--- Accès : extension `editor_ezObjectSelect_selectionLabelOverlay` : `extensions.load("editor_ezObjectSelect_selectionLabelOverlay")`, puis la globale `editor_ezObjectSelect_selectionLabelOverlay`
---@class editor_ezObjectSelect_selectionLabelOverlay
editor_ezObjectSelect_selectionLabelOverlay = {}

--- Dessine toutes les étiquettes de la liste.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionLabelOverlay.lua:68
---@param drawList ImDrawList* Liste de dessin imgui
---@param labels table Liste d'étiquettes {text, color (U32), followMouse, priority, position (ImVec2, si non followMouse)}
---@param mouse ImVec2 Position de la souris
---@param viewport ImGuiViewport Viewport (Pos et Size) servant à garder les étiquettes visibles
function editor_ezObjectSelect_selectionLabelOverlay.draw(drawList, labels, mouse, viewport) end

