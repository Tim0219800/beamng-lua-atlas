# `editor_visualization`

*Fichier : `lua/ge/extensions/editor/visualization.lua` · VM : Game Engine (GE) · 542 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_visualization` : `extensions.load("editor_visualization")`, puis la globale `editor_visualization`

Fenêtre « Visualization » de l'éditeur de monde. Trois onglets : Debug (cases à cocher pour les types de visualisation enregistrés : wireframe, bounding boxes, triggers, terrain, decals, frustums de lumière, graphes de navigation, vues Advanced Lighting, Material Debug...), Visible (affichage par classe d'objet) et Selectable (sélectionnabilité par classe, avec des presets). Elle ajoute aussi la visualisation « Lights Status » (sphères colorées et textes sur les lumières de la scène) et enregistre les préférences gizmos.visualization.*.

## Remarques

- Préférences enregistrées dans la catégorie gizmos/visualization : visTypes, visible, selectable (tables cachées), visualizationDrawDistance (int, défaut 250, 50 à 2000), saveVisualizationSettings (bool, défaut true), showMaterialDebugLegend (bool, défaut true). Si saveVisualizationSettings est false, visTypes/visible/selectable sont marquées non persistantes.
- Lights Status : lit toutes les lumières (sous-classes de LightBase) avec scenetree.findSubClassObjects, rafraîchit au plus toutes les 0,75 s. Bleu = contrôlée par la nuit (champ nightLight), vert = activée, rouge = désactivée (champ isEnabled). Rayon de sphère 0,05 à 5 m (défaut 0,5), distance de dessin 10 à 2000 m (défaut 120). Les textes ne s'affichent que dans les 25 m et pour 12 lumières au maximum.
- Visualisations activées par défaut : SFXEmitter.renderEmitters, BeamNGWaypointDrawDebug et SceneCullingState.disableTerrainOcclusion ; toutes les autres sont à false.
- La visualisation « Annotation Viz » n'est enregistrée que si ResearchVerifier.isTechLicenseVerified() est vrai (licence BeamNG.tech).
- Le rayon affiché dans le libellé d'une lumière vient du champ 'range' pour un SpotLight et 'radius' pour les autres.
- Dépend de l'extension editor_aiViz (commentaire du code : dépendance « pas élégante » mais pratique pour réutiliser la visualisation du navgraph).

**Dépendances (chargées avant) :** `editor_aiViz`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_visualization.onEditorGui()` | Hook de l'éditeur appelé à chaque frame : dessine les sphères/textes de la visualisation des lumières, la fenêtre Visualization (filtre de recherche, trois onglets), la fenêtre de réglages des lumières et la légende de material debug. *(interne)* *(hook)* | 225 |
| `editor_visualization.onEditorInitialized()` | Hook de l'éditeur appelé à l'initialisation : initialise selectabilityPresets, enregistre les fenêtres, efface puis enregistre tous les types de visualisation (editor.registerVisualizationType), initialise materialDebugViz et calcule les valeurs par défaut de chaque type. Expose aussi editor.updateVisSettings. *(interne)* *(hook)* | 440 |
| `editor_visualization.onEditorPreferenceValueChanged(path, value)` | Hook de l'éditeur appelé quand une préférence change : applique visTypes, visible ou selectable aux objets de l'éditeur, synchronise le preset de sélectabilité, et bascule les chemins non persistants quand saveVisualizationSettings change. *(interne)* *(hook)* | 359 |
| `editor_visualization.onEditorRegisterPreferences(prefsRegistry)` | Hook de l'éditeur appelé à l'enregistrement des préférences : mémorise l'état initial visible/sélectionnable de chaque classe d'objet et enregistre la catégorie gizmos/visualization. *(interne)* *(hook)* | 401 |

### Détail des paramètres

#### `editor_visualization.onEditorPreferenceValueChanged(path, value)`

Hook de l'éditeur appelé quand une préférence change : applique visTypes, visible ou selectable aux objets de l'éditeur, synchronise le preset de sélectabilité, et bascule les chemins non persistants quand saveVisualizationSettings change.

- `path` (*string*) : chemin de la préférence, ex. 'gizmos.visualization.visTypes'
- `value` (*any*) : nouvelle valeur (table pour visTypes/visible/selectable, booléen pour saveVisualizationSettings)

#### `editor_visualization.onEditorRegisterPreferences(prefsRegistry)`

Hook de l'éditeur appelé à l'enregistrement des préférences : mémorise l'état initial visible/sélectionnable de chaque classe d'objet et enregistre la catégorie gizmos/visualization.

- `prefsRegistry` (*table*) : registre de préférences de l'éditeur

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'editor_aiViz'} : extension chargée avant celle-ci. |

## Appels vers le moteur (C++)

- `ResearchVerifier.` `isTechLicenseVerified`
- `debugDrawer:` `drawSphere`, `drawTextAdvanced`
- `obj:` `getClassName`, `getDynDataFieldbyName`, `getField`, `getName`, `getPosition`, `getWorldBox`, `isSubClassOf`
- `scenetree.` `findClassObjects`, `findObject`, `findSubClassObjects`
- `worldEditorCppApi.` `getObjectClassNames`, `getRenderableObjectClassNames`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/visualization.lua`.*
