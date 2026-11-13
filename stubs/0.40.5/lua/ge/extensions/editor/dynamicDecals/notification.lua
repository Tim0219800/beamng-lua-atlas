---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/notification.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre de notifications de l'outil Dynamic Decals (« Dynamic Decals - Notifications »). Les autres modules appellent add(section, titre, message, niveau) ; les messages sont regroupés par section dans des en-têtes repliables, colorés selon le niveau (log blanc, warning jaune, error rouge), supprimables un par un ou tous ensemble. La fenêtre s'ouvre toute seule à l'ajout d'un message et se ferme quand la liste est vide.
--- Accès : extension `editor_dynamicDecals_notification` : `extensions.load("editor_dynamicDecals_notification")`, puis la globale `editor_dynamicDecals_notification`
---@class editor_dynamicDecals_notification
---@field levels table<string, integer> Niveaux de gravité : log = 1, warning = 2, error = 3.
editor_dynamicDecals_notification = {}

--- Ajoute une notification dans la section donnée et marque la fenêtre à ouvrir à la prochaine frame.
---Source : lua/ge/extensions/editor/dynamicDecals/notification.lua:97
---@param section string Nom de la section (clé de regroupement).
---@param title string Titre affiché devant le message.
---@param msg string|function Texte, ou fonction qui dessine le contenu.
---@param level integer|nil Une valeur de levels ; défaut levels.log.
function editor_dynamicDecals_notification.add(section, title, msg, level) end

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/notification.lua:84
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_notification.editorPreferenceValueChanged(path, value) end

--- Dessine la fenêtre de notifications. Enregistré auprès de l'outil via tool.registerOnEditorGuiFn et appelé à chaque frame d'interface de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/notification.lua:31
function editor_dynamicDecals_notification.onGui() end

--- Ne déclare aucune préférence (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/notification.lua:78
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_notification.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : enregistre onGui et déclare la fenêtre éditeur (450x650).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/notification.lua:88
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_notification.setup(tool_in) end

