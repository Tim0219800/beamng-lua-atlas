---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionStartPositionEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode d'édition « Edit Mission Start Position » du World Editor (icône drapeau). Il dessine avec debugDrawer une sphère et le nom pour chaque mission dont startTrigger.level est le niveau courant, et permet de déplacer le point de départ de la mission sélectionnée : clic-glisser, ou Ctrl+clic pour poser directement à la position de la souris (raycast caméra). Chaque déplacement est enregistré dans l'historique d'annulation de l'éditeur (editor.history). Un bouton déplace aussi toutes les missions situées à moins de 10 m de la mission sélectionnée vers sa position.
--- Accès : extension `editor_missionStartPositionEditor` : `extensions.load("editor_missionStartPositionEditor")`, puis la globale `editor_missionStartPositionEditor`
---@class editor_missionStartPositionEditor
editor_missionStartPositionEditor = {}

--- Hook appelé à l'initialisation de l'éditeur : déclare le mode d'édition missionStartPositionEditMode (action map « MissionStartPositionEditor », onActivate, onDeactivate, onUpdate, onToolbar).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionStartPositionEditor.lua:267
function editor_missionStartPositionEditor.onEditorInitialized() end

--- Définit la mission sélectionnée dans ce mode d'édition (utile pour l'éditeur de missions).
---Source : lua/ge/extensions/editor/missionStartPositionEditor.lua:284
---@param mission table|nil Mission (avec startTrigger.pos) ou nil pour désélectionner.
function editor_missionStartPositionEditor.setSelectedMission(mission) end

