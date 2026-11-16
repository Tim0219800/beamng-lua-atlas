# `gameplay_traffic_roles_suspect`

*Fichier : `lua/ge/extensions/gameplay/traffic/roles/suspect.lua` · VM : Game Engine (GE) · 84 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/traffic/roles/suspect")` (fichier sous extensions/ mais pas une extension classique)

Rôle de trafic « suspect » : un véhicule recherché par la police. Il définit les actions watchPolice (devenir recherché), fleePolice (fuir), arrest (immobiliser) et clear (remettre à zéro). Tant que son état est 'wanted' et que la police l'a assez vu, il déclenche une poursuite via gameplay_police.

## Remarques

- États utilisés dans self.state : 'wanted', 'flee', 'stop', 'none'.
- Drapeaux manipulés dans self.flags : flee, busy, freeze, driveCheck (lu), pursuit/reset (lus sur les véhicules de police).
- pursuitMode vaut 2 par défaut.
- fleePolice rend le véhicule quasi impossible à respawn en appelant veh:modifyRespawnValues(800, 40).
- onUpdate est une fonction vide.

## Classe `C`

Classe du rôle suspect, complétée par baseRole (self.veh = véhicule de trafic, self.flags, self.state, self.actions).

Le module renvoie un constructeur : `local obj = require("gameplay_traffic_roles_suspect")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Initialise le rôle : ajoute +0,2 d'offset à l'agressivité (personalityModifiers), définit les actions watchPolice / fleePolice / arrest / clear et fixe pursuitMode = 2. | 7 |
| `C:onActiveDone()` | Appelé quand le véhicule n'est plus actif dans le trafic. Même traitement que onRoleEnded : si le drapeau flee est posé, le suspect est déclaré ayant échappé à la police. | 55 |
| `C:onRoleEnded()` | Appelé quand le rôle prend fin. Si le suspect fuyait, appelle gameplay_police.evadeVehicle(vehId, gameplay_traffic.showMessages) et retire le drapeau flee. | 48 |
| `C:onTrafficTick(tickTime)` | Appelé à chaque tick du gestionnaire de trafic. Si l'état est 'wanted', que la valeur de visibilité (pursuit.sightValue) atteint le seuil (0,25 pour une IA, 1 pour un joueur) et que la vitesse atteint le seuil (1 m/s si driveCheck, sinon 0), il cherche les policiers disponibles (ni en poursuite ni en reset), lance gameplay_police.setPursuitMode(pursuitMode, vehId, policeIds) et cible le policier le plus proche. | 62 |
| `C:onUpdate(dt, dtSim)` | Appelé à chaque frame ; corps vide. | 81 |

## Appels vers le moteur (C++)

- `obj:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/roles/suspect.lua`.*
