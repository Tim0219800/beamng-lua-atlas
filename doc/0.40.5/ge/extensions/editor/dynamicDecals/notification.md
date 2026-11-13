# `editor_dynamicDecals_notification`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/notification.lua` · VM : Game Engine (GE) · 111 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_notification` : `extensions.load("editor_dynamicDecals_notification")`, puis la globale `editor_dynamicDecals_notification`

Fenêtre de notifications de l'outil Dynamic Decals (« Dynamic Decals - Notifications »). Les autres modules appellent add(section, titre, message, niveau) ; les messages sont regroupés par section dans des en-têtes repliables, colorés selon le niveau (log blanc, warning jaune, error rouge), supprimables un par un ou tous ensemble. La fenêtre s'ouvre toute seule à l'ajout d'un message et se ferme quand la liste est vide.

## Exemple

```lua
local n = extensions.editor_dynamicDecals_notification
n.add("Load/Save", "Titre", "Message", n.levels.warning)
```

## Remarques

- `msg` peut être une chaîne ou une fonction (appelée dans la fenêtre pour dessiner un contenu ImGui personnalisé).
- Si le niveau n'est pas fourni, levels.log est utilisé. Un message de type fonction n'utilise pas la couleur de niveau.
- Si `msg` est ni chaîne ni fonction, rien n'est affiché pour cette entrée (seul le bouton de suppression apparaît).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_notification.add(section, title, msg, level)` | Ajoute une notification dans la section donnée et marque la fenêtre à ouvrir à la prochaine frame. | 97 |
| `editor_dynamicDecals_notification.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 84 |
| `editor_dynamicDecals_notification.onGui()` | Dessine la fenêtre de notifications. Enregistré auprès de l'outil via tool.registerOnEditorGuiFn et appelé à chaque frame d'interface de l'éditeur. *(interne)* *(hook)* | 31 |
| `editor_dynamicDecals_notification.registerEditorPreferences(prefsRegistry)` | Ne déclare aucune préférence (corps commenté). *(interne)* | 78 |
| `editor_dynamicDecals_notification.setup(tool_in)` | Appelé par l'outil : enregistre onGui et déclare la fenêtre éditeur (450x650). *(interne)* | 88 |

### Détail des paramètres

#### `editor_dynamicDecals_notification.add(section, title, msg, level)`

Ajoute une notification dans la section donnée et marque la fenêtre à ouvrir à la prochaine frame.

- `section` (*string*) : Nom de la section (clé de regroupement).
- `title` (*string*) : Titre affiché devant le message.
- `msg` (*string|function*) : Texte, ou fonction qui dessine le contenu.
- `level` (*integer|nil*) : Une valeur de levels ; défaut levels.log.

#### `editor_dynamicDecals_notification.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_notification.registerEditorPreferences(prefsRegistry)`

Ne déclare aucune préférence (corps commenté).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_notification.setup(tool_in)`

Appelé par l'outil : enregistre onGui et déclare la fenêtre éditeur (450x650).

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

## Champs

| Champ | Type | Description |
|---|---|---|
| `levels` | table<string, integer> | Niveaux de gravité : log = 1, warning = 2, error = 3. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/notification.lua`.*
