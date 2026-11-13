# `editor_mainUpdate`

*Fichier : `lua/ge/extensions/editor/mainUpdate.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_mainUpdate` : `extensions.load("editor_mainUpdate")`, puis la globale `editor_mainUpdate`

Boucle de mise à jour de l'éditeur, appelée à chaque frame via onUpdate quand l'éditeur est actif. Elle met à jour et dessine les icônes d'objets, diffuse les changements de préférences (et les sauvegarde), appelle l'onUpdate du mode d'édition courant, puis présente l'interface (GUI, menus contextuels, boîtes modales, dialogue de sauvegarde des outils modifiés).

## Remarques

- Ne fait rien si editor.active est faux.
- La sauvegarde des préférences se fait dès qu'une préférence a changé dans la frame ; le code contient un TODO pour ajouter un délai.
- M.onEditorInitialized est explicitement mis à nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_mainUpdate.onExtensionLoaded()` | Hook de chargement. Corps vide. *(interne)* *(hook)* | 37 |
| `editor_mainUpdate.onExtensionUnloaded()` | Hook de déchargement. Corps vide. *(interne)* *(hook)* | 40 |
| `editor_mainUpdate.onUpdate(dtReal, dtSim, dtRaw)` | Boucle par frame de l'éditeur : icônes d'objets, préférences modifiées, editMode.onUpdate, gizmos (si editor.hideObjectIcons est faux) puis editor.guiModule.presentGui. *(interne)* *(hook)* | 13 |

### Détail des paramètres

#### `editor_mainUpdate.onUpdate(dtReal, dtSim, dtRaw)`

Boucle par frame de l'éditeur : icônes d'objets, préférences modifiées, editMode.onUpdate, gizmos (si editor.hideObjectIcons est faux) puis editor.guiModule.presentGui.

- `dtReal` (*number*) : Delta de temps réel de la frame (s), transmis au mode d'édition et à presentGui.
- `dtSim` (*number*) : Delta de temps de simulation (s).
- `dtRaw` (*number*) : Delta de temps brut (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `onEditorInitialized` | nil |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/mainUpdate.lua`.*
