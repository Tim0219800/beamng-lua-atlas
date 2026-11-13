# `editor_textEditor`

*Fichier : `lua/ge/extensions/editor/textEditor.lua` · VM : Game Engine (GE) · 107 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_textEditor` : `extensions.load("editor_textEditor")`, puis la globale `editor_textEditor`

Extension de l'éditeur qui fournit une fenêtre « Text Editor » multiligne pour modifier le contenu texte d'un champ d'objet de la scène (ex. un champ long d'un objet). Elle s'enregistre en exposant editor.newTextEditorInstance(objIds, fieldName). Le bouton Ok applique la valeur via objectHistoryActions.changeObjectFieldWithUndo (annulable), Cancel ferme sans rien changer.

## Exemple

```lua
editor.newTextEditorInstance({ obj:getID() }, "myField")
```

## Remarques

- Taille maximale du texte : 16384 caractères (textInputSize).
- Si plusieurs objets sont passés, le champ de départ est vide (le texte n'est prérempli que pour un seul objet) ; la valeur saisie est ensuite appliquée à tous les ids.
- Une nouvelle instance supprime toute instance existante qui partage un id d'objet.
- Le logTag déclaré est 'editor_scene_tree' (copié d'un autre module, sans effet visible).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_textEditor.onDeserialize(state)` | Hook appelé après rechargement : recrée une instance par entrée de l'état sauvegardé. *(interne)* *(hook)* | 84 |
| `editor_textEditor.onEditorGui()` | Hook appelé à chaque frame de l'interface de l'éditeur : crée/affiche chaque fenêtre Text Editor ouverte, avec zone de saisie multiligne et boutons Cancel/Ok. Retire l'instance quand la fenêtre n'est plus visible. *(interne)* *(hook)* | 28 |
| `editor_textEditor.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : publie editor.newTextEditorInstance. *(interne)* *(hook)* | 98 |
| `editor_textEditor.onSerialize()` | Hook de sérialisation (rechargement Lua) : renvoie une copie des instances ouvertes sans le tampon de texte (textInput). *(interne)* *(hook)* | 90 |

### Détail des paramètres

#### `editor_textEditor.onDeserialize(state)`

Hook appelé après rechargement : recrée une instance par entrée de l'état sauvegardé.

- `state` (*table*) : Résultat de onSerialize.

#### `editor_textEditor.onSerialize()`

Hook de sérialisation (rechargement Lua) : renvoie une copie des instances ouvertes sans le tampon de texte (textInput).

- **renvoie** : table Instances (objIds, fieldName) sans textInput.

## Appels vers le moteur (C++)

- `obj:` `getField`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/textEditor.lua`.*
