# `gameplay_freeformDelivery_endScreen`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/endScreen.lua` · VM : Game Engine (GE) · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_endScreen` : `extensions.load("gameplay_freeformDelivery_endScreen")`, puis la globale `gameplay_freeformDelivery_endScreen`

Petit module du mode de livraison libre (freeformDelivery) qui rassemble les statistiques affichées à la fin d'une livraison : temps écoulé, avancement des objectifs (via gameplay_freeformDelivery_goals.getProgress) et dégâts de chaque véhicule de la livraison (lus dans map.objects). Ne contient pas d'interface : il ne fait que construire la table de résultats.

## Remarques

- Le temps est calculé avec os.clock() - startTime : startTime doit donc venir de os.clock().
- Renvoie nil (avec une erreur loggée) si delivery est nil, si startTime est nil ou 0, ou si getProgress ne renvoie rien.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_endScreen.collectStatistics(delivery, startTime)` | Construit la table de statistiques de fin de livraison : durée (brute et formatée par gameplay_freeformDelivery_utils.formatTime), nombre d'objectifs total/complétés/requis/requis complétés, dégâts par véhicule (vehData.damage) et indicateur allRequiredComplete. | 8 |

### Détail des paramètres

#### `gameplay_freeformDelivery_endScreen.collectStatistics(delivery, startTime)`

Construit la table de statistiques de fin de livraison : durée (brute et formatée par gameplay_freeformDelivery_utils.formatTime), nombre d'objectifs total/complétés/requis/requis complétés, dégâts par véhicule (vehData.damage) et indicateur allRequiredComplete.

- `delivery` (*table*) : Données de la livraison chargée (liste vehicles avec id et name).
- `startTime` (*number*) : Instant de début en secondes, mesuré avec os.clock().
- **renvoie** : table|nil {time, timeStr, goalsTotal, goalsCompleted, goalsRequired, goalsRequiredCompleted, vehicleDamages = {[deliveryId] = {name, damage}}, allRequiredComplete}, ou nil en cas d'erreur.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/endScreen.lua`.*
