# `gameplay_traffic_roles_police`

*Fichier : `lua/ge/extensions/gameplay/traffic/roles/police.lua` · VM : Game Engine (GE) · 312 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/traffic/roles/police")` (fichier sous extensions/ mais pas une extension classique)

Rôle de trafic « police » (classe 'emergency'). Il définit les actions de poursuite (pursuitStart, pursuitEnd, chaseTarget, avoidTarget, roadblock) et gère la sirène, le choix de la cible (le véhicule non policier au meilleur score de poursuite), l'évitement de collision frontale, le délai de repos après poursuite et le gel optionnel des feux de circulation quand la rampe lumineuse est allumée.

## Remarques

- États de self.state : 'chase', 'follow', 'flee', 'stop', 'pullOver', 'disabled', 'none'. L'action 'pullOver' est utilisée par onUpdate mais n'est pas définie dans ce fichier (elle doit venir de baseRole).
- Après pursuitEnd, le véhicule est 'disabled' pendant cooldownTimer = max(10, arrestTime + 5) secondes, puis onRefresh est rappelé.
- avoidSpeed est tiré au hasard entre 18 et 24 multiplié par le mode de poursuite ; l'évitement se déclenche si la somme des vitesses dépasse ce seuil et que les véhicules se font face (produit scalaire <= -0,707).
- Un véhicule trop endommagé (damage > baseValues.highDamage) passe à l'action 'disabled' ; si la cible est à moins de 20 m, policeWrecks de la cible augmente.
- enableTrafficSignalsChange et freezeTrafficSignals ne sont pas définis ici (hérités de baseRole).

## Classe `C`

Classe du rôle police, complétée par baseRole (self.veh, self.flags, self.state, self.targetId, setAction, setTarget, resetAction…).

Le module renvoie un constructeur : `local obj = require("gameplay_traffic_roles_police")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:checkTarget()` | Compare les scores de poursuite des véhicules de trafic non policiers dont le mode de poursuite est >= 1 et renvoie l'id de celui qui a le meilleur score. | 107 |
| `C:init()` | Configure le rôle : classe 'emergency', agressivité +0,1, drivability 0,5, et définit les actions pursuitStart (démarre une poursuite : mode 1 = suivi passif avec sirène par à-coups, mode > 1 = poursuite agressive avec rampe allumée), pursuitEnd (arrêt IA, rampe en mode 1, cooldown), chaseTarget, avoidTarget (mode 'flee' temporaire) et roadblock (arrêt, rampe allumée). Fusionne ensuite les baseActions. | 7 |
| `C:onRefresh()` | Appelé lors du rafraîchissement du rôle. Sort de l'état 'disabled', remet les timers à zéro, réinitialise l'action si besoin, puis cherche une cible : s'il y en a une, lance pursuitStart ; sinon annule la poursuite en cours. Avertit dans le log si le joueur est ciblé sans que sa poursuite ait été correctement déclenchée. | 124 |
| `C:onTrafficTick(dt)` | Appelé à chaque tick du trafic. Met à jour les cibles potentielles (distance, visibilité), compte les policiers qui voient la cible, déclenche l'évitement d'une collision frontale, désactive le policier trop endommagé, et gère le gel des feux de circulation selon la rampe lumineuse (vitesse >= 6 m/s). | 153 |
| `C:onUpdate(dt, dtSim)` | Appelé chaque frame. Gère les impulsions de sirène, le décompte du cooldown (qui rappelle onRefresh à la fin), l'arrêt de la poursuite si la cible ne fuit plus, la sortie des barrages routiers, le rangement sur le côté ('pullOver') près d'une cible quasi arrêtée, et les délais des actions temporaires. | 225 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `obj:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/roles/police.lua`.*
