# `gameplay_race_startPosition`

*Fichier : `lua/ge/extensions/gameplay/race/startPosition.lua` · VM : Game Engine (GE) · 237 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/race/startPosition")` (fichier sous extensions/ mais pas une extension classique)

Classe d'une position de départ d'une course : position et rotation d'une ligne de départ, avec un groupe ('start', 'rollingStart', 'recovery' ou 'other'). Elle sait placer un véhicule dessus en conservant son décalage relatif, se calquer sur un véhicule et fournir les coins avant pour les tests de franchissement. Le module renvoie une fabrique : require('/lua/ge/extensions/gameplay/race/startPosition')(race, name). Contrairement aux autres classes de course, son premier argument s'appelle race.

## Remarques

- Le rôle des groupes est celui indiqué par le commentaire du code : start, rollingStart, recovery, other. Sans groupe dans les données, le nom contenant 'Recovery' donne 'recovery', sinon 'start'.
- moveResetVehicleTo utilise une variable logTag non définie dans le fichier (nil, sans conséquence sur le log).
- Sans réparation (repair = false), le véhicule est téléporté avec spawn.safeTeleport et une rotation corrigée.
- calculateVehiclePosRot utilise la boîte englobante OOBB d'apparition : en lowPrecision (véhicule chargé à la première image), le véhicule est placé 2 m derrière et 0,5 m au-dessus de la position.
- Le véhicule est orienté face à la ligne (rotation de la ligne composée d'un demi-tour sur Z).
- setToVehicle ajuste la hauteur et la pente au terrain s'il existe un TerrainBlock.

## Classe `C`

Position de départ. Champs : race, id (race:getNextUniqueIdentifier()), name (« Start Position <id> » par défaut), group, pos (vec3), rot (quat), sortOrder, routePoint, originalDistToTarget, staticRoutePoint, staticOriginalDistToTarget.

Le module renvoie un constructeur : `local obj = require("gameplay_race_startPosition")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateVehiclePosRot(vehId, lowPrecision)` | Calcule la position et la rotation à donner à un véhicule pour qu'il garde son décalage relatif par rapport à sa boîte d'apparition, centrée sur la ligne. | 139 |
| `C:drawDebug(drawMode, clr)` | Dessine la ligne de départ (triangles pleins), un prisme rouge en mode highlight et le nom. | 63 |
| `C:getFrontCorners(width, length)` | Coins de la zone devant la position : deux listes, l'une de quatre points (largeur et longueur, vers l'arrière de la ligne selon -Y), l'autre de deux points à 0,4 m. | 52 |
| `C:getRoutePoint()` | Point de route associé. | 218 |
| `C:getStaticRoutePoint()` | Point de route statique. | 227 |
| `C:init(race, name)` | Constructeur : id, nom, groupe 'start', position et rotation nulles. | 7 |
| `C:moveResetVehicleTo(vehId, lowPrecision, repair)` | Déplace un véhicule sur la position de départ. Par défaut avec réparation (setPositionRotation) ; avec repair = false, téléportation sûre. | 170 |
| `C:onDeserialized(data)` | Restaure la position à partir de données sérialisées (groupe déduit du nom si absent). | 36 |
| `C:onSerialize()` | Sérialise name, group, pos, rot (x,y,z,w) et oldId. | 25 |
| `C:set(pos, rot)` | Définit la position et la rotation. | 47 |
| `C:setRoutePoint(rp)` | Mémorise le point de route associé et sa distance d'origine à la cible (distToTarget). | 211 |
| `C:setStaticRoutePoint(rp)` | Mémorise le point de route statique et sa distance d'origine. | 222 |
| `C:setToVehicle(vehId)` | Aligne la position de départ sur un véhicule : centre de son avant, orientation du véhicule (ou du terrain sous lui). | 190 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSquarePrism`, `drawTextAdvanced`, `drawTriSolid`
- `scenetree.` `findClassObjects`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/race/startPosition.lua`.*
