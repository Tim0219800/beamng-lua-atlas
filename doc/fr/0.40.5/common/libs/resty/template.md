# `libs_resty_template`

*Fichier : `lua/common/libs/resty/template.lua` · VM : Commun (GE + véhicule) · 479 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/resty/template")`

Bibliothèque tierce lua-resty-template (version 1.9, conçue pour OpenResty/nginx mais utilisable en Lua pur) : moteur de gabarits qui convertit un texte à balises en code Lua compilé. Balises : `{{expr}}` (sortie échappée HTML), `{*expr*}` (sortie brute), `{% code %}` (code Lua), `{# commentaire #}`, `{(fichier)}` / `{(fichier, contexte)}` (inclusion), `{[expr]}` (inclusion dynamique), `{-bloc-}...{-bloc-}` (blocs de mise en page), `{-verbatim-}`/`{-raw-}` (texte non interprété). Un `\` devant une balise l'échappe.

## Exemple

```lua
local template = require('libs/resty/template')
local f = template.compile('Bonjour {{nom}} !')
print(f({nom = 'Tim'}))
print(template.renderReturn('{% for i = 1, 3 do %}{*i*} {% end %}', {}))
```

## Remarques

- Hors nginx (ngx == nil), `template.load` lit le fichier du chemin donné ou, s'il n'existe pas, utilise la chaîne comme texte du gabarit ; `template.print` vaut io.write.
- Bug : `template.new(view, layout)` utilise `template.render`, qui n'est défini nulle part dans ce fichier (seul `renderReturn` existe) ; l'appel de `:render()` sur un objet sans layout table (ou avec un layout chaîne) échoue donc (appel de nil).
- Le code généré est chargé avec `load` dans un environnement qui retombe sur le contexte, puis `template`, puis les globales ; le gabarit peut donc lire les globales du jeu.
- Les gabarits compilés sont mis en cache dans `template.cache` (clé = texte du gabarit ou `key`) tant que `caching` est actif ; la clé spéciale "no-cache" contourne le cache.
- Les gabarits précompilés (bytecode, premier octet 27) sont acceptés par `parse` tels quels.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_resty_template.caching(enable)` | Active/désactive le cache de compilation si `enable` est donné, et renvoie l'état courant. | 166 |
| `libs_resty_template.compile(view, key, plain)` | Analyse et compile un gabarit en fonction `f(context)`. Met le résultat en cache sous `key` (par défaut le texte du gabarit). | 236 |
| `libs_resty_template.escape(s, c)` | Échappe le HTML d'une chaîne (& < > " ' /). Si `c` est vrai, échappe aussi { et } (mode code). Les valeurs non chaînes passent par `output`. | 177 |
| `libs_resty_template.new(view, layout)` | Crée un objet gabarit avec `render(context)` et `tostring`, avec une mise en page (layout) facultative, table ou texte. | 185 |
| `libs_resty_template.output(s)` | Convertit une valeur en texte de sortie : nil (ou ngx.null) -> "", fonction -> résultat de son appel, sinon tostring. | 171 |
| `libs_resty_template.parse(view, plain)` | Traduit le gabarit en code source Lua (chaîne) prêt pour load. | 249 |
| `libs_resty_template.precompile(view, path, strip)` | Compile le gabarit et renvoie son bytecode (string.dump) ; l'écrit dans `path` si fourni. | 226 |
| `libs_resty_template.renderReturn(view, context, key, plain)` | Compile (avec cache) puis exécute le gabarit avec `context` et renvoie le texte produit. | 473 |

### Détail des paramètres

#### `libs_resty_template.caching(enable)`

Active/désactive le cache de compilation si `enable` est donné, et renvoie l'état courant.

- `enable` (*boolean|nil*) : true pour activer, false pour désactiver ; nil laisse inchangé.
- **renvoie** : boolean État du cache.

#### `libs_resty_template.compile(view, key, plain)`

Analyse et compile un gabarit en fonction `f(context)`. Met le résultat en cache sous `key` (par défaut le texte du gabarit).

- `view` (*string*) : Gabarit ou chemin.
- `key` (*string|nil*) : Clé de cache ; "no-cache" désactive le cache pour cet appel.
- `plain` (*boolean|nil*) : Si true, `view` est du texte brut (pas de chargement de fichier).
- **renvoie** : function Fonction de rendu.
- **renvoie** : boolean true si elle vient du cache.

#### `libs_resty_template.escape(s, c)`

Échappe le HTML d'une chaîne (& < > " ' /). Si `c` est vrai, échappe aussi { et } (mode code). Les valeurs non chaînes passent par `output`.

- `s` (*any*) : Valeur.
- `c` (*boolean|nil*) : Échapper aussi les accolades.
- **renvoie** : string Texte échappé (la version chaîne renvoie aussi le nombre de remplacements).

#### `libs_resty_template.new(view, layout)`

Crée un objet gabarit avec `render(context)` et `tostring`, avec une mise en page (layout) facultative, table ou texte.

- `view` (*string*) : Gabarit (texte ou chemin).
- `layout` (*string|table|nil*) : Gabarit de mise en page ; reçoit `view` rendu dans context.view.
- **renvoie** : table Objet {render} avec __tostring.

#### `libs_resty_template.output(s)`

Convertit une valeur en texte de sortie : nil (ou ngx.null) -> "", fonction -> résultat de son appel, sinon tostring.

- `s` (*any*) : Valeur à afficher.
- **renvoie** : string Texte.

#### `libs_resty_template.parse(view, plain)`

Traduit le gabarit en code source Lua (chaîne) prêt pour load.

- `view` (*string*) : Gabarit ou chemin.
- `plain` (*boolean|nil*) : Si true, ne passe pas par template.load.
- **renvoie** : string Code Lua (ou bytecode si le gabarit en est déjà).

#### `libs_resty_template.precompile(view, path, strip)`

Compile le gabarit et renvoie son bytecode (string.dump) ; l'écrit dans `path` si fourni.

- `view` (*string*) : Gabarit.
- `path` (*string|nil*) : Fichier de sortie (io.open, mode wb).
- `strip` (*boolean|nil*) : Retirer les infos de debug (défaut true).
- **renvoie** : string Bytecode.

#### `libs_resty_template.renderReturn(view, context, key, plain)`

Compile (avec cache) puis exécute le gabarit avec `context` et renvoie le texte produit.

- `view` (*string*) : Gabarit.
- `context` (*table*) : Variables disponibles dans le gabarit.
- `key` (*string|nil*) : Clé de cache.
- `plain` (*boolean|nil*) : Gabarit en texte brut.
- **renvoie** : string Texte rendu.

## Champs

| Champ | Type | Description |
|---|---|---|
| `_VERSION` | string | Version du module : "1.9". |
| `cache` | table<string, function> | Cache des gabarits compilés. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/resty/template.lua`.*
