# `gameplay_delivery_delivery`

*Fichier : `lua/ge/extensions/gameplay/delivery/delivery.lua` · VM : Game Engine (GE) · 176 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/delivery/delivery")` (fichier sous extensions/ mais pas une extension classique)

Classe d'une livraison chronométrée (ancien système de livraison). Une instance choisit au hasard des lieux d'un objet sites portant un tag, calcule la distance d'un aller-retour par les routes (map.getPath) depuis un point de ramassage, en déduit un temps imparti (baseTime + timePerKm × km), puis suit l'avancement (états disabled, start, active, return, failed). En état active, elle échoue si les dégâts du véhicule dépassent 5000 ou si le temps tombe à 0. Le module renvoie un constructeur : require(...)().

## Exemple

```lua
local d = require('/lua/ge/extensions/gameplay/delivery/delivery')()
d.vehId = be:getPlayerVehicleID(0)
d:setTimeParameters(60, 90)
d:setup(sites, pickupPos, 5, 'delivery', 3)
d:startDelivery()
```

## Remarques

- Il faut appeler setTimeParameters avant setup, sinon baseTime est nil et setup plante.
- Bug probable : init met self.vehId = {} (une table) ; checkFail utilise self.vehId comme id dans scenetree.findObjectById et map.objects[self.vehId] : l'appelant doit assigner vehId (entier) avant update.
- Bug probable : dans selectLocations, le tri par distance utilise la variable globale 'position' (nil) donc ne s'exécute jamais, et il trierait 'locations' après la sélection de toute façon (le résultat selected n'est pas trié).
- selectLocations : s'il y a moins de lieux taggés que count, insère des nil (la table selected reste tronquée).
- isPartiallyInsideLocationOneFrame n'est jamais mis à vrai dans ce fichier : le chronomètre ne se met en pause que si l'appelant pose ce champ à chaque image avant update.
- update n'appelle pas clearEvents (appel commenté) : events.proceedDelivery reste vrai jusqu'à clearEvents.
- Paramètres de échec : maxDamage 5000, stoppedMaxDuration 10 (stoppedTimer non utilisés dans ce fichier), locationRewardFactor 0.5.
- checkFail laisse un dump("No vData?!") dans le code si le véhicule n'est pas dans map.objects.

## Classe `C`

Objet livraison renvoyé par le constructeur du module. Champs : vehId, state ('disabled' au départ), timer (s), events, pickup {pos, radius}, locations, roundtripDistance (m), locationIndex, failReason, sites, baseTime, timePerKm.

Le module renvoie un constructeur : `local obj = require("gameplay_delivery_delivery")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateRoundtrip()` | Calcule la distance en mètres du trajet ramassage -> lieux dans l'ordre -> ramassage, en additionnant la longueur des chemins sur le graphe routier et les distances au point de route le plus proche. | 66 |
| `C:checkFail(dt)` | Teste l'échec : dégâts supérieurs à maxDamage (failReason 'damage') ou temps écoulé (failReason 'time') ; le chronomètre ne décroît pas si isPartiallyInsideLocationOneFrame est vrai. En cas d'échec, state = 'failed'. | 137 |
| `C:clearEvents()` | Vide la table d'évènements. | 133 |
| `C:getCurrentLocation()` | Retourne le lieu de livraison courant, uniquement en état 'active'. | 165 |
| `C:getCurrentRewardFactor()` | Facteur de récompense proportionnel à l'avancement : ((locationIndex - 1) / nombre de lieux) × locationRewardFactor (0.5). | 26 |
| `C:init()` | Initialise l'état (disabled, timer 0, listes vides) et les paramètres d'échec. Appelée par le constructeur. | 7 |
| `C:proceedDelivery()` | Valide la livraison courante : lève l'évènement proceedDelivery et passe au lieu suivant ; après le dernier, passe à l'état 'return'. | 114 |
| `C:selectLocations(tag, count)` | Choisit count lieux de self.sites.locations dont customFields.tags contient le tag ; mélange la liste s'il y en a plus que count. | 40 |
| `C:setTimeParameters(baseTime, timePerKm)` | Définit les paramètres du temps imparti. | 95 |
| `C:setup(sites, pickupPos, pickupRadius, tag, count)` | Prépare la livraison : mémorise sites et point de ramassage, choisit les lieux, calcule la distance et le chronomètre, puis passe à l'état 'start'. | 100 |
| `C:startDelivery()` | Passe à l'état 'active' et sélectionne le premier lieu (locationIndex = 1). | 109 |
| `C:update(dt)` | Mise à jour par image : en état 'active', vérifie les conditions d'échec. Sans effet si l'état est 'disabled'. | 124 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/delivery/delivery.lua`.*
