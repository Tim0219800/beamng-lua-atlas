---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/renderViewBuffers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de debug de l'éditeur (menu Debug > « NamedTextureTarget Viewer ») pour prévisualiser les render buffers (NamedTexTargets) avec imgui : liste filtrable à gauche, aperçu à droite avec zoom/déplacement (molette, glisser), choix du canal (RGBA, R, G, B) et réinitialisation de la vue par double-clic. Utile pour inspecter les cibles de rendu, par exemple les shadow maps.
--- Accès : extension `editor_renderViewBuffers` : `extensions.load("editor_renderViewBuffers")`, puis la globale `editor_renderViewBuffers`
---@class editor_renderViewBuffers
editor_renderViewBuffers = {}

--- Hook : dessine la fenêtre (liste + aperçu) et rafraîchit la liste des cibles à l'ouverture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/renderViewBuffers.lua:274
function editor_renderViewBuffers.onEditorGui() end

--- Hook : ajoute l'entrée de menu Debug et enregistre la fenêtre (1100x700).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/renderViewBuffers.lua:297
function editor_renderViewBuffers.onEditorInitialized() end

