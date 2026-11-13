# `libs_lustach_src_lustache`

*Fichier : `lua/common/libs/lustach/src/lustache.lua` · VM : Commun (GE + véhicule) · 28 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lustach/src/lustache")`

Bibliothèque tierce lustache (Olivine Labs, licence MIT, version 1.3.1-0) : moteur de gabarits Mustache en Lua. Ce fichier est le point d'entrée : il crée un renderer et expose ses méthodes (render, compile, parse, clear_cache) directement sur la table `lustache`. Les clés `partials` et `tags` peuvent être affectées pour définir les partiels et les délimiteurs.

## Exemple

```lua
local lustache = require('common/libs/lustach/src/lustache')
print(lustache:render('Bonjour {{nom}} !', {nom = 'Tim'}))
```

## Remarques

- Appeler les méthodes avec les deux-points (`lustache:render(...)`) : le renderer détecte et refuse `lustache.render(...)` avec une chaîne comme premier argument.
- Le fichier ajoute une fonction globale `string.split_lustache(str, sep)` (découpe sur les caractères de `sep` pris comme classe de caractères) utilisée par le contexte et le renderer.
- Le module est requis sous le chemin `common/libs/lustach/src/lustache` (le dossier s'appelle `lustach`, sans « e »).
- Seules les clés `partials` et `tags` sont écrivables sur le module (via __newindex) ; les autres écritures sont ignorées.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lustach/src/lustache.lua`.*
