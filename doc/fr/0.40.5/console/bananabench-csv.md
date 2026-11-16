# `bananabench_csv`

*Fichier : `lua/console/bananabench-csv.lua` · VM : Console · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("bananabench-csv")`

Script de la VM console : exécute le benchmark bananabench (bench.physics()) puis écrit les résultats au format CSV (colonnes Vehicle, Count, MBeams, RealTime, SpawnTime, ExecTime) à l'écran et dans un fichier. Le nom du fichier est le deuxième argument de la ligne de commande (`args[2]`), sinon `bananabench.csv`.

## Remarques

- Bug : les en-têtes sont `SpawnTime,ExecTime` mais les valeurs écrites sont, dans l'ordre, r.time (temps de simulation) puis r.spawntime (temps d'apparition) : les deux colonnes sont inversées par rapport à leur titre.
- Le script s'exécute au chargement (pas de fonction exportée) et utilise la globale `args` fournie par le lanceur de la console.
- Le fichier est ouvert avec io.open (chemin disque).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/bananabench-csv.lua`.*
