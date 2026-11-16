# `editor_dynamicDecals_loadSave`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/loadSave.lua` · VM : Game Engine (GE) · 153 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_loadSave` : `extensions.load("editor_dynamicDecals_loadSave")`, puis la globale `editor_dynamicDecals_loadSave`

Section « Load/Save » de l'outil Dynamic Decals. Permet d'enregistrer la pile de calques dans un fichier projet `.dyndecals.json` (« Save as... » / « Save ») et d'en charger un (« Load from file ») en mode Overwrite (remplace) ou Append (ajoute). Le dossier par défaut est /art/dynamicDecals/projects/. Le dernier chemin utilisé est conservé lors du rechargement des extensions (onSerialize / onDeserialized).

## Remarques

- Après un chargement, si res.status.code ~= 0, la réponse est affichée avec dump() et une notification de niveau warning « Baking Issues » est ajoutée.
- Le bouton « Save » est désactivé tant que le chemin courant n'a pas d'extension (c'est-à-dire reste le dossier par défaut).
- Faute de frappe dans le nom exporté : getCurrentPorjectFilePath (« Porject »).
- Les modes de chargement viennent de api.loadingModes (champ `key`) ; loadingMode vaut 0 (Overwrite) ou 1 (Append).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_loadSave.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 88 |
| `editor_dynamicDecals_loadSave.getCurrentPorjectFilePath()` | Renvoie le chemin du dernier fichier projet utilisé (ou le dossier par défaut). | 145 |
| `editor_dynamicDecals_loadSave.loadFileDialog()` | Ouvre la boîte de dialogue de fichier (filtre .dyndecals.json) puis appelle api.loadLayerStackFromFile(chemin, mode) et mémorise le chemin. | 22 |
| `editor_dynamicDecals_loadSave.onDeserialized(data)` | Hook appelé après rechargement avec les données de onSerialize ; restaure lastProjectFilePath (défaut : dossier des projets). *(interne)* *(hook)* | 141 |
| `editor_dynamicDecals_loadSave.onSerialize()` | Hook de rechargement des extensions : renvoie {lastProjectFilePath} à conserver. *(interne)* *(hook)* | 135 |
| `editor_dynamicDecals_loadSave.registerEditorPreferences(prefsRegistry)` | Ne déclare aucune préférence (corps commenté). *(interne)* | 82 |
| `editor_dynamicDecals_loadSave.saveAsFileDialog()` | Ouvre la boîte « Enregistrer sous » (confirmation d'écrasement) puis appelle api.saveLayerStackToFile et mémorise le chemin. | 39 |
| `editor_dynamicDecals_loadSave.setup(tool_in)` | Appelé par l'outil : récupère API, notification et docs, prépare la liste des modes de chargement, enregistre la section « Load/Save » (ordre 20) et la page de documentation « Save & Load ». *(interne)* | 117 |

### Détail des paramètres

#### `editor_dynamicDecals_loadSave.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_loadSave.getCurrentPorjectFilePath()`

Renvoie le chemin du dernier fichier projet utilisé (ou le dossier par défaut).

- **renvoie** : string Chemin du projet.

#### `editor_dynamicDecals_loadSave.onDeserialized(data)`

Hook appelé après rechargement avec les données de onSerialize ; restaure lastProjectFilePath (défaut : dossier des projets).

- `data` (*table*) : Table renvoyée par onSerialize.

#### `editor_dynamicDecals_loadSave.onSerialize()`

Hook de rechargement des extensions : renvoie {lastProjectFilePath} à conserver.

- **renvoie** : table Données à restaurer.

#### `editor_dynamicDecals_loadSave.registerEditorPreferences(prefsRegistry)`

Ne déclare aucune préférence (corps commenté).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_loadSave.setup(tool_in)`

Appelé par l'outil : récupère API, notification et docs, prépare la liste des modes de chargement, enregistre la section « Load/Save » (ordre 20) et la page de documentation « Save & Load ».

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/loadSave.lua`.*
