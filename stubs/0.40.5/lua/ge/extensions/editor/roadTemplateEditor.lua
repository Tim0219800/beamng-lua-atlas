---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadTemplateEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur de modèles de routes (menu Fenêtre > Roads > « Road Template Editor »). Permet de choisir, sauvegarder (« Save », « Save as... »), créer (« New ») et supprimer un modèle de route (fichier .road.json) composé de DecalRoads, de décorations et de decals ; les champs se modifient dans la fenêtre Inspector. Dépend de editor_roadEditor et s'appuie sur editor_roadUtils (rechargement des modèles). Quand la fenêtre est masquée, le modèle courant est désélectionné et ses objets temporaires supprimés.
--- Accès : extension `editor_roadTemplateEditor` : `extensions.load("editor_roadTemplateEditor")`, puis la globale `editor_roadTemplateEditor`
---@class editor_roadTemplateEditor
---@field dependencies string[] {"editor_roadEditor"} : extensions chargées avant celle-ci.
editor_roadTemplateEditor = {}

--- Appelé à chaque image : si la fenêtre « roadTemplateEditor » est masquée, désélectionne le modèle ; sinon dessine la fenêtre « Road Templates » avec les boutons Choose Template, Save, Save as..., New, Delete et le choix des routes/décorations/decals du modèle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadTemplateEditor.lua:182
function editor_roadTemplateEditor.onEditorGui() end

--- Appelé à l'initialisation de l'éditeur : ajoute l'entrée de menu « Road Template Editor » (groupe Roads) et enregistre la fenêtre (200x400).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadTemplateEditor.lua:407
function editor_roadTemplateEditor.onEditorInitialized() end

--- Enregistre la catégorie de préférences « roadTemplates » avec la sous-catégorie « general » et la case loadTemplates (bool, false par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadTemplateEditor.lua:412
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_roadTemplateEditor.onEditorRegisterPreferences(prefsRegistry) end

