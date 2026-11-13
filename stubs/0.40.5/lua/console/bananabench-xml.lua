---@meta
-- tim19Atlas stub generated from lua/console/bananabench-xml.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit constructeur de document XML (classe globale).
---@class bananabench_xml_XML
local bananabench_xml_XML = {}

--- Ajoute un nœud enfant.
---Source : lua/console/bananabench-xml.lua:dyn
---@param xml table Nœud enfant.
function bananabench_xml_XML:addChild(xml) end

--- Crée un nœud XML vide (name, attribs, children).
---Source : lua/console/bananabench-xml.lua:dyn
---@return table  Nœud XML.
function bananabench_xml_XML:create() end

--- Renvoie le document complet avec l'en-tête `<?xml version="1.0" encoding="UTF-8"?>`.
---Source : lua/console/bananabench-xml.lua:dyn
---@return string  Texte XML.
function bananabench_xml_XML:encode() end

--- Sérialise le nœud et ses enfants avec indentation de 2 espaces.
---Source : lua/console/bananabench-xml.lua:dyn
---@param indent integer|nil Niveau d'indentation (défaut 0).
---@return string  Texte XML.
function bananabench_xml_XML:toString(indent) end

---@type table
XML = nil
