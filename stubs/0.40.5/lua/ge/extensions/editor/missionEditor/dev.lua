---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/dev.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-fenêtre des notes de développement.
---@class editor_missionEditor_dev
local editor_missionEditor_dev = {}

--- Dessine le texte multiligne, le sélecteur de mode et la case « Dev Mission » (infobulle : la mission n'apparaît que si le mode dev est activé).
---Source : lua/ge/extensions/editor/missionEditor/dev.lua:20
function editor_missionEditor_dev:draw() end

--- Constructeur : mémorise la référence au missionEditor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/dev.lua:9
---@param missionEditor table Module editor_missionEditor.
function editor_missionEditor_dev:init(missionEditor) end

--- Sélectionne la mission : crée le tampon du texte (2048 caractères) et la case devMission à partir de mission.devNotes.
---Source : lua/ge/extensions/editor/missionEditor/dev.lua:14
---@param mission table Données de mission avec devNotes.
function editor_missionEditor_dev:setMission(mission) end

