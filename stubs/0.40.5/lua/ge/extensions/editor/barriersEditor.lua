---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/barriersEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Barriers Selector » (menu Gameplay > Barriers Editor) pour choisir les prefabs de barrières d'un niveau. Elle cherche dans /levels/<niveau>/ les fichiers .prefab correspondant à un motif (défaut *barrier*), les instancie temporairement pour relever la position des TSStatic, puis les affiche en deux listes (non sélectionnés / sélectionnés) avec des sphères de debug dans la vue. Un mode d'édition « Barriers Selection » permet de cliquer dans la vue (clic = bascule, Maj = ajouter seulement, Alt = retirer seulement). Des entrées de menu synchronisent la sélection avec l'éditeur de courses (editor_raceEditor, champ path.prefabs).
--- Accès : extension `editor_barriersEditor` : `extensions.load("editor_barriersEditor")`, puis la globale `editor_barriersEditor`
---@class editor_barriersEditor
---@field onExtensionLoaded nil Vaut nil : référence à une variable locale jamais définie.
editor_barriersEditor = {}

--- Fonction vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/barriersEditor.lua:303
---@param data any Non utilisé.
function editor_barriersEditor.onDeserialized(data) end

--- Appelé chaque frame de l'éditeur : dessine la fenêtre (menus Load / Race Editor, deux listes de prefabs, boutons > et <) et les sphères de debug de chaque prefab.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/barriersEditor.lua:77
function editor_barriersEditor.onEditorGui() end

--- Enregistre la fenêtre (1500x700), l'entrée de menu « Barriers Editor » (groupe Gameplay) et le mode d'édition « Barriers Selection » avec ses raccourcis souris.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/barriersEditor.lua:286
function editor_barriersEditor.onEditorInitialized() end

--- Fonction vide (ne renvoie rien).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/barriersEditor.lua:300
function editor_barriersEditor.onSerialize() end

--- Désélectionne les objets de l'éditeur et affiche la fenêtre « Barriers Selector ».
---Source : lua/ge/extensions/editor/barriersEditor.lua:281
function editor_barriersEditor.show() end

