# `filters`

*Fichier : `lua/common/filters.lua` · VM : Commun (GE + véhicule) · 693 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("filters")`

Collection de filtres numériques à état (lissage, passe-bas/haut, ressort, détecteur de fréquence, régression linéaire) utilisés partout dans le code véhicule (entrées pédales/volant, capteurs, contrôleurs). Chaque filtre est créé par une fonction globale newXxx(...) qui renvoie un objet avec une méthode get(sample, dt) (ou get(sample) pour les filtres à pas fixe) qui met à jour l'état interne et renvoie la valeur filtrée. Les constructeurs sont des variables globales : `require('filters')` n'est pas nécessaire une fois le module chargé (chargé par défaut dans les deux VM).

## Exemple

```lua
local smoother = newTemporalSmoothing(5, 5)          -- 5 unités/s en montée et en descente
function updateGFX(dt)
  local out = smoother:get(rawInput, dt)
end

local lp = newFreqFilter1()
local y = lp:getLowPassFreq(sample, dt, 10) -- passe-bas 10 Hz
```

## Remarques

- Ce fichier ne retourne pas de table M : tout est global (freqGenC, newFreqFilter1, newFreqDetector, newFreqExists, newTemporalSpring, newTemporalSigmoidSmoothing, newTemporalSmoothingHybrid, newTemporalSmoothingNonLinear, newTemporalSmoothing, newLinearSmoothing, newNopSmoothing, newExponentialSmoothing, newExponentialSmoothingT, newLineFitting). Les classes (metatables) sont locales et accessibles seulement via les objets créés.
- IMPORTANT : les extraits de la page automatique donnent des signatures sans l'échantillon (ex. get(dt)). Dans le code, l'échantillon est TOUJOURS le premier argument après self : get(sample, dt), getLowPassFreq(sample, dt, cutOffFreq), lineFitting:getS(x, y), lineFitting:get(x, y, dt), etc.
- Filtres à taux d'entrée/sortie (temporalSmoothing, temporalSmoothingNonLinear, temporalSmoothingHybrid, temporalSigmoidSmoothing, linearSmoothing) : l'objet stocke deux taux dans les clés booléennes [false] = inRate et [true] = outRate. À chaque pas, la clé utilisée est (sample - état) * état >= 0 : donc quand l'écart a le même signe que l'état (la valeur s'éloigne de 0, ou l'état est 0), c'est le taux stocké dans [true] (= outRate) qui s'applique ; quand la valeur revient vers 0, c'est [false] (= inRate). C'est le comportement du code, indépendamment des noms de paramètres.
- temporalSmoothing est LINÉAIRE (vitesse bornée à rate unités/s), temporalSmoothingNonLinear est EXPONENTIEL (st += dif * rate*dt/(1+rate*dt)), temporalSmoothingHybrid = exponentiel avec une vitesse minimale linearRate. Les taux d'entrée infinis sont ramenés à 1e30 (NonLinear, Hybrid) ou la borne basse à 1e-307 (Linear).
- temporalSmoothing:getCapped/getWithRateCapped bornent la sortie à [-1, 1] ; getUncapped = get (alias) et getWithRateUncapped = getWithRate (alias). Si autoCenterRate (3e argument du constructeur) diffère de inRate, getUncapped devient getUncappedAutoCenter ; getCapped passe par getUncapped, donc autocentrage actif seulement via getCapped/getUncapped, pas via get().
- newExponentialSmoothing : la constante interne est calculée avec fixedDt (0.0005 s par défaut) ; la fenêtre est exprimée en nombre d'échantillons (minimum 2). Ne pas l'utiliser à pas variable (utiliser getWindow ou un filtre temporel).
- lineFitting : échantillons x, y ; weight = pente, bias = ordonnée à l'origine. window est en nombre d'échantillons pour getS, en secondes pour get. Pour la stabilité numérique, mettre les entrées à l'échelle [0,1] ou [-1,1] (note du code). Si scale <= 0 ou nil, scale = 1000. lineFitting:set(window, ...) ne règle que decay avec la formule sample-based (1 - 2/(window+1)), mais get() recalcule decay à chaque appel.
- freqExists:get / getS / bufferStart-bufferAdd-bufferEnd implémentent l'algorithme de Goertzel pour mesurer l'amplitude d'une fréquence donnée dans un signal.
- Dans le code, getUncapped est référencé dans temporalSmoothing:getCapped mais n'est défini que par alias après la définition de la classe (temporalSmoothing.getUncapped = temporalSmoothing.get) : OK.
- temporalSigmoidSmoothing et temporalSpring ont leur propre convention : voir la description de chaque méthode.

## Classe `exponentialSmoothing`

Moyenne exponentielle à pas fixe.

| Méthode | Description | Ligne |
|---|---|---|
| `exponentialSmoothing:get(sample)` | Un pas de lissage vers sample avec le coefficient du constructeur. | 513 |
| `exponentialSmoothing:getWindow(sample, window)` | Un pas avec une fenêtre (en échantillons, min 2) fournie à l'appel. | 520 |
| `exponentialSmoothing:reset(value)` | Remet l'état à value, ou à la valeur de départ. | 535 |
| `exponentialSmoothing:set(value)` | Force la valeur. | 531 |
| `exponentialSmoothing:value()` | Valeur courante. | 527 |

## Classe `exponentialSmoothingT`

Moyenne exponentielle avec compensation de tendance.

| Méthode | Description | Ligne |
|---|---|---|
| `exponentialSmoothingT:get(sample)` | Un pas de lissage (fenêtres du constructeur). | 549 |
| `exponentialSmoothingT:getWindow(sample, window, window2)` | Un pas avec fenêtres fournies à l'appel. | 567 |
| `exponentialSmoothingT:reset(value)` | Remet état à value (ou valeur de départ) et efface la tendance. | 593 |
| `exponentialSmoothingT:set(value)` | Force la valeur (n'efface pas la tendance). | 589 |
| `exponentialSmoothingT:value()` | Valeur courante. | 585 |

## Classe `freqDetector`

Estime la période, l'amplitude et le biais DC d'un signal oscillant en suivant les pics et creux.

| Méthode | Description | Ligne |
|---|---|---|
| `freqDetector:get(sample, dt)` | Met à jour avec un échantillon. Renvoie période, amplitude de crête, temps depuis le dernier pic précédent (prevPeakDt) et biais DC. Le signal approché est cos(peakDt*2*pi/(période+1e-30))*ampl + bias. | 101 |
| `freqDetector:reset()` | Remet à zéro pics, creux, période, amplitude et biais. | 141 |
| `freqDetector:value(dt)` | Renvoie la dernière estimation (période, amplitude, prevPeakDt, biais) en avançant les chronomètres de dt (0 par défaut). | 146 |

## Classe `freqExists`

Mesure l'amplitude d'une fréquence précise dans un signal (algorithme de Goertzel).

| Méthode | Description | Ligne |
|---|---|---|
| `freqExists:bufferAdd(sample)` | Ajoute un échantillon au lot en cours. | 192 |
| `freqExists:bufferEnd()` | Termine le lot et renvoie l'amplitude de la fréquence. | 198 |
| `freqExists:bufferStart(dt, freq)` | Démarre un traitement par lot (buffer) pour la fréquence freq à pas dt. Suivre de bufferAdd pour chaque échantillon puis bufferEnd. | 188 |
| `freqExists:get(sample, dt, freq, cycleCount)` | Mode par cycles : accumule des échantillons et, tous les cycleCount cycles de freq, met à jour et renvoie l'amplitude (sinon renvoie la dernière amplitude). Plus de cycles = plus précis mais plus de latence. | 163 |
| `freqExists:getS(sample, dt, freq, winCoef)` | Mode glissant par échantillon : renvoie l'amplitude à chaque appel ; renvoie 0 si freq*dt >= 0.5 (au-delà de Nyquist). winCoef plus grand = plus précis mais plus lent. | 177 |
| `freqExists:reset()` | Remet l'état à zéro. | 204 |

## Classe `freqFilter1`

Filtre du premier ordre (état : state, state2, x). Toutes les méthodes prennent (sample, dt, ...) et renvoient la valeur filtrée. Ne mélanger qu'un seul type de filtre par objet (états partagés).

| Méthode | Description | Ligne |
|---|---|---|
| `freqFilter1:getBandPassFreq(sample, dt, lowFreq, highFreq)` | Passe-bande (passe-haut à lowFreq puis passe-bas à highFreq). | 53 |
| `freqFilter1:getBandPassPeriod(sample, dt, lowPeriod, highPeriod)` | Passe-bande avec périodes. | 62 |
| `freqFilter1:getBandStopFreq(sample, dt, lowFreq, highFreq)` | Coupe-bande (somme d'un passe-haut à highFreq et d'un passe-bas à lowFreq). | 70 |
| `freqFilter1:getBandStopPeriod(sample, dt, lowPeriod, highPeriod)` | Coupe-bande avec périodes. | 79 |
| `freqFilter1:getHighPassFreq(sample, dt, cutOffFreq)` | Passe-haut, coupure en Hz. | 41 |
| `freqFilter1:getHighPassPeriod(sample, dt, cutOffPeriod)` | Passe-haut, coupure en période. | 47 |
| `freqFilter1:getLowPassFreq(sample, dt, cutOffFreq)` | Passe-bas, coupure en Hz. | 27 |
| `freqFilter1:getLowPassPeriod(sample, dt, cutOffPeriod)` | Passe-bas, coupure donnée par une période (constante de temps 2*pi*... voir code : pdt = 2*pi*dt, filtre pdt/(pdt+période)). | 34 |

## Classe `lineFitting`

Régression linéaire récursive pondérée exponentiellement. Champs publics : weight, bias, plus bornes weightMin/Max et biasMin/Max.

| Méthode | Description | Ligne |
|---|---|---|
| `lineFitting:get(x, y, dt)` | Mise à jour avec pas de temps (fenêtre en secondes). Renvoie la pente et l'ordonnée. | 645 |
| `lineFitting:getS(x, y)` | Mise à jour par échantillon (fenêtre en échantillons). Renvoie la pente et l'ordonnée estimées. | 621 |
| `lineFitting:getX(y)` | x estimé pour y (inverse de la droite, garde contre pente nulle). | 678 |
| `lineFitting:getY(x)` | y estimé pour x : weight*x + bias. | 674 |
| `lineFitting:reset()` | Remet pente, ordonnée et matrice de covariance à l'état initial. | 688 |
| `lineFitting:set(window, weight, bias, weightMin, weightMax, biasMin, biasMax)` | Modifie fenêtre (decay), pente, ordonnée et bornes (les arguments nil gardent la valeur actuelle). | 682 |
| `lineFitting:value()` | Pente et ordonnée courantes. | 670 |

## Classe `linearSmoothing`

Lissage linéaire à pas de temps fixe fourni au constructeur.

| Méthode | Description | Ligne |
|---|---|---|
| `linearSmoothing:get(sample)` | Avance d'un pas vers sample (pas d'argument dt). | 469 |
| `linearSmoothing:reset()` | Remet l'état à 0. | 481 |
| `linearSmoothing:set(v)` | Force la valeur. | 477 |

## Classe `nopSmoothing`

Filtre de contournement (aucun lissage).

| Méthode | Description | Ligne |
|---|---|---|
| `nopSmoothing:get(sample)` | Renvoie sample tel quel. | 493 |
| `nopSmoothing:reset()` | Ne fait rien. | 500 |
| `nopSmoothing:set()` | Ne fait rien. | 497 |

## Classe `temporalSigmoidSmoothing`

Lissage en courbe en S avec limitation de vitesse (taux) et d'accélération.

| Méthode | Description | Ligne |
|---|---|---|
| `temporalSigmoidSmoothing:get(sample, dt)` | Avance d'un pas vers sample. La vitesse maximale est celle du constructeur (inRate / outRate selon que la valeur s'éloigne de 0). | 251 |
| `temporalSigmoidSmoothing:getWithRateAccel(sample, dt, ratelimit, startAccel, stopAccel)` | Comme get avec vitesse max et accélérations fournies (stopAccel défaut startAccel). | 273 |
| `temporalSigmoidSmoothing:reset()` | Remet état et vitesse à 0 (pas à la valeur initiale du constructeur). | 298 |
| `temporalSigmoidSmoothing:set(sample)` | Force la valeur et annule la vitesse. | 293 |
| `temporalSigmoidSmoothing:value()` | Valeur courante. | 303 |

## Classe `temporalSmoothing`

Lissage linéaire dépendant du temps (vitesse bornée). Alias : getUncapped = get, getWithRateUncapped = getWithRate.

| Méthode | Description | Ligne |
|---|---|---|
| `temporalSmoothing:get(sample, dt)` | Avance d'un pas vers sample à la vitesse (unités/s) inRate/outRate ; ne dépasse jamais la consigne. | 418 |
| `temporalSmoothing:getCapped(sample, dt)` | getUncapped puis borne la sortie à [-1, 1]. | 426 |
| `temporalSmoothing:getUncappedAutoCenter(sample, dt)` | Comme get mais avec autocentrage : si sample == 0 la vitesse est autoCenterRate. Devient getUncapped quand autoCenterRate ~= inRate. | 403 |
| `temporalSmoothing:getWithRate(sample, dt, rate)` | Comme get avec une vitesse fournie. | 430 |
| `temporalSmoothing:getWithRateCapped(sample, dt, rate)` | getWithRate borné à [-1, 1]. | 438 |
| `temporalSmoothing:reset()` | Remet l'état à startingValue du constructeur. | 445 |
| `temporalSmoothing:set(v)` | Force la valeur. | 453 |
| `temporalSmoothing:value()` | Valeur courante. | 449 |

## Classe `temporalSmoothingHybrid`

Lissage exponentiel avec vitesse minimale linéaire.

| Méthode | Description | Ligne |
|---|---|---|
| `temporalSmoothingHybrid:get(sample, dt)` | Avance d'un pas vers sample (taux choisi selon le sens, voir notes). | 317 |
| `temporalSmoothingHybrid:getWithRate(sample, dt, rate, linearRate)` | Comme get avec taux et vitesse linéaire fournis. | 326 |
| `temporalSmoothingHybrid:reset()` | Met l'état à 0 (pas à startingValue). | 343 |
| `temporalSmoothingHybrid:set(sample)` | Force la valeur. | 335 |
| `temporalSmoothingHybrid:value()` | Valeur courante. | 339 |

## Classe `temporalSmoothingNonLinear`

Lissage exponentiel dépendant du temps.

| Méthode | Description | Ligne |
|---|---|---|
| `temporalSmoothingNonLinear:get(sample, dt)` | Avance d'un pas vers sample. | 357 |
| `temporalSmoothingNonLinear:getWithRate(sample, dt, rate)` | Comme get avec taux fourni. | 366 |
| `temporalSmoothingNonLinear:reset()` | Met l'état à 0. | 382 |
| `temporalSmoothingNonLinear:set(sample)` | Force la valeur. | 374 |
| `temporalSmoothingNonLinear:value()` | Valeur courante. | 378 |

## Classe `temporalSpring`

Filtre ressort amorti : la valeur accélère vers la consigne avec inertie (vel).

| Méthode | Description | Ligne |
|---|---|---|
| `temporalSpring:get(sample, dt)` | Avance d'un pas vers sample avec la raideur/amortissement du constructeur. | 219 |
| `temporalSpring:getWithSpringDamp(sample, dt, spring, damp)` | Comme get avec raideur et amortissement fournis. | 225 |
| `temporalSpring:set(sample)` | Force la valeur et annule la vitesse. | 231 |
| `temporalSpring:value()` | Valeur courante. | 236 |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `freqGenC(period, ampl, t)` | Générateur de cosinus : cos(2*pi*t/period) * ampl. Utile pour des signaux de test. | 12 |
| `newExponentialSmoothing(window, startingValue, fixedDt)` | Crée une moyenne exponentielle à pas fixe, paramétrée par une fenêtre en nombre d'échantillons (minimum 2). | 506 |
| `newExponentialSmoothingT(window, window2, startingValue)` | Crée une moyenne exponentielle avec suivi de tendance (réduit le retard sur des rampes) ; window2 règle la mémoire de la tendance. | 543 |
| `newFreqDetector()` | Crée un détecteur de fréquence d'un signal oscillant (suit pics et creux). Voir la classe freqDetector. | 91 |
| `newFreqExists()` | Crée un détecteur d'amplitude à fréquence cible (algorithme de Goertzel). Voir la classe freqExists. | 157 |
| `newFreqFilter1()` | Crée un filtre du premier ordre (passe-bas, passe-haut, passe-bande, coupe-bande), avec état interne. Chaque méthode est appelée une fois par pas avec le nouvel échantillon. | 20 |
| `newLineFitting(window, weight, bias, scale, weightMin, weightMax, biasMin, biasMax)` | Crée un estimateur de droite y = weight*x + bias par moindres carrés à pondération exponentielle (mise à jour récursive). Mettre les entrées à l'échelle [0,1] ou [-1,1] pour la stabilité. | 603 |
| `newLinearSmoothing(dt, inRate, outRate)` | Crée un lissage linéaire à pas de temps FIXE dt (get ne prend pas dt) ; sans autocentrage. | 463 |
| `newNopSmoothing()` | Filtre neutre : get(sample) renvoie sample. Sert à désactiver un lissage sans changer le code appelant. | 489 |
| `newTemporalSigmoidSmoothing(inRate, startAccel, stopAccel, outRate, startingValue)` | Crée un lissage en courbe en S (accélération limitée au démarrage et à l'arrêt, vitesse bornée par le taux). Moins brutal que le lissage linéaire. | 244 |
| `newTemporalSmoothing(inRate, outRate, autoCenterRate, startingValue)` | Crée un lissage linéaire dans le temps (la valeur avance à vitesse bornée vers la consigne). Typique pour pédales, volant. Peut avoir un taux d'autocentrage quand la consigne est exactement 0. | 390 |
| `newTemporalSmoothingHybrid(inRate, outRate, startingValue, linearRate)` | Crée un lissage exponentiel avec vitesse minimale linéaire (évite la queue infinie de l'exponentielle). | 311 |
| `newTemporalSmoothingNonLinear(inRate, outRate, startingValue)` | Crée un lissage exponentiel pur : st += (sample - st) * r/(1+r) avec r = rate*dt. | 351 |
| `newTemporalSpring(spring, damp, startingValue)` | Crée un filtre ressort amorti qui suit la consigne (valeur lissée avec vitesse et inertie). | 214 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/filters.lua`.*
