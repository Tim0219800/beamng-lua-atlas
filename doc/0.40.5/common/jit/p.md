# `jit_p`

*Fichier : `lua/common/jit/p.lua` · VM : Commun (GE + véhicule) · 310 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jit/p")`

Module jit.p de LuaJIT (auteur Mike Pall, licence MIT, copyright 2005-2026) : interface simple au profileur à faible surcharge intégré à LuaJIT (jit.profile). Il échantillonne la pile d'appel et produit un rapport (fonctions, module:ligne, états de la VM, zones, annotations de source ou format brut pour flame graphs). Dans BeamNG la copie est adaptée (opérateurs != et += de la syntaxe étendue du jeu). L'option de mode est une chaîne de lettres : f/F/l (format de pile), nombre = profondeur, s (split), p (chemins), v (états VM), z (zones), r (compte brut), a/A (annotations), G (sortie pour graphes), m<n> (pourcentage minimal, 3 par défaut), i<n> (intervalle en ms, 10 par défaut).

## Exemple

```lua
local p = require('jit/p')
p.start('f')   -- mode par défaut
-- ... code à profiler ...
p.stop()       -- écrit le rapport sur stdout (ou sur LUAJIT_PROFILEFILE)
```

## Remarques

- La sortie va dans outfile, sinon dans la variable d'environnement LUAJIT_PROFILEFILE, sinon stdout ; '-' force stdout.
- Un profil actif est aussi terminé automatiquement par le __gc d'un proxy newproxy(true) quand le module est ramassé.
- Le mode 'z' charge jit.zone à la demande.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jit_p.start(mode, outfile)` | Démarre le profileur avec la chaîne de mode donnée. Prévu pour l'option -jp de la ligne de commande LuaJIT. | 294 |
| `jit_p.stop()` | Arrête le profileur et écrit le résultat (« [No samples collected] » s'il n'y a aucun échantillon). Ferme le fichier de sortie s'il n'est pas stdout. | 224 |

### Détail des paramètres

#### `jit_p.start(mode, outfile)`

Démarre le profileur avec la chaîne de mode donnée. Prévu pour l'option -jp de la ligne de commande LuaJIT.

- `mode` (*string|nil*) : Chaîne de lettres/nombres (voir module) ; « f » par défaut.
- `outfile` (*string|nil*) : Fichier de sortie ; défaut LUAJIT_PROFILEFILE ou stdout ; '-' = stdout.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jit/p.lua`.*
