# `util_autoAnnotation`

*Fichier : `lua/ge/extensions/util/autoAnnotation.lua` · VM : Game Engine (GE) · 143 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_autoAnnotation` : `extensions.load("util_autoAnnotation")`, puis la globale `util_autoAnnotation`

Outil d'éditeur de niveau : parcourt récursivement l'arbre de scène (MissionGroup) et le jeu de données des objets de forêt (ForestItemDataSet) pour poser automatiquement un champ d'annotation (catégorie sémantique, mode 'Override') sur les objets qui n'en ont pas. Les catégories sont devinées d'après le nom du fichier de forme (TSStatic, ForestItemData) ou le nom du GroundCover.

## Exemple

```lua
util_autoAnnotation.autoAnnotateLevel()
```

## Remarques

- Correspondances de formes (recherche par sous-chaîne, insensible à la casse) : building, fence, fencing, busstop -> BUILDINGS ; tree -> NATURE ; sidewalk -> SIDEWALK ; sign -> TRAFFIC_SIGNS ; tunnel -> STREET ; road -> ASPHALT ; excavator -> CAR. Sans correspondance : OBSTACLES (avertissement loggé).
- GroundCover : grass et shrubs -> NATURE ; par défaut NATURE (avertissement loggé).
- Seuls les objets dont le champ annotation est vide sont modifiés. Les SFXSpace, SFXEmitter, PointLight et SpotLight sont ignorés.
- Les objets modifiés reçoivent setField('annotation', ...), setField('mode', 'Override') puis postApply() : le niveau doit ensuite être sauvegardé par l'éditeur.
- autoAnnotateGroups ne vérifie pas que ForestItemDataSet existe : visitNode planterait si l'objet est absent.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_autoAnnotation.autoAnnotateGroups()` | Annote les données d'objets de forêt (ForestItemDataSet). | 132 |
| `util_autoAnnotation.autoAnnotateLevel()` | Annote le niveau entier : arbre de scène puis jeu de données de forêt. | 137 |
| `util_autoAnnotation.autoAnnotateScenetree()` | Annote tout l'arbre de scène à partir de MissionGroup. Logue une erreur et s'arrête si MissionGroup est introuvable. | 121 |
| `util_autoAnnotation.onInit()` | Hook d'initialisation sans effet (corps vide). *(interne)* *(hook)* | 118 |

## Classe `visitors`

Table interne de visiteurs 'visit<Classe>' appelés selon la classe de chaque nœud. Les visiteurs de TSStatic et ForestItemData posent l'annotation d'après shapeName ; ceux de SFXSpace, SFXEmitter, PointLight, SpotLight ne font rien.

| Méthode | Description | Ligne |
|---|---|---|
| `visitors.visitForest(parent, node)` | Visite chaque élément d'une forêt (Forest) et annote les données de ses items. | 94 |
| `visitors.visitGroundCover(parent, node)` | Annote un GroundCover sans annotation d'après son nom (NATURE par défaut). | 102 |

## Appels vers le moteur (C++)

- `Sim.` `findObject`, `upcast`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/autoAnnotation.lua`.*
