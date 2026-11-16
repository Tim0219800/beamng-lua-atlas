# `editor_undoHistory`

*Fichier : `lua/ge/extensions/editor/undoHistory.lua` · VM : Game Engine (GE) · 97 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_undoHistory` : `extensions.load("editor_undoHistory")`, puis la globale `editor_undoHistory`

Fenêtre d'éditeur « Undo History » : affiche côte à côte la pile d'annulation (editor.history.undoStack) et la pile de rétablissement (redoStack). Chaque action est listée avec son nom ; une infobulle montre un dump tronqué de l'action (20 lignes de 100 caractères max). Boutons « Undo Selected », « Redo Selected » (appellent editor.undo / editor.redo avec le nombre d'étapes) et « Delete All History » (editor.clearUndoHistory, sans défaire les modifications).

## Remarques

- La fenêtre s'appelle « undoHistory » et est ouverte via le menu Window > Undo History.
- Les index sélectionnés (selectedIndex, selectedIndex2) sont des variables locales du module, non exportées.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_undoHistory.onEditorGui()` | Hook appelé à chaque frame de l'éditeur : dessine la fenêtre Undo History avec les deux piles. *(interne)* *(hook)* | 34 |
| `editor_undoHistory.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : ajoute l'entrée de menu « Undo History » et enregistre la fenêtre (taille initiale 300x500). *(interne)* *(hook)* | 88 |
| `editor_undoHistory.onExtensionLoaded()` | Hook appelé au chargement de l'extension ; ne fait rien. *(interne)* *(hook)* | 85 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/undoHistory.lua`.*
