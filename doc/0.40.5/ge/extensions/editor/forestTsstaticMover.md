# `editor_forestTsstaticMover`

*Fichier : `lua/ge/extensions/editor/forestTsstaticMover.lua` · VM : Game Engine (GE) · 565 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_forestTsstaticMover` : `extensions.load("editor_forestTsstaticMover")`, puis la globale `editor_forestTsstaticMover`

**Dépendances (chargées avant) :** `core_forest`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_forestTsstaticMover.onEditorGui()` | UI *(hook)* | 492 |
| `editor_forestTsstaticMover.onEditorInitialized()` | *(hook)* | 556 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorObjectSelectionChanged` — écouté par 8 module(s)

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `obj:` `getId`, `registerObject`, `setField`, `setInternalName`, `setName`, `setScale`, `setTransform`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `worldEditorCppApi.` `rebuildForestManagerInstanceData`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/forestTsstaticMover.lua`.*
