---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraBookmarks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre d'éditeur « Camera Bookmarks » (menu Camera). Permet de créer, copier, coller, rejoindre et supprimer des signets de caméra (objets CameraBookmark rangés dans le groupe retourné par editor.getCameraBookmarks()). L'ajout, la suppression et le collage de position passent par l'historique d'annulation de l'éditeur (editor.history:commitAction).
--- Accès : extension `editor_cameraBookmarks` : `extensions.load("editor_cameraBookmarks")`, puis la globale `editor_cameraBookmarks`
---@class editor_cameraBookmarks
editor_cameraBookmarks = {}

--- Dessine la fenêtre « Camera Bookmarks » : champ de nom + bouton Add, boutons Copy Location / Paste Location, puis la liste des signets avec Go To, Copy et Delete. Appelé à chaque frame par l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraBookmarks.lua:79
function editor_cameraBookmarks.onEditorGui() end

--- Enregistre la fenêtre (500x500) et l'entrée de menu « Camera Bookmarks » dans le groupe de menu Camera. Appelé une fois à l'initialisation de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraBookmarks.lua:133
function editor_cameraBookmarks.onEditorInitialized() end

--- Hook de chargement de l'extension ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraBookmarks.lua:130
function editor_cameraBookmarks.onExtensionLoaded() end

