---@meta
-- tim19Atlas stub generated from lua/common/libs/slaxml/slaxdom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de SLAXML (bibliothèque tierce de Gavin Kistner) : ajoute à la table SLAXML un analyseur `dom` qui construit un DOM à plat (avec nsPrefix, cdata) et un sérialiseur `xml` qui réécrit un nœud ou un document en texte XML (indentation, tri des attributs, omission d'espaces de noms). Le module renvoie la table SLAXML modifiée. Utilisé par xlsxlib et par les écrivains JUnit du testFramework.
--- Accès : `require("libs/slaxml/slaxdom")`
---@class libs_slaxml_slaxdom
local libs_slaxml_slaxdom = {}

--- Analyse le XML en DOM à plat. Renvoie un nœud document {type='document', name='#doc', kids, root}. Les éléments portent name, nsURI, nsPrefix, kids, attr (liste + dictionnaire) et, hors mode simple, el et parent. Les textes ont type='text', value et cdata.
---Source : lua/common/libs/slaxml/slaxdom.lua:3
---@param self any
---@param xml string Texte XML.
---@param opts table|nil {simple = boolean, stripWhitespace = boolean}.
---@return table  Document DOM.
function libs_slaxml_slaxdom.dom(self, xml, opts) end

--- Sérialise un nœud (document, élément, texte, commentaire, instruction de traitement) en chaîne XML.
---Source : lua/common/libs/slaxml/slaxdom.lua:52
---@param self any
---@param n table Nœud DOM à écrire.
---@param opts table|nil indent (nombre d'espaces ou chaîne), sort (trier les attributs), omit (liste d'URI d'espaces de noms ou de valeurs à omettre).
---@return string  Texte XML (lignes séparées par un saut de ligne si indent est donné, sinon concaténées).
function libs_slaxml_slaxdom.xml(self, n, opts) end

return libs_slaxml_slaxdom
