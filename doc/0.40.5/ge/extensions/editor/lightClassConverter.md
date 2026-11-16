# `editor_lightClassConverter`

*File: `lua/ge/extensions/editor/lightClassConverter.lua` · VM: Game Engine (GE) · 249 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_lightClassConverter`: `extensions.load("editor_lightClassConverter")`, then the global `editor_lightClassConverter`

Adds a "Convert To Spot Light / Point Light" button at the top of the inspector when the selection contains only PointLight or only SpotLight objects. The conversion replaces the object in place, keeping the SimObject id, the name, the parent group, the transform and the common fields; it is a single reversible undo step (restored from the original serialization).

## Notes

- The button does not appear if the selection is mixed or contains another type; if an object is locked (isLocked), a yellow message replaces the button.
- Radius: "radius" (PointLight) and "range" (SpotLight) are mapped explicitly, otherwise the light takes the default value and loses its shadows.
- intensity and brightness are not copied raw (different units: lumens/candelas); brightness is reapplied last to avoid drift at each conversion.
- Emits the hook onEditorObjectAdded(id) after each conversion or undo.

**Dependencies (loaded first):** `editor_inspector`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_lightClassConverter.onEditorInspectorHeaderGui(inspectorInfo)` | Draws the conversion button at the top of the inspector window (hook emitted by editor_inspector). Uses the instance's locked selection if it exists, otherwise editor.selection.object. *(internal)* *(hook)* | 195 |

### Parameter details

#### `editor_lightClassConverter.onEditorInspectorHeaderGui(inspectorInfo)`

Draws the conversion button at the top of the inspector window (hook emitted by editor_inspector). Uses the instance's locked selection if it exists, otherwise editor.selection.object.

- `inspectorInfo` (*table|nil*) : Inspector instance; its selection.object field is used if it exists.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {"editor_inspector"}: loaded after the inspector to have the header hook and the APIs available. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorObjectAdded` — listened to by 3 module(s)

## Calls into the engine (C++)

- `Sim.` `deserializeObjectsFromText`
- `obj:` `getClassName`, `getGroup`, `getName`, `isLocked`, `serialize`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/lightClassConverter.lua`.*
