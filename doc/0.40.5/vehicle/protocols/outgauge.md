# `protocols_outgauge`

*Fichier : `lua/vehicle/protocols/outgauge.lua` · VM : Véhicule · 139 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("protocols/outgauge")`

Protocole UDP OutGauge (compatible Live For Speed) : envoie vitesse, régime, rapport, pression de turbo, températures, carburant, entrées pédales et voyants du véhicule pour des tableaux de bord externes. Chargé par protocols.lua ; adresse, port et fréquence viennent des réglages protocols_outgauge_address, _port, _maxUpdateRate. Utilise le pas graphique (coût faible).

## Exemple

```lua
-- Activation : réglage 'protocols_outgauge_enabled'. Dans un logiciel de dashboard OutGauge, écouter le port UDP configuré.
```

## Remarques

- Paquet (struct C) : unsigned time (toujours 0) ; char car[4] = "beam" ; unsigned short flags ; char gear ; char plid (0) ; float speed (m/s) ; rpm (tr/min) ; turbo (bar) ; engTemp (°C) ; fuel (0..1) ; oilPressure (0, non géré) ; oilTemp (°C) ; unsigned dashLights ; unsigned showLights ; float throttle, brake, clutch (0..1) ; char display1[16], display2[16] (vides) ; int id (0).
- flags = OG_KM + OG_BAR (+ OG_TURBO si electrics.turboBoost existe) : indique des unités km/h et bar. Le turbo est convertit depuis psi (electrics.turboBoost / 14.504). Valeurs OG_x : 8192 turbo, 16384 km, 32768 bar.
- gear = electrics.gearIndex + 1 : 0 marche arrière, 1 point mort, 2 première, etc. (gearIndex vaut -1 en marche arrière).
- speed = electrics.wheelspeed, sinon airspeed ; rpm = electrics.rpm ; engTemp = electrics.watertemp ; oilTemp = electrics.oiltemp ; fuel = electrics.fuel.
- Voyants dashLights/showLights (bits 2^n) : SHIFT 0 (si contrôleur shiftLights présent, electrics.shouldShift), FULLBEAM 1 (highbeam), HANDBRAKE 2 (parkingbrake), TC 4 (esc ou tcs actifs, seulement si electrics.hasESC), SIGNAL_L 5 / SIGNAL_R 6 (clignotants), OILWARN 8 (electrics.oil), BATTERY 9 (moteur arrêté : engineRunning == 0), ABS 10 (electrics.absActive, seulement si hasABS). PITSPEED 3, SIGNAL_ANY 7, SPARE 11 ne sont pas utilisés (N/A).
- Bug/incohérence : fillStruct fait un `return` anticipé si electrics.values.watertemp est nil, mais protocols.lua envoie quand même le paquet (rempli de zéros) car l'envoi se fait après l'appel.
- Bug potentiel : electrics.values.gearIndex n'est pas protégé : s'il est nil, l'addition lève une erreur. Les comparaisons `~= 0` des voyants supposent des valeurs numériques (nil ~= 0 est vrai et allume le voyant si la valeur electrics n'existe pas : highbeam, parkingbrake, signal_L, signal_R, oil).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `protocols_outgauge.fillStruct(o, dtSim)` | Remplit le paquet à partir de electrics.values (vitesse, régime, rapport, turbo, températures, carburant, pédales, voyants). *(interne)* | 84 |
| `protocols_outgauge.getAddress()` | Adresse IP de destination (réglage protocols_outgauge_address). *(interne)* | 19 |
| `protocols_outgauge.getMaxUpdateRate()` | Fréquence maximale d'envoi en Hz (réglage protocols_outgauge_maxUpdateRate). *(interne)* | 21 |
| `protocols_outgauge.getPort()` | Port UDP de destination (réglage protocols_outgauge_port). *(interne)* | 20 |
| `protocols_outgauge.getStructDefinition()` | Renvoie la définition C du paquet OutGauge (texte passé à ffi.cdef). *(interne)* | 28 |
| `protocols_outgauge.init()` | Cherche les contrôleurs de type shiftLights pour savoir si le voyant de changement de rapport est disponible. *(interne)* | 13 |
| `protocols_outgauge.isPhysicsStepUsed()` | Indique que ce protocole est mis à jour dans la boucle graphique. *(interne)* | 23 |
| `protocols_outgauge.reset()` | Réinitialisation du protocole (ne fait rien). *(interne)* | 18 |

### Détail des paramètres

#### `protocols_outgauge.fillStruct(o, dtSim)`

Remplit le paquet à partir de electrics.values (vitesse, régime, rapport, turbo, températures, carburant, pédales, voyants).

- `o` (*cdata*) : Struct C du paquet à remplir (mise à zéro avant l'appel).
- `dtSim` (*number*) : Temps de simulation accumulé depuis le dernier envoi (non utilisé).

#### `protocols_outgauge.getAddress()`

Adresse IP de destination (réglage protocols_outgauge_address).

- **renvoie** : string Adresse IP.

#### `protocols_outgauge.getMaxUpdateRate()`

Fréquence maximale d'envoi en Hz (réglage protocols_outgauge_maxUpdateRate).

- **renvoie** : number Hz.

#### `protocols_outgauge.getPort()`

Port UDP de destination (réglage protocols_outgauge_port).

- **renvoie** : integer Numéro de port.

#### `protocols_outgauge.getStructDefinition()`

Renvoie la définition C du paquet OutGauge (texte passé à ffi.cdef).

- **renvoie** : string Corps de la struct C.

#### `protocols_outgauge.isPhysicsStepUsed()`

Indique que ce protocole est mis à jour dans la boucle graphique.

- **renvoie** : boolean Toujours false.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/protocols/outgauge.lua`.*
