---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assetManagementTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil d'éditeur « Asset Management Tool » (menu Window > Assets, fenêtre 1200x900) destiné à la gestion des fichiers assets et des fichiers lien (link files, pour le dépôt SVN de BeamNG). Onglets : Duplicated Assets (visible seulement en devMode), Link Checker, Delinker, Relinker, Link Files Cleanup, Naming Checker. Il s'appuie sur FS:hashFile, FS:findLinkFiles, FS:convertLinkFileToTargetCopy, FS:copyFile, etc. Outil interne de développement, peu utile à un mod.
--- Accès : extension `editor_assetManagementTool` : `extensions.load("editor_assetManagementTool")`, puis la globale `editor_assetManagementTool`
---@class editor_assetManagementTool
editor_assetManagementTool = {}

--- Hook appelé à l'activation de l'éditeur ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetManagementTool.lua:1989
function editor_assetManagementTool.onEditorActivated() end

--- Hook appelé à chaque frame de l'éditeur : dessine la fenêtre à onglets (Duplicated Assets si devMode, Link Checker, Delinker, Relinker, Link Files Cleanup, Naming Checker) et les dialogues modaux associés (ex. confirmation de retrait d'assets de la liste).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetManagementTool.lua:1639
function editor_assetManagementTool.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre 'assetManagementTool' et ses ~15 fenêtres modales, ajoute l'entrée de menu « Asset Management Tool » (groupe Assets) et charge la liste de doublons sauvegardée (loadDuplicatesList).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetManagementTool.lua:1996
function editor_assetManagementTool.onEditorInitialized() end

--- Hook appelé au chargement de l'extension ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assetManagementTool.lua:2017
function editor_assetManagementTool.onExtensionLoaded() end

