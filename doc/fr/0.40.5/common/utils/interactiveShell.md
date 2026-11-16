# `utils_interactiveShell`

*Fichier : `lua/common/utils/interactiveShell.lua` · VM : Commun (GE + véhicule) · 112 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("utils/interactiveShell")`

Console Lua interactive (REPL) pour l'exécutable console (console.x64.exe) : require('utils/interactiveShell').start() lit des lignes sur l'entrée standard et les exécute. Sert au développement et aux tests hors interface ; un moddeur ne l'utilise normalement pas dans le jeu normal. Définit aussi des globales d'aide.

## Exemple

```lua
require('utils/interactiveShell').start()
```

## Remarques

- Définit les GLOBALES spawnObjects (alias sp), updateOnce, updateLoop (alias ul).
- Commandes spéciales dans le shell : help, tracktime (chronomètre chaque commande), unittests / ut, reload (reloadLua()), testenv, exit/quit/Ctrl-D (caractère 4).
- spawnObjects supprime TOUS les objets (BeamEngine:deleteAllObjects()) avant de recréer n objets 'vehicles/<v>' (pickup par défaut), espacés en y de 3*n. Il prévient si le nombre de slots ne correspond pas.
- updateOnce et updateLoop appellent BeamEngine:update(1/2000, 1/2000) ; updateOnce ignore son paramètre n ; updateLoop exécute n+1 itérations (boucle de 0 à n).
- La commande 'unittests' référence lua/tests/unittests qui peut ne pas exister dans la version livrée (déduit du code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `utils_interactiveShell.start()` | Boucle bloquante : affiche l'invite '> ', lit une ligne, gère les raccourcis puis exécute la ligne avec loadstring/xpcall et affiche le résultat ou l'erreur avec trace. Quitte sur fin d'entrée, 'exit', 'quit' ou Ctrl-D. Appelle updateLuaCore() à chaque tour s'il existe (nettoyage et GC). | 66 |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `spawnObjects(n, v)` | GLOBALE d'aide (alias sp) : supprime tous les objets puis fait apparaître n véhicules. | 12 |
| `updateLoop(n)` | GLOBALE d'aide (alias ul) : n+1 mises à jour du moteur de simulation à 1/2000 s. | 31 |
| `updateOnce(n)` | GLOBALE d'aide : une mise à jour du moteur de simulation (BeamEngine:update(1/2000, 1/2000)). | 27 |

**Globales affectées :** `sp`, `ul`

## Appels vers le moteur (C++)

- `BeamEngine:` `deleteAllObjects`, `getSlotCount`, `spawnObject`, `update`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils/interactiveShell.lua`.*
