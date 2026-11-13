---@meta
-- tim19Atlas stub generated from lua/common/libs/lustach/src/lustache/renderer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce lustache : cœur du moteur Mustache. Le renderer analyse un gabarit (`parse`) en arbre de jetons (texte, variables, sections `#`, sections inversées `^`, partiels `>`, accolades triples `{`/`&`, changement de délimiteurs `=`), le compile en fonction (`compile`) et le rend avec une vue (`render`). Les gabarits compilés sont mis en cache. Les valeurs `{{x}}` sont échappées en HTML ; `{{{x}}}` et `{{&x}}` ne le sont pas.
--- Accès : globale `renderer`
---@class renderer
renderer = {}

--- Rend une section inversée `{{^nom}}` seulement si la valeur est nil, false ou un tableau vide. Interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lustach/src/lustache/renderer.lua:238
---@param self any
---@param name string Nom testé.
---@param context table Contexte courant.
---@param callback function Rendu du contenu.
---@return string  Texte rendu ou "".
function renderer._inverted(self, name, context, callback) end

--- Rend une variable : résout le nom (appelle la valeur si c'est une fonction, avec la vue), convertit en chaîne (nil devient "") et échappe le HTML si `escape` est vrai. Interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lustach/src/lustache/renderer.lua:270
---@param self any
---@param name string Nom de la variable.
---@param context table Contexte courant.
---@param escape boolean true pour {{x}}, false pour {{{x}}} et {{&x}}.
---@return string  Texte (avec, quand escape est vrai, un second retour : le nombre de remplacements de gsub).
function renderer._name(self, name, context, escape) end

--- Rend le partiel `{{>nom}}` à partir de self.partials (compilé puis mis en cache) ; "" si le partiel est absent. Interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lustach/src/lustache/renderer.lua:252
---@param self any
---@param name string Nom du partiel.
---@param context table Contexte courant.
---@param originalTemplate string Gabarit d'origine.
---@return string  Texte rendu.
function renderer._partial(self, name, context, originalTemplate) end

--- Rend une section `{{#nom}}...{{/nom}}` selon la valeur du nom (tableau : itération ; table : sous-contexte ; fonction : appel avec le texte brut ; sinon valeur truthy). Interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lustach/src/lustache/renderer.lua:206
---@param self any
---@param token table Jeton de section.
---@param context table Contexte courant.
---@param callback function Rendu du contenu de la section.
---@param originalTemplate string Gabarit d'origine.
---@return string  Texte rendu.
function renderer._section(self, token, context, callback, originalTemplate) end

--- Vide le cache des gabarits compilés et celui des partiels.
---Source : lua/common/libs/lustach/src/lustache/renderer.lua:163
---@param self any
function renderer.clear_cache(self) end

--- Compile un gabarit (chaîne) ou une liste de jetons en fonction `function(view) -> string`.
---Source : lua/common/libs/lustach/src/lustache/renderer.lua:168
---@param self any
---@param tokens string|table Gabarit brut (analysé par parse) ou arbre de jetons.
---@param tags string[]|nil Délimiteurs {ouvrant, fermant} ; défaut self.tags.
---@param originalTemplate string|nil Texte d'origine, nécessaire pour extraire le texte brut des sections-fonctions.
---@return function  Fonction de rendu prenant la vue.
function renderer.compile(self, tokens, tags, originalTemplate) end

--- Crée une instance de renderer (caches vides, délimiteurs {{ }}).
---Source : lua/common/libs/lustach/src/lustache/renderer.lua:379
---@param self table Classe renderer (appel avec les deux-points).
---@return table  Instance.
function renderer.new(self) end

--- Découpe le gabarit en arbre de jetons. `tags` est un tableau de deux chaînes (délimiteur ouvrant et fermant, par défaut mustaches). Lève une erreur « Unclosed tag at <pos> », « Unopened section » ou « Unclosed section ».
---Source : lua/common/libs/lustach/src/lustache/renderer.lua:291
---@param self any
---@param template string Texte du gabarit.
---@param tags string[]|nil Délimiteurs personnalisés.
---@return table  Arbre de jetons {type, value, startIndex, endIndex, tokens?}.
function renderer.parse(self, template, tags) end

--- Rend le gabarit `template` avec `view`. Compile et met en cache le gabarit au premier appel. Si `partials` est fourni, il est mémorisé comme table de partiels. Renvoie "" si `template` est nil. Erreur si appelé avec un point (`self` est une chaîne).
---Source : lua/common/libs/lustach/src/lustache/renderer.lua:181
---@param self any
---@param template string|nil Texte du gabarit.
---@param view table|Context|nil Données ; une table est enveloppée dans un Context.
---@param partials table<string, string>|nil Partiels : nom -> texte du gabarit.
---@return string  Texte rendu.
function renderer.render(self, template, view, partials) end

