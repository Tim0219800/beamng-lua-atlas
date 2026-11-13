# `editor_roadEditor`

*Fichier : `lua/ge/extensions/editor/roadEditor.lua` · VM : Game Engine (GE) · 2367 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadEditor` : `extensions.load("editor_roadEditor")`, puis la globale `editor_roadEditor`

Éditeur de routes en décalque (DecalRoad) du World Editor : mode d'édition « Edit Road » (icône create_road_decal) pour créer des routes (Alt + clic gauche), sélectionner routes et nœuds (Ctrl pour la multi-sélection, Ctrl+Maj+glisser pour une sélection rectangle), déplacer nœuds, régler la largeur, dupliquer, copier/coller les propriétés, supprimer, avec historique d'annulation. Il enregistre aussi les préférences « roadEditor.general.* » et un filtre de matériaux pour DecalRoad (tag « RoadAndPath »). Le fichier est très long (environ 2 400 lignes) : presque tout est local ; seuls quelques hooks et une fonction sont exportés.

## Remarques

- Presque toute la logique (création, sélection, undo/redo, gizmos de nœuds, dessin debugDrawer) est locale au fichier et branchée sur le mode d'édition editor.editModes.roadEditMode ; elle n'est pas appelable de l'extérieur.
- Préférences enregistrées (catégorie roadEditor/general) : defaultWidth (10), dragWidth, aiRoadsSelectable, nonAiRoadsSelectable, overObjects, highlightNearbyRoads, highlightNearbyRoadsDistance (100 m, 0 à 10000), columnSizes (masquée).
- La préférence updateDecalRoadsOnStaticMeshTransform est commentée dans la liste des préférences, mais le code appelle encore editor.getPreference('roadEditor.general.updateDecalRoadsOnStaticMeshTransform') (dans onEditorInitialized) : la valeur lue n'existe pas (déduit du code).
- Les routes situées dans un prefab empaqueté ne sont pas éditables : une fenêtre modale « Select and edit not allowed when road is inside packed prefab! » s'affiche.
- Le module lit extensions.editor_roadRiverGui à son chargement (local roadRiverGui) : cette extension doit exister à ce moment-là.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadEditor.cycleHoveredRoadsAM(value)` | Appelée par l'action map « RoadEditor » : fait défiler le choix parmi les routes survolées superposées. 1 passe à la route suivante, 0 à la précédente (boucle). Sans effet s'il n'y a aucune route survolée. | 2150 |
| `editor_roadEditor.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : crée le mode d'édition « Edit Road » avec ses raccourcis (LMB+Alt créer/ajouter un nœud, Ctrl+LMB multi-sélection, Ctrl+Maj+glisser sélection rectangle, copie/colle/duplication), enregistre le filtre de matériaux DecalRoad, la fenêtre modale d'erreur, la fenêtre de modèles de routes, recharge les modèles (editor_roadUtils.reloadTemplates) et applique la préférence updateDecalRoadsOnStaticMeshTransform si l'API C++ existe. *(interne)* *(hook)* | 2315 |
| `editor_roadEditor.onEditorInspectorHeaderGui(inspectorInfo)` | Hook appelé quand l'inspecteur dessine son en-tête. Si le mode « Edit Road » est actif, ajoute les champs de position et de largeur des nœuds sélectionnés (multi-édition quand toutes les valeurs sont égales) avec enregistrement dans l'historique. *(interne)* *(hook)* | 1213 |
| `editor_roadEditor.onEditorObjectSelectionChanged()` | Hook appelé quand la sélection d'objets de l'éditeur change. Si le mode « Edit Road » est actif, termine la route en cours de création (si aucune sélection), reconstruit la liste des DecalRoad sélectionnés et ne conserve que les nœuds sélectionnés des routes encore sélectionnées. *(interne)* *(hook)* | 2275 |
| `editor_roadEditor.onEditorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Pour roadEditor.general.updateDecalRoadsOnStaticMeshTransform, transmet la valeur à worldEditorCppApi.setUpdateDecalRoadsOnStaticMeshTransform (si disponible). *(interne)* *(hook)* | 2220 |
| `editor_roadEditor.onEditorRegisterPreferences(prefsRegistry)` | Hook appelé pour enregistrer les préférences : crée la catégorie « roadEditor » et la sous-catégorie « general » avec ses réglages (voir notes). *(interne)* *(hook)* | 2226 |
| `editor_roadEditor.onExtensionLoaded()` | Hook appelé au chargement de l'extension ; écrit seulement un log « initialized » (niveau D). *(interne)* *(hook)* | 2072 |
| `editor_roadEditor.onPreRender()` | Hook appelé avant le rendu de chaque frame ; sort immédiatement si le mode « Edit Road » n'est pas actif et ne fait rien d'autre (corps vide). *(interne)* *(hook)* | 2077 |

### Détail des paramètres

#### `editor_roadEditor.cycleHoveredRoadsAM(value)`

Appelée par l'action map « RoadEditor » : fait défiler le choix parmi les routes survolées superposées. 1 passe à la route suivante, 0 à la précédente (boucle). Sans effet s'il n'y a aucune route survolée.

- `value` (*integer*) : 1 = suivante, 0 = précédente.

#### `editor_roadEditor.onEditorInspectorHeaderGui(inspectorInfo)`

Hook appelé quand l'inspecteur dessine son en-tête. Si le mode « Edit Road » est actif, ajoute les champs de position et de largeur des nœuds sélectionnés (multi-édition quand toutes les valeurs sont égales) avec enregistrement dans l'historique.

- `inspectorInfo` (*table*) : Informations de l'inspecteur fournies par l'éditeur (déduit du code).

#### `editor_roadEditor.onEditorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Pour roadEditor.general.updateDecalRoadsOnStaticMeshTransform, transmet la valeur à worldEditorCppApi.setUpdateDecalRoadsOnStaticMeshTransform (si disponible).

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_roadEditor.onEditorRegisterPreferences(prefsRegistry)`

Hook appelé pour enregistrer les préférences : crée la catégorie « roadEditor » et la sous-catégorie « general » avec ses réglages (voir notes).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

## Appels vers le moteur (C++)

- `Engine.` `sceneGetCameraFrustum`
- `FS:` `fileExists`
- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`, `drawTriSolid`
- `scenetree.` `decalRoadContainsPoint`, `findObjectById`
- `worldEditorCppApi.` `setUpdateDecalRoadsOnStaticMeshTransform`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadEditor.lua`.*
