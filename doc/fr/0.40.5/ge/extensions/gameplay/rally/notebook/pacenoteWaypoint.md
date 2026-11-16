# `gameplay_rally_notebook_pacenoteWaypoint`

*Fichier : `lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua` · VM : Game Engine (GE) · 369 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/notebook/pacenoteWaypoint")` (fichier sous extensions/ mais pas une extension classique)

Waypoint d'une pacenote de rallye : une position, un rayon, une normale (direction d'un plan de franchissement) et un type (cornerStart ou cornerEnd, voir waypointTypes). Il sait se sérialiser, se dessiner dans la vue 3D avec debugDrawer (sphère, plan, texte, ou cylindres en mode reconnaissance) et mémorise les points de route associés pour le calcul de distance. Le module renvoie un constructeur : require(...)(pacenote, name, pos, forceId).

## Exemple

```lua
local newWp = require('/lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint')
local wp = newWp(pacenote, 'Waypoint 1', vec3(0,0,0))
wp:setManual(vec3(10,5,0), 4, vec3(0,1,0))
```

## Remarques

- setPos et setManual copient le vec3 reçu (vec3(pos)) pour ne pas partager d'état avec l'appelant.
- Bug probable : setNormal(nil) remet la normale par défaut (0,1,0) mais exécute ensuite normal:length() sur nil, ce qui lève une erreur. Une normale de longueur <= 0.9 est ignorée silencieusement.
- Le rayon initial vient de editor_rallyEditor.getPrefDefaultRadius() si l'éditeur est chargé, sinon de rallyUtil.default_waypoint_intersect_radius.
- onSerialize n'écrit que oldId, name, waypointType, pos, radius, normal ; onDeserialized restaure en mode "manual" (oldIdMap non utilisé).
- colorForWpType renvoie nil si waypointType n'est ni cornerStart ni cornerEnd.

## Classe `C`

Instance de waypoint. Champs : pacenote, id, name, waypointType, normal (vec3), pos (vec3), radius, intersectRadius, sortOrder (999999 par défaut), mode (nil ou "manual"), routePoint, originalDistToTarget, staticRoutePoint, staticOriginalDistToTarget.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_notebook_pacenoteWaypoint")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:colorForWpType(pn_drawMode)` | Couleur du waypoint selon son type et le mode de dessin : couleurs cs/ce normales, « adjacent » pour 'previous' et 'next', « adjacent_bg » pour 'background'. | 135 |
| `C:drawDebug(hover, text, clr_shape, alpha_shape, alpha_text, clr_text_fg, clr_text_bg, radius_factor, globalOpacity)` | Dessine le waypoint : sphère de rayon radius (ou radius*radius_factor), texte facultatif et prisme carré figurant le plan de franchissement. En survol, l'opacité est remplacée par les valeurs « hover ». | 155 |
| `C:drawDebugRecce(i, noteText)` | Dessin du mode reconnaissance : texte de la note au-dessus, plan translucide et trois cylindres formant un portique de 6 m de haut. Le prochain waypoint (i == 1) est plus opaque. | 225 |
| `C:getOriginalDistToTarget()` | Distance d'origine à la cible du point de route. | 349 |
| `C:getRoutePoint()` | Renvoie le point de route mémorisé. | 336 |
| `C:getStaticOriginalDistToTarget()` | Distance d'origine à la cible du point de route statique. | 353 |
| `C:getStaticRoutePoint()` | Renvoie le point de route statique. | 345 |
| `C:init(pacenote, name, pos, forceId)` | Constructeur. L'id vient de forceId ou de pacenote:getNextUniqueIdentifier(), le type de pacenote:getNextWaypointType(), le nom par défaut est « Waypoint <id> ». | 17 |
| `C:isCe()` | true si le type est cornerEnd. | 324 |
| `C:isCs()` | true si le type est cornerStart. | 320 |
| `C:isLockable()` | true si le type est cornerStart ou cornerEnd. | 307 |
| `C:isLocked()` | true si le waypoint est verrouillable et que la préférence editor_rallyEditor.getPrefLockWaypoints() est active. | 311 |
| `C:nameWithPacenote()` | Texte « <nom pacenote>[Cs\|Ce] ». | 357 |
| `C:onDeserialized(data, oldIdMap)` | Restaure type, nom, position, rayon et normale depuis les données sauvegardées. | 90 |
| `C:onSerialize()` | Renvoie la table à écrire en JSON : oldId, name, waypointType, pos, radius, normal (tableaux de 3 nombres). | 79 |
| `C:setManual(pos, radius, normal)` | Passe en mode "manual" et fixe position, rayon et normale. | 59 |
| `C:setNormal(normal)` | Définit la normale, normalisée, si sa longueur dépasse 0.9 ; sinon inchangée. | 70 |
| `C:setPos(newpos)` | Définit la position (copie du vec3). | 66 |
| `C:setRoutePoint(rp)` | Mémorise le point de route et sa distToTarget d'origine (celle-ci change quand le point devient le premier de la route). | 328 |
| `C:setStaticRoutePoint(rp)` | Idem setRoutePoint pour la route statique. | 340 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua`.*
