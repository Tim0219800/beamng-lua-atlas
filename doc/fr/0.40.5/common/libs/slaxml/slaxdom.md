# `libs_slaxml_slaxdom`

*Fichier : `lua/common/libs/slaxml/slaxdom.lua` · VM : Commun (GE + véhicule) · 131 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/slaxml/slaxdom")`

Extension de SLAXML (bibliothèque tierce de Gavin Kistner) : ajoute à la table SLAXML un analyseur `dom` qui construit un DOM à plat (avec nsPrefix, cdata) et un sérialiseur `xml` qui réécrit un nœud ou un document en texte XML (indentation, tri des attributs, omission d'espaces de noms). Le module renvoie la table SLAXML modifiée. Utilisé par xlsxlib et par les écrivains JUnit du testFramework.

## Exemple

```lua
local SLAXML = require('libs/slaxml/slaxdom')
local doc = SLAXML:dom('<a x="1"><b>texte</b></a>')
print(doc.root.name, doc.root.attr.x)
print(SLAXML:xml(doc, {indent = 2}))
```

## Remarques

- Charger ce module remplace `SLAXML.dom` défini dans slaxml.lua (la version ici ajoute nsPrefix, cdata et l'erreur sur le texte non blanc à la racine) et définit `SLAXML.xml`.
- En mode `opts.simple`, `doc.root` n'est pas renseigné (nil) et les liens `parent` / listes `el` ne sont pas créés.
- Chaque attribut existe deux fois : dans `element.attr[i]` (liste de nœuds attribut) et, hors mode simple, dans `element.attr[nom]` (valeur).
- Bug : la sérialisation CDATA écrit `<![[CDATA[` au lieu de `<![CDATA[` ; le résultat n'est pas du XML valide.
- La fonction d'échappement `esc` renvoie deux valeurs (gsub) et n'échappe pas l'apostrophe malgré son entrée dans la table.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_slaxml_slaxdom.dom(self, xml, opts)` | Analyse le XML en DOM à plat. Renvoie un nœud document {type='document', name='#doc', kids, root}. Les éléments portent name, nsURI, nsPrefix, kids, attr (liste + dictionnaire) et, hors mode simple, el et parent. Les textes ont type='text', value et cdata. | 3 |
| `libs_slaxml_slaxdom.xml(self, n, opts)` | Sérialise un nœud (document, élément, texte, commentaire, instruction de traitement) en chaîne XML. | 52 |

### Détail des paramètres

#### `libs_slaxml_slaxdom.dom(self, xml, opts)`

Analyse le XML en DOM à plat. Renvoie un nœud document {type='document', name='#doc', kids, root}. Les éléments portent name, nsURI, nsPrefix, kids, attr (liste + dictionnaire) et, hors mode simple, el et parent. Les textes ont type='text', value et cdata.

- `self` (*any*) : 
- `xml` (*string*) : Texte XML.
- `opts` (*table|nil*) : {simple = boolean, stripWhitespace = boolean}.
- **renvoie** : table Document DOM.

#### `libs_slaxml_slaxdom.xml(self, n, opts)`

Sérialise un nœud (document, élément, texte, commentaire, instruction de traitement) en chaîne XML.

- `self` (*any*) : 
- `n` (*table*) : Nœud DOM à écrire.
- `opts` (*table|nil*) : indent (nombre d'espaces ou chaîne), sort (trier les attributs), omit (liste d'URI d'espaces de noms ou de valeurs à omettre).
- **renvoie** : string Texte XML (lignes séparées par un saut de ligne si indent est donné, sinon concaténées).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/slaxml/slaxdom.lua`.*
