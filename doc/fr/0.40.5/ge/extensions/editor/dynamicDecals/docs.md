# `editor_dynamicDecals_docs`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/docs.lua` · VM : Game Engine (GE) · 423 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_docs` : `extensions.load("editor_dynamicDecals_docs")`, puis la globale `editor_dynamicDecals_docs`

Fenêtre de documentation intégrée à l'outil Dynamic Decals (table des matières + contenu). Chaque module de l'outil y enregistre une page avec register({section = {...}, guiFn = fn}) ; ce module fournit aussi les pages Introduction, Getting Started et Controls (les contrôles sont lus dans les actions d'entrée de l'action map « dynamicDecals », clavier et souris). selectSection ouvre la fenêtre sur une page donnée.

## Exemple

```lua
local docs = extensions.editor_dynamicDecals_docs
docs.register({section = {"Ma section"}, guiFn = function(sec) ui_imgui.TextUnformatted("Texte") end, order = 50})
docs.selectSection("Ma section")
```

## Remarques

- register : `data.section` doit être une table (liste de noms du parent au enfant), sinon un avertissement est loggé et rien n'est enregistré. Les sections intermédiaires manquantes sont créées avec data.order.
- selectSection accepte soit un nom (recherche dans tout l'arbre, efface le filtre de recherche et repart de l'arbre de base), soit une table de noms (chemin complet).
- Bug : introductionGui affiche la version avec tool.version[2] deux fois (minor, minor) au lieu de (major, minor, patch).
- showWindow trie les enfants de chaque section (sortFn) avant d'ouvrir et sauvegarde une copie de l'arbre.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_docs.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 314 |
| `editor_dynamicDecals_docs.hideWindow()` | Masque la fenêtre de documentation. | 408 |
| `editor_dynamicDecals_docs.image(path, overrideWidth, title, subtitle)` | Affiche une image dans la page de doc (à la largeur donnée en conservant le ratio), avec info-bulle optionnelle et légende grise. | 173 |
| `editor_dynamicDecals_docs.introductionGui(docsSection)` | Dessine la page « Introduction » (message de bienvenue et version de l'outil). *(interne)* | 197 |
| `editor_dynamicDecals_docs.isWindowVisible()` | Indique si la fenêtre de documentation est visible. | 412 |
| `editor_dynamicDecals_docs.register(data)` | Enregistre (ou met à jour) une page de documentation dans l'arbre des sections. | 328 |
| `editor_dynamicDecals_docs.registerEditorPreferences(prefsRegistry)` | Enregistre `dynamicDecalsTool.docs` : indentSpacing (int, défaut 8, de 0 à 64) pour la table des matières et verticalSpacing (int, défaut 16, de 0 à 64). *(interne)* | 307 |
| `editor_dynamicDecals_docs.selectSection(section, doNotOpenWindow)` | Sélectionne une page de la documentation et, sauf si doNotOpenWindow, ouvre la fenêtre. | 386 |
| `editor_dynamicDecals_docs.setup(tool_in)` | Appelé par l'outil : déclare la fenêtre (640x640), enregistre les callbacks d'interface et d'update, les pages Introduction (ordre 0), Getting Started (10) et Controls (20), et construit la liste des contrôles clavier/souris de l'action map dynamicDecals. *(interne)* | 278 |
| `editor_dynamicDecals_docs.showWindow()` | Trie les sections puis affiche la fenêtre de documentation. | 401 |
| `editor_dynamicDecals_docs.verticalSpacing()` | Insère un espace vertical de hauteur `dynamicDecalsTool.docs.verticalSpacing` (défaut 16). | 193 |

### Détail des paramètres

#### `editor_dynamicDecals_docs.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_docs.image(path, overrideWidth, title, subtitle)`

Affiche une image dans la page de doc (à la largeur donnée en conservant le ratio), avec info-bulle optionnelle et légende grise.

- `path` (*string*) : Chemin de la texture.
- `overrideWidth` (*number|nil*) : Largeur en pixels ; défaut toute la largeur disponible.
- `title` (*string|nil*) : Texte d'info-bulle.
- `subtitle` (*string|nil*) : Légende sous l'image.

#### `editor_dynamicDecals_docs.introductionGui(docsSection)`

Dessine la page « Introduction » (message de bienvenue et version de l'outil).

- `docsSection` (*table*) : Section de documentation courante.

#### `editor_dynamicDecals_docs.isWindowVisible()`

Indique si la fenêtre de documentation est visible.

- **renvoie** : boolean true si visible.

#### `editor_dynamicDecals_docs.register(data)`

Enregistre (ou met à jour) une page de documentation dans l'arbre des sections.

- `data` (*table*) : {section = string[], guiFn = function(docsSection), order = number|nil}.

#### `editor_dynamicDecals_docs.registerEditorPreferences(prefsRegistry)`

Enregistre `dynamicDecalsTool.docs` : indentSpacing (int, défaut 8, de 0 à 64) pour la table des matières et verticalSpacing (int, défaut 16, de 0 à 64).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_docs.selectSection(section, doNotOpenWindow)`

Sélectionne une page de la documentation et, sauf si doNotOpenWindow, ouvre la fenêtre.

- `section` (*string|string[]*) : Nom de la page, ou chemin sous forme de liste de noms.
- `doNotOpenWindow` (*boolean|nil*) : Si vrai, ne montre pas la fenêtre.

#### `editor_dynamicDecals_docs.setup(tool_in)`

Appelé par l'outil : déclare la fenêtre (640x640), enregistre les callbacks d'interface et d'update, les pages Introduction (ordre 0), Getting Started (10) et Controls (20), et construit la liste des contrôles clavier/souris de l'action map dynamicDecals.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/docs.lua`.*
