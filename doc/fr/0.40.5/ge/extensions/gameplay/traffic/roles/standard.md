# `gameplay_traffic_roles_standard`

*Fichier : `lua/ge/extensions/gameplay/traffic/roles/standard.lua` · VM : Game Engine (GE) · 319 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/traffic/roles/standard")` (fichier sous extensions/ mais pas une extension classique)

Rôle de trafic « standard » : le conducteur civil par défaut. Il réagit aux collisions, accidents et événements vus (quasi-accident, collision d'un tiers) selon sa personnalité (bravoure, patience) : se ranger, suivre ou fuir l'autre véhicule, klaxonner, ou échanger les assurances. Il désactive aussi le véhicule trop endommagé.

## Remarques

- Types d'événements dans driver.eventType : 'none', 'selfCrash', 'otherCrash', 'selfCollision', 'otherCollision', 'nearMiss' (ou autre type reçu par onOtherEvent).
- damageAction est choisi dans onRefresh : bravoure >= 0,56 -> 'followPostCrash', <= 0,44 -> 'fleePostCrash', sinon 'stop' (uniquement pour les IA).
- collisionThreshold = ceil(random()^2 * 6) : nombre minimal de collisions qui déclenche l'action post-crash.
- minActionTime vaut 5 s ; les durées d'action dépendent de la bravoure ou de la patience.
- Dans askInsurance, le drapeau askInsurance est remis à nil et l'IA passe en mode 'stop' ; un message UI 'ui.traffic.interactions.insuranceExchanged' est affiché hors carrière si le joueur est la cible.
- Une vitesse >= 1,2 fois la limite lors d'une collision attribue la faute au véhicule lui-même (veh.collisions[otherId].fault = true).
- L'action 'pullOver' utilisée ici est fournie par baseRole (non définie dans ce fichier).

## Classe `C`

Classe du rôle standard, complétée par baseRole (self.veh, self.driver, self.flags, self.state, setAction, resetAction, setTarget, checkTargetVisible…).

Le module renvoie un constructeur : `local obj = require("gameplay_traffic_roles_standard")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Définit les actions fleePostCrash (fuite IA, agressivité aléatoire >= 0,5), followPostCrash (suivi ou poursuite 'road rage' du responsable), askInsurance (arrêt de l'IA) et disabled (arrêt, état 'disabled'), puis fusionne les baseActions. | 15 |
| `C:onCollision(otherId, data)` | Appelé quand ce véhicule est en collision avec un autre. Impute la faute si la vitesse dépasse 1,2 fois la limite, marque 'selfCollision', cible l'autre véhicule, émet onTrafficAction(vehId, 'collision', …), prévoit un coup de klaxon (selon bravoure et nombre de coups) et mémorise selfHitCount. | 109 |
| `C:onCrashDamage(data)` | Appelé quand le véhicule subit un dégât de crash. Si aucune collision n'est en cours, marque l'événement 'selfCrash' et, pour une IA, émet le hook onTrafficAction(vehId, 'crashDamage', {targetId}). | 86 |
| `C:onOtherCollision(id1, id2, data)` | Appelé quand deux autres véhicules de trafic se percutent. Cible le plus lent des deux s'il est visible, proche et devant ; enregistre otherHitCount. | 130 |
| `C:onOtherCrashDamage(otherId, data)` | Appelé quand un autre véhicule subit un crash. Si ce véhicule est proche (< 60 m d'après la distance interactive), devant et visible, marque l'événement 'otherCrash' et le cible. | 97 |
| `C:onOtherEvent(eventType, otherId, data)` | Appelé pour un événement signalé par un autre véhicule (ex. quasi-accident). Ignoré si un crash est déjà actif ; sinon, si le véhicule est visible, enregistre le type d'événement et le cible. | 149 |
| `C:onRefresh()` | Réinitialise cible, timers et état du conducteur (driver.eventType, damageAction, collisionThreshold, compteurs de collisions). Pour une IA, choisit damageAction selon la bravoure et tire le seuil de collisions. | 60 |
| `C:onTrafficTick(tickTime)` | Appelé à chaque tick du trafic. Désactive le véhicule IA trop endommagé, évalue visibilité et proximité de la cible, puis choisit une réaction (klaxon, rangement 'pullOver', suivi, fuite, passage en poursuite) selon l'événement et la personnalité. Gère aussi le klaxon différé et le gel des feux si une rampe lumineuse est allumée. | 158 |
| `C:onUpdate(dt, dtSim)` | Appelé chaque frame. Fait décroître actionTimer et termine les actions : échange d'assurance quand les deux véhicules sont arrêtés à moins de 20 m, fin du suivi/de la fuite, fin du rangement ; réinitialise l'action si la cible a disparu du trafic. | 274 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTrafficAction` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `obj:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/roles/standard.lua`.*
