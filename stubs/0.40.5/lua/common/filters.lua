---@meta
-- tim19Atlas stub generated from lua/common/filters.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Moyenne exponentielle à pas fixe.
---@class filters_exponentialSmoothing
local filters_exponentialSmoothing = {}

--- Un pas de lissage vers sample avec le coefficient du constructeur.
---Source : lua/common/filters.lua:513
---@param sample number échantillon
---@return number  valeur filtrée
function filters_exponentialSmoothing:get(sample) end

--- Un pas avec une fenêtre (en échantillons, min 2) fournie à l'appel.
---Source : lua/common/filters.lua:520
---@param sample number échantillon
---@param window number fenêtre en échantillons
---@return number  valeur filtrée
function filters_exponentialSmoothing:getWindow(sample, window) end

--- Remet l'état à value, ou à la valeur de départ.
---Source : lua/common/filters.lua:535
---@param value number|nil valeur de reset
function filters_exponentialSmoothing:reset(value) end

--- Force la valeur.
---Source : lua/common/filters.lua:531
---@param value number valeur
function filters_exponentialSmoothing:set(value) end

--- Valeur courante.
---Source : lua/common/filters.lua:527
---@return number  état
function filters_exponentialSmoothing:value() end

--- Moyenne exponentielle avec compensation de tendance.
---@class filters_exponentialSmoothingT
local filters_exponentialSmoothingT = {}

--- Un pas de lissage (fenêtres du constructeur).
---Source : lua/common/filters.lua:549
---@param sample number échantillon
---@return number  valeur filtrée
function filters_exponentialSmoothingT:get(sample) end

--- Un pas avec fenêtres fournies à l'appel.
---Source : lua/common/filters.lua:567
---@param sample number échantillon
---@param window number fenêtre principale
---@param window2 number|nil fenêtre de tendance, défaut infinie
---@return number  valeur filtrée
function filters_exponentialSmoothingT:getWindow(sample, window, window2) end

--- Remet état à value (ou valeur de départ) et efface la tendance.
---Source : lua/common/filters.lua:593
---@param value number|nil valeur de reset
function filters_exponentialSmoothingT:reset(value) end

--- Force la valeur (n'efface pas la tendance).
---Source : lua/common/filters.lua:589
---@param value number valeur
function filters_exponentialSmoothingT:set(value) end

--- Valeur courante.
---Source : lua/common/filters.lua:585
---@return number  état
function filters_exponentialSmoothingT:value() end

--- Estime la période, l'amplitude et le biais DC d'un signal oscillant en suivant les pics et creux.
---@class filters_freqDetector
local filters_freqDetector = {}

--- Met à jour avec un échantillon. Renvoie période, amplitude de crête, temps depuis le dernier pic précédent (prevPeakDt) et biais DC. Le signal approché est cos(peakDt*2*pi/(période+1e-30))*ampl + bias.
---Source : lua/common/filters.lua:101
---@param sample number échantillon
---@param dt number pas de temps (s)
---@return number  période (s)
---@return number  amplitude de crête
---@return number  prevPeakDt
---@return number  biais DC
function filters_freqDetector:get(sample, dt) end

--- Remet à zéro pics, creux, période, amplitude et biais.
---Source : lua/common/filters.lua:141
function filters_freqDetector:reset() end

--- Renvoie la dernière estimation (période, amplitude, prevPeakDt, biais) en avançant les chronomètres de dt (0 par défaut).
---Source : lua/common/filters.lua:146
---@param dt number|nil temps écoulé depuis le dernier get, défaut 0
---@return number  période
---@return number  amplitude
---@return number  prevPeakDt
---@return number  biais
function filters_freqDetector:value(dt) end

--- Mesure l'amplitude d'une fréquence précise dans un signal (algorithme de Goertzel).
---@class filters_freqExists
local filters_freqExists = {}

--- Ajoute un échantillon au lot en cours.
---Source : lua/common/filters.lua:192
---@param sample number échantillon
function filters_freqExists:bufferAdd(sample) end

--- Termine le lot et renvoie l'amplitude de la fréquence.
---Source : lua/common/filters.lua:198
---@return number  amplitude
function filters_freqExists:bufferEnd() end

--- Démarre un traitement par lot (buffer) pour la fréquence freq à pas dt. Suivre de bufferAdd pour chaque échantillon puis bufferEnd.
---Source : lua/common/filters.lua:188
---@param dt number pas de temps (s)
---@param freq number fréquence cible (Hz)
function filters_freqExists:bufferStart(dt, freq) end

--- Mode par cycles : accumule des échantillons et, tous les cycleCount cycles de freq, met à jour et renvoie l'amplitude (sinon renvoie la dernière amplitude). Plus de cycles = plus précis mais plus de latence.
---Source : lua/common/filters.lua:163
---@param sample number échantillon
---@param dt number pas de temps (s)
---@param freq number fréquence cible (Hz)
---@param cycleCount number|nil nombre de cycles par mesure, défaut 1
---@return number  amplitude de freq
function filters_freqExists:get(sample, dt, freq, cycleCount) end

--- Mode glissant par échantillon : renvoie l'amplitude à chaque appel ; renvoie 0 si freq*dt >= 0.5 (au-delà de Nyquist). winCoef plus grand = plus précis mais plus lent.
---Source : lua/common/filters.lua:177
---@param sample number échantillon
---@param dt number pas de temps (s)
---@param freq number fréquence cible (Hz)
---@param winCoef number|nil coefficient de fenêtre, défaut 10
---@return number  amplitude
function filters_freqExists:getS(sample, dt, freq, winCoef) end

--- Remet l'état à zéro.
---Source : lua/common/filters.lua:204
function filters_freqExists:reset() end

--- Filtre du premier ordre (état : state, state2, x). Toutes les méthodes prennent (sample, dt, ...) et renvoient la valeur filtrée. Ne mélanger qu'un seul type de filtre par objet (états partagés).
---@class filters_freqFilter1
local filters_freqFilter1 = {}

--- Passe-bande (passe-haut à lowFreq puis passe-bas à highFreq).
---Source : lua/common/filters.lua:53
---@param sample number échantillon
---@param dt number pas de temps (s)
---@param lowFreq number fréquence basse (Hz)
---@param highFreq number fréquence haute (Hz)
---@return number  sortie filtrée
function filters_freqFilter1:getBandPassFreq(sample, dt, lowFreq, highFreq) end

--- Passe-bande avec périodes.
---Source : lua/common/filters.lua:62
---@param sample number échantillon
---@param dt number pas de temps (s)
---@param lowPeriod number période basse
---@param highPeriod number période haute
---@return number  sortie filtrée
function filters_freqFilter1:getBandPassPeriod(sample, dt, lowPeriod, highPeriod) end

--- Coupe-bande (somme d'un passe-haut à highFreq et d'un passe-bas à lowFreq).
---Source : lua/common/filters.lua:70
---@param sample number échantillon
---@param dt number pas de temps (s)
---@param lowFreq number fréquence basse (Hz)
---@param highFreq number fréquence haute (Hz)
---@return number  sortie filtrée
function filters_freqFilter1:getBandStopFreq(sample, dt, lowFreq, highFreq) end

--- Coupe-bande avec périodes.
---Source : lua/common/filters.lua:79
---@param sample number échantillon
---@param dt number pas de temps (s)
---@param lowPeriod number période basse
---@param highPeriod number période haute
---@return number  sortie filtrée
function filters_freqFilter1:getBandStopPeriod(sample, dt, lowPeriod, highPeriod) end

--- Passe-haut, coupure en Hz.
---Source : lua/common/filters.lua:41
---@param sample number échantillon
---@param dt number pas de temps (s)
---@param cutOffFreq number fréquence de coupure (Hz)
---@return number  sortie filtrée
function filters_freqFilter1:getHighPassFreq(sample, dt, cutOffFreq) end

--- Passe-haut, coupure en période.
---Source : lua/common/filters.lua:47
---@param sample number échantillon
---@param dt number pas de temps (s)
---@param cutOffPeriod number période de coupure (s)
---@return number  sortie filtrée
function filters_freqFilter1:getHighPassPeriod(sample, dt, cutOffPeriod) end

--- Passe-bas, coupure en Hz.
---Source : lua/common/filters.lua:27
---@param sample number échantillon
---@param dt number pas de temps (s)
---@param cutOffFreq number fréquence de coupure (Hz)
---@return number  sortie filtrée
function filters_freqFilter1:getLowPassFreq(sample, dt, cutOffFreq) end

--- Passe-bas, coupure donnée par une période (constante de temps 2*pi*... voir code : pdt = 2*pi*dt, filtre pdt/(pdt+période)).
---Source : lua/common/filters.lua:34
---@param sample number échantillon
---@param dt number pas de temps (s)
---@param cutOffPeriod number période de coupure (s)
---@return number  sortie filtrée
function filters_freqFilter1:getLowPassPeriod(sample, dt, cutOffPeriod) end

--- Régression linéaire récursive pondérée exponentiellement. Champs publics : weight, bias, plus bornes weightMin/Max et biasMin/Max.
---@class filters_lineFitting
local filters_lineFitting = {}

--- Mise à jour avec pas de temps (fenêtre en secondes). Renvoie la pente et l'ordonnée.
---Source : lua/common/filters.lua:645
---@param x number entrée x
---@param y number sortie y
---@param dt number pas de temps (s)
---@return number  weight
---@return number  bias
function filters_lineFitting:get(x, y, dt) end

--- Mise à jour par échantillon (fenêtre en échantillons). Renvoie la pente et l'ordonnée estimées.
---Source : lua/common/filters.lua:621
---@param x number entrée x
---@param y number sortie y
---@return number  weight (pente)
---@return number  bias (ordonnée à l'origine)
function filters_lineFitting:getS(x, y) end

--- x estimé pour y (inverse de la droite, garde contre pente nulle).
---Source : lua/common/filters.lua:678
---@param y number y
---@return number  x
function filters_lineFitting:getX(y) end

--- y estimé pour x : weight*x + bias.
---Source : lua/common/filters.lua:674
---@param x number x
---@return number  y
function filters_lineFitting:getY(x) end

--- Remet pente, ordonnée et matrice de covariance à l'état initial.
---Source : lua/common/filters.lua:688
function filters_lineFitting:reset() end

--- Modifie fenêtre (decay), pente, ordonnée et bornes (les arguments nil gardent la valeur actuelle).
---Source : lua/common/filters.lua:682
---@param window number|nil nouvelle fenêtre (échantillons)
---@param weight number|nil pente
---@param bias number|nil ordonnée
---@param weightMin number|nil borne basse pente
---@param weightMax number|nil borne haute pente
---@param biasMin number|nil borne basse ordonnée
---@param biasMax number|nil borne haute ordonnée
function filters_lineFitting:set(window, weight, bias, weightMin, weightMax, biasMin, biasMax) end

--- Pente et ordonnée courantes.
---Source : lua/common/filters.lua:670
---@return number  weight
---@return number  bias
function filters_lineFitting:value() end

--- Lissage linéaire à pas de temps fixe fourni au constructeur.
---@class filters_linearSmoothing
local filters_linearSmoothing = {}

--- Avance d'un pas vers sample (pas d'argument dt).
---Source : lua/common/filters.lua:469
---@param sample number consigne
---@return number  valeur filtrée
function filters_linearSmoothing:get(sample) end

--- Remet l'état à 0.
---Source : lua/common/filters.lua:481
function filters_linearSmoothing:reset() end

--- Force la valeur.
---Source : lua/common/filters.lua:477
---@param v number valeur
function filters_linearSmoothing:set(v) end

--- Filtre de contournement (aucun lissage).
---@class filters_nopSmoothing
local filters_nopSmoothing = {}

--- Renvoie sample tel quel.
---Source : lua/common/filters.lua:493
---@param sample number valeur
---@return number  sample
function filters_nopSmoothing:get(sample) end

--- Ne fait rien.
---Source : lua/common/filters.lua:500
function filters_nopSmoothing:reset() end

--- Ne fait rien.
---Source : lua/common/filters.lua:497
function filters_nopSmoothing:set() end

--- Lissage en courbe en S avec limitation de vitesse (taux) et d'accélération.
---@class filters_temporalSigmoidSmoothing
local filters_temporalSigmoidSmoothing = {}

--- Avance d'un pas vers sample. La vitesse maximale est celle du constructeur (inRate / outRate selon que la valeur s'éloigne de 0).
---Source : lua/common/filters.lua:251
---@param sample number consigne
---@param dt number pas de temps (s)
---@return number  valeur filtrée
function filters_temporalSigmoidSmoothing:get(sample, dt) end

--- Comme get avec vitesse max et accélérations fournies (stopAccel défaut startAccel).
---Source : lua/common/filters.lua:273
---@param sample number consigne
---@param dt number pas de temps (s)
---@param ratelimit number vitesse maximale
---@param startAccel number accélération de départ
---@param stopAccel number|nil décélération d'arrivée
---@return number  valeur filtrée
function filters_temporalSigmoidSmoothing:getWithRateAccel(sample, dt, ratelimit, startAccel, stopAccel) end

--- Remet état et vitesse à 0 (pas à la valeur initiale du constructeur).
---Source : lua/common/filters.lua:298
function filters_temporalSigmoidSmoothing:reset() end

--- Force la valeur et annule la vitesse.
---Source : lua/common/filters.lua:293
---@param sample number valeur
function filters_temporalSigmoidSmoothing:set(sample) end

--- Valeur courante.
---Source : lua/common/filters.lua:303
---@return number  état
function filters_temporalSigmoidSmoothing:value() end

--- Lissage linéaire dépendant du temps (vitesse bornée). Alias : getUncapped = get, getWithRateUncapped = getWithRate.
---@class filters_temporalSmoothing
local filters_temporalSmoothing = {}

--- Avance d'un pas vers sample à la vitesse (unités/s) inRate/outRate ; ne dépasse jamais la consigne.
---Source : lua/common/filters.lua:418
---@param sample number consigne
---@param dt number pas de temps (s)
---@return number  valeur filtrée
function filters_temporalSmoothing:get(sample, dt) end

--- getUncapped puis borne la sortie à [-1, 1].
---Source : lua/common/filters.lua:426
---@param sample number consigne
---@param dt number pas de temps (s)
---@return number  valeur dans [-1,1]
function filters_temporalSmoothing:getCapped(sample, dt) end

--- Comme get mais avec autocentrage : si sample == 0 la vitesse est autoCenterRate. Devient getUncapped quand autoCenterRate ~= inRate.
---Source : lua/common/filters.lua:403
---@param sample number consigne
---@param dt number pas de temps (s)
---@return number  valeur filtrée
function filters_temporalSmoothing:getUncappedAutoCenter(sample, dt) end

--- Comme get avec une vitesse fournie.
---Source : lua/common/filters.lua:430
---@param sample number consigne
---@param dt number pas de temps (s)
---@param rate number vitesse (unités/s)
---@return number  valeur filtrée
function filters_temporalSmoothing:getWithRate(sample, dt, rate) end

--- getWithRate borné à [-1, 1].
---Source : lua/common/filters.lua:438
---@param sample number consigne
---@param dt number pas de temps (s)
---@param rate number vitesse (unités/s)
---@return number  valeur dans [-1,1]
function filters_temporalSmoothing:getWithRateCapped(sample, dt, rate) end

--- Remet l'état à startingValue du constructeur.
---Source : lua/common/filters.lua:445
function filters_temporalSmoothing:reset() end

--- Force la valeur.
---Source : lua/common/filters.lua:453
---@param v number valeur
function filters_temporalSmoothing:set(v) end

--- Valeur courante.
---Source : lua/common/filters.lua:449
---@return number  état
function filters_temporalSmoothing:value() end

--- Lissage exponentiel avec vitesse minimale linéaire.
---@class filters_temporalSmoothingHybrid
local filters_temporalSmoothingHybrid = {}

--- Avance d'un pas vers sample (taux choisi selon le sens, voir notes).
---Source : lua/common/filters.lua:317
---@param sample number consigne
---@param dt number pas de temps (s)
---@return number  valeur filtrée
function filters_temporalSmoothingHybrid:get(sample, dt) end

--- Comme get avec taux et vitesse linéaire fournis.
---Source : lua/common/filters.lua:326
---@param sample number consigne
---@param dt number pas de temps (s)
---@param rate number taux exponentiel (1/s)
---@param linearRate number|nil vitesse minimale, défaut 0
---@return number  valeur filtrée
function filters_temporalSmoothingHybrid:getWithRate(sample, dt, rate, linearRate) end

--- Met l'état à 0 (pas à startingValue).
---Source : lua/common/filters.lua:343
function filters_temporalSmoothingHybrid:reset() end

--- Force la valeur.
---Source : lua/common/filters.lua:335
---@param sample number valeur
function filters_temporalSmoothingHybrid:set(sample) end

--- Valeur courante.
---Source : lua/common/filters.lua:339
---@return number  état
function filters_temporalSmoothingHybrid:value() end

--- Lissage exponentiel dépendant du temps.
---@class filters_temporalSmoothingNonLinear
local filters_temporalSmoothingNonLinear = {}

--- Avance d'un pas vers sample.
---Source : lua/common/filters.lua:357
---@param sample number consigne
---@param dt number pas de temps (s)
---@return number  valeur filtrée
function filters_temporalSmoothingNonLinear:get(sample, dt) end

--- Comme get avec taux fourni.
---Source : lua/common/filters.lua:366
---@param sample number consigne
---@param dt number pas de temps (s)
---@param rate number taux (1/s)
---@return number  valeur filtrée
function filters_temporalSmoothingNonLinear:getWithRate(sample, dt, rate) end

--- Met l'état à 0.
---Source : lua/common/filters.lua:382
function filters_temporalSmoothingNonLinear:reset() end

--- Force la valeur.
---Source : lua/common/filters.lua:374
---@param sample number valeur
function filters_temporalSmoothingNonLinear:set(sample) end

--- Valeur courante.
---Source : lua/common/filters.lua:378
---@return number  état
function filters_temporalSmoothingNonLinear:value() end

--- Filtre ressort amorti : la valeur accélère vers la consigne avec inertie (vel).
---@class filters_temporalSpring
local filters_temporalSpring = {}

--- Avance d'un pas vers sample avec la raideur/amortissement du constructeur.
---Source : lua/common/filters.lua:219
---@param sample number consigne
---@param dt number pas de temps (s)
---@return number  valeur filtrée
function filters_temporalSpring:get(sample, dt) end

--- Comme get avec raideur et amortissement fournis.
---Source : lua/common/filters.lua:225
---@param sample number consigne
---@param dt number pas de temps (s)
---@param spring number raideur
---@param damp number amortissement
---@return number  valeur filtrée
function filters_temporalSpring:getWithSpringDamp(sample, dt, spring, damp) end

--- Force la valeur et annule la vitesse.
---Source : lua/common/filters.lua:231
---@param sample number valeur
function filters_temporalSpring:set(sample) end

--- Valeur courante.
---Source : lua/common/filters.lua:236
---@return number  état
function filters_temporalSpring:value() end

--- Générateur de cosinus : cos(2*pi*t/period) * ampl. Utile pour des signaux de test.
---Source : lua/common/filters.lua:12
---@param period number période en secondes (1e-30 ajouté pour éviter la division par zéro)
---@param ampl number amplitude
---@param t number temps en secondes
---@return number  valeur du signal
function freqGenC(period, ampl, t) end

--- Crée une moyenne exponentielle à pas fixe, paramétrée par une fenêtre en nombre d'échantillons (minimum 2).
---Source : lua/common/filters.lua:506
---@param window number fenêtre en échantillons
---@param startingValue number|nil valeur initiale, défaut 0
---@param fixedDt number|nil pas de temps de référence, défaut 0.0005 s
---@return exponentialSmoothing  filtre
function newExponentialSmoothing(window, startingValue, fixedDt) end

--- Crée une moyenne exponentielle avec suivi de tendance (réduit le retard sur des rampes) ; window2 règle la mémoire de la tendance.
---Source : lua/common/filters.lua:543
---@param window number fenêtre en échantillons (min 2)
---@param window2 number|nil fenêtre de tendance, défaut infinie
---@param startingValue number|nil valeur initiale, défaut 0
---@return exponentialSmoothingT  filtre
function newExponentialSmoothingT(window, window2, startingValue) end

--- Crée un détecteur de fréquence d'un signal oscillant (suit pics et creux). Voir la classe freqDetector.
---Source : lua/common/filters.lua:91
---@return freqDetector  détecteur
function newFreqDetector() end

--- Crée un détecteur d'amplitude à fréquence cible (algorithme de Goertzel). Voir la classe freqExists.
---Source : lua/common/filters.lua:157
---@return freqExists  détecteur
function newFreqExists() end

--- Crée un filtre du premier ordre (passe-bas, passe-haut, passe-bande, coupe-bande), avec état interne. Chaque méthode est appelée une fois par pas avec le nouvel échantillon.
---Source : lua/common/filters.lua:20
---@return freqFilter1  filtre
function newFreqFilter1() end

--- Crée un estimateur de droite y = weight*x + bias par moindres carrés à pondération exponentielle (mise à jour récursive). Mettre les entrées à l'échelle [0,1] ou [-1,1] pour la stabilité.
---Source : lua/common/filters.lua:603
---@param window number mémoire : en échantillons (getS) ou en secondes (get)
---@param weight number|nil pente initiale, défaut 0
---@param bias number|nil ordonnée initiale, défaut 0
---@param scale number|nil échelle d'initialisation de la matrice de covariance, défaut 1000
---@param weightMin number|nil borne basse pente
---@param weightMax number|nil borne haute pente
---@param biasMin number|nil borne basse ordonnée
---@param biasMax number|nil borne haute ordonnée
---@return lineFitting  estimateur
function newLineFitting(window, weight, bias, scale, weightMin, weightMax, biasMin, biasMax) end

--- Crée un lissage linéaire à pas de temps FIXE dt (get ne prend pas dt) ; sans autocentrage.
---Source : lua/common/filters.lua:463
---@param dt number pas de temps fixe en secondes
---@param inRate number|nil vitesse quand la valeur revient vers 0, défaut 1
---@param outRate number|nil vitesse quand elle s'éloigne de 0, défaut inRate
---@return linearSmoothing  filtre
function newLinearSmoothing(dt, inRate, outRate) end

--- Filtre neutre : get(sample) renvoie sample. Sert à désactiver un lissage sans changer le code appelant.
---Source : lua/common/filters.lua:489
---@return nopSmoothing  filtre
function newNopSmoothing() end

--- Crée un lissage en courbe en S (accélération limitée au démarrage et à l'arrêt, vitesse bornée par le taux). Moins brutal que le lissage linéaire.
---Source : lua/common/filters.lua:244
---@param inRate number|nil vitesse max (unités/s), défaut 1
---@param startAccel number|nil accélération de départ, défaut +infini
---@param stopAccel number|nil décélération d'arrivée, défaut startAccel
---@param outRate number|nil vitesse max quand la valeur s'éloigne de 0 (clé true), défaut inRate
---@param startingValue number|nil valeur initiale, défaut 0
---@return temporalSigmoidSmoothing  filtre
function newTemporalSigmoidSmoothing(inRate, startAccel, stopAccel, outRate, startingValue) end

--- Crée un lissage linéaire dans le temps (la valeur avance à vitesse bornée vers la consigne). Typique pour pédales, volant. Peut avoir un taux d'autocentrage quand la consigne est exactement 0.
---Source : lua/common/filters.lua:390
---@param inRate number|nil vitesse (unités/s) quand la valeur revient vers 0, défaut 1, min 1e-307
---@param outRate number|nil vitesse quand elle s'éloigne de 0, défaut inRate
---@param autoCenterRate number|nil vitesse d'autocentrage quand sample == 0, défaut inRate
---@param startingValue number|nil valeur initiale (aussi valeur de reset), défaut 0
---@return temporalSmoothing  filtre
function newTemporalSmoothing(inRate, outRate, autoCenterRate, startingValue) end

--- Crée un lissage exponentiel avec vitesse minimale linéaire (évite la queue infinie de l'exponentielle).
---Source : lua/common/filters.lua:311
---@param inRate number|nil taux exponentiel (1/s), défaut 1, borné à 1e30
---@param outRate number|nil taux quand l'écart a le même signe que l'état, défaut inRate
---@param startingValue number|nil valeur initiale, défaut 0
---@param linearRate number|nil vitesse minimale (unités/s), défaut 0
---@return temporalSmoothingHybrid  filtre
function newTemporalSmoothingHybrid(inRate, outRate, startingValue, linearRate) end

--- Crée un lissage exponentiel pur : st += (sample - st) * r/(1+r) avec r = rate*dt.
---Source : lua/common/filters.lua:351
---@param inRate number|nil taux (1/s), défaut 1, borné à 1e30
---@param outRate number|nil taux quand l'écart a le même signe que l'état, défaut inRate
---@param startingValue number|nil valeur initiale, défaut 0
---@return temporalSmoothingNonLinear  filtre
function newTemporalSmoothingNonLinear(inRate, outRate, startingValue) end

--- Crée un filtre ressort amorti qui suit la consigne (valeur lissée avec vitesse et inertie).
---Source : lua/common/filters.lua:214
---@param spring number|nil raideur, défaut 10
---@param damp number|nil amortissement, défaut 2
---@param startingValue number|nil valeur initiale, défaut 0
---@return temporalSpring  filtre
function newTemporalSpring(spring, damp, startingValue) end

