# `editor_terraform_fetchSources`

*Fichier : `lua/ge/extensions/editor/terraform/fetchSources.lua` · VM : Game Engine (GE) · 310 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_terraform_fetchSources` : `extensions.load("editor_terraform_fetchSources")`, puis la globale `editor_terraform_fetchSources`

Récupère les 'sources' que l'outil Terraform sait suivre : routes MeshRoad de la scène, routes RAT (Road Architect), splines mesh, splines d'assemblage et Master Splines. Chaque source est une liste de points {pos = vec3, width = largeur, binormal = vec3 unitaire latéral}. Quand une route entre et sort du polygone, elle est découpée et seules les parties intérieures sont renvoyées comme sources séparées. Les splines sont lissées par Catmull-Rom (centripète pour les splines mesh/assemblage) avec 10 points par segment. Consommé par editor_terraformTool et editor/terraform/terraform.

## Remarques

- Les splines mesh et d'assemblage reçoivent une largeur fixe de 3.0 m (defaultWidthForMeshSplines) ; les MeshRoad utilisent leurs largeurs réelles.
- getAllSourcesInSelection ne gère que les objets de classe MeshRoad de editor.selection.object ; RAT roads et splines ne sont pas traitées en sélection.
- Seules les parties qui ont au moins 2 points dans le polygone sont gardées (eIdx > sIdx).
- Les MeshRoad sont d'abord filtrées par boîte englobante XY (monde) contre celle du polygone.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_terraform_fetchSources.getAllSourcesInPolygon(polygon)` | Renvoie toutes les sources supportées dans le polygone (MeshRoad, routes RAT, splines mesh, splines d'assemblage, Master Splines). Une route qui traverse le bord est découpée ; seules ses parties intérieures sont gardées, comme sources séparées. | 245 |
| `editor_terraform_fetchSources.getAllSourcesInSelection()` | Renvoie les sources construites à partir des objets MeshRoad actuellement sélectionnés dans l'éditeur (editor.selection.object). | 287 |

### Détail des paramètres

#### `editor_terraform_fetchSources.getAllSourcesInPolygon(polygon)`

Renvoie toutes les sources supportées dans le polygone (MeshRoad, routes RAT, splines mesh, splines d'assemblage, Master Splines). Une route qui traverse le bord est découpée ; seules ses parties intérieures sont gardées, comme sources séparées.

- `polygon` (*table*) : Liste de points 2D/3D du polygone (déduit du code : passée à geom.getAABB et geom.getNodeSpansInsidePolygon).
- **renvoie** : table Liste de sources ; chaque source est une liste de {pos, width, binormal}.

#### `editor_terraform_fetchSources.getAllSourcesInSelection()`

Renvoie les sources construites à partir des objets MeshRoad actuellement sélectionnés dans l'éditeur (editor.selection.object).

- **renvoie** : table Liste de sources (une par MeshRoad sélectionnée).

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/terraform/fetchSources.lua`.*
