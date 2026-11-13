# `editor_roadSpline`

*Fichier : `lua/ge/extensions/editor/roadSpline.lua` · VM : Game Engine (GE) · 1699 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadSpline` : `extensions.load("editor_roadSpline")`, puis la globale `editor_roadSpline`

Outil « Road Spline » de l'éditeur de niveaux : on trace une spline (nœuds + largeurs) et l'outil génère automatiquement des DecalRoads empilés en couches (chaussée, lignes centrales/de rive, fondus de bord, marques de pneus, fissures, rustines…), avec peinture optionnelle du terrain. Ce fichier est surtout l'interface ImGui (fenêtre « roadSplineEditor », mode d'édition « Road Spline ») ; la logique de données est dans editor/roadSpline/groupMgr et layerMgr. Il enregistre aussi l'entrée « Convert to Road Spline » dans le menu contextuel de l'arbre de scène pour convertir des DecalRoads existants. Utile à un moddeur surtout pour verrouiller/sélectionner une spline depuis un autre outil (Master Spline).

## Remarques

- Le dossier de scène créé pour chaque spline n'est sauvegardé avec le niveau que si la route est verrouillée (« bakée ») ; sinon il est transitoire (cansave = false).
- onSerialize/onDeserialized servent au rechargement des extensions Lua : une route verrouillée garde ses DecalRoads dans la scène, seuls leurs ids sont repris au retour (groupMgr.release/adopt).
- Même si l'outil n'est pas actif, onEditorGui reconstruit les groupes marqués sales et dessine les « coques » des splines.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadSpline.onClientEndMission()` | Appelé à la sortie du niveau : supprime les groupes actifs non liés (les verrouillés et liés restent dans la liste) et recalcule la table id -> indice. *(interne)* *(hook)* | 1680 |
| `editor_roadSpline.onDeserialized(data)` | Hook de désérialisation après rechargement Lua : recrée les groupes, reprend les DecalRoads conservés des routes verrouillées (groupMgr.adopt) et recalcule la table id -> indice. *(interne)* *(hook)* | 162 |
| `editor_roadSpline.onEditorGui()` | Appelé à chaque image par l'éditeur. Met à jour les groupes sales (même si l'outil est inactif), puis, si l'outil est actif, dessine la fenêtre principale, gère le polygone de sélection, la sélection de matériau, le fil de fer, les nœuds/poignées et le gizmo. *(interne)* *(hook)* | 1504 |
| `editor_roadSpline.onEditorInitialized()` | Appelé à l'initialisation de l'éditeur : déclare le mode d'édition roadSplineEditor (« Road Spline »), enregistre la fenêtre de l'outil et celle de sélection de matériau, et ajoute « Convert to Road Spline » au menu contextuel de l'arbre de scène. *(interne)* *(hook)* | 1657 |
| `editor_roadSpline.onSerialize()` | Hook de sérialisation avant rechargement Lua. Renvoie la liste des groupes encodés ; pour une route verrouillée, mémorise les ids de ses DecalRoads (keptObjects) et laisse les objets dans la scène. Vide ensuite la liste des groupes. *(interne)* *(hook)* | 144 |
| `editor_roadSpline.setLockedById(id, isLocked)` | Verrouille ou déverrouille la spline dont l'id est donné et la reconstruit immédiatement. Verrouillée (isEnabled = false), la route n'est plus reconstruite par l'outil et ses DecalRoads sont sauvegardés avec le niveau. Utilisée aussi par la Master Spline pour les splines enfants liées. Ne fait rien si l'id est inconnu. | 86 |
| `editor_roadSpline.setSelectedNodeIdx(idx)` | Définit l'indice du nœud sélectionné dans la spline courante (sélection partagée entre outils). | 119 |
| `editor_roadSpline.setSelectedSplineIdx(idx)` | Définit l'indice de la spline sélectionnée dans l'outil (sélection partagée entre outils). | 116 |

### Détail des paramètres

#### `editor_roadSpline.onDeserialized(data)`

Hook de désérialisation après rechargement Lua : recrée les groupes, reprend les DecalRoads conservés des routes verrouillées (groupMgr.adopt) et recalcule la table id -> indice.

- `data` (*table*) : Valeur renvoyée par onSerialize.

#### `editor_roadSpline.onSerialize()`

Hook de sérialisation avant rechargement Lua. Renvoie la liste des groupes encodés ; pour une route verrouillée, mémorise les ids de ses DecalRoads (keptObjects) et laisse les objets dans la scène. Vide ensuite la liste des groupes.

- **renvoie** : table Tableau de groupes sérialisés (chaînes encodées par string.buffer).

#### `editor_roadSpline.setLockedById(id, isLocked)`

Verrouille ou déverrouille la spline dont l'id est donné et la reconstruit immédiatement. Verrouillée (isEnabled = false), la route n'est plus reconstruite par l'outil et ses DecalRoads sont sauvegardés avec le niveau. Utilisée aussi par la Master Spline pour les splines enfants liées. Ne fait rien si l'id est inconnu.

- `id` (*string*) : Identifiant (UUID) du groupe/spline.
- `isLocked` (*boolean*) : true pour verrouiller (le dernier état affiché est d'abord reconstruit), false pour déverrouiller.

#### `editor_roadSpline.setSelectedNodeIdx(idx)`

Définit l'indice du nœud sélectionné dans la spline courante (sélection partagée entre outils).

- `idx` (*integer*) : Indice (à partir de 1) du nœud.

#### `editor_roadSpline.setSelectedSplineIdx(idx)`

Définit l'indice de la spline sélectionnée dans l'outil (sélection partagée entre outils).

- `idx` (*integer*) : Indice (à partir de 1) dans la liste des groupes.

## Appels vers le moteur (C++)

- `obj:` `getClassName`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadSpline.lua`.*
