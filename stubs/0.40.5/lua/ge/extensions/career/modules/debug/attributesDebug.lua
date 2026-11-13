---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/attributesDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onglet de debug carrière « Attributes ». Affiche l'argent, la BeamXP, les vouchers et l'XP de chaque branche avec des boutons de triche (+/-) qui appellent career_modules_playerAttributes.addAttributes avec les tags 'cheat'. Le menu 'Branches > Branch Order' liste les branches triées et ouvre leur fichier dans l'explorateur.
--- Accès : extension `career_modules_debug_attributesDebug` : `extensions.load("career_modules_debug_attributesDebug")`, puis la globale `career_modules_debug_attributesDebug`
---@class career_modules_debug_attributesDebug
---@field debugName string Titre de l'onglet : 'Attributes'.
---@field debugOrder number Ordre de tri dans la fenêtre de debug (0).
career_modules_debug_attributesDebug = {}

--- Dessine le sous-menu ImGui 'Branches > Branch Order' : pour chaque branche triée, bouton Edit (Engine.Platform.exploreFolder sur branch.file) et ligne cliquable qui fait dump(branch).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/attributesDebug.lua:9
function career_modules_debug_attributesDebug.drawDebugFunctions() end

--- Dessine les compteurs money, beamXP, vouchers et ceux de chaque branche (avec son niveau) avec boutons d'ajout/retrait (ex. +100000 argent, +1000 XP, +5/+100/+500 par branche).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/attributesDebug.lua:25
function career_modules_debug_attributesDebug.drawDebugMenu() end

