# `gameplay_rally_loop_speedingDetector`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua` · VM : Game Engine (GE) · 262 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/loop/speedingDetector")` (fichier sous extensions/ mais pas une extension classique)

Détecte les excès de vitesse du joueur sur les sections de liaison d'une boucle de rallye. Toutes les secondes, la vitesse du véhicule joueur est échantillonnée dans un tampon circulaire de 5 valeurs ; si la moyenne dépasse la limite, une pénalité est tirée au hasard avec une probabilité proportionnelle au dépassement. Les pénalités sont espacées d'au moins 60 s et transmises au gestionnaire via recordSpeedingPenalty.

## Exemple

```lua
local det = require('gameplay_rally_loop_speedingDetector')(manager)
-- à chaque frame :
det:update(dtSim, 70, false)
```

## Remarques

- Mode normal : probabilité = min(dépassement / 60 * 0.05, 0.05), soit 5 % au maximum à 60 km/h de dépassement. Mode strict : min(dépassement / 5 * 0.2, 0.2), soit 20 % au maximum à 5 km/h de dépassement.
- Le tirage utilise math.random() sur la moyenne des 5 dernières secondes, pas la vitesse instantanée.
- Le test commence avec le délai de pénalité déjà écoulé (timeSinceLastPenalty = 60), donc la première pénalité est possible immédiatement.
- drawDebug (non appelé : l'appel est commenté dans update) affiche en mode strict une probabilité basée sur la vitesse instantanée, ce qui diffère du calcul réel de update (moyenne).
- Le module renvoie un constructeur : require('gameplay_rally_loop_speedingDetector')(manager). Vitesses en km/h (vitesse m/s du véhicule * 3.6).

## Classe `C`

Détecteur de vitesse. Champs d'instance : manager, currentLimitKph, bufferSize (5), data (tampon circulaire), writeIndex, count, sampleRate (1 s), penaltyRateLimit (60 s), penalties (liste des pénalités déclenchées), maxSpeedOver/maxProbability (60 / 0.05), strictMaxSpeedOver/strictMaxProbability (5 / 0.2), strictMode.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_loop_speedingDetector")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addSample(sample)` | Ajoute une vitesse au tampon circulaire en écrasant la plus ancienne si besoin. | 42 |
| `C:drawDebug()` | Fenêtre ImGui « Speeding Detector Debug » : limite, vitesses courante et moyenne, probabilité, pénalités et échantillons. Actuellement jamais appelée par update. | 155 |
| `C:getAverageSpeed()` | Moyenne des échantillons valides du tampon. | 49 |
| `C:getCurrentSpeedKph()` | Vitesse du véhicule joueur 0 en km/h (norme de la vitesse * 3.6). | 35 |
| `C:init(manager)` | Initialise le tampon et les paramètres. Appelé par le constructeur. | 9 |
| `C:stochasticPenalty(maxSpeedOver, maxProbability)` | Décide au hasard si une pénalité est déclenchée selon la moyenne par rapport à la limite : probabilité linéaire de 0 (à la limite) à maxProbability (à maxSpeedOver au-dessus). | 60 |
| `C:update(dtSim, limitKph, strictMode)` | À appeler à chaque frame. Cumule le temps, prend un échantillon toutes les secondes et, si le délai de 60 s est écoulé, tire une pénalité ; en cas de pénalité, stocke {averageSpeed, instantSpeed, speedLimit, speedOver, probability, strictMode} et appelle manager:recordSpeedingPenalty. | 86 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua`.*
