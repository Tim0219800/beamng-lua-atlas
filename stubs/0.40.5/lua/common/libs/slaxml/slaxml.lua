---@meta
-- tim19Atlas stub generated from lua/common/libs/slaxml/slaxml.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce SLAXML v0.8 (Gavin Kistner, licence MIT) : analyseur XML pur Lua de type SAX avec gestion des espaces de noms. On lui passe des callbacks (pi, comment, startElement, attribute, text, closeElement) ; il les appelle pendant la lecture. Le jeu s'en sert pour lire des XML (par ex. xlsxlib, écriture JUnit).
--- Accès : `require("libs/slaxml/slaxml")`
---@class libs_slaxml_slaxml
local libs_slaxml_slaxml = {}

--- Analyse le XML et renvoie un DOM à plat : document {type='document', name='#doc', kids, root}, éléments {type='element', name, kids, el, attr, nsURI, parent}, attributs, textes, commentaires, instructions de traitement. Avec opts.simple, les liens parent et `el` ne sont pas créés. Lève une erreur s'il y a plusieurs racines ou un fermant inattendu.
---Source : lua/common/libs/slaxml/slaxml.lua:259
---@param self any
---@param xml string Texte XML.
---@param opts table|nil {simple = boolean, stripWhitespace = boolean}.
---@return table  Document DOM.
function libs_slaxml_slaxml.dom(self, xml, opts) end

--- Analyse le texte XML en appelant les callbacks de l'analyseur (ou de SLAXML si appelé directement). Gère les entités standard (&lt; &gt; &amp; &quot; &apos;) et les références numériques.
---Source : lua/common/libs/slaxml/slaxml.lua:43
---@param self any
---@param xml string Texte XML.
---@param options table|nil {stripWhitespace = boolean}.
function libs_slaxml_slaxml.parse(self, xml, options) end

--- Crée un objet analyseur {_call, parse} utilisant les callbacks donnés (ou ceux par défaut qui impriment).
---Source : lua/common/libs/slaxml/slaxml.lua:39
---@param self any
---@param callbacks table|nil Table de callbacks : pi(target, content), comment(content), startElement(name, nsURI, nsPrefix), attribute(name, value, nsURI, nsPrefix), text(text, cdata), closeElement(name, nsURI, nsPrefix).
---@return table  Analyseur avec méthode parse.
function libs_slaxml_slaxml.parser(self, callbacks) end

return libs_slaxml_slaxml
