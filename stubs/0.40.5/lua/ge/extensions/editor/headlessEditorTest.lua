---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/headlessEditorTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exemple de développement du mode « headless » de l'éditeur (masque menus et barres d'outils pour n'afficher que son propre outil). Le module n'exporte ses hooks que si shipping_build est faux : en build de production, il est vide. Il montre comment entrer/sortir du mode (editor.enableHeadless), dessiner sa propre barre de menu via onEditorHeadlessMainMenuBar et ouvrir une fenêtre d'outil et une barre d'outils flottante.
--- Accès : extension `editor_headlessEditorTest` : `extensions.load("editor_headlessEditorTest")`, puis la globale `editor_headlessEditorTest`
---@class editor_headlessEditorTest
editor_headlessEditorTest = {}

