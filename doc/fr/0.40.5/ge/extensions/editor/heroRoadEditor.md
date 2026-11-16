# `editor_heroRoadEditor`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor.lua` · VM : Game Engine (GE) · 2905 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor` : `extensions.load("editor_heroRoadEditor")`, puis la globale `editor_heroRoadEditor`

Éditeur « Hero Road » : création et édition de routes par splines (groupes de routes avec nœuds, profils, couches, mesh, trottoirs, barrières, éclairages et objets placés, terraformage, peinture, export). Les modules associés sont dans editor/heroRoadEditor/ (groupMgr, layerMgr, profile, mesh, exportMgr, sidewalkMgr, barrierMgr, placeablesUI, import) et editor/toolUtilities/. Il enregistre le mode d'édition « Hero Road » et un menu contextuel du scene tree « Convert to Hero Road » pour importer des DecalRoad sélectionnés. L'état des routes survit à un rechargement Lua via onSerialize/onDeserialized.

## Remarques

- Le displayName du mode d'édition (« Hero Road ») doit être égal à groupMgr.getToolPrefixStr() : splineInput reconnaît le propriétaire d'un nœud en comparant bestHit.toolName à editor.editMode.displayName ; sinon l'outil se réactive à chaque clic.
- Constantes en dur : largeur de spline par défaut 10 m, tolérance de simplification RDP 9.0, décalage d'arête de couche de -5 à 5 m.
- Les setters setSelectedSplineIdx/setSelectedNodeIdx n'ont pas de vérification de borne : ils écrivent directement l'indice.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor.onClientEndMission()` | Hook appelé quand on quitte la carte : supprime tous les groupes de routes et recalcule la table id vers indice. *(interne)* *(hook)* | 2888 |
| `editor_heroRoadEditor.onDeserialized(data)` | Hook de désérialisation après rechargement Lua : recrée les groupes de routes à partir des données et recalcule la table id vers indice. Accepte l'ancien format (tableau de groupes nu). *(interne)* *(hook)* | 270 |
| `editor_heroRoadEditor.onEditorGui()` | Hook appelé chaque frame par l'éditeur : callback principal de l'outil. Gère le masquage pendant les glissements (nœud, passage piéton, poignée de coin, curseur « live »), la reconstruction des groupes modifiés, le rendu des splines et la fenêtre d'outil. *(interne)* *(hook)* | 2618 |
| `editor_heroRoadEditor.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre le mode d'édition « Hero Road », la fenêtre de l'outil, la fenêtre de sélection de matériau et l'entrée de menu « Convert to Hero Road » du scene tree. *(interne)* *(hook)* | 2862 |
| `editor_heroRoadEditor.onSerialize()` | Hook appelé avant un rechargement Lua : sérialise tous les groupes de routes, puis les supprime (removeAllGroups). *(interne)* *(hook)* | 258 |
| `editor_heroRoadEditor.setSelectedNodeIdx(idx)` | Définit l'indice du nœud sélectionné (sélection entre outils). | 233 |
| `editor_heroRoadEditor.setSelectedSplineIdx(idx)` | Définit l'indice de la spline (groupe de route) sélectionnée (sélection entre outils). | 230 |

### Détail des paramètres

#### `editor_heroRoadEditor.onDeserialized(data)`

Hook de désérialisation après rechargement Lua : recrée les groupes de routes à partir des données et recalcule la table id vers indice. Accepte l'ancien format (tableau de groupes nu).

- `data` (*table*) : Table {groups = {...}} renvoyée par onSerialize, ou ancien tableau de groupes

#### `editor_heroRoadEditor.onSerialize()`

Hook appelé avant un rechargement Lua : sérialise tous les groupes de routes, puis les supprime (removeAllGroups).

- **renvoie** : table {groups = <groupes sérialisés>}

#### `editor_heroRoadEditor.setSelectedNodeIdx(idx)`

Définit l'indice du nœud sélectionné (sélection entre outils).

- `idx` (*integer|nil*) : Indice du nœud dans la spline sélectionnée

#### `editor_heroRoadEditor.setSelectedSplineIdx(idx)`

Définit l'indice de la spline (groupe de route) sélectionnée (sélection entre outils).

- `idx` (*integer|nil*) : Indice du groupe dans la liste des groupes

## Appels vers le moteur (C++)

- `be:` `reloadCollision`
- `obj:` `getClassName`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor.lua`.*
