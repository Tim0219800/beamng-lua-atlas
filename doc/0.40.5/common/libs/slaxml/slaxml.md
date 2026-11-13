# `libs_slaxml_slaxml`

*Fichier : `lua/common/libs/slaxml/slaxml.lua` · VM : Commun (GE + véhicule) · 307 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/slaxml/slaxml")`

Bibliothèque tierce SLAXML v0.8 (Gavin Kistner, licence MIT) : analyseur XML pur Lua de type SAX avec gestion des espaces de noms. On lui passe des callbacks (pi, comment, startElement, attribute, text, closeElement) ; il les appelle pendant la lecture. Le jeu s'en sert pour lire des XML (par ex. xlsxlib, écriture JUnit).

## Exemple

```lua
local SLAXML = require('libs/slaxml/slaxml')
local p = SLAXML:parser{ startElement = function(name) print('<'..name..'>') end }
p:parse('<a><b/></a>', {stripWhitespace = true})
```

## Remarques

- Sans callbacks personnalisés, `SLAXML:parser()` utilise des callbacks par défaut qui impriment (print/io.write) chaque événement.
- `parse` lève une erreur si aucun élément n'est trouvé (« Parsing did not discover any elements »), si des éléments restent ouverts, si un préfixe d'espace de noms est inconnu, ou si le contenu d'une balise ne se lit pas.
- Option `options.stripWhitespace` : retire les blancs de début/fin du texte (défaut false).
- `SLAXML:dom` est défini ici (version simple) et redéfini par libs/slaxml/slaxdom (qui ajoute nsPrefix et la sérialisation `xml`) : charger slaxdom remplace cette version.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_slaxml_slaxml.dom(self, xml, opts)` | Analyse le XML et renvoie un DOM à plat : document {type='document', name='#doc', kids, root}, éléments {type='element', name, kids, el, attr, nsURI, parent}, attributs, textes, commentaires, instructions de traitement. Avec opts.simple, les liens parent et `el` ne sont pas créés. Lève une erreur s'il y a plusieurs racines ou un fermant inattendu. | 259 |
| `libs_slaxml_slaxml.parse(self, xml, options)` | Analyse le texte XML en appelant les callbacks de l'analyseur (ou de SLAXML si appelé directement). Gère les entités standard (&lt; &gt; &amp; &quot; &apos;) et les références numériques. | 43 |
| `libs_slaxml_slaxml.parser(self, callbacks)` | Crée un objet analyseur {_call, parse} utilisant les callbacks donnés (ou ceux par défaut qui impriment). | 39 |

### Détail des paramètres

#### `libs_slaxml_slaxml.dom(self, xml, opts)`

Analyse le XML et renvoie un DOM à plat : document {type='document', name='#doc', kids, root}, éléments {type='element', name, kids, el, attr, nsURI, parent}, attributs, textes, commentaires, instructions de traitement. Avec opts.simple, les liens parent et `el` ne sont pas créés. Lève une erreur s'il y a plusieurs racines ou un fermant inattendu.

- `self` (*any*) : 
- `xml` (*string*) : Texte XML.
- `opts` (*table|nil*) : {simple = boolean, stripWhitespace = boolean}.
- **renvoie** : table Document DOM.

#### `libs_slaxml_slaxml.parse(self, xml, options)`

Analyse le texte XML en appelant les callbacks de l'analyseur (ou de SLAXML si appelé directement). Gère les entités standard (&lt; &gt; &amp; &quot; &apos;) et les références numériques.

- `self` (*any*) : 
- `xml` (*string*) : Texte XML.
- `options` (*table|nil*) : {stripWhitespace = boolean}.

#### `libs_slaxml_slaxml.parser(self, callbacks)`

Crée un objet analyseur {_call, parse} utilisant les callbacks donnés (ou ceux par défaut qui impriment).

- `self` (*any*) : 
- `callbacks` (*table|nil*) : Table de callbacks : pi(target, content), comment(content), startElement(name, nsURI, nsPrefix), attribute(name, value, nsURI, nsPrefix), text(text, cdata), closeElement(name, nsURI, nsPrefix).
- **renvoie** : table Analyseur avec méthode parse.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/slaxml/slaxml.lua`.*
