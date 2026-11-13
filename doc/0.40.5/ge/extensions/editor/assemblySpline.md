# `editor_assemblySpline`

*Fichier : `lua/ge/extensions/editor/assemblySpline.lua` · VM : Game Engine (GE) · 1787 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assemblySpline` : `extensions.load("editor_assemblySpline")`, puis la globale `editor_assemblySpline`

Outil « Assembly Spline » de l'éditeur du monde : on trace une spline et l'outil y place automatiquement des meshes TSStatic issus d'un « kit d'assemblage » (dossier assets/meshes/props/assembly_kit/), par ex. des barrières ou des rails dont les éléments se raccordent par des ancres 'nail.*'. Il s'enregistre comme mode d'édition (icône gyroscope), possède une fenêtre ImGui 'assemblySpline', gère la sérialisation des splines dans la session de l'éditeur, l'import depuis des TSStatic existants (menu clic droit de l'arbre de scène « Convert to Assembly Spline » ou polygone de sélection), le verrouillage/cuisson (bake) et le terraformage. La logique est répartie entre splineMgr, molecule, populate, distribution et import.

## Remarques

- Constantes en tête de fichier : kitSearchPath, simplifyRdpTol = 9.0, defaultSplineWidth = 10 m, bornes des curseurs (espacement 0..100, décalage vertical -100..100, affaissement 0..100, graine aléatoire max 1000).
- Même quand l'outil n'est pas actif, onEditorGui met à jour les splines sales (pour les splines liées) et dessine leurs coques.
- onClientEndMission supprime toutes les splines (même désactivées) pour éviter des pointeurs TSStatic invalides après rechargement.
- Une spline verrouillée (isEnabled = false) garde ses meshes dans la scène : onSerialize les libère (pop.release) et onDeserialized les réadopte (pop.adopt).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assemblySpline.eachObjectById(id, fn)` | Appelle fn sur chaque objet scène de la spline d'id donné (délègue à pop.eachObject). Rien si la spline n'existe plus. | 109 |
| `editor_assemblySpline.onClientEndMission()` | Hook appelé en quittant la carte : supprime toutes les assembly splines. *(interne)* *(hook)* | 1768 |
| `editor_assemblySpline.onDeserialized(data)` | Hook appelé après rechargement avec les données de onSerialize : recrée les splines, réadopte les objets conservés, reconstruit la table id->index, les kits de meshes et les molécules. *(interne)* *(hook)* | 161 |
| `editor_assemblySpline.onEditorGui()` | Hook appelé chaque frame par l'éditeur : gère les mises à jour différées d'import, met à jour les splines sales, affiche la fenêtre de l'outil, le dessin de polygone de sélection, les entrées souris/clavier sur les nœuds et le rendu debugDraw des splines. *(interne)* *(hook)* | 1646 |
| `editor_assemblySpline.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : crée le mode d'édition assemblySplineEditMode, enregistre la fenêtre et ajoute l'entrée de menu « Convert to Assembly Spline » à l'arbre de scène (valide si au moins 2 TSStatic compatibles sont sélectionnés). *(interne)* *(hook)* | 1748 |
| `editor_assemblySpline.onSerialize()` | Hook de sérialisation d'extension (avant rechargement Lua) : sérialise toutes les splines puis les supprime de la scène. *(interne)* *(hook)* | 142 |
| `editor_assemblySpline.setLockedById(id, isLocked)` | Verrouille ou déverrouille la assembly spline d'id donné et la reconstruit immédiatement (utilisé aussi par la Master Spline pour ses enfants liés, et par la cuisson). Verrouiller force d'abord la mise à jour d'une spline sale. Ne fait rien si l'id est introuvable. | 99 |
| `editor_assemblySpline.setSelectedNodeIdx(idx)` | Définit l'index du nœud sélectionné (sélection partagée entre outils). | 139 |
| `editor_assemblySpline.setSelectedSplineIdx(idx)` | Définit l'index de la spline sélectionnée (sélection partagée entre outils). | 136 |

### Détail des paramètres

#### `editor_assemblySpline.eachObjectById(id, fn)`

Appelle fn sur chaque objet scène de la spline d'id donné (délègue à pop.eachObject). Rien si la spline n'existe plus.

- `id` (*integer*) : Id de la spline.
- `fn` (*function*) : Callback appliqué à chaque objet.

#### `editor_assemblySpline.onDeserialized(data)`

Hook appelé après rechargement avec les données de onSerialize : recrée les splines, réadopte les objets conservés, reconstruit la table id->index, les kits de meshes et les molécules.

- `data` (*table|nil*) : Splines sérialisées.

#### `editor_assemblySpline.onSerialize()`

Hook de sérialisation d'extension (avant rechargement Lua) : sérialise toutes les splines puis les supprime de la scène.

- **renvoie** : table Tableau de splines sérialisées.

#### `editor_assemblySpline.setLockedById(id, isLocked)`

Verrouille ou déverrouille la assembly spline d'id donné et la reconstruit immédiatement (utilisé aussi par la Master Spline pour ses enfants liés, et par la cuisson). Verrouiller force d'abord la mise à jour d'une spline sale. Ne fait rien si l'id est introuvable.

- `id` (*integer*) : Id de la spline.
- `isLocked` (*boolean*) : true pour verrouiller (isEnabled = false).

#### `editor_assemblySpline.setSelectedNodeIdx(idx)`

Définit l'index du nœud sélectionné (sélection partagée entre outils).

- `idx` (*integer*) : Index (à partir de 1).

#### `editor_assemblySpline.setSelectedSplineIdx(idx)`

Définit l'index de la spline sélectionnée (sélection partagée entre outils).

- `idx` (*integer*) : Index (à partir de 1).

## Appels vers le moteur (C++)

- `obj:` `getClassName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assemblySpline.lua`.*
