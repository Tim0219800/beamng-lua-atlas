# `editor_documentationHelper`

*Fichier : `lua/ge/extensions/editor/documentationHelper.lua` · VM : Game Engine (GE) · 23 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_documentationHelper` : `extensions.load("editor_documentationHelper")`, puis la globale `editor_documentationHelper`

Petite extension de l'éditeur qui ajoute à la table globale `editor` deux fonctions pour ouvrir la documentation en ligne de BeamNG dans le navigateur. Les autres outils de l'éditeur s'en servent pour leurs boutons d'aide.

## Exemple

```lua
editor.openHelp("terrain_editor")  -- ouvre https://documentation.beamng.com/world_editor/terrain_editor.html
```

## Remarques

- Les fonctions ne sont installées dans `editor` qu'au moment du hook onEditorInitialized ; avant cela editor.openHelp vaut nil.
- Sans argument, la page « index » est ouverte.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_documentationHelper.onEditorInitialized()` | Hook appelé par l'éditeur quand il est initialisé. Installe editor.openHelp et editor.openCodingHelp. *(interne)* *(hook)* | 16 |

## Classe `editor`

Fonctions ajoutées à la table globale `editor` par onEditorInitialized.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.openCodingHelp(contextPageName)` | Ouvre dans le navigateur la référence d'API de l'éditeur : https://documentation.beamng.com/world_editor/api_reference/<page>.html. | 12 |
| `editor.openHelp(contextPageName)` | Ouvre dans le navigateur https://documentation.beamng.com/world_editor/<page>.html. | 8 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/documentationHelper.lua`.*
