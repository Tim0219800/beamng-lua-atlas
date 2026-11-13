---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/datastore.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Magasin clé/valeur persistant générique, avec index secondaires construits à la demande. Chaque « store » est enregistré sous un nom avec un champ clé primaire (unique) et stocké dans un fichier <chemin>/<prefix->nom.bin (MessagePack ; le format JSON existe dans le code mais USE_MSGPACK est à true). Il sert de cache de données (le code mentionne un cache de l'UI) et permet de chercher des entrées par n'importe quel champ, de suivre des chaînes de relations (getChain) et de réécrire le fichier à chaque modification.
--- Accès : extension `util_datastore` : `extensions.load("util_datastore")`, puis la globale `util_datastore`
---@class util_datastore
util_datastore = {}

--- Vide le store et réécrit le fichier (vide).
---Source : lua/ge/extensions/util/datastore.lua:347
---@param storeName string Nom du store.
---@return boolean|table  true ; false si lecture seule ; table d'échec si non enregistré.
function util_datastore.clear(storeName) end

--- Renvoie toutes les entrées du store (ordre non garanti).
---Source : lua/ge/extensions/util/datastore.lua:242
---@param storeName string Nom du store.
---@return table[]  Entrées (ou table d'échec).
function util_datastore.getAll(storeName) end

--- Cherche une entrée graine puis suit sa chaîne de relations (chainField/resolveField définis par setChain), sans cycle.
---Source : lua/ge/extensions/util/datastore.lua:261
---@param storeName string Nom du store.
---@param field string Champ pour trouver la graine.
---@param value any Valeur de la graine.
---@return table[]  Graine puis entrées liées ; vide si la graine n'existe pas.
function util_datastore.getChain(storeName, field, value) end

--- Renvoie les entrées dont le champ vaut l'une des valeurs, sans doublons (dédoublonnées par clé primaire).
---Source : lua/ge/extensions/util/datastore.lua:194
---@param storeName string Nom du store.
---@param field string Champ de recherche.
---@param values table Liste de valeurs ; une valeur non-table donne une liste vide.
---@return table[]  Entrées trouvées (ou table d'échec).
function util_datastore.getEntries(storeName, field, values) end

--- Renvoie la première entrée dont le champ vaut value.
---Source : lua/ge/extensions/util/datastore.lua:184
---@param storeName string Nom du store.
---@param field string Champ de recherche (clé primaire ou autre).
---@param value any Valeur cherchée.
---@return table|nil  Entrée, nil si absente, ou table d'échec si le store n'est pas enregistré.
function util_datastore.getEntry(storeName, field, value) end

--- Sans primaryKey : liste des valeurs distinctes présentes pour le champ. Avec primaryKey = true : table clé primaire -> valeur du champ pour chaque entrée (non dédoublonnée).
---Source : lua/ge/extensions/util/datastore.lua:221
---@param storeName string Nom du store.
---@param field string Champ à indexer.
---@param primaryKey boolean|nil true pour la table indexée par clé primaire.
---@return table  Liste ou table, ou table d'échec.
function util_datastore.getIndex(storeName, field, primaryKey) end

--- Indique si au moins une entrée a ce champ égal à value.
---Source : lua/ge/extensions/util/datastore.lua:252
---@param storeName string Nom du store.
---@param field string Champ de recherche.
---@param value any Valeur cherchée.
---@return boolean  true si trouvée (ou table d'échec si store inconnu).
function util_datastore.hasEntry(storeName, field, value) end

--- Indique si un store est enregistré.
---Source : lua/ge/extensions/util/datastore.lua:64
---@param storeName string Nom du store.
---@return boolean  true si enregistré.
function util_datastore.isRegistered(storeName) end

--- Indique si un résultat est l'échec « store_not_registered ».
---Source : lua/ge/extensions/util/datastore.lua:73
---@param result any Résultat d'une fonction du module.
---@return boolean  true si c'est cet échec.
function util_datastore.isUnregisteredFailure(result) end

--- Hook de rechargement à chaud : recrée les stores à partir des enregistrements sauvegardés (entrées à relire du fichier).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/datastore.lua:388
---@param data table Résultat d'onSerialize.
function util_datastore.onDeserialized(data) end

--- Hook d'initialisation : passe l'extension en déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/datastore.lua:369
function util_datastore.onInit() end

--- Hook de rechargement à chaud : sérialise seulement les enregistrements des stores (pas les entrées).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/datastore.lua:374
---@return table  {registrations = ...}.
function util_datastore.onSerialize() end

--- Insère ou remplace des entrées (identifiées par la clé primaire), met à jour les index et réécrit le fichier. Les entrées sans clé primaire sont ignorées avec un avertissement.
---Source : lua/ge/extensions/util/datastore.lua:292
---@param storeName string Nom du store.
---@param entries table[] Liste d'entrées (tables).
---@return boolean  true si quelque chose a changé ; false si lecture seule, argument invalide ou rien à écrire (ou table d'échec).
function util_datastore.putEntries(storeName, entries) end

--- Enregistre (ou ré-enregistre) un store en mémoire ; ne charge pas le fichier.
---Source : lua/ge/extensions/util/datastore.lua:147
---@param storeName string Nom du store (non vide).
---@param primaryField string|nil Champ de clé primaire unique, 'name' par défaut.
---@param opts table|nil {path = dossier (défaut /temp), prefix = préfixe du fichier, readonly = boolean}.
---@return boolean  false si le nom est invalide, sinon true.
function util_datastore.register(storeName, primaryField, opts) end

--- Supprime les entrées dont le champ vaut l'une des valeurs, puis réécrit le fichier.
---Source : lua/ge/extensions/util/datastore.lua:315
---@param storeName string Nom du store.
---@param field string Champ de recherche.
---@param values table Liste de valeurs.
---@return boolean  true si des entrées ont été supprimées.
function util_datastore.removeEntries(storeName, field, values) end

--- Définit comment suivre les relations pour getChain : chainField contient un tableau de clés, résolues via le champ field.
---Source : lua/ge/extensions/util/datastore.lua:359
---@param storeName string Nom du store.
---@param chainField string Champ de l'entrée contenant un tableau de clés liées.
---@param field string Champ dans lequel chercher chaque clé.
---@return boolean|table  true, ou table d'échec.
function util_datastore.setChain(storeName, chainField, field) end

--- Retire l'enregistrement en mémoire sans toucher au fichier.
---Source : lua/ge/extensions/util/datastore.lua:174
---@param storeName string Nom du store.
---@return boolean  true si le store existait.
function util_datastore.unregister(storeName) end

