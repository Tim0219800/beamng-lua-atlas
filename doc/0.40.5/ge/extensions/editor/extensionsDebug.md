# `editor_extensionsDebug`

*Fichier : `lua/ge/extensions/editor/extensionsDebug.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_extensionsDebug` : `extensions.load("editor_extensionsDebug")`, puis la globale `editor_extensionsDebug`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_extensionsDebug.onEditorGui()` | local function addFilter()<br>  im.Checkbox("Function", funCheck)<br>  im.SameLine()<br>  im.Checkbox("Number",numCheck)<br>  im.SameLine()<br>  im.Checkbox("String",strCheck)<br>  im.SameLine()<br>  im.Checkbox("Cdata",cdataCheck)<br>  im.SameLine()<br>  im.Checkbox("Boolean",boolCheck)<br>  im.SameLine()<br>  im.Checkbox("Table",tblCheck)<br>  im.Separator()<br>end-- *(hook)* | 33 |
| `editor_extensionsDebug.onEditorInitialized()` | *(hook)* | 59 |
| `editor_extensionsDebug.onExtensionLoaded()` | *(hook)* | 56 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/extensionsDebug.lua`.*
