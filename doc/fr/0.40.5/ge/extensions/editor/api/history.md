# `editor_api_history`

*Fichier : `lua/ge/extensions/editor/api/history.lua` · VM : Game Engine (GE) · 226 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/api/history")` (fichier sous extensions/ mais pas une extension classique)

Pile annuler/rétablir (undo/redo) de l'éditeur. Chaque action a un nom, une table de données et deux fonctions undo/redo qui reçoivent cette table. Les actions sont regroupées en transactions (une action seule forme une transaction d'une action) ; undo/redo opèrent par transaction. Le module renvoie un constructeur sans argument (appelle `init`). Limite par défaut : 1000 niveaux.

## Exemple

```lua
local h = require("editor/api/history")()
h:commitAction("MyMove", {id = 5, old = a, new = b},
  function(d) --[[ undo ]] end,
  function(d) --[[ redo ]] end)
h:undo()
```

## Remarques

- `commitAction` hors transaction exécute immédiatement redoFunc (sauf dontCallRedoNow) et renvoie le RÉSULTAT de redoFunc, non l'action comme le dit le commentaire ; dans une transaction il renvoie l'action. Il renvoie nil si l'action est identique à la dernière transaction de la pile (hors timestamp), et false si undo ou redo manque.
- `table.remove(self.undoStack, 0)` est utilisé pour retirer la plus ancienne transaction quand la pile est pleine : l'indice 0 n'est pas un indice valide d'une séquence Lua, donc la limite de 1000 niveaux ne semble pas vraiment appliquée (déduit du code).
- `endTransaction` plante si aucune transaction n'est commencée (currentTransaction nil). Une transaction vide n'est pas ajoutée à la pile.
- Tout nouveau commit ou endTransaction non vide vide la pile de redo.
- Hooks optionnels posés par l'appelant : `self.onUndo(action)`, `self.onRedo(action)`, `self.onCommitAction(action)`. Les actions stockent `userId` (editor.userId) et `timestamp` (os.time()).

## Classe `C`

Objet d'historique. Champs : maxUndoLevels, undoStack, redoStack, currentTransaction.

Le module renvoie un constructeur : `local obj = require("editor_api_history")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginTransaction(name)` | Démarre un groupe d'actions annulables d'un seul coup. Les redo ne sont exécutés qu'à endTransaction. | 76 |
| `C:cancelTransaction()` | Abandonne la transaction en cours sans rien exécuter ni empiler (utile si une action a échoué). | 88 |
| `C:clear()` | Vide les piles d'undo et de redo (nouveau document). | 173 |
| `C:commitAction(name, data, undoFunc, redoFunc, dontCallRedoNow)` | Enregistre une action undo/redo et exécute son redo. Dans une transaction, l'action est seulement ajoutée au groupe. | 122 |
| `C:deserialize(data)` | Restaure les piles depuis `data.history` s'il existe et annule la transaction en cours. | 212 |
| `C:endTransaction(dontCallRedoNow)` | Termine la transaction : l'empile et exécute les redo de toutes ses actions (sauf dontCallRedoNow), puis vide la pile de redo. | 94 |
| `C:init()` | Initialise les piles vides, maxUndoLevels = 1000, aucune transaction en cours. Appelé par le constructeur. | 31 |
| `C:redo(steps)` | Rétablit `steps` transactions : appelle redo de chaque action dans l'ordre, puis les remet sur la pile d'undo. | 58 |
| `C:serialize(data)` | Écrit `data.history = { undoStack, redoStack }` (références, pas de copie). | 205 |
| `C:undo(steps)` | Annule `steps` transactions : appelle undo de chaque action en ordre inverse, puis déplace la transaction sur la pile de redo. S'arrête si la pile est vide. | 40 |
| `C:updateRedoStackObjectId(oldObjectId, newObjectId)` | Dans les actions de la pile de redo, remplace `data.objectId` et les éléments de `data.objectIds` égaux à oldObjectId par newObjectId (utile quand un objet est recréé avec un autre id). | 181 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/history.lua`.*
