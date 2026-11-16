# `flowgraph_nodes_events_customizedTriggerBox`

*Fichier : `lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua` · VM : Game Engine (GE) · 270 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/events/customizedTriggerBox")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Custom Trigger » (catégorie repeat_instant, événement). Crée une zone de déclenchement (boîte ou sphère/ellipsoïde) pendant l'exécution du projet. Pins d'entrée : position (vec3), rotation (quat), scale (number ou vec3), vehId (défaut : véhicule joueur). Sorties : enter et exit (impulsions), inside, outside, vehId. Le type de zone (Box/Sphere) se choisit dans l'éditeur.

## Remarques

- data.highPrecision : teste 4 points de la boîte englobante du véhicule (au lieu de sa seule position). data.debug : dessine la zone avec debugDrawer.
- Si le véhicule est introuvable, toutes les sorties passent à nil.
- Le trigger est recalculé quand position, rotation ou scale changent. Le type est sérialisé (triggerType).
- todo du code : à fusionner avec onBeamNGTrigger.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Réinitialise les états dedans/dehors et marque le trigger à recalculer. | 51 |
| `C:_executionStopped()` | Oublie la position, l'échelle et les points mémorisés. | 59 |
| `C:_onDeserialized(res)` | Relit triggerType depuis res. | 263 |
| `C:_onSerialize(res)` | Sauvegarde triggerType dans res. | 259 |
| `C:checkIntersections()` | Teste si l'un des points du véhicule est dans la zone (containsOBB_point ou containsEllipsoid_Point) et met à jour enterFlag, exitFlag, vehInside. | 66 |
| `C:drawAxisBox(corner, x, y, z, clr)` | Dessine une boîte colorée avec arêtes via debugDrawer (mode debug). | 178 |
| `C:drawCustomProperties()` | Éditeur : liste déroulante du type de trigger ; renvoie la raison du changement. | 235 |
| `C:drawMiddle(builder, style)` | Dessin du nœud dans l'éditeur. | 255 |
| `C:init(mgr, ...)` | Initialise les drapeaux, triggerType = 'Box', data.highPrecision et data.debug à false. | 40 |
| `C:work(args)` | Recalcule la zone si besoin, récupère les points du véhicule, appelle checkIntersections et remplit les pins de sortie. | 93 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua`.*
