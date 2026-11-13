---@meta
-- tim19Atlas stub generated from lua/common/libs/resty/template.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce lua-resty-template (version 1.9, conçue pour OpenResty/nginx mais utilisable en Lua pur) : moteur de gabarits qui convertit un texte à balises en code Lua compilé. Balises : `{{expr}}` (sortie échappée HTML), `{*expr*}` (sortie brute), `{% code %}` (code Lua), `{# commentaire #}`, `{(fichier)}` / `{(fichier, contexte)}` (inclusion), `{[expr]}` (inclusion dynamique), `{-bloc-}...{-bloc-}` (blocs de mise en page), `{-verbatim-}`/`{-raw-}` (texte non interprété). Un `\` devant une balise l'échappe.
--- Accès : `require("libs/resty/template")`
---@class libs_resty_template
---@field _VERSION string Version du module : "1.9".
---@field cache table<string, function> Cache des gabarits compilés.
local libs_resty_template = {}

--- Active/désactive le cache de compilation si `enable` est donné, et renvoie l'état courant.
---Source : lua/common/libs/resty/template.lua:166
---@param enable boolean|nil true pour activer, false pour désactiver ; nil laisse inchangé.
---@return boolean  État du cache.
function libs_resty_template.caching(enable) end

--- Analyse et compile un gabarit en fonction `f(context)`. Met le résultat en cache sous `key` (par défaut le texte du gabarit).
---Source : lua/common/libs/resty/template.lua:236
---@param view string Gabarit ou chemin.
---@param key string|nil Clé de cache ; "no-cache" désactive le cache pour cet appel.
---@param plain boolean|nil Si true, `view` est du texte brut (pas de chargement de fichier).
---@return function  Fonction de rendu.
---@return boolean  true si elle vient du cache.
function libs_resty_template.compile(view, key, plain) end

--- Échappe le HTML d'une chaîne (& < > " ' /). Si `c` est vrai, échappe aussi { et } (mode code). Les valeurs non chaînes passent par `output`.
---Source : lua/common/libs/resty/template.lua:177
---@param s any Valeur.
---@param c boolean|nil Échapper aussi les accolades.
---@return string  Texte échappé (la version chaîne renvoie aussi le nombre de remplacements).
function libs_resty_template.escape(s, c) end

--- Crée un objet gabarit avec `render(context)` et `tostring`, avec une mise en page (layout) facultative, table ou texte.
---Source : lua/common/libs/resty/template.lua:185
---@param view string Gabarit (texte ou chemin).
---@param layout string|table|nil Gabarit de mise en page ; reçoit `view` rendu dans context.view.
---@return table  Objet {render} avec __tostring.
function libs_resty_template.new(view, layout) end

--- Convertit une valeur en texte de sortie : nil (ou ngx.null) -> "", fonction -> résultat de son appel, sinon tostring.
---Source : lua/common/libs/resty/template.lua:171
---@param s any Valeur à afficher.
---@return string  Texte.
function libs_resty_template.output(s) end

--- Traduit le gabarit en code source Lua (chaîne) prêt pour load.
---Source : lua/common/libs/resty/template.lua:249
---@param view string Gabarit ou chemin.
---@param plain boolean|nil Si true, ne passe pas par template.load.
---@return string  Code Lua (ou bytecode si le gabarit en est déjà).
function libs_resty_template.parse(view, plain) end

--- Compile le gabarit et renvoie son bytecode (string.dump) ; l'écrit dans `path` si fourni.
---Source : lua/common/libs/resty/template.lua:226
---@param view string Gabarit.
---@param path string|nil Fichier de sortie (io.open, mode wb).
---@param strip boolean|nil Retirer les infos de debug (défaut true).
---@return string  Bytecode.
function libs_resty_template.precompile(view, path, strip) end

--- Compile (avec cache) puis exécute le gabarit avec `context` et renvoie le texte produit.
---Source : lua/common/libs/resty/template.lua:473
---@param view string Gabarit.
---@param context table Variables disponibles dans le gabarit.
---@param key string|nil Clé de cache.
---@param plain boolean|nil Gabarit en texte brut.
---@return string  Texte rendu.
function libs_resty_template.renderReturn(view, context, key, plain) end

return libs_resty_template
