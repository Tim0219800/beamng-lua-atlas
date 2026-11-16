# `editor_rallyEditor_ghostNotebook_ghostRenderer`

*Fichier : `lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua` · VM : Game Engine (GE) · 269 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/ghostNotebook/ghostRenderer")` (fichier sous extensions/ mais pas une extension classique)

Dessine dans la vue 3D les libellés du carnet fantôme de l'éditeur de rallye. Pour chaque pacenote du carnet fantôme, il projette le début de virage sur la route (snaproad), trie les entrées par distance le long de la route et n'affiche que celles proches de la caméra. Texte blanc sur fond bleu foncé via debugDrawer:drawTextAdvanced. Le module renvoie un constructeur (classe C).

## Remarques

- Le tracé en prismes de la route fantôme est désactivé dans le code (appel à drawRoutePrisms commenté dans drawEntry) : seuls les libellés sont affichés.
- Distance d'affichage = préférence getPrefPacenoteLabelDistance (100 m par défaut) autour de la position de la caméra projetée sur la snaproad.
- Si un pacenote est sélectionné dans l'éditeur, seul le fantôme le plus proche (et ses voisins selon les préférences) est étiqueté ; les voisins sont à 50 % d'opacité du texte. Sans sélection, tous les libellés proches sont dessinés.
- Le cache (entrées triées) est reconstruit quand le carnet ou la snaproad change (comparaison par référence).

## Classe `C`

Objet renvoyé par le constructeur (new(rallyEditor)). Champs : rallyEditor, cache {path, snaproad, entries}.

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_ghostNotebook_ghostRenderer")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:buildCache(path, snaproad)` | Construit la liste des entrées du carnet fantôme : pour chaque pacenote non manquant ayant un début et une fin de virage, calcule les positions de route, la position du libellé et la distance le long de la route, puis trie par distance. Stocke le résultat dans self.cache. | 137 |
| `C:draw(path, snaproad, globalOpacity, pacenoteToolsState, activePath)` | Appelée à chaque image : localise la caméra sur la snaproad, sélectionne les entrées dans la fenêtre de distance, décide quelles étiquettes afficher (sélection et voisins précédent/suivant selon les préférences) et appelle drawEntry. | 205 |
| `C:drawEntry(entry, lineColor, textAlpha, textBgAlpha, drawLabel, prismWidth)` | Dessine le libellé d'une entrée à sa position de début de virage. Le texte vient de rallyEditor.getGhostNotebookLabelForPacenote, sinon du nom du pacenote. Ne dessine rien si drawLabel est faux ou si le texte est vide. | 179 |
| `C:getCache(path, snaproad)` | Renvoie le cache courant s'il correspond au même carnet et à la même snaproad, sinon le reconstruit. | 172 |
| `C:init(rallyEditor)` | Constructeur interne : mémorise l'éditeur et vide le cache. | 13 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua`.*
