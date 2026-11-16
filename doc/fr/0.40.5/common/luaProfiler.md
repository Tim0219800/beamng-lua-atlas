# `luaProfiler`

*Fichier : `lua/common/luaProfiler.lua` · VM : Commun (GE + véhicule) · 235 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("luaProfiler")`

Petit profileur de sections de code Lua. On crée un profileur avec LuaProfiler(titre), on appelle p:start() au début d'une fonction, p:add('nom') après chaque section à mesurer (temps et mémoire allouée), puis p:finish(...) à la fin pour écrire dans le log les durées, la mémoire et un petit graphique, avec détection optionnelle de pics par rapport à une moyenne lissée. Utile pour trouver les parties lentes ou génératrices de garbage d'un mod.

## Exemple

```lua
local p = LuaProfiler('mon profileur')
function updateGFX(dt)
  p:start()
  foo()
  p:add('foo')
  bar()
  p:add('bar')
  p:finish(true)            -- afficher à chaque frame
  -- p:finish(dt > 0, dt)   -- avec détection de pics
  -- p:finish(true, nil, 0.002) -- masquer les sections < 2 ms
end
```

## Remarques

- SIGNATURE RÉELLE : finish(compute, dt, threshold) ; finishToTable(dt, threshold). La page extraite affichait finish(dt, threshold), ce qui est inexact.
- compute == false désactive tout calcul et tout log (moyen rapide de couper le profilage sans retirer les add()). dt (nombre) active le calcul de moyenne et la détection de pics ; threshold = durée minimale pour afficher une ligne.
- Plusieurs add() avec le même nom dans une même frame sont cumulés (champ runs, affiché '(xN)'). start() et add() réinitialisent le chronomètre : mesurer des fonctions indépendantes demande un start() chacune.
- Les durées sont affichées en 'ms' dans les messages (valeur renvoyée par le chronomètre haute précision, HighPerfTimer ou hptimer) et la mémoire en octets (collectgarbage('count')*1024).
- Dans le code, `peakDetected = true` est affecté inconditionnellement dans computeFrameResult juste après son calcul : la détection de pic globale est donc toujours vraie (seul le test par section sur deltaRel > 0.3 filtre).
- Utilise des globales du jeu : log, newTemporalSmoothing (filters.lua), lpad, graphs, HighPerfTimer/hptimer.
- Le commentaire d'exemple du code contient une faute (`p.add` et `done`), ignorer : la syntaxe correcte est p:add et end.

## Classe `C`

Classe du profileur (objet renvoyé par LuaProfiler).

| Méthode | Description | Ligne |
|---|---|---|
| `C:add(section)` | À appeler après chaque section de code à mesurer : enregistre le temps et la mémoire depuis le dernier start/add sous le nom `section`, puis relance le chronomètre. Journalise une erreur si start() n'a pas été appelé. | 49 |
| `C:finish(compute, dt, threshold)` | Termine la frame : calcule les statistiques et écrit dans le log la ligne TOTAL puis une ligne par section (mémoire, durée, éventuel écart à la moyenne, graphique). Réinitialise ensuite le chronomètre et les sections. | 191 |
| `C:finishToTable(dt, threshold)` | Comme finish mais renvoie un rapport sérialisable au lieu d'écrire dans le log : {title, detectPeaks, threshold, peakDetected, shouldOutput, total = {time, garbage, stats}, sections = [{section, runs, time, garbage, peakDetected, shouldOutput, graph, stats}]}. | 222 |
| `C:init(title)` | Constructeur : mémorise le titre. | 44 |
| `C:start()` | Démarre (ou réinitialise) le chronomètre et le compteur de mémoire. À appeler une fois par fonction indépendante à profiler (sans appelant commun avec une autre déjà profilée). | 183 |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `LuaProfiler(...)` | Fonction GLOBALE : crée un profileur (objet de classe C) et appelle son init avec les arguments donnés. | 229 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/luaProfiler.lua`.*
