# `util_groundModelDebug`

*Fichier : `lua/ge/extensions/util/groundModelDebug.lua` · VM : Game Engine (GE) · 578 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_groundModelDebug` : `extensions.load("util_groundModelDebug")`, puis la globale `util_groundModelDebug`

Fenêtre ImGui de débogage et de réglage des ground models (modèles de sol : friction, fluide de surface, type de collision). Elle permet d'afficher en 3D, autour du pointeur de la souris (ou du point de focus du debugger), la carte de hauteur des ground models, sa profondeur et les triangles de collision statiques, avec une couleur par ground model, et une densité de triangles de collision par tuile. Chaque ground model peut être modifié en direct (be:setGroundModel, aliases inclus) puis sauvegardé dans /art/groundmodels.json ; le bouton « Default » recharge les valeurs d'origine. Les réglages d'affichage sont mémorisés dans settings/editor/groundModelDebug_settings.json.

## Exemple

```lua
extensions.load('util_groundModelDebug')
extensions.util_groundModelDebug.openWindow()
```

## Remarques

- Les propriétés modifiables d'un ground model : collisiontype (index de matériau physique), defaultDepth (m), dragAnisotropy, flowBehaviorIndex, flowConsistencyIndex, fluidDensity (kg/m3), hydrodynamicFriction, roughnessCoefficient, shearStrength, skidMarks, slidingFrictionCoefficient, staticFrictionCoefficient, strength, stribeckVelocity (m/s). Les info-bulles de la fenêtre expliquent chacune.
- Les modifications sont appliquées en direct côté jeu ; elles ne sont écrites dans /art/groundmodels.json que par le bouton Save (le fichier est remplacé en entier ; les ground models alias ne sont pas écrits mais listés dans le champ aliases de leur parent).
- La fenêtre se reconstruit (setup) quand core_environment.groundModels est remplacé (par exemple au chargement d'un niveau).
- À la fermeture de la fenêtre, l'affichage des triangles statiques et de la densité sont désactivés (Engine.setStaticColDebugEnabled(false)).
- Le bloc d'affichage de la collision statique détaillée est commenté dans le code car il provoquait de fortes chutes de framerate.

**Dépendances (chargées avant) :** `ui_imguiUtils`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_groundModelDebug.onDeserialized(data)` | Hook de désérialisation : restaure l'état sauvegardé et réactive le débogage des collisions statiques côté moteur si nécessaire. *(interne)* *(hook)* | 563 |
| `util_groundModelDebug.onExtensionLoaded()` | Appelé au chargement : construit la liste des ground models depuis core_environment.groundModels et relit les réglages sauvegardés. *(interne)* *(hook)* | 551 |
| `util_groundModelDebug.onSerialize()` | Hook de sérialisation avant un rechargement d'extensions : conserve l'état d'ouverture de la fenêtre, de l'affichage des triangles statiques et de la densité. *(interne)* *(hook)* | 555 |
| `util_groundModelDebug.onUpdate(dt)` | Hook appelé chaque frame : tant que la fenêtre est ouverte, détermine le point de focus (raycast de la souris ou Lua.lastDebugFocusPos), dessine les visualisations debug de chaque ground model actif et l'interface ImGui. *(interne)* *(hook)* | 232 |
| `util_groundModelDebug.openWindow()` | Ouvre la fenêtre « GroundModel Debug Window ». | 207 |

### Détail des paramètres

#### `util_groundModelDebug.onDeserialized(data)`

Hook de désérialisation : restaure l'état sauvegardé et réactive le débogage des collisions statiques côté moteur si nécessaire.

- `data` (*table*) : Données renvoyées par onSerialize

#### `util_groundModelDebug.onSerialize()`

Hook de sérialisation avant un rechargement d'extensions : conserve l'état d'ouverture de la fenêtre, de l'affichage des triangles statiques et de la densité.

- **renvoie** : table {windowOpen, staticDebug, colDensityEnabled}

#### `util_groundModelDebug.onUpdate(dt)`

Hook appelé chaque frame : tant que la fenêtre est ouverte, détermine le point de focus (raycast de la souris ou Lua.lastDebugFocusPos), dessine les visualisations debug de chaque ground model actif et l'interface ImGui.

- `dt` (*number*) : Delta de temps en secondes (non utilisé)

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_imguiUtils"} : utilisé pour charger l'atlas d'icônes de l'éditeur |

## Appels vers le moteur (C++)

- `Engine.` `setStaticColDebugEnabled`, `setStaticColDebugPosShrink`
- `be:` `setGroundModel`
- `core_environment.` `reloadGroundModels`
- `debugDrawer:` `drawSphere`, `renderGroundModelDebug`, `renderStaticColCounter`, `renderStaticColDebug`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/groundModelDebug.lua`.*
