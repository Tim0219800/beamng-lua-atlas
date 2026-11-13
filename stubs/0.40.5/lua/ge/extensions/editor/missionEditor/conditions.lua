---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/conditions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-fenêtre d'édition d'une condition de mission.
---@class editor_missionEditor_conditions
local editor_missionEditor_conditions = {}

--- Dessine la condition de la mission (par défaut {type='always'}) avec son libellé, de façon récursive pour les conditions imbriquées.
---Source : lua/ge/extensions/editor/missionEditor/conditions.lua:228
function editor_missionEditor_conditions:draw() end

--- Appelle setMission puis renvoie les problèmes : aucune condition définie (error), ou condition réglée sur « never » (error).
---Source : lua/ge/extensions/editor/missionEditor/conditions.lua:46
---@param m table Données de mission.
---@return table[]  Éléments {label, severity}.
function editor_missionEditor_conditions:getMissionIssues(m) end

--- Constructeur : mémorise missionEditor, le champ édité et le libellé affiché, puis charge toutes les conditions disponibles depuis gameplay/missions/unlocks/conditions/.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/conditions.lua:27
---@param missionEditor table Module editor_missionEditor.
---@param field string Nom du champ de la mission (par exemple 'startCondition' ou 'visibleCondition').
---@param name string Libellé affiché dans la colonne de gauche.
function editor_missionEditor_conditions:init(missionEditor, field, name) end

--- Sélectionne la mission à éditer et vide le cache des champs de saisie.
---Source : lua/ge/extensions/editor/missionEditor/conditions.lua:41
---@param mission table Données de mission.
function editor_missionEditor_conditions:setMission(mission) end

