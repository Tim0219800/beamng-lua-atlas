---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/lightClassConverter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ajoute un bouton « Convert To Spot Light / Point Light » en haut de l'inspecteur quand la sélection ne contient que des PointLight ou que des SpotLight. La conversion remplace l'objet sur place en gardant l'id SimObject, le nom, le groupe parent, la transformation et les champs communs ; c'est une seule étape d'undo réversible (restauration par la sérialisation d'origine).
--- Accès : extension `editor_lightClassConverter` : `extensions.load("editor_lightClassConverter")`, puis la globale `editor_lightClassConverter`
---@class editor_lightClassConverter
---@field dependencies table<integer, string> {"editor_inspector"} : chargé après l'inspecteur pour disposer du hook de header et des API.
editor_lightClassConverter = {}

--- Dessine le bouton de conversion en haut de la fenêtre d'inspecteur (hook émis par editor_inspector). Utilise la sélection verrouillée de l'instance si elle existe, sinon editor.selection.object.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/lightClassConverter.lua:195
---@param inspectorInfo table|nil Instance d'inspecteur ; son champ selection.object est utilisé s'il existe.
function editor_lightClassConverter.onEditorInspectorHeaderGui(inspectorInfo) end

