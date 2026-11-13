# `editor_api_assets`

*Fichier : `lua/ge/extensions/editor/api/assets.lua` · VM : Game Engine (GE) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_assets` : `extensions.load("editor_api_assets")`, puis la globale `editor_api_assets`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_assets.initialize(editorInstance)` | Initialize the module. | 39 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.dragDropSource(dragDropId, data, callback)` | Function that gets invoked when a payload has been successfully dropped on a drag and drop target.<br> @param dragDropId the drag and drop id. An arbitrary id that is created by the user. Drag and drop targets only accept payloads from drag and drop sources with the same dragDropId.<br> @param data payload of the drag and drop action. The actual data that gets transferred from a drag and drop source to a drag and drop target.<br> @param callback callback function. | 13 |
| `editor.dragDropTarget(dragDropId)` | Drag and drop targets only accept payloads from drag and drop sources with the same dragDropId.<br> @param dragDropId the drag and drop id. An arbitrary id that is created by the user. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/assets.lua`.*
