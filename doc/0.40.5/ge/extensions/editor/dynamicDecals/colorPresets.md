# `editor_dynamicDecals_colorPresets`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/colorPresets.lua` · VM : Game Engine (GE) · 186 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_colorPresets` : `extensions.load("editor_dynamicDecals_colorPresets")`, puis la globale `editor_dynamicDecals_colorPresets`

Section « Color Presets » de l'outil Dynamic Decals. Liste des couleurs nommées stockées dans la préférence `dynamicDecalsTool.colorPresets.presets` (environ 42 par défaut : « iconic oraNGe », Aquamarine, Burgundy, Jet Black…). Chaque entrée {name, value={r,g,b,a}} peut être éditée, renommée, supprimée, filtrée par nom, et appliquée comme couleur de decal ou de fill layer.

## Remarques

- Les valeurs sont des flottants 0..1 (RGBA).
- Le champ de recherche est libellé « Texture Filter » (copié d'une autre section) alors qu'il filtre les noms de couleurs.
- Le bouton « Add color preset » insère une couleur orange (1, 0.4, 0, 1) sans nom ; newPreset.name n'est pas utilisé.
- La table `newPreset.value` est partagée entre tous les presets ajoutés : ils référencent la même table Lua tant que la préférence n'est pas relue.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_colorPresets.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 152 |
| `editor_dynamicDecals_colorPresets.onGui(guiId)` | Dessine le filtre de recherche, la liste des presets (widget couleur, nom, boutons supprimer / appliquer comme couleur de decal via api.setDecalColor / appliquer comme couleur de fill layer via api.setFillLayerColor) et le bouton d'ajout. Sert à la fois de contenu de section et d'éditeur de la préférence `presets`. *(interne)* *(hook)* | 30 |
| `editor_dynamicDecals_colorPresets.registerEditorPreferences(prefsRegistry)` | Enregistre la sous-catégorie `dynamicDecalsTool.colorPresets` avec la table `presets` (liste par défaut de couleurs nommées) et son éditeur graphique (onGui). *(interne)* | 101 |
| `editor_dynamicDecals_colorPresets.setup(tool_in)` | Appelé par l'outil : récupère l'API et docs, enregistre la section « Color Presets » (ordre 121) et sa page de documentation. *(interne)* | 169 |

### Détail des paramètres

#### `editor_dynamicDecals_colorPresets.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_colorPresets.onGui(guiId)`

Dessine le filtre de recherche, la liste des presets (widget couleur, nom, boutons supprimer / appliquer comme couleur de decal via api.setDecalColor / appliquer comme couleur de fill layer via api.setFillLayerColor) et le bouton d'ajout. Sert à la fois de contenu de section et d'éditeur de la préférence `presets`.

- `guiId` (*string*) : Suffixe pour des identifiants ImGui uniques.

#### `editor_dynamicDecals_colorPresets.registerEditorPreferences(prefsRegistry)`

Enregistre la sous-catégorie `dynamicDecalsTool.colorPresets` avec la table `presets` (liste par défaut de couleurs nommées) et son éditeur graphique (onGui).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_colorPresets.setup(tool_in)`

Appelé par l'outil : récupère l'API et docs, enregistre la section « Color Presets » (ordre 121) et sa page de documentation.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/colorPresets.lua`.*
