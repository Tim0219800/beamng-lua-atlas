---@meta
-- tim19Atlas stub generated from lua/common/extensions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire d'extensions (global `extensions`, présent dans la VM GE et dans la VM véhicule). Il charge/décharge des modules Lua comme extensions, résout leurs dépendances (champ M.dependencies), les expose comme globales et sous extensions.<nom>, et diffuse les hooks (extensions.hook('onXxx', ...)) à tous les modules qui définissent cette fonction. Il gère aussi la sérialisation/désérialisation lors d'un rechargement de la VM Lua (Ctrl+L). Un moddeur s'en sert pour charger son extension, déclencher des hooks ou accéder à une extension par son nom.
--- Accès : globale `extensions`
---@class extensions
---@field hook function Fonction de diffusion de hook : hook(funcName, ...). Variante profilée (hookProfiled) hors build shipping, rapide (hookFast) sinon, ou hookSingleFrameProfiled si un profiler est fourni à setProfiler.
---@field onDeserialize function nop.
---@field onDeserialized function nop.
---@field onSerialize function nop : l'extension `extensions` elle-même ne sérialise rien.
extensions = {}

--- Ajoute directory/?.lua en tête de package.path.
---Source : lua/common/extensions.lua:701
---@param directory string Dossier de modules Lua.
function extensions.addModulePath(directory) end

--- Recharge les extensions listées dans data puis restitue leurs données via onDeserialize(data) ou fusion de M.state/M (puis onDeserialized). Les données sont aussi passées à onExtensionLoaded/onInit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions.lua:1015
---@param data table|nil Données produites par getSerializationData.
---@param filter string|nil Nom d'extension : ne restituer que celle-ci.
function extensions.deserialize(data, filter) end

--- Exclut des extensions de la sérialisation lors du rechargement de la VM Lua.
---Source : lua/common/extensions.lua:947
---@param ... string|string[] Noms d'extensions.
function extensions.disableSerialization(...) end

--- Convertit un nom d'extension en chemin ('a_b__c' -> 'a/b_c').
---Source : lua/common/extensions.lua:64
---@param extName string|nil Nom d'extension.
---@return string|nil  Chemin.
function extensions.extNameToLuaPath(extName) end

--- Renvoie la liste triée des noms d'extensions chargées.
---Source : lua/common/extensions.lua:1201
---@param excludeVirtual boolean|nil true pour omettre les extensions virtuelles (proxies).
---@return string[]  Noms triés.
function extensions.getLoadedExtensionsNames(excludeVirtual) end

--- Construit la table de données à conserver lors d'un rechargement : liste des extensions chargées (chemins) et, pour chaque module ayant onSerialize/onDeserialize(d), le retour de onSerialize(reason), sinon M.state, sinon le module entier. Si reason == 'reload', décharge ensuite toutes les extensions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions.lua:965
---@param reason string|nil Raison (défaut 'reload').
---@return table  Données de sérialisation.
function extensions.getSerializationData(reason) end

--- Appelle la fonction func de tous les modules résolus sauf ceux listés. Voir notes : la comparaison utilise un champ jamais défini.
---Source : lua/common/extensions.lua:884
---@param exceptionList string[] Chemins de modules à exclure.
---@param func string Nom de la fonction de hook.
---@param ... any Arguments passés à chaque module.
function extensions.hookExcept(exceptionList, func, ...) end

--- Appelle M.hook(func, ...) puis exécute et supprime les callbacks enregistrés avec setCompletedCallback pour ce hook.
---Source : lua/common/extensions.lua:899
---@param func string Nom du hook.
---@param ... any Arguments.
function extensions.hookNotify(func, ...) end

--- Invalide le cache des fonctions d'un hook pour qu'il soit reconstruit au prochain appel (à utiliser quand un module ajoute ou retire dynamiquement une fonction de hook).
---Source : lua/common/extensions.lua:94
---@param funcName string Nom du hook.
function extensions.hookUpdate(funcName) end

--- Indique si une extension est chargée (test : _G[extName] ~= nil).
---Source : lua/common/extensions.lua:280
---@param extName string Nom d'extension.
---@return boolean  true si présente comme global.
function extensions.isExtensionLoaded(extName) end

--- Charge une ou plusieurs extensions (noms au format ext_nom ou chemins contenant '/'), les marque comme chargées manuellement, résout les dépendances puis appelle onExtensionLoaded (et onInit côté GE) des modules fraîchement chargés.
---Source : lua/common/extensions.lua:648
---@param ... string|string[] Noms ou chemins d'extensions, ou tableaux de ces chaînes.
function extensions.load(...) end

--- Charge un fichier Lua comme extension en choisissant une racine de nommage : le nom devient rootName..'_'..nomDuFichier (ou le seul nom de fichier si rootName vaut '').
---Source : lua/common/extensions.lua:658
---@param extPath string Chemin du fichier sans .lua, contenant au moins un '/'.
---@param rootName string Préfixe de nom ; ne doit pas contenir '_' ('' pour l'espace global).
---@return string|nil  Nom de l'extension, nil en cas d'erreur.
---@return table|nil  Module chargé.
function extensions.loadAtRoot(extPath, rootName) end

--- Obsolète : appelle load avec un avertissement.
---Source : lua/common/extensions.lua:1189
---@param extName string Nom d'extension.
function extensions.loadModule(extName) end

--- Charge à la racine globale tous les .lua trouvés (récursivement) dans un dossier, avec le nom du fichier comme nom d'extension (compatibilité avec les anciens mods).
---Source : lua/common/extensions.lua:708
---@param directory string Dossier à parcourir (FS:findFiles).
---@param excludeSubdirectories string[]|nil Motifs de sous-chemins à exclure.
function extensions.loadModulesInDirectory(directory, excludeSubdirectories) end

--- Convertit un chemin ('a/b_c') en nom d'extension ('a_b__c').
---Source : lua/common/extensions.lua:55
---@param filepath string|nil Chemin sans .lua.
---@return string|nil  Nom d'extension.
function extensions.luaPathToExtName(filepath) end

--- Journalise la liste des extensions chargées avec leurs dépendances.
---Source : lua/common/extensions.lua:860
function extensions.printExtensions() end

--- Affiche (print) les extensions qui définissent la fonction funcName.
---Source : lua/common/extensions.lua:867
---@param funcName string Nom du hook.
function extensions.printHooks(funcName) end

--- Réapplique le traitement de chargement à une extension déjà chargée, sans relire le disque (dépendances, hooks obsolètes, etc.).
---Source : lua/common/extensions.lua:928
---@param extName string Nom d'extension déjà chargée.
---@return table|false|nil  Module, ou false si l'extension n'est pas chargée.
function extensions.refresh(extName) end

--- Décharge puis recharge une extension depuis le disque (vide le cache package.loaded).
---Source : lua/common/extensions.lua:922
---@param extPath string Nom ou chemin d'extension.
function extensions.reload(extPath) end

--- Obsolète : appelle reload avec un avertissement.
---Source : lua/common/extensions.lua:942
---@param modulePath string Nom ou chemin.
function extensions.reloadModule(modulePath) end

--- Restaure le package.path mémorisé par saveModulePath.
---Source : lua/common/extensions.lua:917
function extensions.restoreModulePath() end

--- Mémorise package.path courant.
---Source : lua/common/extensions.lua:913
function extensions.saveModulePath() end

--- Enregistre un callback exécuté (une seule fois) à la fin du prochain hookNotify pour ce hook.
---Source : lua/common/extensions.lua:757
---@param funcName string Nom du hook.
---@param callback function Fonction appelée avec les arguments du hook.
function extensions.setCompletedCallback(funcName, callback) end

--- Active un profiler (M.hook devient hookSingleFrameProfiled) ou, avec nil, revient au hook normal.
---Source : lua/common/extensions.lua:851
---@param p table|nil Objet profiler avec méthodes start et add.
function extensions.setProfiler(p) end

--- Décharge une extension et toutes celles qui en dépendent (et plus rien d'autre ne nécessite), en appelant onExtensionUnloaded. Ne fait rien si elle n'est pas chargée. Les extensions virtuelles ne sont pas déchargées sauf si enfants d'un module déchargé.
---Source : lua/common/extensions.lua:284
---@param extName string Nom d'extension.
function extensions.unload(extName) end

--- Décharge toutes les extensions sauf celles listées et leurs dépendances. Accepte soit une liste en argument unique, soit plusieurs listes.
---Source : lua/common/extensions.lua:337
---@param ... string[] Liste(s) de noms d'extensions à conserver.
function extensions.unloadExcept(...) end

--- Obsolète : appelle unload avec un avertissement.
---Source : lua/common/extensions.lua:332
---@param extName string Nom d'extension.
function extensions.unloadModule(extName) end

--- Charge l'extension puis la renvoie (ancienne syntaxe ; l'accès direct extensions.nom charge déjà automatiquement).
---Source : lua/common/extensions.lua:1194
---@param key string Nom d'extension.
---@return table|nil  Module chargé.
function extensions.use(key) end

--- Enveloppe toutes les fonctions de toutes les extensions avec profilerPushEvent/PopEvent. Les extensions chargées ensuite sont aussi enveloppées.
---Source : lua/common/extensions.lua:479
function extensions.wrapAllExtensionsForProfiler() end

--- Objet renvoyé par newExtensionProxy. Champs : extName, extPath, __virtual__, __manuallyLoaded__, hookProxies.
---@class extensions_ExtensionProxy
local extensions_ExtensionProxy = {}

--- Réenregistre le proxy comme extension virtuelle (refreshInternal) et vide le cache de hooks.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions.lua:1153
---@return table  Module (hookProxies).
function extensions_ExtensionProxy:_updateHooks() end

--- Supprime les hooks du proxy et le décharge.
---Source : lua/common/extensions.lua:1162
function extensions_ExtensionProxy:destroy() end

--- Enregistre des instances (avec leurs métatables) comme destinataires : toute fonction dont le nom commence par 'on' est exposée comme hook qui appelle m[k](m, ...) sur chaque instance. Met à jour les hooks et les dépendances du proxy.
---Source : lua/common/extensions.lua:1114
---@param hookableTablesInstances table Instances d'objets recevant les hooks.
---@param dependencies string[]|nil Dépendances du proxy (défaut {}).
function extensions_ExtensionProxy:submitEventSinks(hookableTablesInstances, dependencies) end

--- Métatable du module `extensions`.
---@class extensions_MT
local extensions_MT = {}

--- Résout extensions.<nom> : renvoie le module résolu (recherche insensible à la casse) ou le charge avec load puis renvoie _G[nom].
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions.lua:1169
---@param tbl table Table extensions.
---@param key string Nom d'extension.
---@return table|nil  Module.
function extensions_MT.__index(tbl, key) end

--- Fonction GLOBALE. Crée une extension virtuelle (ExtensionProxy) qui redirige les hooks vers des instances d'objets (OOP) ; nom 'prefixe_virtual_N'. Si parentExtension est donné, le proxy est déchargé avec lui.
---Source : lua/common/extensions.lua:1089
---@param parentExtension table|nil Extension parente (doit avoir __extensionName__).
---@param identifierPrefix string|nil Préfixe de nom (défaut : nom du parent ou '').
---@return table|nil  Objet ExtensionProxy.
function newExtensionProxy(parentExtension, identifierPrefix) end

