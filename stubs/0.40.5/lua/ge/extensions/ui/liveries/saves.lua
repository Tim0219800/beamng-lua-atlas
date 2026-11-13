---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/saves.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les sauvegardes de livrées (éditeur de décalcomanies dynamiques) dans settings/dynamicDecals/*.dynDecals.json. Permet de lister, créer, renommer, supprimer, enregistrer et recharger une pile de calques, et mémorise le nom de la sauvegarde courante de la session d'édition. S'appuie sur l'extension editor_api_dynamicDecals pour la sérialisation réelle.
--- Accès : extension `ui_liveries_saves` : `extensions.load("ui_liveries_saves")`, puis la globale `ui_liveries_saves`
---@class ui_liveries_saves
ui_liveries_saves = {}

--- Oublie la sauvegarde courante et la skin préparée (stagedApplySkinName).
---Source : lua/ge/extensions/ui/liveries/saves.lua:115
function ui_liveries_saves.clearCurrentSave() end

--- Renvoie le nom de la skin préparée par un save avec applySkin et l'efface (lecture unique, prévue à la sortie de l'éditeur).
---Source : lua/ge/extensions/ui/liveries/saves.lua:120
---@return string|nil  Nom de la skin à appliquer, ou nil.
function ui_liveries_saves.consumeStagedApplySkin() end

--- Écrit la pile de calques actuelle dans un nouveau fichier via editor_api_dynamicDecals.saveLayerStackToFile. Ne vérifie pas si le fichier existe déjà et ne change pas la sauvegarde courante.
---Source : lua/ge/extensions/ui/liveries/saves.lua:52
---@param filename string Nom sans extension (validé).
---@return string|boolean  Chemin du fichier écrit, ou false si le nom est invalide.
function ui_liveries_saves.create(filename) end

--- Supprime le fichier de sauvegarde. Si c'était la sauvegarde courante, réinitialise l'état de session via clearCurrentSave (la skin préparée n'est plus appliquée).
---Source : lua/ge/extensions/ui/liveries/saves.lua:90
---@param filename string Nom sans extension.
---@return boolean  true si le fichier existait et a été supprimé.
function ui_liveries_saves.delete(filename) end

--- Indique si une sauvegarde portant ce nom existe dans settings/dynamicDecals/.
---Source : lua/ge/extensions/ui/liveries/saves.lua:32
---@param filename string Nom sans extension.
---@return boolean  true si le fichier existe.
function ui_liveries_saves.exists(filename) end

--- Liste toutes les sauvegardes présentes. Chaque entrée contient name, location (chemin), created, modified et fileSize.
---Source : lua/ge/extensions/ui/liveries/saves.lua:36
---@return table[]  Tableau d'entrées {name, location, created, modified, fileSize}.
function ui_liveries_saves.getAll() end

--- Renvoie le nom de la sauvegarde chargée ou enregistrée en dernier dans cette session d'édition.
---Source : lua/ge/extensions/ui/liveries/saves.lua:111
---@return string|nil  nil pour une nouvelle livrée non enregistrée.
function ui_liveries_saves.getCurrentSaveName() end

--- Extrait le nom de sauvegarde (sans dossier ni extension .dynDecals.json) d'un chemin de fichier.
---Source : lua/ge/extensions/ui/liveries/saves.lua:19
---@param file string Chemin complet d'un fichier de sauvegarde.
---@return string  Nom sans extension.
function ui_liveries_saves.getFilename(file) end

--- Charge une sauvegarde dans l'éditeur via editor_api_dynamicDecals.loadLayerStackFromFile (appelée sous pcall). Définit la sauvegarde courante et efface la skin préparée.
---Source : lua/ge/extensions/ui/liveries/saves.lua:163
---@param filename string Nom sans extension (validé).
---@return boolean  true si le chargement a réussi.
function ui_liveries_saves.load(filename) end

--- Renomme une sauvegarde. Échoue si le nouveau nom est invalide, si l'ancien fichier n'existe pas, si le nouveau nom est déjà pris ou si le renommage échoue. Met à jour le nom de la sauvegarde courante s'il s'agissait de ce fichier.
---Source : lua/ge/extensions/ui/liveries/saves.lua:62
---@param filename string Nom actuel.
---@param newFilename string Nouveau nom (validé).
---@return boolean  true si le renommage a réussi.
function ui_liveries_saves.rename(filename, newFilename) end

--- Enregistre la livrée : refuse un nom invalide ou déjà pris par une autre sauvegarde que la courante, exige un véhicule joueur, écrit la pile de calques puis exporte la skin (exportSkin) sous le même nom. Définit ensuite la sauvegarde courante et, si applySkin est vrai, prépare la skin pour la sortie de l'éditeur.
---Source : lua/ge/extensions/ui/liveries/saves.lua:137
---@param filename string Nom sans extension (validé).
---@param applySkin boolean|nil Si vrai, la skin exportée sera appliquée à la sortie de l'éditeur (voir consumeStagedApplySkin).
---@return string|boolean  Chemin du fichier écrit, ou false en cas d'échec (nom invalide, doublon, pas de véhicule).
function ui_liveries_saves.save(filename, applySkin) end

