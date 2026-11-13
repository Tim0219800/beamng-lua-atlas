---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cubemapEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur de cubemaps du World Editor (menu Assets > « Cubemap Editor », fenêtre « cubemapEditor »). Il liste les objets de classe CubemapData du niveau, permet de créer, enregistrer et supprimer un cubemap, d'assigner chacune des 6 faces (glisser-déposer ou bouton), et de capturer les 6 faces depuis la position de la caméra (captureCameraCubemap, résolution 128 à 2048 px, puissance de 2) avant de les assigner automatiquement. Il exporte aussi les données dans un fichier main.materials.json. Peut être ouvert par un autre outil via show(onSelectCb) pour choisir un cubemap.
--- Accès : extension `editor_cubemapEditor` : `extensions.load("editor_cubemapEditor")`, puis la globale `editor_cubemapEditor`
---@class editor_cubemapEditor
editor_cubemapEditor = {}

--- Hook appelé à chaque frame de l'éditeur : dessine la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cubemapEditor.lua:751
function editor_cubemapEditor.onEditorGui() end

--- Hook appelé à l'initialisation du World Editor : enregistre la fenêtre (750x380, masquée) et l'entrée de menu « Cubemap Editor » dans le groupe Assets.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cubemapEditor.lua:745
function editor_cubemapEditor.onEditorInitialized() end

--- Ouvre la fenêtre de l'éditeur de cubemaps. Charge la liste des cubemaps au premier appel, présélectionne celui dont le nom est donné (sinon le premier si rien n'est sélectionné). Si un callback est fourni, la fenêtre affiche des boutons Select/Cancel ; Select appelle le callback avec le nom du cubemap et ferme la fenêtre.
---Source : lua/ge/extensions/editor/cubemapEditor.lua:734
---@param onSelectCb function|nil appelé avec le nom (string) du cubemap choisi
---@param preselectName string|nil nom du cubemap à présélectionner
function editor_cubemapEditor.show(onSelectCb, preselectName) end

