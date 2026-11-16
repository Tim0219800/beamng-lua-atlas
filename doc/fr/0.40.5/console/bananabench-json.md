# `bananabench_json`

*Fichier : `lua/console/bananabench-json.lua` · VM : Console · 22 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("bananabench-json")`

Script de la VM console : met stdout en mode ligne par ligne (pour que le processus parent lise la progression en direct), exécute bench.physics() de bananabench puis écrit le résultat complet en JSON avec jsonWriteFile (indenté). Nom du fichier : deuxième argument de la ligne de commande (`args[2]`), sinon `bananabench.json`.

## Remarques

- S'exécute au chargement (pas de fonction exportée) ; utilise la globale `args` fournie par la console.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/bananabench-json.lua`.*
