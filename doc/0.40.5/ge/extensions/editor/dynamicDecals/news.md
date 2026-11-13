# `editor_dynamicDecals_news`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/news.lua` · VM : Game Engine (GE) · 170 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_news` : `extensions.load("editor_dynamicDecals_news")`, puis la globale `editor_dynamicDecals_news`

Fenêtre « Vehicle Livery Creator - News » (nom public de l'outil Dynamic Decals) : message de bienvenue, lien vers le fil du forum BeamNG et historique des versions (1.1.0, 1.0.1, 1.0.0, textes en dur). Elle s'ouvre automatiquement quand la version de l'outil (tool.version) dépasse celle stockée dans la préférence `dynamicDecalsTool.general.version`, ou tant que « do not show again » n'est pas coché.

## Remarques

- Quand une nouvelle version est détectée, la préférence general.version est mise à jour et doNotShowAgain remis à false.
- La fenêtre est aussi rouverte à chaque frame tant que windowBeenClosed == false et doNotShowAgain == false ; le bouton « OK » met windowBeenClosed à true et masque la fenêtre.
- Les textes sont en anglais, non traduits.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_news.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 160 |
| `editor_dynamicDecals_news.registerEditorPreferences(prefsRegistry)` | Enregistre la préférence bool `dynamicDecalsTool.news.doNotShowAgain` (défaut false). *(interne)* | 154 |
| `editor_dynamicDecals_news.setup(tool_in)` | Appelé par l'outil : récupère helper, déclare la fenêtre éditeur (640x640) et enregistre le dessin de la fenêtre via tool.registerOnEditorGuiFn. *(interne)* | 145 |
| `editor_dynamicDecals_news.showWindow()` | Ouvre la fenêtre de news. | 164 |

### Détail des paramètres

#### `editor_dynamicDecals_news.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_news.registerEditorPreferences(prefsRegistry)`

Enregistre la préférence bool `dynamicDecalsTool.news.doNotShowAgain` (défaut false).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_news.setup(tool_in)`

Appelé par l'outil : récupère helper, déclare la fenêtre éditeur (640x640) et enregistre le dessin de la fenêtre via tool.registerOnEditorGuiFn.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/news.lua`.*
