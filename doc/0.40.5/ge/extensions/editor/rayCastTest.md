# `editor_rayCastTest`

*Fichier : `lua/ge/extensions/editor/rayCastTest.lua` · VM : Game Engine (GE) · 157 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rayCastTest` : `extensions.load("editor_rayCastTest")`, puis la globale `editor_rayCastTest`

Outil de debug de l'éditeur (menu Debug > Raycast Test) pour comparer deux types de lancers de rayon. Mode 0 « Gameengine Raycast » : un gizmo de translation place un point, un Engine.castRay vertical (±4 m) dessine le point d'impact et la normale. Mode 1 « Physics Raycast » : une grille de rayons castRayStatic est tirée autour du curseur et les impacts sont colorés selon la distance à la caméra. Le mode est stocké dans la préférence raycastTest.general.rayCastMode.

## Remarques

- onWindowMenuItem, editModeActivate/Update/Deactivate sont locaux : ils sont branchés via editor.editModes.checkTerrainCastRay et le menu, pas exportés.
- Le mode « Physics Raycast » divise par (maxDist - minDist) : donne NaN si tous les impacts sont à la même distance.
- Les fonctions beginDrag/endDrag/dragging sont vides.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rayCastTest.onEditorGui()` | Hook : dessine la fenêtre « Raycast Test » avec un combo pour choisir le mode de rayon. *(interne)* *(hook)* | 32 |
| `editor_rayCastTest.onEditorInitialized()` | Hook : déclare le mode d'édition checkTerrainCastRay (action map « RayCastTest »), enregistre la fenêtre et l'entrée de menu Debug. *(interne)* *(hook)* | 133 |
| `editor_rayCastTest.onEditorRegisterPreferences(prefsRegistry)` | Hook : enregistre la catégorie de préférences raycastTest/general avec rayCastMode (nombre, défaut 0, caché). *(interne)* *(hook)* | 123 |
| `editor_rayCastTest.onEditorToolWindowHide(wndName)` | Hook : si la fenêtre masquée est « raycastTest », repasse en mode d'édition objectSelect. *(interne)* *(hook)* | 145 |
| `editor_rayCastTest.onExtensionLoaded()` | Hook appelé au chargement de l'extension ; vide. *(interne)* *(hook)* | 47 |

### Détail des paramètres

#### `editor_rayCastTest.onEditorRegisterPreferences(prefsRegistry)`

Hook : enregistre la catégorie de préférences raycastTest/general avec rayCastMode (nombre, défaut 0, caché).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_rayCastTest.onEditorToolWindowHide(wndName)`

Hook : si la fenêtre masquée est « raycastTest », repasse en mode d'édition objectSelect.

- `wndName` (*string*) : Nom de la fenêtre masquée.

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `debugDrawer:` `drawLine`, `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rayCastTest.lua`.*
