# `editor_materialEditor`

*Fichier : `lua/ge/extensions/editor/materialEditor.lua` · VM : Game Engine (GE) · 3879 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_materialEditor` : `extensions.load("editor_materialEditor")`, puis la globale `editor_materialEditor`

Éditeur de matériaux du monde (fenêtre « materialEditor » de l'éditeur de niveau). Il liste les matériaux du niveau et de art/, permet de modifier leurs propriétés par couche (textures, couleurs, flottants, cases à cocher, animation, mélange alpha, cubemap…), avec undo/redo, aperçu 3D (cube de art/shapes/material_preview), détection de problèmes de textures, estimation de taille GPU, usage du matériau dans la scène, focus/isolation dans la vue et sauvegarde des matériaux modifiés. Les fonctions exportées servent surtout à d'autres outils de l'éditeur : sélectionner un matériau, changer une propriété, réutiliser les widgets.

## Exemple

```lua
local me = extensions.editor_materialEditor
me.showMaterialEditor()
me.selectMaterialByName('road_asphalt_2lane', true)
```

## Remarques

- setProperty modifie le matériau courant (currentMaterial) si materialObj est nil, via editor.setMaterialProperty, puis le marque dirty et rafraîchit l'aperçu ; il ne crée pas d'entrée d'historique (les widgets utilisent setPropertyWithUndo en interne).
- Les widgets exportés (inputFloat, colorEdit4, imageButton, deleteMapButton) lisent currentMaterial et la couche courante o.layer[0] si layer est nil ; ils n'ont de sens que dans un contexte imgui de l'éditeur.
- Matériaux custom proposés par défaut : 'Standard' et 'MetalicCarPaint' (customMaterialsArray).
- onFilesChanged recharge la liste des matériaux quand un fichier main.materials.json de /levels/ ou /art/ change.
- Préférences enregistrées (catégorie materialEditor.general) : thumbnailSize (32 à 256, défaut 64), maxMaterialPreviewSize (64 à 1024, défaut 256), textFilterResultsWithSameFirstCharAtTop (true), showEstimatedSizeInList (false), plus columnSizes et levelMaterialNames cachés ; la sélection est mémorisée par niveau dans levelMaterialNames.
- onEditorObjectSelectionChanged et onEditorDeleteSelection sont des hooks vides.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_materialEditor.colorEdit4(label, property, id, layer, labelSameLine)` | Widget imgui : éditeur de couleur RGBA lié à une propriété du matériau courant ; applique la valeur en direct et crée une entrée d'undo en fin d'édition. | 1749 |
| `editor_materialEditor.deleteMapButton(label, property, layer)` | Dessine un bouton d'icône qui vide la texture de la propriété (valeur "") avec undo. | 1552 |
| `editor_materialEditor.imageButton(label, property, layer, additionalGuiFn)` | Widget imgui : miniature de la texture d'une propriété, avec aperçu, glisser-déposer et sélection de fichier ; modifie la propriété avec undo. | 1598 |
| `editor_materialEditor.inputFloat(label, property, float_step, float_step_fast, string_format, layer, tooltip)` | Widget imgui : champ numérique lié à une propriété flottante du matériau courant ; applique en direct et ajoute une entrée d'undo en fin d'édition. | 1869 |
| `editor_materialEditor.onEditorActivated()` | Hook appelé à l'activation de l'éditeur : charge matériaux, ground models et meshes d'aperçu, prépare les aperçus 3D (cube_1m.dae) et le chemin du niveau. *(interne)* *(hook)* | 3786 |
| `editor_materialEditor.onEditorDeactivated()` | Hook appelé à la désactivation de l'éditeur : retire le focus de scène, libère listes de matériaux, caches de taille et meshes d'aperçu. *(interne)* *(hook)* | 3816 |
| `editor_materialEditor.onEditorDeleteSelection()` | Hook de suppression de la sélection ; vide. *(interne)* *(hook)* | 3846 |
| `editor_materialEditor.onEditorGui()` | Hook appelé à chaque image de l'éditeur : dessine la fenêtre principale et les fenêtres annexes (aperçu, usage du matériau, création, copie, matériaux par tag), gère le focus et les travaux d'arrière-plan. *(interne)* *(hook)* | 3552 |
| `editor_materialEditor.onEditorInitialized()` | Hook d'initialisation de l'éditeur : ajoute le menu « Material Editor », enregistre les six fenêtres (cinq annexes masquées) et lance le job de cartographie des tags. *(interne)* *(hook)* | 3827 |
| `editor_materialEditor.onEditorObjectSelectionChanged()` | Hook de changement de sélection d'objets ; vide. *(interne)* *(hook)* | 3843 |
| `editor_materialEditor.onEditorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change ; réagit à thumbnailSize, maxMaterialPreviewSize, textFilterResultsWithSameFirstCharAtTop (recharge la liste) et showEstimatedSizeInList. *(interne)* *(hook)* | 3753 |
| `editor_materialEditor.onEditorRegisterPreferences(prefsRegistry)` | Hook d'enregistrement des préférences : crée la catégorie materialEditor et la sous-catégorie general. *(interne)* *(hook)* | 3771 |
| `editor_materialEditor.onFilesChanged(files)` | Hook appelé quand des fichiers changent sur disque ; recharge les matériaux si un main.materials.json sous /levels/ ou /art/ est concerné. *(interne)* *(hook)* | 3738 |
| `editor_materialEditor.onVehicleSwitched(oid, nid, player)` | Hook appelé au changement de véhicule joué ; si la fenêtre est visible et l'éditeur actif, relance le job de tags et recharge les matériaux. *(interne)* *(hook)* | 3729 |
| `editor_materialEditor.selectMaterialByName(matName, clearFilter)` | Sélectionne dans la liste le matériau portant ce nom, met à jour ses propriétés affichées et mémorise le choix pour le niveau courant dans la préférence levelMaterialNames. Si le nom est introuvable, l'indice courant passe à 0. Ne fait rien tant que la liste n'est pas chargée (éditeur non activé). | 948 |
| `editor_materialEditor.setMaterialDirty(materialObj)` | Marque le matériau comme modifié (v.dirtyMaterials[nom] = true) pour qu'il soit sauvegardé. | 1247 |
| `editor_materialEditor.setProperty(materialObj, property, layer, value)` | Définit une propriété d'une couche du matériau via editor.setMaterialProperty ; en cas de succès, marque dirty, invalide l'estimation de taille et redessine l'aperçu. Mémorise la valeur précédente pour l'undo. | 1254 |
| `editor_materialEditor.showMaterialEditor()` | Affiche la fenêtre de l'éditeur de matériaux, ou lui donne le focus si elle est déjà visible. | 3005 |

### Détail des paramètres

#### `editor_materialEditor.colorEdit4(label, property, id, layer, labelSameLine)`

Widget imgui : éditeur de couleur RGBA lié à une propriété du matériau courant ; applique la valeur en direct et crée une entrée d'undo en fin d'édition.

- `label` (*string*) : Libellé (affiché si non vide).
- `property` (*string*) : Propriété couleur (chaîne « r g b a »).
- `id` (*string|nil*) : Identifiant imgui ; property par défaut.
- `layer` (*integer|nil*) : Couche ; o.layer[0] si nil.
- `labelSameLine` (*boolean|nil*) : Si vrai, le widget est placé sur la même ligne que le libellé.

#### `editor_materialEditor.deleteMapButton(label, property, layer)`

Dessine un bouton d'icône qui vide la texture de la propriété (valeur "") avec undo.

- `label` (*string*) : Libellé utilisé dans l'infobulle « Remove … ».
- `property` (*string*) : Propriété texture à vider.
- `layer` (*integer|nil*) : Couche ; o.layer[0] si nil.

#### `editor_materialEditor.imageButton(label, property, layer, additionalGuiFn)`

Widget imgui : miniature de la texture d'une propriété, avec aperçu, glisser-déposer et sélection de fichier ; modifie la propriété avec undo.

- `label` (*string*) : Libellé du widget.
- `property` (*string*) : Propriété texture.
- `layer` (*integer|nil*) : Couche ; o.layer[0] si nil.
- `additionalGuiFn` (*function|nil*) : Fonction de dessin additionnelle (déduit du code).

#### `editor_materialEditor.inputFloat(label, property, float_step, float_step_fast, string_format, layer, tooltip)`

Widget imgui : champ numérique lié à une propriété flottante du matériau courant ; applique en direct et ajoute une entrée d'undo en fin d'édition.

- `label` (*string*) : Libellé.
- `property` (*string*) : Propriété flottante.
- `float_step` (*number|nil*) : Pas (0.01 par défaut).
- `float_step_fast` (*number|nil*) : Pas rapide (0.1 par défaut).
- `string_format` (*string|nil*) : Format d'affichage ("%.2f" par défaut).
- `layer` (*integer|nil*) : Couche ; o.layer[0] si nil.
- `tooltip` (*string|nil*) : Texte d'aide affiché à côté du libellé.

#### `editor_materialEditor.onEditorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change ; réagit à thumbnailSize, maxMaterialPreviewSize, textFilterResultsWithSameFirstCharAtTop (recharge la liste) et showEstimatedSizeInList.

- `path` (*string*) : Chemin de la préférence, ex. materialEditor.general.thumbnailSize.
- `value` (*any*) : Nouvelle valeur.

#### `editor_materialEditor.onEditorRegisterPreferences(prefsRegistry)`

Hook d'enregistrement des préférences : crée la catégorie materialEditor et la sous-catégorie general.

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_materialEditor.onFilesChanged(files)`

Hook appelé quand des fichiers changent sur disque ; recharge les matériaux si un main.materials.json sous /levels/ ou /art/ est concerné.

- `files` (*table[]*) : Liste d'entrées avec un champ filename.

#### `editor_materialEditor.onVehicleSwitched(oid, nid, player)`

Hook appelé au changement de véhicule joué ; si la fenêtre est visible et l'éditeur actif, relance le job de tags et recharge les matériaux.

- `oid` (*integer*) : Id de l'ancien véhicule.
- `nid` (*integer*) : Id du nouveau véhicule.
- `player` (*integer*) : Indice du joueur (non utilisé).

#### `editor_materialEditor.selectMaterialByName(matName, clearFilter)`

Sélectionne dans la liste le matériau portant ce nom, met à jour ses propriétés affichées et mémorise le choix pour le niveau courant dans la préférence levelMaterialNames. Si le nom est introuvable, l'indice courant passe à 0. Ne fait rien tant que la liste n'est pas chargée (éditeur non activé).

- `matName` (*string*) : Nom du matériau.
- `clearFilter` (*boolean|nil*) : Si vrai, vide d'abord le filtre texte (sinon la sélection peut échouer).

#### `editor_materialEditor.setMaterialDirty(materialObj)`

Marque le matériau comme modifié (v.dirtyMaterials[nom] = true) pour qu'il soit sauvegardé.

- `materialObj` (*userdata|nil*) : Objet matériau ; matériau courant si nil.

#### `editor_materialEditor.setProperty(materialObj, property, layer, value)`

Définit une propriété d'une couche du matériau via editor.setMaterialProperty ; en cas de succès, marque dirty, invalide l'estimation de taille et redessine l'aperçu. Mémorise la valeur précédente pour l'undo.

- `materialObj` (*userdata|nil*) : Matériau à modifier ; courant si nil.
- `property` (*string*) : Nom du champ (ex. diffuseMap, diffuseColor).
- `layer` (*integer*) : Indice de couche du matériau.
- `value` (*any*) : Nouvelle valeur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `customMaterialsArray` | string[] | Classes de matériaux proposées : 'Standard', 'MetalicCarPaint'. |
| `customMaterialsArrayPtr` | any | Tableau de chaînes imgui (ArrayCharPtrByTbl) construit à partir de customMaterialsArray. |
| `dbg` | boolean | Drapeau de debug (copie de la valeur locale initiale, false). |
| `o` | table | Pointeurs imgui des options de l'éditeur, notamment o.layer (IntPtr, couche courante) et o.reflectionMode. |
| `v` | table | État de l'interface : materialNameList, currentMaterialIndex, dirtyMaterials, materialUsage, inputWidgetHeight, style… |

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`, `isLinkFile`, `triggerFilesChanged`
- `obj:` `getField`, `getMaterialNames`, `getModelFile`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `worldEditorCppApi.` `getClassIsSelectable`, `setHoveredObjectId`, `setMaterialFocus`, `setMaterialFocusHighlight`, `setMaterialFocusIsolate`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/materialEditor.lua`.*
