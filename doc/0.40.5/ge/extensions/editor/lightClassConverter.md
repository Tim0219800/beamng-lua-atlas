# `editor_lightClassConverter`

*Fichier : `lua/ge/extensions/editor/lightClassConverter.lua` · VM : Game Engine (GE) · 249 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_lightClassConverter` : `extensions.load("editor_lightClassConverter")`, puis la globale `editor_lightClassConverter`

**Dépendances (chargées avant) :** `editor_inspector`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_lightClassConverter.onEditorInspectorHeaderGui(inspectorInfo)` | rendered at the top of the object inspector window (see the<br> "onEditorInspectorHeaderGui" hook fired by editor_inspector) *(hook)* | 195 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table | Depend on the inspector so this loads after it and the header gui hook + the<br> object/history apis we use are guaranteed to be available. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorObjectAdded` — écouté par 3 module(s)

## Appels vers le moteur (C++)

- `Sim.` `deserializeObjectsFromText`
- `obj:` `getClassName`, `getGroup`, `getName`, `isLocked`, `serialize`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/lightClassConverter.lua`.*
