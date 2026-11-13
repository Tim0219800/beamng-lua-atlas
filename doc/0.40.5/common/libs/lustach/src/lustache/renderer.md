# `renderer`

*Fichier : `lua/common/libs/lustach/src/lustache/renderer.lua` · VM : Commun (GE + véhicule) · 389 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `renderer`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `renderer._inverted(self, name, context, callback)` |  | 238 |
| `renderer._name(self, name, context, escape)` |  | 270 |
| `renderer._partial(self, name, context, originalTemplate)` |  | 252 |
| `renderer._section(self, token, context, callback, originalTemplate)` |  | 206 |
| `renderer.clear_cache(self)` |  | 163 |
| `renderer.compile(self, tokens, tags, originalTemplate)` |  | 168 |
| `renderer.new(self)` |  | 379 |
| `renderer.parse(self, template, tags)` | Breaks up the given `template` string into a tree of token objects. If<br> `tags` is given here it must be an array with two string values: the<br> opening and closing tags used in the template (e.g. ["<%", "%>"]). Of<br> course, the default is to use mustaches (i.e. Mustache.tags). | 291 |
| `renderer.render(self, template, view, partials)` |  | 181 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lustach/src/lustache/renderer.lua`.*
