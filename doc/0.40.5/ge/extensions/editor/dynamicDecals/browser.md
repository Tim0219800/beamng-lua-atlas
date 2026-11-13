# `editor_dynamicDecals_browser`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/browser.lua` · VM : Game Engine (GE) · 98 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_browser` : `extensions.load("editor_dynamicDecals_browser")`, puis la globale `editor_dynamicDecals_browser`

Fenêtre « Dynamic Decals Tool - Browser » de l'outil de livrées dynamiques de l'éditeur : un point central à onglets (Textures, Brushes, Fonts…) où d'autres modules enregistrent leur contenu avec registerBrowserTab. Les assets se glissent-déposent vers les widgets du système de decals. Le module est initialisé par l'outil principal via setup(tool).

## Exemple

```lua
extensions.editor_dynamicDecals_browser.registerBrowserTab("Textures", function() im.Text("…") end, 10)
```

## Remarques

- Les onglets sont triés par order croissant (1000 par défaut).
- registerEditorPreferences et editorPreferenceValueChanged sont des fonctions vides (corps commenté).
- Dans onGui, la variable textureBrowserCurrentTab est écrasée à chaque itération et n'a pas d'effet visible.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_browser.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change : ne fait rien actuellement. *(interne)* | 43 |
| `editor_dynamicDecals_browser.hideWindow()` | Masque la fenêtre du navigateur. | 80 |
| `editor_dynamicDecals_browser.isWindowVisible()` | Indique si la fenêtre est visible. | 84 |
| `editor_dynamicDecals_browser.onGui()` | Dessine la fenêtre et sa barre d'onglets en appelant le guiFn de chaque onglet. Enregistrée par setup() comme callback d'éditeur « browser ». *(interne)* *(hook)* | 20 |
| `editor_dynamicDecals_browser.registerBrowserTab(name, guiFn, order)` | Ajoute un onglet au navigateur et retrie la liste par ordre. | 71 |
| `editor_dynamicDecals_browser.registerEditorPreferences(prefsRegistry)` | Hook de préférences de l'éditeur : ne fait rien actuellement. *(interne)* | 37 |
| `editor_dynamicDecals_browser.setup(tool_in)` | Initialise le module : récupère les extensions editor_api_dynamicDecals, editor_dynamicDecals_textures et editor_dynamicDecals_docs, enregistre la fenêtre (800x400), le callback d'interface « browser » et la page de documentation « Browser ». | 60 |
| `editor_dynamicDecals_browser.showWindow()` | Affiche la fenêtre du navigateur. | 76 |

### Détail des paramètres

#### `editor_dynamicDecals_browser.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change : ne fait rien actuellement.

- `path` (*string*) : chemin de la préférence
- `value` (*any*) : nouvelle valeur

#### `editor_dynamicDecals_browser.isWindowVisible()`

Indique si la fenêtre est visible.

- **renvoie** : boolean visibilité

#### `editor_dynamicDecals_browser.registerBrowserTab(name, guiFn, order)`

Ajoute un onglet au navigateur et retrie la liste par ordre.

- `name` (*string*) : titre de l'onglet
- `guiFn` (*function*) : fonction ImGui dessinant le contenu de l'onglet
- `order` (*number|nil*) : rang de tri, 1000 par défaut

#### `editor_dynamicDecals_browser.registerEditorPreferences(prefsRegistry)`

Hook de préférences de l'éditeur : ne fait rien actuellement.

- `prefsRegistry` (*table*) : registre de préférences

#### `editor_dynamicDecals_browser.setup(tool_in)`

Initialise le module : récupère les extensions editor_api_dynamicDecals, editor_dynamicDecals_textures et editor_dynamicDecals_docs, enregistre la fenêtre (800x400), le callback d'interface « browser » et la page de documentation « Browser ».

- `tool_in` (*table*) : outil de decals dynamiques (fournit registerOnEditorGuiFn)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/browser.lua`.*
