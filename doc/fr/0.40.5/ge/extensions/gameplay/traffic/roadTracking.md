# `gameplay_traffic_roadTracking`

*Fichier : `lua/ge/extensions/gameplay/traffic/roadTracking.lua` · VM : Game Engine (GE) · 352 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/traffic/roadTracking")` (fichier sous extensions/ mais pas une extension classique)

Classe qui suit le placement et le comportement d'un véhicule sur la route : segment de route courant (n1, n2), position latérale, alignement avec la route, limite de vitesse, côté légal, et trois scores de faute (overSpeed, wrongWay, reckless) bornés de 0 à 1. Elle gère aussi les infractions de feux/stop via core_trafficSignals. Utilisée par le trafic pour détecter les infractions que la police peut sanctionner.

## Exemple

```lua
local rt = require('/lua/ge/extensions/gameplay/traffic/roadTracking')({vehId = be:getPlayerVehicleID(0)})
-- à chaque frame :
rt:onUpdate(dt)
if rt.faults.overSpeed > 0.5 then --[[ excès de vitesse ]] end
```

## Remarques

- Le module renvoie un constructeur : le paramètre (table) est transformé en objet, et init(o.vehId) est appelé.
- Les scores de faute sont plafonnés à 1 ; une valeur > 0,5 déclenche les infractions côté police (d'après le commentaire du code).
- Vitesses en m/s : speedLimitFloor = 4,167 (15 km/h), speedLimitCoef = 1,125 (tolérance de 12,5 % avant l'excès de vitesse).
- sideValue : 1 = côté/sens légal, -1 = côté illégal, -2 = sens interdit sur route à sens unique.
- Sur route non publique (type 'private' ou drivability < 0,25), toutes les fautes sont remises à 0.
- Les collisions sont accumulées depuis map.objects[vehId].objectCollisions ; elles peuvent être manquées si dt est trop grand.
- init peut marquer self._invalid = true si le véhicule n'existe pas, mais lit ensuite quand même getObjectByID(vehId).initialNodePosBB, ce qui plante si le véhicule est absent.
- highFrequency = true force la recherche de route à chaque frame ; fullStats est sérialisé mais n'est pas lu dans ce fichier.

## Classe `C`

Objet de suivi de route d'un véhicule. Champs principaux : vehId, pos/dirVec/vel (vec3), speed, n1/n2 (noms des nœuds de la route), linkData, speedLimit, speedRatio, alignment (≈1 si parallèle à la route), roadOffset, roadXnorm/roadYnorm (0 à 1), halfWidth, isOnRoad, isNearRoad, isPublicRoad, isOneWay, isReverse, legalSide, faults, timers, collisionIds, collisionCount, currSignal, signalAction, signalFault.

Le module renvoie un constructeur : `local obj = require("gameplay_traffic_roadTracking")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calcVehOnRoad()` | Calcule la position du véhicule sur le segment n1-n2 : position longitudinale et latérale normalisée, demi-largeur interpolée, alignement, décalage par rapport à la ligne centrale, et isOnRoad. | 109 |
| `C:init(vehId)` | Initialise l'objet : mesure l'emprise du véhicule (initialNodePosBB), calcule vehBasicRadius (demi-largeur ou demi-longueur minimale), fixe les seuils de vitesse, puis appelle refresh. | 16 |
| `C:onDeserialized(data)` | Restaure la configuration depuis la table produite par onSerialize. | 338 |
| `C:onSerialize()` | Sérialise la configuration (vehId, speedLimitFloor, speedLimitCoef, highFrequency, fullStats). | 328 |
| `C:onUpdate(dt)` | Mise à jour par frame : actualise véhicule et route, cumule les collisions, puis fait évoluer les scores de faute (excès de vitesse, mauvais sens/côté, conduite imprudente) et suit les signaux de circulation (feu rouge, stop) pour renseigner signalAction et signalFault. | 193 |
| `C:refresh()` | Remet à zéro toutes les tables et valeurs (fautes, timers, collisions, route), recalcule le côté légal (conduite à droite ou à gauche selon map.getRoadRules()), puis, si le véhicule est dans map.objects, met à jour le véhicule et la route courante. | 38 |
| `C:resetValues()` | Remet à leurs valeurs neutres les valeurs de suivi actives (ratio de vitesse, alignement, décalage, fautes, timers, signal, collisions). | 68 |
| `C:updateCurrentRoad()` | Cherche le meilleur segment de route (map.findBestRoad) pour la position et la direction actuelles, met à jour limite de vitesse, sens unique, route publique et ligne centrale (d'après la chaîne de voies '+'/'-'), oriente n1->n2 dans le sens de marche, puis appelle calcVehOnRoad. Si aucune route proche : isNearRoad = false et reset des valeurs. | 152 |
| `C:updateVehicle()` | Met à jour la position au sol (centre de l'OOBB abaissé de la demi-hauteur), la direction, la vitesse (m/s) et isReverse (vitesse d'au moins 1 m/s dans le sens opposé à l'avant du véhicule). | 97 |

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/roadTracking.lua`.*
