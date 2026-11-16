# `libs_resty_template_html`

*Fichier : `lua/common/libs/resty/template/html.lua` · VM : Commun (GE + véhicule) · 52 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/resty/template/html")`

Bibliothèque tierce lua-resty-template : petit générateur de balises HTML. `html.nom(attributs)(contenu)` ou `html.nom(contenu)` produit `<nom attr="...">contenu</nom>` avec échappement HTML du contenu et des valeurs d'attributs. Il s'enregistre aussi comme `template.html`.

## Exemple

```lua
local html = require('resty.template.html')
print(html.a{href = '/x'}('lien'))   -- <a href="&#47;x">lien</a>
print(html.br())                       -- <br />
```

## Remarques

- Le fichier fait `require "resty.template"` (séparateur point) alors que le module est dans libs/resty/template : ce nom doit être résolvable par le chemin de recherche de require.
- Si le contenu n'est pas une chaîne, la balise est auto-fermante (` />`). Les attributs à clé numérique sont écrits tels quels (échappés), les autres en clé="valeur".
- Les valeurs d'attributs sont échappées avec template.escape : les '/' deviennent &#47;.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/resty/template/html.lua`.*
