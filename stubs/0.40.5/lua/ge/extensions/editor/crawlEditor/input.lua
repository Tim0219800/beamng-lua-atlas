---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/input.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide de l'éditeur de crawl pour la souris : à chaque appel de updateMouseInfo, calcule le rayon caméra-souris, le raycast sur la scène (forêt désactivée le temps du tir) et les états clic/maintien/relâché du bouton gauche. Les autres fichiers du crawlEditor lisent le résultat via getMouseInfo().
--- Accès : extension `editor_crawlEditor_input` : `extensions.load("editor_crawlEditor_input")`, puis la globale `editor_crawlEditor_input`
---@class editor_crawlEditor_input
editor_crawlEditor_input = {}

--- Renvoie la table mouseInfo courante.
---Source : lua/ge/extensions/editor/crawlEditor/input.lua:45
---@return table|nil  mouseInfo, ou nil avant le premier updateMouseInfo
function editor_crawlEditor_input.getMouseInfo() end

--- Met à jour la table mouseInfo (position caméra, rayon souris, raycast, états du bouton gauche). Désactive puis réactive la collision de la forêt autour du raycast.
---Source : lua/ge/extensions/editor/crawlEditor/input.lua:10
function editor_crawlEditor_input.updateMouseInfo() end

