# `editor_dynamicDecals_widgets`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/widgets.lua` · VM : Game Engine (GE) · 1592 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_widgets` : `extensions.load("editor_dynamicDecals_widgets")`, puis la globale `editor_dynamicDecals_widgets`

Bibliothèque de widgets imgui de l'outil Dynamic Decals. draw() affiche une propriété (nom, infobulle de description, éventuel choix du type de widget) puis le widget adapté à son type : bool (case à cocher), int (Input/Slider/Drag/Combo), float (Input/Slider/Drag), Point2F (Input/Slider/Drag), Point3F et Point4F (Slider/Color), string (Input/InputMultiline), Texture (File/ImageButton), File, ColorI et MultiColor (dégradé). Les propriétés viennent de l'API dynamicDecals (api.propertiesMap, api.types, api.widgetTypes). Gère aussi la mise en évidence temporaire d'une propriété avec défilement automatique.

## Remarques

- Un type de propriété inconnu est affiché en rouge avec le nom de la propriété.
- La plupart des widgets proposent un bouton de remise à la valeur par défaut (icône refresh) si property.default est défini ; la nouvelle valeur est écrite dans property.value.
- Si property.widgetType est absent, le widget par défaut du type est utilisé. Si api.widgetTypes[type] existe, un bouton « Widget Type » ouvre un popup pour changer property.widgetType.
- En mode debug de l'outil (préférence dynamicDecalsTool.general.debug), l'infobulle ajoute l'identifiant du widget.
- Préférences enregistrées : texturePreviewSize (float, 128, 32 à 512) et multiColorWidgetWidth (float, 128, 32 à 512).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_widgets.defaultButton(widgetId, cbFunc, tooltipMsg)` | Dessine un bouton icône « refresh » suivi de SameLine ; appelle cbFunc au clic. | 59 |
| `editor_dynamicDecals_widgets.draw(value, property, guiId, editEnded, widgetOptions)` | Dessine une propriété et son widget. Renvoie true si la valeur a été modifiée cette frame ; editEnded[0] est mis à jour pour indiquer la fin d'une édition (relâchement de la souris, validation). | 1325 |
| `editor_dynamicDecals_widgets.editorPreferenceValueChanged(path, value)` | Hook de préférence vide. *(interne)* | 1582 |
| `editor_dynamicDecals_widgets.highlight(id, time)` | Met en évidence une propriété (cadre de la couleur BeamNG) et fait défiler la fenêtre jusqu'à elle. Remplace toute mise en évidence précédente. | 1553 |
| `editor_dynamicDecals_widgets.registerEditorPreferences(prefsRegistry)` | Enregistre les préférences texturePreviewSize et multiColorWidgetWidth. *(interne)* | 1575 |
| `editor_dynamicDecals_widgets.setup(tool_in)` | Initialise avec l'outil parent, récupère l'API dynamicDecals et le helper, et enregistre la mise à jour qui fait expirer les mises en évidence. *(interne)* | 1567 |

### Détail des paramètres

#### `editor_dynamicDecals_widgets.defaultButton(widgetId, cbFunc, tooltipMsg)`

Dessine un bouton icône « refresh » suivi de SameLine ; appelle cbFunc au clic.

- `widgetId` (*string*) : Identifiant du widget (le bouton est « widgetId_resetButton »)
- `cbFunc` (*function*) : Fonction appelée au clic
- `tooltipMsg` (*string|nil*) : Infobulle optionnelle

#### `editor_dynamicDecals_widgets.draw(value, property, guiId, editEnded, widgetOptions)`

Dessine une propriété et son widget. Renvoie true si la valeur a été modifiée cette frame ; editEnded[0] est mis à jour pour indiquer la fin d'une édition (relâchement de la souris, validation).

- `value` (*any*) : Valeur actuelle de la propriété (type selon property.type)
- `property` (*table*) : Propriété {id, name?, description?, type?, widgetType?, default?, value, ...} ; id sert à retrouver api.propertiesMap
- `guiId` (*string*) : Suffixe d'identifiant imgui pour rendre le widget unique (widgetId = "##guiId_property.id")
- `editEnded` (*table|nil*) : Pointeur booléen imgui ([0]) mis à true à la fin de l'édition
- `widgetOptions` (*table|nil*) : Options de rendu, par exemple widthMod (ajustement de largeur en pixels)
- **renvoie** : boolean|nil true si modifié, sinon nil

#### `editor_dynamicDecals_widgets.editorPreferenceValueChanged(path, value)`

Hook de préférence vide.

- `path` (*string*) : Chemin
- `value` (*any*) : Valeur

#### `editor_dynamicDecals_widgets.highlight(id, time)`

Met en évidence une propriété (cadre de la couleur BeamNG) et fait défiler la fenêtre jusqu'à elle. Remplace toute mise en évidence précédente.

- `id` (*string*) : Identifiant de widget complet, au format "##guiId_propertyId"
- `time` (*number*) : Durée en secondes (décrémentée avec dtReal)

#### `editor_dynamicDecals_widgets.registerEditorPreferences(prefsRegistry)`

Enregistre les préférences texturePreviewSize et multiColorWidgetWidth.

- `prefsRegistry` (*table*) : Registre de préférences

#### `editor_dynamicDecals_widgets.setup(tool_in)`

Initialise avec l'outil parent, récupère l'API dynamicDecals et le helper, et enregistre la mise à jour qui fait expirer les mises en évidence.

- `tool_in` (*table*) : Module editor_dynamicDecalsTool

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/widgets.lua`.*
