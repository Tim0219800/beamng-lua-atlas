# `gameplay_freeformDelivery_markers`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/markers.lua` · VM : Game Engine (GE) · 444 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_markers` : `extensions.load("gameplay_freeformDelivery_markers")`, puis la globale `gameplay_freeformDelivery_markers`

Sous-module du mode livraison libre (freeformDelivery) qui affiche les repères visuels des zones cibles : décalques au sol pour les places de parking (couleur selon l'état de stationnement), sphères/rectangles de debug pour les lieux, zones et places, et les marqueurs d'attention 3D de la route active. Il est piloté par freeformDelivery (setup, update chaque frame, cleanup).

## Remarques

- États de stationnement d'une place : none (blanc), partial (jaune, 1 à 3 coins dans la place), full (vert, 4 coins) et blocked (rouge, un véhicule qui n'est pas associé à la place l'occupe totalement).
- Les décalques de place ne sont dessinés que si un objectif (goal) lié à la place est actif et que le joueur est à moins de 300 m ; l'opacité descend de 1.0 (250 m) à 0.2 (300 m).
- Les dessins de debug (sphère, rectangle, texte) ne sont actifs que si gameplay_freeformDelivery_freeformDelivery.debug.enabled et le sous-réglage targetAreas correspondant sont vrais.
- Dépend des globales gameplay_freeformDelivery_utils, gameplay_freeformDelivery_goals et gameplay_freeformDelivery_freeformDelivery, sans les déclarer dans M.dependencies.
- Le marqueur de route est décalé de 2 m en hauteur (ATTENTION_MARKER_HEIGHT_OFFSET) et son rayon vaut 1.5.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_markers.cleanup()` | Vide les marqueurs, décalques et caches, oublie la livraison active et détruit les marqueurs de route. *(interne)* | 435 |
| `gameplay_freeformDelivery_markers.hideRouteMarker()` | Cache les marqueurs de route (principal, zone, parking) sans les détruire. | 230 |
| `gameplay_freeformDelivery_markers.setRouteMarker(pos, zone, parkingSpot)` | Crée (en remplaçant les précédents) le marqueur d'attention de la route à la position donnée, plus éventuellement un marqueur de zone et un marqueur de place de parking, puis les affiche. | 176 |
| `gameplay_freeformDelivery_markers.setup(delivery)` | Mémorise la livraison active, crée un marqueur par zone cible (targetAreas) retrouvée dans delivery.sites, prépare les données de décalque des places de parking et pré-calcule quels véhicules sont associés à quelle place via les goals de type placement. *(interne)* | 242 |
| `gameplay_freeformDelivery_markers.update(dtReal, dtSim, dtRaw, profiler)` | Appelée chaque frame : met à jour l'état de stationnement des places, dessine les repères de debug, ajoute les décalques au sol via Engine.Render.DynamicDecalMgr.addDecals et met à jour les marqueurs de route. *(interne)* | 292 |

### Détail des paramètres

#### `gameplay_freeformDelivery_markers.setRouteMarker(pos, zone, parkingSpot)`

Crée (en remplaçant les précédents) le marqueur d'attention de la route à la position donnée, plus éventuellement un marqueur de zone et un marqueur de place de parking, puis les affiche.

- `pos` (*vec3*) : Position du marqueur principal (relevée de 2 m).
- `zone` (*table|nil*) : Données de checkpoint de zone passées à setToCheckpoint du marqueur de zone.
- `parkingSpot` (*table|nil*) : Données de place de parking passées au marqueur de parking.
- **renvoie** : boolean false si pos est nil ou si le marqueur n'a pas pu être créé, sinon true.

#### `gameplay_freeformDelivery_markers.setup(delivery)`

Mémorise la livraison active, crée un marqueur par zone cible (targetAreas) retrouvée dans delivery.sites, prépare les données de décalque des places de parking et pré-calcule quels véhicules sont associés à quelle place via les goals de type placement.

- `delivery` (*table*) : Données de la livraison (goals, targetAreas, sites, vehicles).

#### `gameplay_freeformDelivery_markers.update(dtReal, dtSim, dtRaw, profiler)`

Appelée chaque frame : met à jour l'état de stationnement des places, dessine les repères de debug, ajoute les décalques au sol via Engine.Render.DynamicDecalMgr.addDecals et met à jour les marqueurs de route.

- `dtReal` (*number*) : Delta temps réel en secondes.
- `dtSim` (*number*) : Delta temps de simulation en secondes.
- `dtRaw` (*number*) : Delta temps brut (non utilisé directement).
- `profiler` (*table|nil*) : Profileur optionnel (méthode add) pour mesurer les sections.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/markers.lua`.*
