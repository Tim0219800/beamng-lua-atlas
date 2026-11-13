# `editor_copyToSelected`

*Fichier : `lua/ge/extensions/editor/copyToSelected.lua` · VM : Game Engine (GE) · 498 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_copyToSelected` : `extensions.load("editor_copyToSelected")`, puis la globale `editor_copyToSelected`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_copyToSelected.onEditorGui()` | UI *(hook)* | 376 |
| `editor_copyToSelected.onEditorInitialized()` | *(hook)* | 491 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorObjectSelectionChanged` — écouté par 8 module(s)

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `debugDrawer:` `drawSphere`
- `obj:` `getDynDataFieldbyName`, `getField`, `getName`, `setDynDataFieldbyName`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/copyToSelected.lua`.*
