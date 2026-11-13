---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/forestTsstaticMover.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil d'éditeur « Forest TSStatic Mover » (menu Window > Terrain) qui convertit des instances entre la forêt (ForestItem) et des objets TSStatic. Deux boutons : « Move selected ForestItems -> TSStatic » (mode Forest Tools requis) et « Move selected TSStatic -> ForestItems » (mode Object Select requis). Options : sélectionner les objets créés, déplacer toutes les instances du même mesh, ranger les TSStatic créés dans un nouveau SimGroup. L'action est enregistrée dans l'historique (annuler/rétablir).
--- Accès : extension `editor_forestTsstaticMover` : `extensions.load("editor_forestTsstaticMover")`, puis la globale `editor_forestTsstaticMover`
---@class editor_forestTsstaticMover
---@field dependencies string[] Extensions chargées avant ce module : {"core_forest"}.
editor_forestTsstaticMover = {}

--- Hook appelé chaque frame par l'éditeur : dessine la fenêtre « Forest TSStatic Mover » (mode d'édition courant, forme sélectionnée, cases à cocher, boutons de conversion grisés selon le mode, dernière erreur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/forestTsstaticMover.lua:492
function editor_forestTsstaticMover.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : ajoute l'entrée de menu « Forest TSStatic Mover » (groupe Terrain) et enregistre la fenêtre (560x260).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/forestTsstaticMover.lua:556
function editor_forestTsstaticMover.onEditorInitialized() end

