# `gameplay_rally_loop_roadSectionPenaltyKeeper`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua` · VM : Game Engine (GE) · 86 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/loop/roadSectionPenaltyKeeper")` (fichier sous extensions/ mais pas une extension classique)

Surveille les sections de liaison (road sections) d'une boucle de rallye : si le joueur déclenche trop de recalculs d'itinéraire dans une fenêtre de temps (il sort de la route de liaison), une pénalité « liaison_deviation » est enregistrée auprès du gestionnaire. Les pénalités sont escaladantes : 30 s, 60 s, 120 s, 180 s.

## Remarques

- Constantes : fenêtre RECALC_TIME_WINDOW = 10 s, seuil RECALC_THRESHOLD = 5 recalculs, MAX_VIOLATIONS = 1.
- Avec MAX_VIOLATIONS = 1, onUpdate ne déclenche qu'une seule violation par instance (condition violationCount < 1), donc seule la pénalité de 30 s est en pratique appliquée ; les paliers 60/120/180 s ne sont jamais atteints par onUpdate.
- Le module renvoie un constructeur : require('gameplay_rally_loop_roadSectionPenaltyKeeper')(manager). Le temps vient de manager.clock.

## Classe `C`

Détecteur de pénalités de liaison. Champs : manager, recalcCount, violationCount, lastCheckTime.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_loop_roadSectionPenaltyKeeper")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:createPenaltyData()` | Incrémente violationCount et renvoie la donnée de pénalité {type = 'liaison_deviation', amount, data = {violationNumber, recalcCount}} avec amount = 30, 60, 120 puis 180 s. | 37 |
| `C:init(manager)` | Mémorise le gestionnaire et remet les compteurs à zéro. Appelé par le constructeur. | 20 |
| `C:onUpdate()` | Appelé à chaque frame par le gestionnaire. Toutes les 10 s (temps manager.clock), si recalcCount > 5 et violationCount < MAX_VIOLATIONS, appelle manager:recordRouteRecalcPenalty(createPenaltyData()) et remet recalcCount à 0. | 58 |
| `C:registerRecalc()` | Incrémente le compteur de recalculs d'itinéraire ; à appeler à chaque recalcul de route détecté. | 33 |
| `C:reset()` | Remet recalcCount et violationCount à 0. | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua`.*
