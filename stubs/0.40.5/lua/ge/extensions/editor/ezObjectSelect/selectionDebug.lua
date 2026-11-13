---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dessin de debug et de retour visuel de l'outil Easy Select dans le monde 3D (debugDrawer) : boîtes des objets découverts, de la pile de candidats, de l'objet choisi, des objets sélectionnés ou en cours de glisser, objets filtrés car trop grands, axes de la sélection (X rouge, Y vert, Z bleu) et anneau de distance maximale autour de la caméra. Le dessin 2D de debug est délégué au module selectionScreenDebug.
--- Accès : extension `editor_ezObjectSelect_selectionDebug` : `extensions.load("editor_ezObjectSelect_selectionDebug")`, puis la globale `editor_ezObjectSelect_selectionDebug`
---@class editor_ezObjectSelect_selectionDebug
editor_ezObjectSelect_selectionDebug = {}

--- Délègue à selectionScreenDebug.draw(snapshot, options) le debug en overlay 2D.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionDebug.lua:275
---@param snapshot table|nil Snapshot
---@param options table Options
function editor_ezObjectSelect_selectionDebug.drawScreen(snapshot, options) end

--- Dessine dans le monde les boîtes et axes décrits par le snapshot de sélection et les options. Les boîtes sont tracées en lignes si options.outlineMode == 1 (sinon remplies).
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionDebug.lua:177
---@param snapshot table|nil État de sélection : discovery, candidates, pick, filteredLarge, camera
---@param options table outlineMode, selectedIds, draggingIds, depthTest, dragDepthTest, selectedDepthTest, showFilteredLarge, debugEnabled, maxDiscoveryOutlines, maxStackOutlines, showSelectionAxes, axisLocal, axisLengthScale, axisLineWidth, showDistanceRing, maxDistance
function editor_ezObjectSelect_selectionDebug.drawWorld(snapshot, options) end

--- Réinitialise l'état de selectionScreenDebug.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionDebug.lua:279
function editor_ezObjectSelect_selectionDebug.reset() end

