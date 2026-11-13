---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/docs.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre de documentation intégrée à l'outil Dynamic Decals (table des matières + contenu). Chaque module de l'outil y enregistre une page avec register({section = {...}, guiFn = fn}) ; ce module fournit aussi les pages Introduction, Getting Started et Controls (les contrôles sont lus dans les actions d'entrée de l'action map « dynamicDecals », clavier et souris). selectSection ouvre la fenêtre sur une page donnée.
--- Accès : extension `editor_dynamicDecals_docs` : `extensions.load("editor_dynamicDecals_docs")`, puis la globale `editor_dynamicDecals_docs`
---@class editor_dynamicDecals_docs
editor_dynamicDecals_docs = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/docs.lua:314
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_docs.editorPreferenceValueChanged(path, value) end

--- Masque la fenêtre de documentation.
---Source : lua/ge/extensions/editor/dynamicDecals/docs.lua:408
function editor_dynamicDecals_docs.hideWindow() end

--- Affiche une image dans la page de doc (à la largeur donnée en conservant le ratio), avec info-bulle optionnelle et légende grise.
---Source : lua/ge/extensions/editor/dynamicDecals/docs.lua:173
---@param path string Chemin de la texture.
---@param overrideWidth number|nil Largeur en pixels ; défaut toute la largeur disponible.
---@param title string|nil Texte d'info-bulle.
---@param subtitle string|nil Légende sous l'image.
function editor_dynamicDecals_docs.image(path, overrideWidth, title, subtitle) end

--- Dessine la page « Introduction » (message de bienvenue et version de l'outil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/docs.lua:197
---@param docsSection table Section de documentation courante.
function editor_dynamicDecals_docs.introductionGui(docsSection) end

--- Indique si la fenêtre de documentation est visible.
---Source : lua/ge/extensions/editor/dynamicDecals/docs.lua:412
---@return boolean  true si visible.
function editor_dynamicDecals_docs.isWindowVisible() end

--- Enregistre (ou met à jour) une page de documentation dans l'arbre des sections.
---Source : lua/ge/extensions/editor/dynamicDecals/docs.lua:328
---@param data table {section = string[], guiFn = function(docsSection), order = number|nil}.
function editor_dynamicDecals_docs.register(data) end

--- Enregistre `dynamicDecalsTool.docs` : indentSpacing (int, défaut 8, de 0 à 64) pour la table des matières et verticalSpacing (int, défaut 16, de 0 à 64).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/docs.lua:307
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_docs.registerEditorPreferences(prefsRegistry) end

--- Sélectionne une page de la documentation et, sauf si doNotOpenWindow, ouvre la fenêtre.
---Source : lua/ge/extensions/editor/dynamicDecals/docs.lua:386
---@param section string|string[] Nom de la page, ou chemin sous forme de liste de noms.
---@param doNotOpenWindow boolean|nil Si vrai, ne montre pas la fenêtre.
function editor_dynamicDecals_docs.selectSection(section, doNotOpenWindow) end

--- Appelé par l'outil : déclare la fenêtre (640x640), enregistre les callbacks d'interface et d'update, les pages Introduction (ordre 0), Getting Started (10) et Controls (20), et construit la liste des contrôles clavier/souris de l'action map dynamicDecals.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/docs.lua:278
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_docs.setup(tool_in) end

--- Trie les sections puis affiche la fenêtre de documentation.
---Source : lua/ge/extensions/editor/dynamicDecals/docs.lua:401
function editor_dynamicDecals_docs.showWindow() end

--- Insère un espace vertical de hauteur `dynamicDecalsTool.docs.verticalSpacing` (défaut 16).
---Source : lua/ge/extensions/editor/dynamicDecals/docs.lua:193
function editor_dynamicDecals_docs.verticalSpacing() end

