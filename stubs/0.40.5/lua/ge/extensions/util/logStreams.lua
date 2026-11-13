---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/logStreams.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit utilitaire d'entrée/sortie pour sauvegarder et relire les « streams » (flux de données de véhicule) journalisés, sous trois formats dans le dossier utilisateur : loggedStreams.json, loggedStreams.txt (wikitable) et loggedStreams.rst. Les fonctions ne font que lire/écrire ces fichiers ; la génération du contenu se fait ailleurs.
--- Accès : extension `util_logStreams` : `extensions.load("util_logStreams")`, puis la globale `util_logStreams`
---@class util_logStreams
util_logStreams = {}

--- Lit et décode loggedStreams.json.
---Source : lua/ge/extensions/util/logStreams.lua:16
---@return table|nil  Contenu décodé, ou nil si le fichier est absent
function util_logStreams.readJson() end

--- Lit loggedStreams.rst en remplaçant chaque retour à la ligne par la séquence littérale \n.
---Source : lua/ge/extensions/util/logStreams.lua:33
---@return string  Contenu avec \n échappés
---@return integer  Nombre de remplacements (second retour de gsub)
function util_logStreams.readRst() end

--- Lit loggedStreams.txt en remplaçant chaque retour à la ligne par la séquence littérale \n.
---Source : lua/ge/extensions/util/logStreams.lua:24
---@return string  Contenu avec \n échappés
---@return integer  Nombre de remplacements (second retour de gsub)
function util_logStreams.readWikitable() end

--- Écrit data dans loggedStreams.json (jsonWriteFile, format lisible).
---Source : lua/ge/extensions/util/logStreams.lua:12
---@param data table Données à sérialiser
function util_logStreams.saveJson(data) end

--- Écrit le texte fourni dans loggedStreams.rst.
---Source : lua/ge/extensions/util/logStreams.lua:29
---@param data string Texte au format reStructuredText
function util_logStreams.saveRst(data) end

--- Écrit le texte fourni dans loggedStreams.txt.
---Source : lua/ge/extensions/util/logStreams.lua:20
---@param data string Texte au format wikitable
function util_logStreams.saveWikitable(data) end

