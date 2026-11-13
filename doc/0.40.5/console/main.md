# `main`

*Fichier : `lua/console/main.lua` · VM : Console · 18 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("main")`

Point d'entrée de la VM Lua « Console » (utilisée pour des outils en ligne de commande, hors jeu). Il règle package.path/cpath, charge extensions (chemins lua/ge/extensions/ et lua/common/extensions/), puis luaCore, common/cdefs, utils et mathlib. Il ne définit aucune fonction.

## Remarques

- Définit la globale Engine comme un faux objet : Engine.Profiler.pushEvent et popEvent sont des nop, pour que le code partagé qui appelle le profileur fonctionne dans la console.
- package.cpath est vidé : aucune bibliothèque native n'est chargeable depuis cette VM.

**Globales affectées :** `Engine`, `extensions`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/main.lua`.*
