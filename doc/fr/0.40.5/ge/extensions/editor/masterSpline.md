# `editor_masterSpline`

*Fichier : `lua/ge/extensions/editor/masterSpline.lua` · VM : Game Engine (GE) · 1954 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_masterSpline` : `extensions.load("editor_masterSpline")`, puis la globale `editor_masterSpline`

Outil Master Spline de l'éditeur de monde (mode d'édition « masterSpline »). Une Master Spline est une courbe maîtresse (nœuds, largeurs, normales) qui pilote une pile de couches, chacune liée à une spline enfant d'un autre outil (mesh, assembly, decal, road, tree) décalée latéralement. Le fichier contient surtout l'interface imgui (fenêtre « masterSpline », poignées de virage, gizmo, terraformage, route automatique, homologation, session) ; les données sont dans masterSpline/splineMgr.lua. Elle sert aux créateurs de niveaux, pas aux véhicules.

## Remarques

- L'API publique est réduite : deux setters de sélection et les hooks de sérialisation/éditeur ; presque tout le reste est local au fichier.
- onEditorGui reconstruit les Master Splines dirty à chaque image même si l'outil n'est pas actif (il dessine alors seulement les contours via rSpline.renderShells).
- onSerialize est destructif : après avoir sérialisé, il délie toutes les splines, supprime toutes les Master Splines puis appelle be:reloadCollision() (la collision est cuite dans la scène). Les données doivent donc être rechargées par onDeserialized.
- Valeurs par défaut de la route automatique : baseWidth 10, slopeAvoidance 1, bankingStrength 0.35, widthBlend 0.5. Curseur de position latérale entre -5 et 5, DOI entre 0 et 500.
- Le fichier s'enregistre auprès de splineInput.registerSplineTool et déclare une spec de session (Save/Load Session) groupant masters et enfants liés.

**Dépendances (chargées avant) :** `editor_assemblySpline`, `editor_decalSpline`, `editor_meshSpline`, `editor_roadSpline`, `editor_treeSpline`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_masterSpline.onClientEndMission()` | Hook appelé en quittant la carte : délie et supprime toutes les Master Splines et recalcule la table id vers indice. *(interne)* *(hook)* | 1922 |
| `editor_masterSpline.onDeserialized(data)` | Hook de désérialisation : supprime les Master Splines existantes, recrée celles de data, puis recalcule la table id vers indice. *(interne)* *(hook)* | 203 |
| `editor_masterSpline.onEditorGui()` | Hook appelé à chaque image de l'éditeur : optimisation en direct de la spline sélectionnée, reconstruction des splines dirty, puis, si l'outil est actif, fenêtre, caméra panoramique, poignées de virage engineered, événements souris/clavier, terraformage et dessin. *(interne)* *(hook)* | 1788 |
| `editor_masterSpline.onEditorInitialized()` | Hook d'initialisation de l'éditeur : enregistre le mode d'édition « Master Spline » (editor.editModes.masterSpline) et la fenêtre « masterSpline ». *(interne)* *(hook)* | 1908 |
| `editor_masterSpline.onSerialize()` | Hook de sérialisation de l'éditeur : sérialise toutes les Master Splines, délie leurs enfants, supprime les Master Splines et recharge la collision. *(interne)* *(hook)* | 183 |
| `editor_masterSpline.setSelectedNodeIdx(idx)` | Définit l'indice du nœud sélectionné (sélection croisée entre outils). | 145 |
| `editor_masterSpline.setSelectedSplineIdx(idx)` | Définit l'indice de la Master Spline sélectionnée (sélection croisée entre outils). | 142 |

### Détail des paramètres

#### `editor_masterSpline.onDeserialized(data)`

Hook de désérialisation : supprime les Master Splines existantes, recrée celles de data, puis recalcule la table id vers indice.

- `data` (*table[]*) : Données produites par onSerialize.

#### `editor_masterSpline.onSerialize()`

Hook de sérialisation de l'éditeur : sérialise toutes les Master Splines, délie leurs enfants, supprime les Master Splines et recharge la collision.

- **renvoie** : table[] Tableau des Master Splines sérialisées.

#### `editor_masterSpline.setSelectedNodeIdx(idx)`

Définit l'indice du nœud sélectionné (sélection croisée entre outils).

- `idx` (*integer*) : Indice du nœud (à partir de 1).

#### `editor_masterSpline.setSelectedSplineIdx(idx)`

Définit l'indice de la Master Spline sélectionnée (sélection croisée entre outils).

- `idx` (*integer*) : Indice dans la liste (à partir de 1).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant celle-ci pour garantir l'ordre de sérialisation : editor_assemblySpline, editor_decalSpline, editor_meshSpline, editor_roadSpline, editor_treeSpline. |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/masterSpline.lua`.*
