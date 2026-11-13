---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/foliagePicker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sélecteur imgui partagé d'espèces (ForestItemData du niveau) pour les outils de végétation de l'éditeur. Affiche une liste à cocher avec un curseur de poids par espèce cochée, plus des boutons (tout cocher, tout décocher, rescanner). Il lit et écrit les tables target.species et target.speciesWeights.
--- Accès : extension `editor_toolUtilities_foliagePicker` : `extensions.load("editor_toolUtilities_foliagePicker")`, puis la globale `editor_toolUtilities_foliagePicker`
---@class editor_toolUtilities_foliagePicker
editor_toolUtilities_foliagePicker = {}

--- Dessine le sélecteur pour la cible : liste à cocher, curseurs de poids (0 à 1) et boutons tout cocher / tout décocher / rescanner. À appeler à chaque frame depuis le code imgui d'un outil.
---Source : lua/ge/extensions/editor/toolUtilities/foliagePicker.lua:53
---@param target table Cible avec les tables .species et .speciesWeights.
---@param opts table id (obligatoire, suffixe d'id imgui unique), height (px), onBeginEdit() -> jeton d'annulation, onCommit(label, jeton) pour l'historique, onChange() pour marquer l'état modifié.
function editor_toolUtilities_foliagePicker.draw(target, opts) end

--- Renvoie la liste d'espèces en cache, en la scannant si elle est vide.
---Source : lua/ge/extensions/editor/toolUtilities/foliagePicker.lua:32
---@return string[]  Noms des ForestItemData du niveau.
function editor_toolUtilities_foliagePicker.getList() end

--- Rescanne les ForestItemData du niveau et remplit le cache partagé.
---Source : lua/ge/extensions/editor/toolUtilities/foliagePicker.lua:26
---@return string[]  Liste des noms d'espèces.
function editor_toolUtilities_foliagePicker.refresh() end

--- Coche une espèce (avec le poids par défaut 1.0 si elle n'en a pas) ou la décoche.
---Source : lua/ge/extensions/editor/toolUtilities/foliagePicker.lua:38
---@param target table Cible avec les tables species et speciesWeights.
---@param nm string Nom de l'espèce.
---@param on boolean true pour cocher, false pour décocher.
function editor_toolUtilities_foliagePicker.setTicked(target, nm, on) end

