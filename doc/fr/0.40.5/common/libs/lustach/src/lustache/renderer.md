# `renderer`

*Fichier : `lua/common/libs/lustach/src/lustache/renderer.lua` · VM : Commun (GE + véhicule) · 389 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `renderer`

Bibliothèque tierce lustache : cœur du moteur Mustache. Le renderer analyse un gabarit (`parse`) en arbre de jetons (texte, variables, sections `#`, sections inversées `^`, partiels `>`, accolades triples `{`/`&`, changement de délimiteurs `=`), le compile en fonction (`compile`) et le rend avec une vue (`render`). Les gabarits compilés sont mis en cache. Les valeurs `{{x}}` sont échappées en HTML ; `{{{x}}}` et `{{&x}}` ne le sont pas.

## Exemple

```lua
local renderer = require('common/libs/lustach/src/lustache/renderer'):new()
print(renderer:render('{{#items}}<{{.}}>{{/items}}', {items = {1, 2, 3}}))  -- <1><2><3>
```

## Remarques

- Le fichier renvoie la table `renderer` (variable locale) ; la page auto indique « globale renderer » mais le code n'en crée pas de globale. On obtient une instance par `renderer:new()` (champs cache, partial_cache, tags = {"{{","}}"}).
- Sections : une table tableau (indices 1..n contigus) est itérée ; une autre table devient le contexte ; une fonction reçoit (texte_brut_de_la_section, fonction_de_rendu) ; toute autre valeur truthy rend la section telle quelle.
- Bug : dans nest_tokens, le test `not section.value == token.value` est évalué comme `(not section.value) == token.value` ; une fermeture de section ne correspondant pas à l'ouverture n'est donc pas détectée (seuls les cas « Unopened section » et « Unclosed section » le sont).
- Échappement HTML : & < > " ' / sont remplacés par &amp; &lt; &gt; &quot; &#39; &#x2F;.
- `_partial` lit `self.partials[name]` et compile le partiel ; les partiels sont mémorisés par nom dans partial_cache (le cache n'est pas invalidé si on change la table partials sans appeler clear_cache).
- Les méthodes se préfixent par `_` (_section, _inverted, _partial, _name) sont internes, appelées par le code compilé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `renderer._inverted(self, name, context, callback)` | Rend une section inversée `{{^nom}}` seulement si la valeur est nil, false ou un tableau vide. Interne. *(interne)* | 238 |
| `renderer._name(self, name, context, escape)` | Rend une variable : résout le nom (appelle la valeur si c'est une fonction, avec la vue), convertit en chaîne (nil devient "") et échappe le HTML si `escape` est vrai. Interne. *(interne)* | 270 |
| `renderer._partial(self, name, context, originalTemplate)` | Rend le partiel `{{>nom}}` à partir de self.partials (compilé puis mis en cache) ; "" si le partiel est absent. Interne. *(interne)* | 252 |
| `renderer._section(self, token, context, callback, originalTemplate)` | Rend une section `{{#nom}}...{{/nom}}` selon la valeur du nom (tableau : itération ; table : sous-contexte ; fonction : appel avec le texte brut ; sinon valeur truthy). Interne. *(interne)* | 206 |
| `renderer.clear_cache(self)` | Vide le cache des gabarits compilés et celui des partiels. | 163 |
| `renderer.compile(self, tokens, tags, originalTemplate)` | Compile un gabarit (chaîne) ou une liste de jetons en fonction `function(view) -> string`. | 168 |
| `renderer.new(self)` | Crée une instance de renderer (caches vides, délimiteurs {{ }}). | 379 |
| `renderer.parse(self, template, tags)` | Découpe le gabarit en arbre de jetons. `tags` est un tableau de deux chaînes (délimiteur ouvrant et fermant, par défaut mustaches). Lève une erreur « Unclosed tag at <pos> », « Unopened section » ou « Unclosed section ». | 291 |
| `renderer.render(self, template, view, partials)` | Rend le gabarit `template` avec `view`. Compile et met en cache le gabarit au premier appel. Si `partials` est fourni, il est mémorisé comme table de partiels. Renvoie "" si `template` est nil. Erreur si appelé avec un point (`self` est une chaîne). | 181 |

### Détail des paramètres

#### `renderer._inverted(self, name, context, callback)`

Rend une section inversée `{{^nom}}` seulement si la valeur est nil, false ou un tableau vide. Interne.

- `self` (*any*) : 
- `name` (*string*) : Nom testé.
- `context` (*table*) : Contexte courant.
- `callback` (*function*) : Rendu du contenu.
- **renvoie** : string Texte rendu ou "".

#### `renderer._name(self, name, context, escape)`

Rend une variable : résout le nom (appelle la valeur si c'est une fonction, avec la vue), convertit en chaîne (nil devient "") et échappe le HTML si `escape` est vrai. Interne.

- `self` (*any*) : 
- `name` (*string*) : Nom de la variable.
- `context` (*table*) : Contexte courant.
- `escape` (*boolean*) : true pour {{x}}, false pour {{{x}}} et {{&x}}.
- **renvoie** : string Texte (avec, quand escape est vrai, un second retour : le nombre de remplacements de gsub).

#### `renderer._partial(self, name, context, originalTemplate)`

Rend le partiel `{{>nom}}` à partir de self.partials (compilé puis mis en cache) ; "" si le partiel est absent. Interne.

- `self` (*any*) : 
- `name` (*string*) : Nom du partiel.
- `context` (*table*) : Contexte courant.
- `originalTemplate` (*string*) : Gabarit d'origine.
- **renvoie** : string Texte rendu.

#### `renderer._section(self, token, context, callback, originalTemplate)`

Rend une section `{{#nom}}...{{/nom}}` selon la valeur du nom (tableau : itération ; table : sous-contexte ; fonction : appel avec le texte brut ; sinon valeur truthy). Interne.

- `self` (*any*) : 
- `token` (*table*) : Jeton de section.
- `context` (*table*) : Contexte courant.
- `callback` (*function*) : Rendu du contenu de la section.
- `originalTemplate` (*string*) : Gabarit d'origine.
- **renvoie** : string Texte rendu.

#### `renderer.compile(self, tokens, tags, originalTemplate)`

Compile un gabarit (chaîne) ou une liste de jetons en fonction `function(view) -> string`.

- `self` (*any*) : 
- `tokens` (*string|table*) : Gabarit brut (analysé par parse) ou arbre de jetons.
- `tags` (*string[]|nil*) : Délimiteurs {ouvrant, fermant} ; défaut self.tags.
- `originalTemplate` (*string|nil*) : Texte d'origine, nécessaire pour extraire le texte brut des sections-fonctions.
- **renvoie** : function Fonction de rendu prenant la vue.

#### `renderer.new(self)`

Crée une instance de renderer (caches vides, délimiteurs {{ }}).

- `self` (*table*) : Classe renderer (appel avec les deux-points).
- **renvoie** : table Instance.

#### `renderer.parse(self, template, tags)`

Découpe le gabarit en arbre de jetons. `tags` est un tableau de deux chaînes (délimiteur ouvrant et fermant, par défaut mustaches). Lève une erreur « Unclosed tag at <pos> », « Unopened section » ou « Unclosed section ».

- `self` (*any*) : 
- `template` (*string*) : Texte du gabarit.
- `tags` (*string[]|nil*) : Délimiteurs personnalisés.
- **renvoie** : table Arbre de jetons {type, value, startIndex, endIndex, tokens?}.

#### `renderer.render(self, template, view, partials)`

Rend le gabarit `template` avec `view`. Compile et met en cache le gabarit au premier appel. Si `partials` est fourni, il est mémorisé comme table de partiels. Renvoie "" si `template` est nil. Erreur si appelé avec un point (`self` est une chaîne).

- `self` (*any*) : 
- `template` (*string|nil*) : Texte du gabarit.
- `view` (*table|Context|nil*) : Données ; une table est enveloppée dans un Context.
- `partials` (*table<string, string>|nil*) : Partiels : nom -> texte du gabarit.
- **renvoie** : string Texte rendu.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lustach/src/lustache/renderer.lua`.*
