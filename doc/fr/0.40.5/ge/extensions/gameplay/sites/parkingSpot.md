# `gameplay_sites_parkingSpot`

*Fichier : `lua/ge/extensions/gameplay/sites/parkingSpot.lua` · VM : Game Engine (GE) · 479 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/sites/parkingSpot")` (fichier sous extensions/ mais pas une extension classique)

Classe « ParkingSpot » d'un jeu de sites : un rectangle orienté (position, rotation, dimensions scl = largeur X, longueur Y, hauteur Z) représentant une place de parking. Permet de tester si un véhicule y rentre, s'il y est garé, si elle est occupée, et d'y téléporter un véhicule. Peut générer plusieurs places côte à côte (« multi-spot »). Le module renvoie un constructeur.

## Exemple

```lua
local ok, corners = spot:checkParking(vehId, 0.8, 5, 1)
if spot:vehicleFits(vehId) and not spot:hasAnyVehicles(vehId) then
  spot:moveResetVehicleTo(vehId, false, false, nil, nil, true)
end
```

## Remarques

- Axes locaux : X = largeur, Y = direction de la place (avant), Z = hauteur ; scl contient les dimensions totales.
- Les places multiples (isMultiSpot) sont étendues par generateMultiSpots lors de finalizeSites : les copies sont marquées isProcedural et n'ont pas de dessin debug propre.
- multiSpotData.spotDirection vaut 'Left', 'Right', 'Front' ou 'Back'. Si une autre valeur est donnée, le décalage reste celui du dernier calcul (variable temporaire partagée).
- checkParking : les vitesses sont comparées au carré de la norme de la vitesse (m/s). Par défaut drivingSpeed 5 m/s, parkingSpeed 1 m/s, precision 0,8.
- moveResetVehicleTo en mode non safeTeleport multiplie toujours le quaternion final par backwardsQuat (rotation de 180° autour de Z), même si backwards est faux ; le quaternion renvoyé est modifié en place par cette multiplication.

## Classe `C`

Objet place de parking. Champs : sites, id, name, color, vertices (4 coins 2D), pos, rot, scl, isMultiSpot, multiSpotData {spotAmount, spotOffset, spotDirection, spotRotation}, wasGenerated, isProcedural, customFields.

Le module renvoie un constructeur : `local obj = require("gameplay_sites_parkingSpot")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:boxFits(extentsX, extentsY, extentsZ)` | Teste si une boîte de dimensions données rentre dans les dimensions de la place (comparaison par axe, sans rotation). | 347 |
| `C:calcVerts()` | Recalcule les 4 coins 2D (vertices) à partir de pos, rot et scl. | 244 |
| `C:checkParking(vehId, precision, drivingSpeed, parkingSpeed)` | Vérifie si un véhicule est correctement garé : vitesse faible, orienté dans l'axe de la place (\|cos\| >= 0,707) et coins de sa boîte englobante à l'intérieur. Avec precision <= 0, seul le centre du véhicule est testé. | 294 |
| `C:containsPoint(pos)` | Teste si un point est dans le volume de la place (boîte orientée, avec contrôle rapide par rayon). | 257 |
| `C:drawDebug(drawMode, clr, customHeight, drawDirection)` | Dessine la place en debug (surface, direction, nom selon le mode). Ignore les places procédurales. | 87 |
| `C:drawSide(a, b, z, clrI)` | Dessine un côté vertical de la place entre deux points (aide au debug). | 176 |
| `C:generateMultiSpots(parkingSpotList, skipSort)` | Pour une place multi-spot, crée les places supplémentaires (nom « <nom>.<n> ») décalées selon spotDirection/spotOffset, avec la rotation spotRotation, et copie tags et champs personnalisés. N'agit qu'une fois (wasGenerated). | 198 |
| `C:getPath()` | Identifiant textuel de la place : dossier + fichier du jeu de sites + « # » + nom. | 83 |
| `C:hasAnyVehicles(playerId)` | Indique si un véhicule actif occupe la place (centre de la boîte englobante dedans ; pour les véhicules suivis par map, test des arêtes aussi). | 359 |
| `C:init(sites, name, forceId)` | Constructeur. Nom par défaut « Parking <id> ». | 17 |
| `C:moveResetVehicleTo(vehId, lowPrecision, backwards, addedOffsetPos, addedOffsetRot, useSafeTeleport, removeTraffic, resetVehicleInSafeTeleport, options)` | Place un véhicule sur la place, aligné sur sa rotation. Avec useSafeTeleport, passe par spawn.safeTeleport ; sinon calcule le décalage de la boîte englobante, positionne le véhicule, réinitialise le flexmesh et appelle autoplace. | 399 |
| `C:onDeserialized(data)` | Restaure la place depuis les données et recalcule les coins. | 55 |
| `C:onSerialize()` | Sérialise la place (position, rotation d'origine, dimensions, paramètres multi-spot, couleur, champs personnalisés). | 35 |
| `C:set(pos, rot, scl)` | Modifie position, rotation et/ou dimensions (valeurs nil ignorées) et recalcule les coins. | 70 |
| `C:vehicleFits(vehId)` | Teste si le véhicule rentre (boîte englobante initiale des noeuds, initialNodePosBB). | 351 |

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`
- `debugDrawer:` `drawTextAdvanced`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/sites/parkingSpot.lua`.*
