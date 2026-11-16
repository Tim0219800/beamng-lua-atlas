# `editor_forestView`

*Fichier : `lua/ge/extensions/editor/forestView.lua` · VM : Game Engine (GE) · 157 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_forestView` : `extensions.load("editor_forestView")`, puis la globale `editor_forestView`

Fenêtre « Forest View » de l'éditeur, destinée à lister les ForestItemData de la forêt (« theForest ») sous forme de boutons triés par nom. Le module est en grande partie inachevé : les hooks d'activation/désactivation du mode d'édition sont commentés à l'export, donc la liste n'est jamais remplie et la fenêtre reste vide.

## Remarques

- Bug : forestItemDataTreeNode appelle selectForestItemData, dont la définition est entièrement commentée ; cliquer sur un bouton lèverait une erreur si la liste contenait des éléments.
- populateForestItems, onEditorEditModeActivated et onEditorEditModeDeactivated sont définis mais jamais appelés (les exports M.onEditorEditModeActivated/Deactivated sont commentés) : forestItemsInfo reste vide.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_forestView.onEditorActivated()` | Hook appelé à l'activation de l'éditeur ; corps vide. *(interne)* *(hook)* | 15 |
| `editor_forestView.onEditorGui()` | Hook appelé chaque frame par l'éditeur : dessine la fenêtre « Forest View » avec un bouton par entrée de forestItemsInfo. *(interne)* *(hook)* | 86 |
| `editor_forestView.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre « forestEditorView » (220x320). *(interne)* *(hook)* | 11 |

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `obj:` `getId`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/forestView.lua`.*
