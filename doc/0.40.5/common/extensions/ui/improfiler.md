# `ui_improfiler`

*Fichier : `lua/common/extensions/ui/improfiler.lua` · VM : Commun (GE + véhicule) · 332 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_improfiler` : `extensions.load("ui_improfiler")`, puis la globale `ui_improfiler`

Profileur LuaJIT affiché dans une fenêtre ImGui « LuaJIT Profiler ». La première partie du fichier est le module jit/p de Mike Pall (MIT, 2005-2017) adapté : échantillonnage du profileur intégré de LuaJIT (jit.profile) et formatage du résultat dans une chaîne au lieu de stdout. La fin du fichier est la partie BeamNG : toutes les 3 secondes, le profil est terminé, son texte affiché dans la fenêtre, puis un nouveau profil est lancé avec le mode « vzm0lspi0 500 -500 » (états VM, zones, minimum 0 %, split, chemins complets, intervalle 0 ms...).

## Exemple

```lua
extensions.load('ui_improfiler') -- la fenêtre apparaît ; le texte est rafraîchi toutes les 3 s
```

## Remarques

- Le fichier fait require('libs/LuaJIT/vmdef') alors que la copie du jeu est dans common/jit/vmdef.lua : chemin différent (pas de bug prouvé, seulement à garder en tête).
- Le fichier assert que jit.version_num == 20100.
- Seul onUpdate est exposé ; le profil démarre au premier cycle de 3 s (prof_finish ne fait rien tant qu'aucun profil n'est lancé).
- Le temps est cumulé avec dtReal (temps réel, non affecté par le ralenti).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_improfiler.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé chaque frame : dessine la fenêtre « LuaJIT Profiler » avec le dernier résultat ; toutes les 3 s de temps réel, termine le profil en cours, met à jour le texte affiché et relance le profileur. *(interne)* *(hook)* | 307 |

### Détail des paramètres

#### `ui_improfiler.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé chaque frame : dessine la fenêtre « LuaJIT Profiler » avec le dernier résultat ; toutes les 3 s de temps réel, termine le profil en cours, met à jour le texte affiché et relance le profileur.

- `dtReal` (*number*) : Delta temps réel (s), cumulé pour le minuteur de 3 s.
- `dtSim` (*number*) : Non utilisé.
- `dtRaw` (*number*) : Non utilisé.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/extensions/ui/improfiler.lua`.*
