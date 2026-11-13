---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteLibrary.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Save, Save As et Open pour les outils de site à document unique. Un bâtiment massing, un espace ouvert et un parking sont chacun UN document dont la maison est un dossier d'étagère de bibliothèque (voir siteAssets) : Save réécrit par-dessus sans demander, Save As nomme un nouveau dossier et le suit, Open remplace tout le document. Le placeur de sites dresse les copies, l'éditeur découpe l'original. new(cfg) fabrique, pour chaque outil, une liaison avec les mêmes trois boutons, icônes et libellés.
--- Accès : extension `editor_toolUtilities_siteLibrary` : `extensions.load("editor_toolUtilities_siteLibrary")`, puis la globale `editor_toolUtilities_siteLibrary`
---@class editor_toolUtilities_siteLibrary
editor_toolUtilities_siteLibrary = {}

--- Fabrique la liaison d'un outil à son étagère. Renvoie une table avec les fonctions : save(doc, name) (écrit le document dans la bibliothèque sous un nom, qui est aussi son dossier ; un seul chemin pour Save, Save As et Rename ; renvoie ok), open(dir) (rouvre un site cuit depuis son model.json et s'y lie ; renvoie ok, erreur), buttons(doc) (dessine Save, Save As, Open), settle() (ouvre le dossier choisi avant tout dessin), unbind() (détache du site ouvert et marque modifié), saveOnLeave(doc) (à la sortie de l'éditeur : réécrit le site s'il a changé, ou lui donne un nom libre, avec suffixe numérique), boundName() (nom du dossier lié ou nil), boundPath() (dossier lié), attachment() (liaison et état modifié), reattach(at) et setOnOpened(fn) (à lancer une fois un document chargé).
---Source : lua/ge/extensions/editor/toolUtilities/siteLibrary.lua:35
---@param cfg table { toolId, kind, noun, stateKey, editMode, hasContent, bakeRun, applyState, rename }.
---@return table  Liaison avec save, open, buttons, settle, unbind, saveOnLeave, boundName, boundPath, attachment, reattach, setOnOpened.
function editor_toolUtilities_siteLibrary.new(cfg) end

