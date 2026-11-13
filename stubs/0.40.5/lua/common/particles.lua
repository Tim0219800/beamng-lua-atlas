---@meta
-- tim19Atlas stub generated from lua/common/particles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Charge au démarrage lua/common/particles.json (matériaux physiques et règles de particules entre deux matériaux) et prépare des tables de recherche : une liste de matériaux et une table indexée par paire de matériaux avec, pour chaque règle, une fonction de comparaison compilée (sur perpendicularVel et slipVel). Sert à choisir les particules d'impact/glissement selon les deux matériaux en contact.
--- Accès : globale `_`, `particles`
---@class _
_ = {}

--- Renvoie le matériau d'indice i dans mats, ou nil si i est nil.
---Source : lua/common/particles.lua:11
---@param mats table liste de matériaux (premier retour de getMaterialsParticlesTable)
---@param i integer|nil identifiant de matériau
---@return table|nil  matériau {name, colorR, colorG, colorB, …}
function _.getMaterialByID(mats, i) end

--- Cherche l'identifiant du matériau nommé s ; renvoie min(3, #mats) s'il est inconnu (pas d'ajout).
---Source : lua/common/particles.lua:30
---@param mats table liste de matériaux
---@param s string nom du matériau
---@return integer  identifiant de matériau
function _.getMaterialIDByName(mats, s) end

--- Renvoie la liste des matériaux et la table des règles de particules par paire de matériaux (clé id1*10000+id2).
---Source : lua/common/particles.lua:122
---@return table  matériaux
---@return table<integer, table[]>  règles par paire de matériaux
function _.getMaterialsParticlesTable() end

--- Cherche l'identifiant du matériau de nom s ; s'il n'existe pas, crée une définition temporaire (blanche, dynamic = true) ajoutée à mats et renvoie son nouvel identifiant.
---Source : lua/common/particles.lua:16
---@param mats table liste de matériaux (modifiée)
---@param s string nom du matériau
---@return integer  identifiant de matériau
function _.getOrAddMaterialIDByName(mats, s) end

