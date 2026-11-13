# `editor_ezObjectSelect_subtools_fence_session`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua` · VM : Game Engine (GE) · 775 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_subtools_fence_session` : `extensions.load("editor_ezObjectSelect_subtools_fence_session")`, puis la globale `editor_ezObjectSelect_subtools_fence_session`

Session d'édition de clôture d'Easy Object Select. begin() découvre une clôture existante à partir de l'objet sélectionné (fence/anchors) ou démarre une création ; la clôture est représentée par une spline éditable (splineInput, nœuds sphères) sur laquelle le moteur populationEngine de meshSpline place des pièces TSStatic en aperçu (max 512). La validation crée/modifie les objets en une action d'historique annulable (« Edit Fence » ou « Delete Fence »).

## Exemple

```lua
local s = extensions.editor_ezObjectSelect_subtools_fence_session
local ok, err = s.begin({assetPaths = {"art/shapes/fence.dae"}, anchorDistance = 0.5, noOverlap = true})
-- à chaque frame : s.update(true)
-- puis : s.exitAndCommit()
```

## Remarques

- La touche Échap annule la session (update appelle cancel).
- En création initiale, un clic sur le terrain pose le premier nœud puis glisser définit le second ; un glisser trop court est ignoré.
- Les objets finaux sont ajoutés à editor.resolveAddGroup(MissionGroup) et le hook onEditorObjectAdded est émis lors des restaurations (undo/redo).
- exitAndCommit et deleteAndCommit refusent d'agir (retour 0 et message) si isCapped() est vrai.
- Utilise des upvalues locaux : une seule session peut être active à la fois.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_subtools_fence_session.begin(options)` | Démarre une session. Échoue si une session est déjà active ou si aucun asset n'est choisi. Si des objets sont sélectionnés, démarre depuis le dernier ; sinon démarre une création vierge. Sauvegarde la sélection d'origine et enregistre l'outil de spline. | 520 |
| `editor_ezObjectSelect_subtools_fence_session.cancel()` | Annule la session : restaure les objets sources et la sélection d'origine. | 722 |
| `editor_ezObjectSelect_subtools_fence_session.deleteAndCommit()` | Supprime les objets d'origine de la clôture en une action d'historique « Delete Fence ». | 698 |
| `editor_ezObjectSelect_subtools_fence_session.exitAndCommit()` | Valide la clôture : sérialise l'état final, termine la session et enregistre l'action d'historique « Edit Fence » (annulable). | 664 |
| `editor_ezObjectSelect_subtools_fence_session.getNodeCount()` | Nombre de nœuds de la spline (0 sans spline). | 751 |
| `editor_ezObjectSelect_subtools_fence_session.getPieceCount()` | Nombre de pièces de l'aperçu. | 743 |
| `editor_ezObjectSelect_subtools_fence_session.getSelectedPieceCount()` | Nombre de pièces d'origine sélectionnées au démarrage. | 747 |
| `editor_ezObjectSelect_subtools_fence_session.getStatusMessage()` | Dernier message d'état (erreur de validation, etc.). | 770 |
| `editor_ezObjectSelect_subtools_fence_session.isActive()` | true si une session est active. | 735 |
| `editor_ezObjectSelect_subtools_fence_session.isCapped()` | true si la découverte ou l'aperçu a atteint la limite de sécurité ; la validation est alors bloquée. | 759 |
| `editor_ezObjectSelect_subtools_fence_session.isDragging()` | true si un glisser (création initiale ou nœud de spline) est en cours. | 739 |
| `editor_ezObjectSelect_subtools_fence_session.isLoop()` | true si la spline est fermée en boucle. | 755 |
| `editor_ezObjectSelect_subtools_fence_session.setNoOverlap(enabled)` | Active/désactive le mode sans chevauchement (longueurs de mesh entières, reste laissé vide en bout) et marque la spline à reconstruire. | 763 |
| `editor_ezObjectSelect_subtools_fence_session.update(canAcceptInput)` | À appeler chaque frame : gère Échap, la création initiale ou l'édition de spline, reconstruit l'aperçu si la spline est modifiée et dessine nœuds et spline. | 616 |

### Détail des paramètres

#### `editor_ezObjectSelect_subtools_fence_session.begin(options)`

Démarre une session. Échoue si une session est déjà active ou si aucun asset n'est choisi. Si des objets sont sélectionnés, démarre depuis le dernier ; sinon démarre une création vierge. Sauvegarde la sélection d'origine et enregistre l'outil de spline.

- `options` (*table|nil*) : assetPaths (string[]), anchorDistance (m), noOverlap (boolean, vrai par défaut sauf false explicite).
- **renvoie** : boolean true si la session démarre.
- **renvoie** : string|nil Message d'erreur en cas d'échec.

#### `editor_ezObjectSelect_subtools_fence_session.deleteAndCommit()`

Supprime les objets d'origine de la clôture en une action d'historique « Delete Fence ».

- **renvoie** : integer Nombre de pièces supprimées ; 0 si impossible.

#### `editor_ezObjectSelect_subtools_fence_session.exitAndCommit()`

Valide la clôture : sérialise l'état final, termine la session et enregistre l'action d'historique « Edit Fence » (annulable).

- **renvoie** : integer Nombre de pièces créées ; 0 si rien ou en cas d'erreur.

#### `editor_ezObjectSelect_subtools_fence_session.getNodeCount()`

Nombre de nœuds de la spline (0 sans spline).

- **renvoie** : integer Nombre de nœuds.

#### `editor_ezObjectSelect_subtools_fence_session.getPieceCount()`

Nombre de pièces de l'aperçu.

- **renvoie** : integer Nombre de placements.

#### `editor_ezObjectSelect_subtools_fence_session.getSelectedPieceCount()`

Nombre de pièces d'origine sélectionnées au démarrage.

- **renvoie** : integer Nombre.

#### `editor_ezObjectSelect_subtools_fence_session.getStatusMessage()`

Dernier message d'état (erreur de validation, etc.).

- **renvoie** : string|nil Message.

#### `editor_ezObjectSelect_subtools_fence_session.isActive()`

true si une session est active.

- **renvoie** : boolean Session active.

#### `editor_ezObjectSelect_subtools_fence_session.isCapped()`

true si la découverte ou l'aperçu a atteint la limite de sécurité ; la validation est alors bloquée.

- **renvoie** : boolean Limite atteinte.

#### `editor_ezObjectSelect_subtools_fence_session.isDragging()`

true si un glisser (création initiale ou nœud de spline) est en cours.

- **renvoie** : boolean Glisser en cours.

#### `editor_ezObjectSelect_subtools_fence_session.isLoop()`

true si la spline est fermée en boucle.

- **renvoie** : boolean Boucle.

#### `editor_ezObjectSelect_subtools_fence_session.setNoOverlap(enabled)`

Active/désactive le mode sans chevauchement (longueurs de mesh entières, reste laissé vide en bout) et marque la spline à reconstruire.

- `enabled` (*boolean*) : true pour activer.

#### `editor_ezObjectSelect_subtools_fence_session.update(canAcceptInput)`

À appeler chaque frame : gère Échap, la création initiale ou l'édition de spline, reconstruit l'aperçu si la spline est modifiée et dessine nœuds et spline.

- `canAcceptInput` (*boolean*) : true si les entrées peuvent être traitées.
- **renvoie** : boolean false si aucune session active.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorObjectAdded` — écouté par 3 module(s)

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `Sim.` `deserializeObjectsFromText`
- `be:` `reloadCollision`
- `debugDrawer:` `drawSphere`
- `obj:` `delete`, `disableCollision`, `enableCollision`, `getGroup`, `getID`, `registerObject`, `serialize`, `setField`, `setHidden`, `setPosRot`, `setRenderEnabled`
- `scenetree.` `findObjectById`
- `worldEditorCppApi.` `setAxisGizmoSelectedElement`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua`.*
