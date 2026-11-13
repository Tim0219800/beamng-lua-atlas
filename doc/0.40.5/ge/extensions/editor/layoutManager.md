# `editor_layoutManager`

*Fichier : `lua/ge/extensions/editor/layoutManager.lua` · VM : Game Engine (GE) · 83 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_layoutManager` : `extensions.load("editor_layoutManager")`, puis la globale `editor_layoutManager`

Gestion des dispositions (layouts) de fenêtres de l'éditeur. Chaque layout est un dossier settings/<outil>/layouts/<nom>/ contenant windowsState.json ; le layout courant est settings/<outil>/windowsState.json. Les positions ImGui sont lues/écrites dans settings/imgui.ini (ou settings/default_imgui.ini pour le layout Default). L'outil vaut « editor » par défaut.

## Exemple

```lua
editor_layoutManager.saveWindowLayout("MonLayout")
local liste = editor_layoutManager.getWindowLayouts()
```

## Remarques

- Dépend de editor.loadWindowsState / editor.saveWindowsState (définis ailleurs) et de ui_imgui.
- saveCurrentWindowLayout ne transmet pas toolName à editor.saveWindowsState, contrairement à saveWindowLayout et loadCurrentWindowLayout.
- resetLayouts supprime tous les layouts dont le chemin ne contient pas « /Default », puis recharge Default.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_layoutManager.deleteWindowLayout(layoutPath)` | Supprime tous les fichiers d'un dossier de layout puis le dossier lui-même. | 55 |
| `editor_layoutManager.getWindowLayouts(toolName)` | Liste les dossiers de layouts de settings/<outil>/layouts/. | 14 |
| `editor_layoutManager.loadCurrentWindowLayout(toolName)` | Charge l'état courant des fenêtres (settings/<outil>/windowsState.json). Si editor.needsDefaultImguiIniLoad est vrai, charge default_imgui.ini une fois, sinon imgui.ini. | 37 |
| `editor_layoutManager.loadWindowLayout(layout, toolName)` | Charge windowsState.json d'un layout et recharge imgui.ini : default_imgui.ini si le layout est Default, sinon imgui.ini. | 18 |
| `editor_layoutManager.resetLayouts(toolName)` | Supprime tous les layouts personnalisés (tout sauf Default) de settings/<outil>/layouts puis charge le layout Default. | 63 |
| `editor_layoutManager.saveCurrentWindowLayout(toolName)` | Enregistre l'état courant des fenêtres dans settings/<outil>/windowsState.json et sauvegarde imgui.ini. | 50 |
| `editor_layoutManager.saveWindowLayout(layoutName, toolName)` | Enregistre l'état des fenêtres dans settings/<outil>/layouts/<layoutName>/windowsState.json et sauvegarde imgui.ini. | 30 |

### Détail des paramètres

#### `editor_layoutManager.deleteWindowLayout(layoutPath)`

Supprime tous les fichiers d'un dossier de layout puis le dossier lui-même.

- `layoutPath` (*string*) : Chemin du dossier de layout à supprimer.

#### `editor_layoutManager.getWindowLayouts(toolName)`

Liste les dossiers de layouts de settings/<outil>/layouts/.

- `toolName` (*string|nil*) : Nom de l'outil ; « editor » si nil.
- **renvoie** : table<integer, string> Chemins des dossiers de layouts (FS:directoryList).

#### `editor_layoutManager.loadCurrentWindowLayout(toolName)`

Charge l'état courant des fenêtres (settings/<outil>/windowsState.json). Si editor.needsDefaultImguiIniLoad est vrai, charge default_imgui.ini une fois, sinon imgui.ini.

- `toolName` (*string|nil*) : Nom de l'outil ; « editor » si nil.

#### `editor_layoutManager.loadWindowLayout(layout, toolName)`

Charge windowsState.json d'un layout et recharge imgui.ini : default_imgui.ini si le layout est Default, sinon imgui.ini.

- `layout` (*string|nil*) : Dossier du layout ; settings/editor/layouts/Default si nil.
- `toolName` (*string|nil*) : Nom de l'outil passé à editor.loadWindowsState.

#### `editor_layoutManager.resetLayouts(toolName)`

Supprime tous les layouts personnalisés (tout sauf Default) de settings/<outil>/layouts puis charge le layout Default.

- `toolName` (*string|nil*) : Nom de l'outil ; « editor » si nil.

#### `editor_layoutManager.saveCurrentWindowLayout(toolName)`

Enregistre l'état courant des fenêtres dans settings/<outil>/windowsState.json et sauvegarde imgui.ini.

- `toolName` (*string|nil*) : Sert à construire le chemin, mais n'est pas transmis à editor.saveWindowsState.

#### `editor_layoutManager.saveWindowLayout(layoutName, toolName)`

Enregistre l'état des fenêtres dans settings/<outil>/layouts/<layoutName>/windowsState.json et sauvegarde imgui.ini.

- `layoutName` (*string*) : Nom du layout (nom du dossier).
- `toolName` (*string|nil*) : Nom de l'outil ; « editor » si nil.

## Appels vers le moteur (C++)

- `FS:` `directoryList`, `directoryRemove`, `findFiles`, `getFileRealPath`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/layoutManager.lua`.*
