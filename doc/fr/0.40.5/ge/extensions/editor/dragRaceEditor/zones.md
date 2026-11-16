# `editor_dragRaceEditor_zones`

*Fichier : `lua/ge/extensions/editor/dragRaceEditor/zones.lua` · VM : Game Engine (GE) · 342 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dragRaceEditor_zones` : `extensions.load("editor_dragRaceEditor_zones")`, puis la globale `editor_dragRaceEditor_zones`

Éditeur de zones du drag race (zone d'un strip ou zone d'une voie), sur le même principe que les frontières du crawl editor. Il s'appuie sur la classe gameplay/sites/zone : sélection de sommets à la souris, ajout/insertion de sommets, déplacement et rotation avec le gizmo d'axes de l'éditeur, accrochage optionnel au terrain, undo/redo via editor.history. init() renvoie une instance d'éditeur ; zoneFromData/zoneToData convertissent entre table sérialisée et objet Zone.

## Exemple

```lua
local zones = require('/lua/ge/extensions/editor/dragRaceEditor/zones')
local ed = zones.init()
ed:setZone(zones.zoneFromData(strip.stripZone), {type='stripZone', strip=strip})
-- chaque frame : ed:draw(mouseInfo)
ed:syncBack()
```

## Remarques

- Raccourcis : Maj+clic ajoute un sommet (le premier clic ajoute un sommet si la zone est vide), Alt+clic insère au milieu d'une arête, Ctrl+clic ajoute un sommet à la sélection.
- La cible (target) est {type='stripZone', strip=…} ou {type='laneZone', strip=…, lane=…} ; syncBack écrit la zone sérialisée dans strip.stripZone ou lane.zone et marque le strip _dirty.
- Dans dragging(), le décalage du gizmo est divisé par 2 (posOffset = delta/2) : comportement tel quel dans le code, à vérifier si les sommets semblent suivre le gizmo à moitié vitesse.
- snapToTerrain est actif par défaut (hauteur via core_terrain.getTerrainHeight).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dragRaceEditor_zones.init()` | Crée et renvoie une instance d'éditeur de zone (classe C) initialisée. | 334 |

### Détail des paramètres

#### `editor_dragRaceEditor_zones.init()`

Crée et renvoie une instance d'éditeur de zone (classe C) initialisée.

- **renvoie** : table instance avec les méthodes setZone, clearZone, syncBack, draw…

## Champs

| Champ | Type | Description |
|---|---|---|
| `zoneFromData` | function | Alias de C.zoneFromData. |
| `zoneToData` | function | Alias de C.zoneToData. |

## Classe `C`

Éditeur de zone renvoyé par init(). Champs : zone, target, currentVertices (sommets sélectionnés), currentPlane, snapToTerrain.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` | Début de déplacement du gizmo : mémorise les positions de départ. | 226 |
| `C:clearZone()` | Oublie la zone et la cible courantes. | 75 |
| `C:dragging()` | Pendant le déplacement du gizmo : translate (avec accrochage terrain) ou fait pivoter les sommets sélectionnés autour de leur centroïde. | 237 |
| `C:draw(mouseInfo)` | À appeler chaque frame en mode édition de zone : met à jour/affiche le gizmo, traite la saisie et dessine la zone en debug. | 318 |
| `C:dropToTerrain(pos)` | Projette une position sur la hauteur du terrain (core_terrain.getTerrainHeight). | 129 |
| `C:endDragging()` | Fin du déplacement : recale au terrain si activé et enregistre l'action d'historique « Manipulate Zone Vertices ». | 295 |
| `C:findVert(mouseInfo, objects)` | Cherche parmi des objets {pos, index} celui touché par le rayon souris (rayon de sélection = distance caméra/40) le plus proche de la caméra ; dessine aussi les sphères (orange si déjà sélectionné). | 99 |
| `C:init()` | Initialise les champs (aucune zone, snapToTerrain=true). | 57 |
| `C:input(mouseInfo)` | Gère la saisie souris : ajout de sommet (Maj ou zone vide), insertion (Alt), sinon sélection simple ou multiple (Ctrl) de sommets. | 157 |
| `C:setZone(zoneInstance, target)` | Définit la zone éditée et sa cible ; réinitialise la sélection de sommets. | 68 |
| `C:syncBack()` | Réécrit la zone dans strip.stripZone ou lane.zone, marque le strip _dirty et signale des modifications non sauvées. Sans effet si pas de zone ou de cible. | 83 |
| `C:tryInsert(mouseInfo)` | Cherche le milieu d'arête survolé ; au clic, insère un sommet à cet endroit (action d'historique « Insert Zone Vertex »). Demande au moins 2 sommets. | 138 |
| `C:updateTransform()` | Place le gizmo d'axes au centroïde des sommets sélectionnés (ou au point du plan courant). | 201 |
| `C.zoneFromData(data)` | Fonction statique : construit une Zone depuis une table sérialisée (copie profonde ; vertices et customFields par défaut vides, donc zone vide autorisée). | 41 |
| `C.zoneToData(zone)` | Fonction statique : sérialise une Zone via zone:onSerialize(). | 52 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dragRaceEditor/zones.lua`.*
