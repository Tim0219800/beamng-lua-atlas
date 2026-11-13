# `editor_dynamicDecals_fonts`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/fonts.lua` · VM : Game Engine (GE) · 533 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_fonts` : `extensions.load("editor_dynamicDecals_fonts")`, puis la globale `editor_dynamicDecals_fonts`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_fonts.checkOrGenerateFontBitmaps(fontPath)` |  | 502 |
| `editor_dynamicDecals_fonts.editorPreferenceValueChanged(path, value)` |  | 470 |
| `editor_dynamicDecals_fonts.getFontDirectory()` |  | 517 |
| `editor_dynamicDecals_fonts.getGeneratedFontAtlases()` |  | 521 |
| `editor_dynamicDecals_fonts.registerEditorPreferences(prefsRegistry)` |  | 462 |
| `editor_dynamicDecals_fonts.setup(tool_in)` |  | 483 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `supportedFontFileFormats` | table | M.supportedFontFileFormats = {{"Any files", "*"},{"Font files",{".ttf", ".TTF", ".otf", ".OTF"}}, {"TTF files",{".ttf", ".TTF"}}, {"TTF files",{".otf", ".OTF"}}} |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/fonts.lua`.*
