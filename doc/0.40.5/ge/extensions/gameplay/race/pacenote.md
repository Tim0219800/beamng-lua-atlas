# `gameplay_race_pacenote`

*Fichier : `lua/ge/extensions/gameplay/race/pacenote.lua` · VM : Game Engine (GE) · 168 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/race/pacenote")` (fichier sous extensions/ mais pas une extension classique)

Classe d'une annonce de copilote (pacenote) d'un chemin de course : une sphère positionnée (manuellement ou sur un nœud du navgraph) avec une normale, un texte note et l'id d'un segment associé. Le module renvoie une fabrique : require('/lua/ge/extensions/gameplay/race/pacenote')(path, name, forceId). Elle sert à l'éditeur de course et à la sérialisation des chemins.

## Remarques

- setNormal : quand normal est nil, la valeur par défaut vec3(0,1,0) est posée mais la fonction continue et appelle normal:length() sur nil : erreur Lua (pas de return).
- setNavgraph utilise self.navRadiusScale et inside lit self.hasNormal, deux champs jamais initialisés dans init (contrairement à pathnode) : setNavgraph échoue sur un nœud existant, inside ne teste que la sphère.
- intersectCorners ne tient pas compte de hasNormal : il utilise toujours le plan de la normale.
- Modes possibles : 'manual' ou 'navgraph' (liste modes locale).
- onSerialize n'enregistre pas le mode : la désérialisation recrée toujours la note en mode manuel.

## Classe `C`

Annonce de copilote. Champs : path, id, name, pos (vec3), normal (vec3, défaut (0,1,0)), radius, note (texte), segment (id, -1 si aucun), sortOrder (999999 par défaut), mode, navgraphName.

Le module renvoie un constructeur : `local obj = require("gameplay_race_pacenote")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawDebug(drawMode, clr, extraText)` | Dessine la sphère, le texte (note, ou « (nom) » si vide) et les flèches de la normale avec debugDrawer. | 116 |
| `C:init(path, name, forceId)` | Constructeur : attribue l'id (forceId ou path:getNextUniqueIdentifier()), le nom par défaut « Pacenote <id> », la position nulle, la note vide et le segment -1. | 8 |
| `C:inside(pos)` | Indique si un point est dans la sphère de l'annonce (et du bon côté de la normale si hasNormal). | 59 |
| `C:intersectCorners(fromCorners, toCorners)` | Teste si un des segments reliant les coins d'un véhicule (fromCorners[i] vers toCorners[i]) traverse le plan de l'annonce à l'intérieur de la sphère. | 69 |
| `C:onDeserialized(data, oldIdMap)` | Restaure l'annonce (mode manuel) à partir de données sérialisées ; convertit l'id de segment avec oldIdMap. | 108 |
| `C:onSerialize()` | Sérialise l'annonce : name, pos, radius, normal, oldId, note, segment. | 95 |
| `C:setManual(pos, radius, normal)` | Passe en mode manuel avec position, rayon et normale données (oublie le nom de nœud navgraph). | 34 |
| `C:setNavgraph(navgraphName, fallback)` | Passe en mode navgraph : prend position et rayon d'un nœud de la carte routière, ou de fallback si le nœud n'existe pas. | 42 |
| `C:setNormal(normal)` | Définit la normale de l'annonce si sa longueur dépasse 0,9 (elle est alors normalisée). | 25 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/race/pacenote.lua`.*
