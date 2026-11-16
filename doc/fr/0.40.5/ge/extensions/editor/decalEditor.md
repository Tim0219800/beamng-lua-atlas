# `editor_decalEditor`

*Fichier : `lua/ge/extensions/editor/decalEditor.lua` · VM : Game Engine (GE) · 1400 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_decalEditor` : `extensions.load("editor_decalEditor")`, puis la globale `editor_decalEditor`

Éditeur de decals du World Editor (mode d'édition « Edit Decal », fenêtre « Decal Editor », action map « DecalEditor »). Deux onglets : « Templates » (liste des DecalData avec * pour les modifiés ; créer, supprimer, enregistrer un ou tous les templates) et « Instances » (liste et propriétés des decals posés, remplacement de template, duplication). En mode Templates, un clic sur le terrain crée une instance du template sélectionné ; les instances sont visualisées par des sphères de debug colorées par id, sélectionnables à la souris (Ctrl+clic = multi-sélection) et déplaçables avec le gizmo d'axes (Maj + glisser = dupliquer). Toutes les actions sont annulables via editor.history, et les decals sont enregistrés avant la sauvegarde du niveau.

## Remarques

- Les templates DummyDecal et tireTrackDecal sont cachés de la liste.
- Distances de debug : sphères jusqu'à 250 m, textes jusqu'à 50 m ; l'opacité des sphères se règle avec le curseur « Gizmo sphere alpha ».
- Une grille spatiale de cellules accélère la recherche des decals visibles et survolés ; elle est reconstruite quand le nombre de decals change.
- Le gizmo est placé sur la moyenne des positions des instances sélectionnées, ou sur la matrice monde de l'instance en alignement local avec une seule sélection.
- Possible erreur : dans onEditorInspectorFieldChanged, le résultat de scenetree.findObjectById n'est pas testé avant template:getClassName() (déduit du code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_decalEditor.onEditorAxisGizmoAligmentChanged()` | Hook appelé quand l'alignement du gizmo (local/monde) change ; si des instances sont sélectionnées en mode Edit Decal, replace le gizmo. *(interne)* *(hook)* | 282 |
| `editor_decalEditor.onEditorBeforeSaveLevel()` | Hook appelé avant la sauvegarde du niveau ; enregistre tous les templates de decals (editor.saveDecals). *(interne)* *(hook)* | 1335 |
| `editor_decalEditor.onEditorGui()` | Hook appelé à chaque frame de l'éditeur ; si le mode Edit Decal est actif, dessine la fenêtre (curseur d'opacité des sphères, case « Show info labels », onglets Templates et Instances). *(interne)* *(hook)* | 1359 |
| `editor_decalEditor.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : déclare editor.editModes.decalEditMode (onActivate, onDeactivate, onUpdate, onDeleteSelection, icône create_decal, raccourcis auxiliaires) et enregistre la fenêtre 400x600. *(interne)* *(hook)* | 1316 |
| `editor_decalEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | Hook appelé quand un champ change dans l'inspecteur ; pour chaque DecalData modifié, le marque dirty dans scenetree.decalPersistMan et notifie les instances qui l'utilisent (editor.notifyDecalModified). *(interne)* *(hook)* | 1339 |
| `editor_decalEditor.onEditorInspectorHeaderGui(inspectorInfo)` | Hook appelé pour dessiner l'en-tête de l'inspecteur ; en mode Edit Decal, affiche l'aperçu du matériau du template sélectionné. *(interne)* *(hook)* | 1017 |
| `editor_decalEditor.onExtensionLoaded()` | Hook appelé au chargement de l'extension ; écrit « initialized » dans le journal. *(interne)* *(hook)* | 1301 |

### Détail des paramètres

#### `editor_decalEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)`

Hook appelé quand un champ change dans l'inspecteur ; pour chaque DecalData modifié, le marque dirty dans scenetree.decalPersistMan et notifie les instances qui l'utilisent (editor.notifyDecalModified).

- `selectedIds` (*integer[]*) : ids des objets sélectionnés
- `fieldName` (*string*) : champ modifié
- `fieldValue` (*any*) : nouvelle valeur
- `arrayIndex` (*integer*) : index dans le champ tableau

#### `editor_decalEditor.onEditorInspectorHeaderGui(inspectorInfo)`

Hook appelé pour dessiner l'en-tête de l'inspecteur ; en mode Edit Decal, affiche l'aperçu du matériau du template sélectionné.

- `inspectorInfo` (*table*) : infos de l'inspecteur (inutilisé)

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `Sim.` `upcast`
- `debugDrawer:` `drawArrow`, `drawLine`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/decalEditor.lua`.*
