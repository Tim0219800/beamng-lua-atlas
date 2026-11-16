# `editor_dynamicDecals_layerTypes_linkedSet`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/layerTypes/linkedSet.lua` · VM : Game Engine (GE) · 220 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_layerTypes_linkedSet` : `extensions.load("editor_dynamicDecals_layerTypes_linkedSet")`, puis la globale `editor_dynamicDecals_layerTypes_linkedSet`

Type de calque « Linked Set » de l'outil Dynamic Decals : se comporte comme un groupe, mais on peut lui ajouter dans l'inspecteur des propriétés (parmi api.properties) avec une valeur. Le bouton « Apply » propage récursivement ces valeurs à tous les calques enfants qui possèdent la propriété, quel que soit leur type. Le bouton de barre d'outils (ordre 40) appelle api.addLinkedSet.

## Remarques

- Seuls les enfants qui ont déjà un champ `property.id` non nil sont modifiés.
- Cas spécial decalGradientColor : une propriété à quatre valeurs est répartie sur decalGradientColorTopLeft / TopRight / BottomLeft / BottomRight.
- Cas spécial useSurfaceNormal : decalPos et decalNorm de l'enfant sont mis à nil pour forcer le recalcul de la matrice du decal (le code le qualifie de hack).
- Les types de propriété non gérés par setProperty affichent « not yet implemented » dans la console.
- layer.propertiesDirty passe à true à chaque modification ; l'inspecteur affiche alors un message invitant à cliquer sur « Apply ».
- Le bouton de suppression d'une propriété ne marque pas propertiesDirty ni n'appelle api.setLayer.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_layerTypes_linkedSet.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 184 |
| `editor_dynamicDecals_layerTypes_linkedSet.onGui(guiId)` | Fonction vide (section non utilisée). *(interne)* *(hook)* | 174 |
| `editor_dynamicDecals_layerTypes_linkedSet.registerEditorPreferences(prefsRegistry)` | Ne déclare aucune préférence (corps commenté). *(interne)* | 178 |
| `editor_dynamicDecals_layerTypes_linkedSet.setup(tool_in)` | Appelé par l'outil : récupère les modules liés, enregistre la GUI d'inspecteur du type linkedSet, l'élément de barre d'outils « linkedSet » et la page de documentation « Layer Types / Linked Set Layers ». *(interne)* | 202 |

### Détail des paramètres

#### `editor_dynamicDecals_layerTypes_linkedSet.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_layerTypes_linkedSet.onGui(guiId)`

Fonction vide (section non utilisée).

- `guiId` (*string*) : Suffixe d'identifiant ImGui (non utilisé).

#### `editor_dynamicDecals_layerTypes_linkedSet.registerEditorPreferences(prefsRegistry)`

Ne déclare aucune préférence (corps commenté).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_layerTypes_linkedSet.setup(tool_in)`

Appelé par l'outil : récupère les modules liés, enregistre la GUI d'inspecteur du type linkedSet, l'élément de barre d'outils « linkedSet » et la page de documentation « Layer Types / Linked Set Layers ».

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/layerTypes/linkedSet.lua`.*
