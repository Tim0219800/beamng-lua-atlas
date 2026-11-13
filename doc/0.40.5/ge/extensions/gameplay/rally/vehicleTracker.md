# `gameplay_rally_vehicleTracker`

*Fichier : `lua/ge/extensions/gameplay/rally/vehicleTracker.lua` · VM : Game Engine (GE) · 253 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/vehicleTracker")` (fichier sous extensions/ mais pas une extension classique)

Suivi du véhicule joueur (slot 0) pour le rallye : position, vitesse et détection de dégâts. À chaque onUpdate, il relit map.objects[vehicleId] et déclenche un indicateur « vient de prendre des dégâts » quand la valeur `damage` augmente d'au moins un seuil. Un dessin de debug optionnel affiche position, vecteur vitesse et texte. Le module renvoie un constructeur : `require(...)(damageThreshold)`.

## Remarques

- Le véhicule suivi est toujours getPlayerVehicle(0), pas un véhicule passé en paramètre.
- Un commentaire du code indique que retourner vehicle:getPosition() directement « fait fonctionner » alors que la copie via getPositionXYZ dans un vec3 partagé est conservée : pos() et velocity() renvoient un vec3 réutilisé (même objet à chaque appel), il faut le copier si on le conserve.
- pos() et velocity() journalisent une erreur 'E' à chaque appel quand il n'y a pas de véhicule joueur.
- Le dégât est une valeur cumulée (map.objects[id].damage) ; seul un accroissement >= damageThreshold depuis la dernière valeur retenue lève justHadDamage, et seulement pour le tick concerné.
- Les champs wheelOffsets/currentCorners/previousCorners sont remplis dans init mais plus mis à jour (updateVehicleCorners est commenté).

## Classe `C`

Traqueur de véhicule. Champs : damageThreshold (1 par défaut), vehicleData, lastDamage, lastDamageDiff, justHadDamage, debugDraw, wheelOffsets, currentCorners, previousCorners.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_vehicleTracker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:damage()` | Dégât cumulé du véhicule d'après map.objects. | 185 |
| `C:didJustHaveDamage()` | Indique si un choc d'au moins damageThreshold a eu lieu au dernier tick. | 193 |
| `C:drawDebugInfo()` | Si activé : sphère magenta (rayon 1,5) 2 m au-dessus du véhicule, ligne cyan pour la vitesse (x2, au-delà de 0,1 m/s) et texte « VehicleTracker \| Pos \| Speed » en km/h et m/s. | 204 |
| `C:getVehicle()` | Renvoie getPlayerVehicle(0). | 54 |
| `C:getVehicleId()` | Id du véhicule joueur 0. | 48 |
| `C:init(damageThreshold)` | Constructeur. Récupère les données du véhicule joueur, mémorise le dégât courant et calcule les décalages des roues dans le repère du véhicule. | 9 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | À appeler chaque image : met à jour vehicleData et l'état de dégâts, puis dessine le debug si activé. Sans véhicule, réinitialise vehicleData, lastDamage et justHadDamage. | 70 |
| `C:pos()` | Position du véhicule joueur (vec3 partagé, réutilisé entre appels). | 151 |
| `C:setDebugDraw(enabled)` | Active ou coupe le dessin de debug. | 200 |
| `C:speedMs()` | Norme de la vitesse. | 180 |
| `C:updateVehicleDamage()` | Compare le dégât courant au dernier retenu et met à jour lastDamage, lastDamageDiff et justHadDamage. | 115 |
| `C:updateVehicleData(vehicleId)` | Met vehicleData à map.objects[vehicleId] (ou nil). | 145 |
| `C:velocity()` | Vitesse du véhicule joueur (vec3 partagé, réutilisé). | 168 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/vehicleTracker.lua`.*
