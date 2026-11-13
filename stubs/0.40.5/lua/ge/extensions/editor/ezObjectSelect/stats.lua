---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/stats.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Statistiques d'usage affichées dans le panneau de l'outil Easy Object Select : nombre de sélections, distance transformée, nombre de translations/rotations/mises à l'échelle, répartition opérations monde/local et rotations par touche R/molette, plus le volume cumulé (m^3) de la sélection. draw() les affiche en ImGui avec un bouton « Reset Stats ».
--- Accès : extension `editor_ezObjectSelect_stats` : `extensions.load("editor_ezObjectSelect_stats")`, puis la globale `editor_ezObjectSelect_stats`
---@class editor_ezObjectSelect_stats
editor_ezObjectSelect_stats = {}

--- Initialise le mode de coordonnées et invalide le cache de volume.
---Source : lua/ge/extensions/editor/ezObjectSelect/stats.lua:63
---@param isLocal boolean true si l'espace de coordonnées est local.
function editor_ezObjectSelect_stats.activate(isLocal) end

--- Affiche le bloc « Stats » en ImGui (volume sélectionné, compteurs, barres de progression World/Local et R/Wheel, bouton Reset Stats).
---Source : lua/ge/extensions/editor/ezObjectSelect/stats.lua:108
---@param selectedIds integer[]|nil IDs des objets sélectionnés, pour le calcul du volume.
function editor_ezObjectSelect_stats.draw(selectedIds) end

--- Force le recalcul du volume de sélection au prochain draw.
---Source : lua/ge/extensions/editor/ezObjectSelect/stats.lua:99
function editor_ezObjectSelect_stats.invalidateVolume() end

--- Enregistre une opération de transformation : incrémente le compteur monde/local, puis transforms (et la distance cumulée), rotates (avec source « r » ou « wheel ») ou scales.
---Source : lua/ge/extensions/editor/ezObjectSelect/stats.lua:77
---@param operation string "transform", "rotate" ou "scale".
---@param source string|nil Pour une rotation : "r" (touche R) ou "wheel" (molette).
---@param distance number|nil Distance parcourue (m), comptée pour "transform".
function editor_ezObjectSelect_stats.recordOperation(operation, source, distance) end

--- Incrémente le compteur de sélections et invalide le volume.
---Source : lua/ge/extensions/editor/ezObjectSelect/stats.lua:72
function editor_ezObjectSelect_stats.recordSelection() end

--- Change le mode de coordonnées utilisé pour classer les opérations (monde ou local).
---Source : lua/ge/extensions/editor/ezObjectSelect/stats.lua:68
---@param isLocal boolean true pour local.
function editor_ezObjectSelect_stats.setCoordinateMode(isLocal) end

