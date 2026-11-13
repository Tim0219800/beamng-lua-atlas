# `jit_v`

*Fichier : `lua/common/jit/v.lua` · VM : Commun (GE + véhicule) · 175 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jit/v")`

Module jit.v de LuaJIT (Mike Pall, licence MIT, 2005-2026) : mode verbeux du compilateur JIT. Il affiche une ligne par trace générée ([TRACE n fichier:ligne ...]) et par trace abandonnée, ce qui aide à voir quel code est compilé ou où le compilateur retombe sur l'interpréteur (NYI). Sortie par défaut sur stderr ; fichier via argument ou variable d'environnement LUAJIT_VERBOSEFILE.

## Exemple

```lua
local v = require('jit/v')
v.on('jit_verbose.txt')
-- code à observer
v.off()
```

## Remarques

- on et start sont la même fonction (start sert à l'option -jv de la ligne de commande).
- Un second appel à on() détache d'abord les handlers précédents (dumpoff).
- Le fichier de sortie est écrasé à chaque démarrage ; '-' désigne stdout.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jit_v.off()` | Détache le handler de traces et ferme le fichier (sauf stdout/stderr). | 146 |
| `jit_v.on(outfile)` | Ouvre le fichier de sortie et attache le handler de traces (jit.attach 'trace'). | 156 |
| `jit_v.start(outfile)` | Alias de on, prévu pour l'option -jv de la ligne de commande. | 156 |

### Détail des paramètres

#### `jit_v.on(outfile)`

Ouvre le fichier de sortie et attache le handler de traces (jit.attach 'trace').

- `outfile` (*string|nil*) : Fichier de sortie ; défaut LUAJIT_VERBOSEFILE sinon stderr ; '-' = stdout.

#### `jit_v.start(outfile)`

Alias de on, prévu pour l'option -jv de la ligne de commande.

- `outfile` (*string|nil*) : Fichier de sortie.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jit/v.lua`.*
