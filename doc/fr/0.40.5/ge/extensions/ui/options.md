# `ui_options`

*Fichier : `lua/ge/extensions/ui/options.lua` · VM : Game Engine (GE) · 59 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_options` : `extensions.load("ui_options")`, puis la globale `ui_options`

Petit utilitaire côté GE pour la disposition (layout) du menu d'options Vue. Il lit quels fichiers layout.json / layout.dev.json existent dans le dossier utilisateur et peut sauvegarder un layout dans /ui/ui-vue/src/modules/options/runtime/ (donc dans le dossier utilisateur). Utile à un moddeur qui veut surcharger la structure du menu d'options.

## Exemple

```lua
ui_options.saveLayout("mon-layout", jsonString) -- écrit layout.mon-layout.json
```

## Remarques

- La clé de saveLayout doit être vide/nil ou correspondre à ^[%w%-_]+$ ; sinon la fonction logue une erreur et renvoie false.
- isValidKey n'est appelé que si key n'est ni nil ni vide, donc pas de risque d'erreur string.match sur nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_options.getUserFolderLayouts()` | Liste ceux des fichiers layout.json et layout.dev.json dont le chemin réel se trouve sous le dossier utilisateur (FS:getUserPath). | 16 |
| `ui_options.saveLayout(key, data)` | Écrit les données JSON dans layout[.key].json sous /ui/ui-vue/src/modules/options/runtime/ via writeFile. | 30 |

### Détail des paramètres

#### `ui_options.getUserFolderLayouts()`

Liste ceux des fichiers layout.json et layout.dev.json dont le chemin réel se trouve sous le dossier utilisateur (FS:getUserPath).

- **renvoie** : string[] Noms de fichiers trouvés ; vide si le dossier utilisateur est inconnu.

#### `ui_options.saveLayout(key, data)`

Écrit les données JSON dans layout[.key].json sous /ui/ui-vue/src/modules/options/runtime/ via writeFile.

- `key` (*string|nil*) : Suffixe du fichier (slug sûr) ; nil ou vide pour layout.json.
- `data` (*string*) : Contenu JSON déjà sérialisé.
- **renvoie** : boolean true si l'écriture a réussi, false si data n'est pas une chaîne, si la clé est invalide ou si l'écriture échoue.

## Appels vers le moteur (C++)

- `FS:` `getFileRealPath`, `getUserPath`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/options.lua`.*
