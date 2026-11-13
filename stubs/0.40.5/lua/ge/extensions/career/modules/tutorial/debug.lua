---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/debug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Menu de debug imgui du tutoriel de carrière. Il affiche l'étape courante, des boutons pour démarrer/avancer/terminer le tutoriel, sauter à une étape, ouvrir l'écran de signature de contrat, simuler un véhicule endommagé ou une sortie de zone, et gérer l'affichage des zones de limites. Il appelle aussi onDebugMenu(im) de l'extension de l'étape courante si elle en a un.
--- Accès : extension `career_modules_tutorial_debug` : `extensions.load("career_modules_tutorial_debug")`, puis la globale `career_modules_tutorial_debug`
---@class career_modules_tutorial_debug
---@field debugName string Nom de l'onglet de debug : "Tutorial".
---@field debugOrder number Ordre d'affichage : 100.
career_modules_tutorial_debug = {}

--- Dessine le contenu imgui du menu de debug du tutoriel (appelé chaque frame par le système de debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/debug.lua:19
---@param dt number Delta temps.
function career_modules_tutorial_debug.drawDebugMenu(dt) end

