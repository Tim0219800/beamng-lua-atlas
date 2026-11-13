---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vizHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit outil pour les level designers (menu Debug > « Viz Helper ») : il pose des décalcomanies (decals) dynamiques d'images prises dans art/vizhelper/ à l'endroit visé par la souris dans la vue 3D, pour marquer des choses. Molette = rotation, Ctrl+molette = taille, Alt+molette = changer d'image, Maj = sensibilité x10, clic gauche = poser (maintenu = peindre avec une distance minimale).
--- Accès : extension `editor_vizHelper` : `extensions.load("editor_vizHelper")`, puis la globale `editor_vizHelper`
---@class editor_vizHelper
---@field windowOpen ImGui BoolPtr État ouvert/fermé de la fenêtre ; lire/écrire avec windowOpen[0].
editor_vizHelper = {}

--- Hook appelé après un rechargement Lua : restaure l'état ouvert de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vizHelper.lua:211
---@param data table table produite par onSerialize
function editor_vizHelper.onDeserialized(data) end

--- Hook de l'éditeur appelé à l'activation ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vizHelper.lua:198
function editor_vizHelper.onEditorActivated() end

--- Hook de l'éditeur appelé à la désactivation : vide savedDecals.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vizHelper.lua:201
function editor_vizHelper.onEditorDeactivated() end

--- Hook de l'éditeur appelé à chaque frame : dessine la fenêtre, gère l'entrée (molette, clic), fait un cameraMouseRayCast, dessine une sphère verte au point visé et ajoute le decal de prévisualisation ou le sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vizHelper.lua:50
function editor_vizHelper.onEditorGui() end

--- Hook de l'éditeur : ajoute l'entrée de menu « Viz Helper » (groupe Debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vizHelper.lua:185
function editor_vizHelper.onEditorInitialized() end

--- Hook d'extension appelé au chargement : liste les fichiers de art/vizhelper/ et construit la chaîne de la liste déroulante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vizHelper.lua:190
function editor_vizHelper.onExtensionLoaded() end

--- Hook appelé avant un rechargement Lua : renvoie {windowOpen = bool}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vizHelper.lua:205
---@return table  {windowOpen = boolean}
function editor_vizHelper.onSerialize() end

--- Hook d'extension appelé à chaque frame : réaffiche tous les decals sauvegardés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vizHelper.lua:173
function editor_vizHelper.onUpdate() end

--- Ouvre la fenêtre Viz Helper (windowOpen[0] = true).
---Source : lua/ge/extensions/editor/vizHelper.lua:37
function editor_vizHelper.openWindow() end

