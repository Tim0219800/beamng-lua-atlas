# `editor_decalSpline`

*Fichier : `lua/ge/extensions/editor/decalSpline.lua` · VM : Game Engine (GE) · 1764 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_decalSpline` : `extensions.load("editor_decalSpline")`, puis la globale `editor_decalSpline`

Outil « Decal Spline » du World Editor : on trace une spline (nœuds, largeur par défaut 10 m) le long de laquelle des decals sont posés automatiquement à partir de jusqu'à 4 composants (matériau, lignes/colonnes de texture, frame, espacement, jitter). Le fichier est le point d'entrée de l'outil (fenêtre « decalSpline », mode d'édition « Decal Spline ») ; la logique est répartie dans editor/decalSpline/splineMgr, editor/decalSpline/populate et les utilitaires editor/toolUtilities (splineInput, render/spline, session, bake, panCamera, materialSelectionMgr…). Il gère aussi la sauvegarde des splines dans le niveau (onSerialize/onDeserialized, qui survit au rechargement Lua) et l'import/export de sessions.

## Remarques

- Même hors du mode d'édition, onEditorGui reconstruit les splines modifiées (pour mettre à jour les splines liées) et dessine leurs contours (shells).
- Une spline verrouillée (isEnabled = false) garde ses decals dans la scène ; onSerialize les libère via populate.release et onDeserialized les reprend via populate.adopt.
- onSerialize supprime toutes les splines après les avoir sérialisées (splineMgr.removeAllDecalSplines(true)) : les splines sont recréées par onDeserialized.
- Constantes internes : tolérance RDP de simplification 9.0, espacement entre 0 et 100, échelle des lignes d'élévation 100.
- setSelectedSplineIdx et setSelectedNodeIdx n'ont pas de contrôle de borne (la borne est appliquée seulement dans onDeserialized).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_decalSpline.onClientEndMission()` | Hook appelé quand on quitte la carte ; supprime toutes les splines de decals. *(interne)* *(hook)* | 1745 |
| `editor_decalSpline.onDeserialized(data)` | Hook de restauration après rechargement Lua : recrée les splines depuis les données sérialisées, reprend les decals conservés des splines verrouillées (populate.adopt), borne l'index sélectionné et recalcule la table id vers index. *(interne)* *(hook)* | 127 |
| `editor_decalSpline.onEditorGui()` | Hook appelé à chaque frame de l'éditeur. Met à jour les splines modifiées ; si l'outil n'est pas actif, ne fait que dessiner les contours. Sinon gère la fenêtre principale, la caméra panoramique, la sélection de matériau, les événements souris/clavier (splineInput) et le rendu des splines. *(interne)* *(hook)* | 1664 |
| `editor_decalSpline.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : déclare editor.editModes.decalSplineEditMode (icône decalRoad) et enregistre la fenêtre 300x700. *(interne)* *(hook)* | 1731 |
| `editor_decalSpline.onSerialize()` | Hook de sauvegarde avant rechargement Lua : renvoie la liste des splines sérialisées ({} s'il n'y en a pas) et supprime les splines en mémoire. *(interne)* *(hook)* | 108 |
| `editor_decalSpline.setLockedById(id, isLocked)` | Verrouille ou déverrouille la spline d'id donné et la reconstruit immédiatement (utilisé aussi par la Master Spline pour ses enfants liés). Les decals sont enregistrés par le gestionnaire de persistance dans les deux cas : le verrou rend seulement la spline non éditable. Ne fait rien si l'id est inconnu. | 96 |
| `editor_decalSpline.setSelectedNodeIdx(idx)` | Définit l'index du nœud sélectionné (sélection partagée entre outils). | 92 |
| `editor_decalSpline.setSelectedSplineIdx(idx)` | Définit l'index de la spline sélectionnée (sélection partagée entre outils). | 89 |

### Détail des paramètres

#### `editor_decalSpline.onDeserialized(data)`

Hook de restauration après rechargement Lua : recrée les splines depuis les données sérialisées, reprend les decals conservés des splines verrouillées (populate.adopt), borne l'index sélectionné et recalcule la table id vers index.

- `data` (*table|nil*) : liste de splines sérialisées (ignorée si vide)

#### `editor_decalSpline.onSerialize()`

Hook de sauvegarde avant rechargement Lua : renvoie la liste des splines sérialisées ({} s'il n'y en a pas) et supprime les splines en mémoire.

- **renvoie** : table splines sérialisées

#### `editor_decalSpline.setLockedById(id, isLocked)`

Verrouille ou déverrouille la spline d'id donné et la reconstruit immédiatement (utilisé aussi par la Master Spline pour ses enfants liés). Les decals sont enregistrés par le gestionnaire de persistance dans les deux cas : le verrou rend seulement la spline non éditable. Ne fait rien si l'id est inconnu.

- `id` (*integer*) : id de la spline
- `isLocked` (*boolean*) : true pour verrouiller

#### `editor_decalSpline.setSelectedNodeIdx(idx)`

Définit l'index du nœud sélectionné (sélection partagée entre outils).

- `idx` (*integer*) : index du nœud, à partir de 1

#### `editor_decalSpline.setSelectedSplineIdx(idx)`

Définit l'index de la spline sélectionnée (sélection partagée entre outils).

- `idx` (*integer*) : index de la spline, à partir de 1

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/decalSpline.lua`.*
