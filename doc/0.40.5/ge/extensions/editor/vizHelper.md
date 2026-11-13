# `editor_vizHelper`

*Fichier : `lua/ge/extensions/editor/vizHelper.lua` · VM : Game Engine (GE) · 228 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vizHelper` : `extensions.load("editor_vizHelper")`, puis la globale `editor_vizHelper`

Petit outil pour les level designers (menu Debug > « Viz Helper ») : il pose des décalcomanies (decals) dynamiques d'images prises dans art/vizhelper/ à l'endroit visé par la souris dans la vue 3D, pour marquer des choses. Molette = rotation, Ctrl+molette = taille, Alt+molette = changer d'image, Maj = sensibilité x10, clic gauche = poser (maintenu = peindre avec une distance minimale).

## Exemple

```lua
extensions.load('editor_vizHelper')
editor_vizHelper.openWindow()
```

## Remarques

- Les decals posés sont gardés dans une table locale savedDecals et réaffichés à chaque onUpdate via Engine.Render.DynamicDecalMgr.addDecals ; ils sont vidés à la désactivation de l'éditeur (onEditorDeactivated) ou par le bouton « clear ». Ils ne sont pas sauvegardés dans le niveau.
- Les images sont listées au chargement de l'extension (FS:findFiles sur art/vizhelper/) ; si le dossier est vide, vizHelper[curItem+1] est nil et la concaténation du chemin échoue.
- Le fenêtrage utilise im.Begin directement (un TODO dans le code prévoit de passer à editor.beginWindow).
- Valeurs fixes des decals : fadeStart 2000, fadeEnd 2500 (m), échelle uniforme = Size, forwardVec tourné autour de la normale.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vizHelper.onDeserialized(data)` | Hook appelé après un rechargement Lua : restaure l'état ouvert de la fenêtre. *(interne)* *(hook)* | 211 |
| `editor_vizHelper.onEditorActivated()` | Hook de l'éditeur appelé à l'activation ; ne fait rien. *(interne)* *(hook)* | 198 |
| `editor_vizHelper.onEditorDeactivated()` | Hook de l'éditeur appelé à la désactivation : vide savedDecals. *(interne)* *(hook)* | 201 |
| `editor_vizHelper.onEditorGui()` | Hook de l'éditeur appelé à chaque frame : dessine la fenêtre, gère l'entrée (molette, clic), fait un cameraMouseRayCast, dessine une sphère verte au point visé et ajoute le decal de prévisualisation ou le sauvegarde. *(interne)* *(hook)* | 50 |
| `editor_vizHelper.onEditorInitialized()` | Hook de l'éditeur : ajoute l'entrée de menu « Viz Helper » (groupe Debug). *(interne)* *(hook)* | 185 |
| `editor_vizHelper.onExtensionLoaded()` | Hook d'extension appelé au chargement : liste les fichiers de art/vizhelper/ et construit la chaîne de la liste déroulante. *(interne)* *(hook)* | 190 |
| `editor_vizHelper.onSerialize()` | Hook appelé avant un rechargement Lua : renvoie {windowOpen = bool}. *(interne)* *(hook)* | 205 |
| `editor_vizHelper.onUpdate()` | Hook d'extension appelé à chaque frame : réaffiche tous les decals sauvegardés. *(interne)* *(hook)* | 173 |
| `editor_vizHelper.openWindow()` | Ouvre la fenêtre Viz Helper (windowOpen[0] = true). | 37 |

### Détail des paramètres

#### `editor_vizHelper.onDeserialized(data)`

Hook appelé après un rechargement Lua : restaure l'état ouvert de la fenêtre.

- `data` (*table*) : table produite par onSerialize

#### `editor_vizHelper.onSerialize()`

Hook appelé avant un rechargement Lua : renvoie {windowOpen = bool}.

- **renvoie** : table {windowOpen = boolean}

## Champs

| Champ | Type | Description |
|---|---|---|
| `windowOpen` | ImGui BoolPtr | État ouvert/fermé de la fenêtre ; lire/écrire avec windowOpen[0]. |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vizHelper.lua`.*
