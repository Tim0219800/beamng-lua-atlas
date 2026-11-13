---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraTransform.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petite fenêtre d'éditeur « Camera Transform » (menu Camera). Elle lit la position/rotation de la caméra en JSON (commands.getCameraTransformJson), permet de l'éditer ou de la copier dans le presse-papiers, et de téléporter la caméra libre vers un JSON saisi (commands.setFreeCameraTransformJson).
--- Accès : extension `editor_cameraTransform` : `extensions.load("editor_cameraTransform")`, puis la globale `editor_cameraTransform`
---@class editor_cameraTransform
editor_cameraTransform = {}

--- Appelé à l'activation de l'éditeur ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraTransform.lua:46
function editor_cameraTransform.onEditorActivated() end

--- Appelé à la désactivation de l'éditeur ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraTransform.lua:50
function editor_cameraTransform.onEditorDeactivated() end

--- Dessine la fenêtre : boutons « Get Camera Transform », « GoTo » et « Copy », et un champ de texte contenant le JSON de la transformation. Appelé à chaque frame par l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraTransform.lua:18
function editor_cameraTransform.onEditorGui() end

--- Ajoute l'entrée de menu « Camera Transform » (groupe Camera) et enregistre la fenêtre 600x200.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraTransform.lua:54
function editor_cameraTransform.onEditorInitialized() end

