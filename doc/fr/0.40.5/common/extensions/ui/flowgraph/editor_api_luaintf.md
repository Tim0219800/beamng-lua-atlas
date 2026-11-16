# `ui_flowgraph_editor_api_luaintf`

*Fichier : `lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua` · VM : Commun (GE + véhicule) · 314 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/ui/flowgraph/editor_api_luaintf")` (fichier sous extensions/ mais pas une extension classique)

Couche d'interface Lua vers l'éditeur de nœuds C++ (Engine.fge, un éditeur de graphes de type « imgui-node-editor »). Le fichier renvoie une fonction qui reçoit une table M (celle de ui_flowgraph_editor) et y ajoute : constructeurs d'identifiants (NodeIdPtr, LinkIdPtr, PinIdPtr), enums (StyleColor_*, StyleVar_*, PinKind_*, FlowDirection_*, IconType_*, Dirty_*), et wrappers des fonctions fge (éditeur courant, styles, nœuds, pins, liens, sélection, création/suppression, navigation, raccourcis, menus contextuels, conversion écran/canevas). Ce n'est pas une extension chargeable en soi.

## Remarques

- Begin() ajuste l'échelle ImGui : SetWindowFontScale(1/FontGlobalScale) et met im.uiscale[0] à 1 ; End() restaure im.uiscale[0] et remet l'échelle de fonte à 1.
- GetSelectedNodes/GetSelectedLinks sont dépréciés : ils loguent une erreur et remplissent un tableau indexé depuis 0 à partir de GetSelectedNodeIds/GetSelectedLinkIds.
- M.setDebugEnabled est assigné à fge.getDebugEnabled (et non à un setter) : probable bug de copier-coller, setDebugEnabled lit au lieu d'écrire.
- Les valeurs par défaut sont appliquées par les wrappers : Link (couleur blanche, épaisseur 1, isShortcut false), BeginCreate, QueryNewLink2/QueryNewNode2/AcceptNewItem2/RejectNewItem2 (épaisseur 1), AcceptDeletedItem (deleteDependencies true), SelectNode/SelectLink (id 0, append false), NavigateToContent (durée -1), NavigateToSelection (zoomIn false, durée -1).
- M.ctx est initialisé avec fge.GetCurrentEditor() si un éditeur existe ; SetCurrentEditor met aussi à jour M.ctx.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_flowgraph_editor_api_luaintf.AcceptDeletedItem(deleteDependencies)` | Accepte la suppression de l'élément interrogé. (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.Begin(id, size, readOnly)` | Ouvre le canevas de l'éditeur de nœuds (fge.Begin) et neutralise l'échelle d'UI ImGui le temps de l'édition. (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.BeginCreate(color, thickness)` | Démarre la section de création interactive de liens/nœuds. (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.End()` | Ferme le canevas (fge.End) et restaure l'échelle d'UI. (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.Flow(linkId, direction)` | Anime un flux sur un lien. (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.GetSelectedLinks(links, size)` | Déprécié : logue une erreur ; remplit links (indexé depuis 0) avec les ids sélectionnés. (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.GetSelectedNodes(nodes, size)` | Déprécié : logue une erreur ; remplit nodes (indexé depuis 0) avec les ids sélectionnés. (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.Link(id, startPinId, endPinId, color, thickness, isShortcut, shortCutLabel)` | Déclare un lien entre deux pins. (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.LinkIdPtr()` | Crée un objet LinkId initialisé à 0. (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.NavigateToContent(duration)` | Centre la vue sur tout le contenu. (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.NavigateToSelection(zoomIn, duration)` | Centre la vue sur la sélection. (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.NodeIdPtr()` | Crée un objet NodeId initialisé à 0. (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.PinIdPtr()` | Crée un objet PinId initialisé à 0. (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.PopStyleColor(count)` | Dépile des couleurs de style de l'éditeur (1 par défaut). (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.PopStyleVar(count)` | Dépile des variables de style de l'éditeur (1 par défaut). (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.PtrToId(obj)` | Renvoie l'identifiant numérique d'un objet pointeur NodeId/LinkId/PinId (appelle obj:id()). (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.SelectLink(linkId, append)` | Sélectionne un lien (id 0 si nil). (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.SelectNode(nodeId, append)` | Sélectionne un nœud (id 0 si nil). (assignée dynamiquement) | dyn |
| `ui_flowgraph_editor_api_luaintf.SetCurrentEditor(ctx)` | Définit l'éditeur courant (M.ctx et fge.SetCurrentEditor). (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `ui_flowgraph_editor_api_luaintf.AcceptDeletedItem(deleteDependencies)`

Accepte la suppression de l'élément interrogé. (assignée dynamiquement)

- `deleteDependencies` (*boolean|nil*) : Supprime aussi les dépendances, true par défaut.
- **renvoie** : boolean Résultat de fge.AcceptDeletedItem.

#### `ui_flowgraph_editor_api_luaintf.Begin(id, size, readOnly)`

Ouvre le canevas de l'éditeur de nœuds (fge.Begin) et neutralise l'échelle d'UI ImGui le temps de l'édition. (assignée dynamiquement)

- `id` (*string*) : Identifiant ImGui du canevas.
- `size` (*ImVec2|nil*) : Taille, (0,0) par défaut.
- `readOnly` (*boolean|nil*) : Lecture seule, false par défaut.
- **renvoie** : any Résultat de fge.Begin.

#### `ui_flowgraph_editor_api_luaintf.BeginCreate(color, thickness)`

Démarre la section de création interactive de liens/nœuds. (assignée dynamiquement)

- `color` (*ImVec4|nil*) : Couleur, blanc par défaut.
- `thickness` (*number|nil*) : Épaisseur, 1.0 par défaut.
- **renvoie** : boolean Résultat de fge.BeginCreate.

#### `ui_flowgraph_editor_api_luaintf.End()`

Ferme le canevas (fge.End) et restaure l'échelle d'UI. (assignée dynamiquement)

- **renvoie** : any Résultat de fge.End.

#### `ui_flowgraph_editor_api_luaintf.Flow(linkId, direction)`

Anime un flux sur un lien. (assignée dynamiquement)

- `linkId` (*any*) : Id du lien.
- `direction` (*integer|nil*) : FlowDirection_Forward par défaut.

#### `ui_flowgraph_editor_api_luaintf.GetSelectedLinks(links, size)`

Déprécié : logue une erreur ; remplit links (indexé depuis 0) avec les ids sélectionnés. (assignée dynamiquement)

- `links` (*table*) : Tableau rempli.
- `size` (*integer*) : Non utilisé.
- **renvoie** : integer Nombre de liens.

#### `ui_flowgraph_editor_api_luaintf.GetSelectedNodes(nodes, size)`

Déprécié : logue une erreur ; remplit nodes (indexé depuis 0) avec les ids sélectionnés. (assignée dynamiquement)

- `nodes` (*table*) : Tableau rempli.
- `size` (*integer*) : Non utilisé.
- **renvoie** : integer Nombre de nœuds.

#### `ui_flowgraph_editor_api_luaintf.Link(id, startPinId, endPinId, color, thickness, isShortcut, shortCutLabel)`

Déclare un lien entre deux pins. (assignée dynamiquement)

- `id` (*any*) : Id du lien.
- `startPinId` (*any*) : Pin de départ.
- `endPinId` (*any*) : Pin d'arrivée.
- `color` (*ImVec4|nil*) : Couleur, blanc par défaut.
- `thickness` (*number|nil*) : Épaisseur, 1.0 par défaut.
- `isShortcut` (*boolean|nil*) : Lien raccourci, false par défaut.
- `shortCutLabel` (*string|nil*) : Libellé du raccourci.
- **renvoie** : any Résultat de fge.Link.

#### `ui_flowgraph_editor_api_luaintf.LinkIdPtr()`

Crée un objet LinkId initialisé à 0. (assignée dynamiquement)

- **renvoie** : userdata LinkId.

#### `ui_flowgraph_editor_api_luaintf.NavigateToContent(duration)`

Centre la vue sur tout le contenu. (assignée dynamiquement)

- `duration` (*number|nil*) : Durée de l'animation, -1.0 par défaut.

#### `ui_flowgraph_editor_api_luaintf.NavigateToSelection(zoomIn, duration)`

Centre la vue sur la sélection. (assignée dynamiquement)

- `zoomIn` (*boolean|nil*) : Zoome, false par défaut.
- `duration` (*number|nil*) : Durée, -1.0 par défaut.

#### `ui_flowgraph_editor_api_luaintf.NodeIdPtr()`

Crée un objet NodeId initialisé à 0. (assignée dynamiquement)

- **renvoie** : userdata NodeId.

#### `ui_flowgraph_editor_api_luaintf.PinIdPtr()`

Crée un objet PinId initialisé à 0. (assignée dynamiquement)

- **renvoie** : userdata PinId.

#### `ui_flowgraph_editor_api_luaintf.PopStyleColor(count)`

Dépile des couleurs de style de l'éditeur (1 par défaut). (assignée dynamiquement)

- `count` (*integer|nil*) : Nombre à dépiler, 1 si nil.

#### `ui_flowgraph_editor_api_luaintf.PopStyleVar(count)`

Dépile des variables de style de l'éditeur (1 par défaut). (assignée dynamiquement)

- `count` (*integer|nil*) : Nombre à dépiler, 1 si nil.

#### `ui_flowgraph_editor_api_luaintf.PtrToId(obj)`

Renvoie l'identifiant numérique d'un objet pointeur NodeId/LinkId/PinId (appelle obj:id()). (assignée dynamiquement)

- `obj` (*userdata*) : Objet NodeId, LinkId ou PinId.
- **renvoie** : integer Identifiant.

#### `ui_flowgraph_editor_api_luaintf.SelectLink(linkId, append)`

Sélectionne un lien (id 0 si nil). (assignée dynamiquement)

- `linkId` (*any|nil*) : Id du lien.
- `append` (*boolean|nil*) : Ajoute à la sélection, false par défaut.

#### `ui_flowgraph_editor_api_luaintf.SelectNode(nodeId, append)`

Sélectionne un nœud (id 0 si nil). (assignée dynamiquement)

- `nodeId` (*any|nil*) : Id du nœud.
- `append` (*boolean|nil*) : Ajoute à la sélection, false par défaut.

#### `ui_flowgraph_editor_api_luaintf.SetCurrentEditor(ctx)`

Définit l'éditeur courant (M.ctx et fge.SetCurrentEditor). (assignée dynamiquement)

- `ctx` (*userdata*) : Contexte d'éditeur créé par CreateEditor.

## Appels vers le moteur (C++)

- `obj:` `id`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua`.*
