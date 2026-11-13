---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/cameraBookmarks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Panneau imgui de signets de caméra pour l'outil Easy Select. Permet d'ajouter la position/rotation courante de la caméra (core_camera.getPosition / getQuat), de renommer, de retourner à un signet, de le mettre à jour ou de le supprimer. Les signets ne vivent qu'en mémoire (table locale) : ils ne sont pas sauvegardés.
--- Accès : extension `editor_ezObjectSelect_cameraBookmarks` : `extensions.load("editor_ezObjectSelect_cameraBookmarks")`, puis la globale `editor_ezObjectSelect_cameraBookmarks`
---@class editor_ezObjectSelect_cameraBookmarks
editor_ezObjectSelect_cameraBookmarks = {}

--- Dessine le panneau « Camera Bookmarks » (champ de nom, bouton Add Current Position, liste, Rename, Go To, Update View, Delete). Go To vide les entrées/mouvements de la caméra puis fixe position et rotation via core_camera.setPosition/setRotation. À appeler chaque frame depuis une fenêtre imgui.
---Source : lua/ge/extensions/editor/ezObjectSelect/cameraBookmarks.lua:43
function editor_ezObjectSelect_cameraBookmarks.draw() end

