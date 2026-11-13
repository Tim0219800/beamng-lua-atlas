---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/textEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de l'éditeur qui fournit une fenêtre « Text Editor » multiligne pour modifier le contenu texte d'un champ d'objet de la scène (ex. un champ long d'un objet). Elle s'enregistre en exposant editor.newTextEditorInstance(objIds, fieldName). Le bouton Ok applique la valeur via objectHistoryActions.changeObjectFieldWithUndo (annulable), Cancel ferme sans rien changer.
--- Accès : extension `editor_textEditor` : `extensions.load("editor_textEditor")`, puis la globale `editor_textEditor`
---@class editor_textEditor
editor_textEditor = {}

--- Hook appelé après rechargement : recrée une instance par entrée de l'état sauvegardé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/textEditor.lua:84
---@param state table Résultat de onSerialize.
function editor_textEditor.onDeserialize(state) end

--- Hook appelé à chaque frame de l'interface de l'éditeur : crée/affiche chaque fenêtre Text Editor ouverte, avec zone de saisie multiligne et boutons Cancel/Ok. Retire l'instance quand la fenêtre n'est plus visible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/textEditor.lua:28
function editor_textEditor.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : publie editor.newTextEditorInstance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/textEditor.lua:98
function editor_textEditor.onEditorInitialized() end

--- Hook de sérialisation (rechargement Lua) : renvoie une copie des instances ouvertes sans le tampon de texte (textInput).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/textEditor.lua:90
---@return table  Instances (objIds, fieldName) sans textInput.
function editor_textEditor.onSerialize() end

