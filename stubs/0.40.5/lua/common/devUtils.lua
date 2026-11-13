---@meta
-- tim19Atlas stub generated from lua/common/devUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Écrit en JSON un instantané des variables globales, des modules (contenu et locales) et des extensions chargées. Les fonctions et userdata sont retirés, les tables aplaties (flattenTable).
---Source : lua/common/devUtils.lua:145
---@param filename string Fichier JSON de sortie (via jsonWriteFile).
function createGlobalSnapshot(filename) end

--- Compile puis exécute la chaîne cmd avec xpcall, en remplaçant temporairement print pour capturer les sorties. En cas d'erreur de syntaxe ou d'exécution, renvoie une chaîne commençant par 'Error: '.
---Source : lua/common/devUtils.lua:10
---@param cmd string Code Lua à exécuter.
---@param source string|nil Nom de chunk pour les messages d'erreur (défaut 'executeLuaSandboxed').
---@return any  Résultat de l'exécution (1re valeur renvoyée par le chunk), ou chaîne 'Error: ...'.
---@return string[]|nil  Lignes capturées par print ; nil en cas d'erreur.
function executeLuaSandboxed(cmd, source) end

--- Renvoie les variables locales (upvalues) utilisées par les fonctions d'un module, en parcourant récursivement les fonctions, leurs upvalues et la métatable. Ignore les globales, les champs du module, le module lui-même et ___locals.
---Source : lua/common/devUtils.lua:89
---@param moduleTbl table Table du module à inspecter.
---@return table<string, any>  Nom d'upvalue vers valeur.
function getModuleLocals(moduleTbl) end

--- Parcourt tbl et détecte les sous-tables atteintes par plusieurs chemins (références partagées ou cycles).
---Source : lua/common/devUtils.lua:200
---@param tbl table Table à analyser.
---@return integer|nil  Nombre de tables vues plus d'une fois ; nil si tbl n'est pas une table.
---@return table<string, string[]>  Pour chaque table dupliquée (adresse en texte), la liste de ses chemins.
function tableFindRecursion(tbl) end

