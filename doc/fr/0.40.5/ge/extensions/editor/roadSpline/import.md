# `editor_roadSpline_import`

*Fichier : `lua/ge/extensions/editor/roadSpline/import.lua` · VM : Game Engine (GE) · 451 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadSpline_import` : `extensions.load("editor_roadSpline_import")`, puis la globale `editor_roadSpline_import`

Import de DecalRoads existants dans l'outil Road Spline. Estime une ligne centrale de référence (nœuds, largeurs, normales) à partir des routes choisies en cherchant leurs bords (recherche exponentielle puis dichotomie, jusqu'à 50 m latéralement), simplifie par RDP, crée un nouveau groupe Road Spline « Import N » et recrée les routes d'origine sous forme de couches relatives à cette ligne. Les DecalRoads source sont ensuite supprimés (undo possible).

## Remarques

- BUG : importSelectedIntoNewGroup appelle groupMgr.getSplineMap(), qui n'existe pas dans groupMgr (la fonction s'appelle getIdToIdxMap). L'appel plante donc avec une erreur « attempt to call a nil value » après la création du groupe ; l'import via menu contextuel ou polygone ne peut pas aboutir en l'état (même appel aux lignes 116 et 138 pour les fonctions d'annulation).
- Toutes les couches importées sont créées avec les couches automatiques désactivées (marques de pneus, lignes, fondus, etc.).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadSpline_import.importFromPolygon(polygon)` | Importe tous les DecalRoads dont au moins un nœud se trouve dans le polygone, puis appelle importSelectedIntoNewGroup avec eux. | 425 |
| `editor_roadSpline_import.importSelectedIntoNewGroup(decalRoads)` | Convertit les DecalRoads donnés en un nouveau groupe Road Spline : calcule la spline de référence, crée le groupe, génère les couches, supprime les DecalRoads (et leurs groupes de scène devenus vides) et enregistre une action d'annulation. Retourne sans rien faire si la liste est vide. | 351 |

### Détail des paramètres

#### `editor_roadSpline_import.importFromPolygon(polygon)`

Importe tous les DecalRoads dont au moins un nœud se trouve dans le polygone, puis appelle importSelectedIntoNewGroup avec eux.

- `polygon` (*table*) : Polygone de sélection (liste de points) tracé par l'utilisateur.

#### `editor_roadSpline_import.importSelectedIntoNewGroup(decalRoads)`

Convertit les DecalRoads donnés en un nouveau groupe Road Spline : calcule la spline de référence, crée le groupe, génère les couches, supprime les DecalRoads (et leurs groupes de scène devenus vides) et enregistre une action d'annulation. Retourne sans rien faire si la liste est vide.

- `decalRoads` (*table*) : Liste d'objets DecalRoad (scenetree), par ex. la sélection de l'éditeur.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `Sim.` `getUniqueName`, `upcast`
- `obj:` `delete`, `getID`, `registerObject`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadSpline/import.lua`.*
