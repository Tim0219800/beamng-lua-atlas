# `editor_raceEditor_trackLayout`

*Fichier : `lua/ge/extensions/editor/raceEditor/trackLayout.lua` · VM : Game Engine (GE) · 155 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/trackLayout")` (fichier sous extensions/ mais pas une extension classique)

Sous-fenêtre « Track Layout » de l'éditeur de course (raceEditor). Elle règle le nombre de tours par défaut (defaultLaps, minimum 1), les nœuds de départ et d'arrivée (startNode, endNode), les positions de départ normale, inverse, lancée et lancée inverse (defaultStartPosition, reverseStartPosition, rollingStartPosition, rollingReverseStartPosition) et l'option « Simplify AI Path » (simplifyAiPath). Elle affiche la classification calculée par path:classify() (Reversible, Rolling Start, Closed, Branching) et dessine dans le monde les libellés « Stop Control » et « Split N ». Changements via editor.history. Le module renvoie un constructeur : require('/lua/ge/extensions/editor/raceEditor/trackLayout')(raceEditor).

## Remarques

- Une position de départ nommée STOP_ZONE, SS_stop_control ou TC_out est reconnue comme zone d'arrêt et reçoit le texte « Stop Control » dans le monde.
- Les nœuds marqués useAsSplit (sauf le dernier de la liste triée) sont numérotés « Split 1 », « Split 2 »… dans le monde.
- Un circuit ouvert ne peut pas avoir plus d'un tour ; un circuit fermé n'a pas besoin de End Node (infobulles du code).
- C:selector indexe objects.objects[self.path[fieldName]] : la valeur -1 (« None ») dépend du fait que la collection renvoie un objet « manquant » pour cet indice.

## Classe `C`

Fenêtre Track Layout (windowDescription = 'Track Layout'). Instanciée avec init(raceEditor).

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_trackLayout")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:changeField(field, new)` | Si la nouvelle valeur diffère de path[field], valide une action d'historique qui modifie ce champ du chemin. | 27 |
| `C:displayClassification(classification, name, field, tt)` | Affiche une ligne « nom » avec icône coche ou croix selon classification[field]. | 78 |
| `C:draw()` | Appelé à chaque frame : dessine le formulaire, la zone d'arrêt et les splits. | 20 |
| `C:drawGeneralInfo()` | Dessine le formulaire (tours, nœuds, positions de départ, classification, option de simplification IA) puis la zone d'arrêt et les splits. | 35 |
| `C:drawSplits()` | Dessine « Split N » sur chaque pathnode useAsSplit (hors dernier nœud de la liste triée). | 107 |
| `C:drawStopZone()` | Cherche une position de départ nommée STOP_ZONE, SS_stop_control ou TC_out et y dessine le texte « Stop Control ». | 89 |
| `C:init(raceEditor)` | Mémorise raceEditor. | 10 |
| `C:selected()` | Appelé quand l'onglet devient actif ; ne fait rien. | 17 |
| `C:selector(name, objects, fieldName, clrI, tt)` | Liste déroulante de choix d'un nœud ou d'une position pour un champ du chemin (None = -1), avec libellé dessiné dans le monde et prévisualisation du nom survolé. | 120 |
| `C:setPath(path)` | Définit le chemin de course édité. | 14 |
| `C:unselect()` | Appelé quand l'onglet est quitté ; ne fait rien. | 18 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/trackLayout.lua`.*
