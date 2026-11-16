# `editor_toolUtilities_rdp`

*Fichier : `lua/ge/extensions/editor/toolUtilities/rdp.lua` · VM : Game Engine (GE) · 197 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_rdp` : `extensions.load("editor_toolUtilities_rdp")`, puis la globale `editor_toolUtilities_rdp`

Implémentation optimisée de l'algorithme de Ramer-Douglas-Peucker (RDP) pour simplifier des polylignes ayant trop de points. Utilise la distance au segment (et non à la droite infinie), une pile explicite à la place de la récursion et des tables réutilisées. Les variantes simplifyNodes* compactent les tableaux en place, y compris les tableaux parallèles (largeurs, normales, vitesses, limites de vitesse).

## Exemple

```lua
local rdp = extensions.editor_toolUtilities_rdp
local n = rdp.simplifyNodes(nodes, 2.0) -- nodes : liste de vec3, modifiée en place
-- n = nombre de points conservés
```

## Remarques

- Les nœuds doivent être des vec3 (ou objets ayant la méthode squaredDistanceToLineSegment).
- Le premier et le dernier point sont toujours conservés.
- Tolérance par défaut 6.0 (unités du monde, mètres) quand tol vaut nil.
- Avec 2 points ou moins, les fonctions simplify* renvoient #nodes sans rien modifier.
- Les tables d'indices et la pile sont partagées au niveau du module : non réentrant, et la table renvoyée par rdpIndices est écrasée si on ne passe pas retListP.
- Les tableaux parallèles (widths, normals…) doivent avoir au moins la longueur de nodes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_rdp.rdpIndices(nodes, startIdx, endIdx, tol, retListP)` | Calcule les indices à conserver par RDP entre startIdx et endIdx. La table de sortie est vidée puis remplie ; l'ordre n'est pas strictement croissant selon la pile mais le premier indice est startIdx. | 24 |
| `editor_toolUtilities_rdp.simplifyNodes(nodes, tol)` | Simplifie nodes en place et supprime les points en trop. | 69 |
| `editor_toolUtilities_rdp.simplifyNodesVels(nodes, velocities, tol)` | Comme simplifyNodes, en gardant velocities aligné avec nodes. | 140 |
| `editor_toolUtilities_rdp.simplifyNodesWidths(nodes, widths, tol)` | Comme simplifyNodes, en gardant le tableau widths aligné avec nodes. | 92 |
| `editor_toolUtilities_rdp.simplifyNodesWidthsNormals(nodes, widths, normals, tol)` | Comme simplifyNodes, en gardant widths et normals alignés avec nodes. | 116 |
| `editor_toolUtilities_rdp.simplifyNodesWidthsVelVelLimits(nodes, widths, velocities, velLimits, tol)` | Comme simplifyNodes, en gardant widths, velocities et velLimits alignés avec nodes. | 164 |

### Détail des paramètres

#### `editor_toolUtilities_rdp.rdpIndices(nodes, startIdx, endIdx, tol, retListP)`

Calcule les indices à conserver par RDP entre startIdx et endIdx. La table de sortie est vidée puis remplie ; l'ordre n'est pas strictement croissant selon la pile mais le premier indice est startIdx.

- `nodes` (*table*) : Liste de vec3.
- `startIdx` (*integer*) : Indice de départ (1 pour tout le tracé).
- `endIdx` (*integer*) : Indice de fin.
- `tol` (*number*) : Distance maximale tolérée au segment.
- `retListP` (*table|nil*) : Table de sortie réutilisable ; créée si nil.
- **renvoie** : table Liste des indices conservés.

#### `editor_toolUtilities_rdp.simplifyNodes(nodes, tol)`

Simplifie nodes en place et supprime les points en trop.

- `nodes` (*table*) : Liste de vec3, modifiée.
- `tol` (*number|nil*) : Tolérance (défaut 6.0).
- **renvoie** : integer Nombre de points restants.

#### `editor_toolUtilities_rdp.simplifyNodesVels(nodes, velocities, tol)`

Comme simplifyNodes, en gardant velocities aligné avec nodes.

- `nodes` (*table*) : Points.
- `velocities` (*table*) : Vitesses associées.
- `tol` (*number|nil*) : Tolérance (défaut 6.0).
- **renvoie** : integer Nombre de points restants.

#### `editor_toolUtilities_rdp.simplifyNodesWidths(nodes, widths, tol)`

Comme simplifyNodes, en gardant le tableau widths aligné avec nodes.

- `nodes` (*table*) : Points, modifiés en place.
- `widths` (*table*) : Largeurs associées, modifiées en place.
- `tol` (*number|nil*) : Tolérance (défaut 6.0).
- **renvoie** : integer Nombre de points restants.

#### `editor_toolUtilities_rdp.simplifyNodesWidthsNormals(nodes, widths, normals, tol)`

Comme simplifyNodes, en gardant widths et normals alignés avec nodes.

- `nodes` (*table*) : Points.
- `widths` (*table*) : Largeurs.
- `normals` (*table*) : Normales.
- `tol` (*number|nil*) : Tolérance (défaut 6.0).
- **renvoie** : integer Nombre de points restants.

#### `editor_toolUtilities_rdp.simplifyNodesWidthsVelVelLimits(nodes, widths, velocities, velLimits, tol)`

Comme simplifyNodes, en gardant widths, velocities et velLimits alignés avec nodes.

- `nodes` (*table*) : Points.
- `widths` (*table*) : Largeurs.
- `velocities` (*table*) : Vitesses.
- `velLimits` (*table*) : Limites de vitesse.
- `tol` (*number|nil*) : Tolérance (défaut 6.0).
- **renvoie** : integer Nombre de points restants.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/rdp.lua`.*
