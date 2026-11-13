---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/input.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère l'entrée souris de l'éditeur de drag race pour l'édition de zones : à chaque mise à jour, calcule le rayon caméra-souris, le raycast sur la scène et les états clic/maintien/relâchement du bouton gauche. Le résultat est lu par l'éditeur de zone via getMouseInfo.
--- Accès : extension `editor_dragRaceEditor_input` : `extensions.load("editor_dragRaceEditor_input")`, puis la globale `editor_dragRaceEditor_input`
---@class editor_dragRaceEditor_input
editor_dragRaceEditor_input = {}

--- Renvoie la table mouseInfo courante.
---Source : lua/ge/extensions/editor/dragRaceEditor/input.lua:44
---@return table|nil  nil tant que updateMouseInfo n'a jamais été appelé.
function editor_dragRaceEditor_input.getMouseInfo() end

--- Recalcule la table mouseInfo : camPos, ray, rayDir, rayCast, valid, down, hold, up et les positions/normales _downPos, _holdPos, _upPos, _downNormal, _holdNormal, _upNormal.
---Source : lua/ge/extensions/editor/dragRaceEditor/input.lua:6
function editor_dragRaceEditor_input.updateMouseInfo() end

