# `input`

*Fichier : `lua/vehicle/input.lua` · VM : Véhicule · 858 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `input`

Réception et filtrage des entrées de conduite du véhicule (volant, gaz, frein, frein à main, embrayage, et toute entrée spécifique au véhicule). Les actions de contrôle (clavier, manette, volant, IA, scripts) appellent input.event(type, valeur, filtre, …) ; la valeur est stockée dans input.state[type]. À chaque frame, input.updateGFX applique le filtre choisi (lissage clavier/manette, mise en correspondance d'angle du volant, assistances de direction), borne la valeur et l'écrit dans input[type] (ex. input.throttle) et dans electrics.values[type .. '_input']. Les modules du véhicule (controller, hydros, wheels, powertrain) lisent ensuite electrics.values.* ou input.*.

## Exemple

```lua
-- piloter la direction depuis une extension (comme straightLine) :
input.event('steering', -0.3, FILTER_DIRECT)   -- valeur -1..1, filtre direct
input.event('throttle', 1, FILTER_PAD)
local gaz = input.throttle                       -- valeur filtrée de la dernière frame
input.toggleEvent('parkingbrake')
```

## Remarques

- Constantes de filtre (common/inputFilters.lua) : FILTER_KBD = 0 (clavier, lissage avec taux dynamiques), FILTER_PAD = 1 (manette, lissage sans autocentrage), FILTER_DIRECT = 2 (valeur reprise telle quelle, pour volant physique/scripts), FILTER_KBD2 = 3 (clavier, variante), FILTER_AI = "FILTER_AI" (IA).
- Types d'entrée par défaut dans input.state : steering (-1..1), throttle (0..1), brake (0..1), parkingbrake (0..1), clutch (0..1). Chaque entrée est une table {val, filter, smootherKBD, smootherPAD, minLimit, maxLimit} + angle, lockType, osClockHP, source après un event. Une entrée spécifique au véhicule (autre nom) est acceptée par event mais avec un état par défaut (limites -1..1, lissage 10/10) et un log d'avertissement ; le créateur du véhicule devrait définir input.state[nom] = {minLimit, maxLimit, smootherKBD, smootherPAD, val=0, filter=0} dans son init.
- Les valeurs filtrées sont publiées à la fois comme champs du module (input.steering, input.throttle, input.brake, input.parkingbrake, input.clutch, input.<nom>) et dans electrics.values.<nom>_input (steering_input, throttle_input…). electrics.values.steeringUnassisted contient la direction avant assistances. Si osClockHP est fourni, electrics.values.<nom>_timestamp est aussi écrit.
- Mise en correspondance d'angle du volant (filtre direct, ou angle > 0 pour steering qui force FILTER_DIRECT) : lockType 0 = désactivé, 1 = normal (valeur x angle/(2 x steeringWheelLock)), 2 = progressif (plus rapide après mi-course pour garantir la butée), 3 = désactivé tant que l'angle du volant < angle du véhicule. vehicleSteeringWheelLock vient de v.data.input.steeringWheelLock ou de l'hydro steering_input, défaut 450 (degrés).
- Assistances de direction (réglages settings : steeringStabilization*, steeringUndersteerReduction*, steeringSlowdown*, steeringLimit*, steeringAutocenterEnabled) : contre-braquage anti-survirage, réduction de sous-virage selon le grip, ralentissement et limitation de la direction à haute vitesse. Chacune a une variante *Direct pour s'appliquer aussi au filtre direct. Les vitesses sont en m/s.
- setAllowedInputSource filtre les sources : tant qu'une entrée a une liste de sources autorisées, seul un event dont `source` y figure est pris en compte. La source par défaut d'un event est "local". Les valeurs reçues sont quand même mémorisées dans input.lastInputs[source][type].
- Quand le joueur humain conduit (anyPlayerSeated et pas d'IA), un changement de filtre de direction déclenche côté GE extensions.hook('onSteeringFilterChanged', nomDuFiltre).
- Le frein à main joue les sons handbrakeEngaging/Disengaging/Disengaged (si une roue a parkingTorque > 0) lors des changements de valeur.
- Incohérences repérées : M.keys est un reliquat de compatibilité (accès journalisé comme obsolète une seule fois) ; M.lowspeedCoef vaut toujours nil (seul M.lowspeedCoefFFB est affecté, dans initSecondStage, quand un hydro steering_input définit lowspeedCoefFFB) ; reset appelle `M:settingsChanged()` avec deux-points (M passé en argument inutilisé) ; updateUIAppDebugging utilise des globales non définies (smExtra2, dt) mais n'est jamais appelée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `input.event(itype, ivalue, filter, angle, lockType, osClockHP, source)` | Enregistre une valeur d'entrée pour la frame suivante. Le filtrage et la publication dans electrics se font dans updateGFX. Ignorée (mais mémorisée dans lastInputs) si des sources sont restreintes pour ce type et que `source` n'en fait pas partie. | 717 |
| `input.init()` | Premier étage d'initialisation (main.lua : initSystems) : recrée input.state avec les cinq entrées par défaut et leurs lisseurs. *(interne)* | 88 |
| `input.initSecondStage()` | Second étage (après sounds/electrics) : détermine l'angle de volant du véhicule (hydro steering_input ou v.data.input.steeringWheelLock), autocentrage et lowspeedCoefFFB demandés par l'hydro, crée les sons de frein à main, identifie roues avant/arrière pour les assistances, calcule les taux de lissage clavier, puis appelle reset(). *(interne)* | 144 |
| `input.kbdSteer(isRight, val, filter)` | Compatibilité clavier multi-touches : mémorise la valeur de la touche gauche ou droite et envoie event('steering', droite - gauche, filter). | 753 |
| `input.neutralizeControls()` | Remet à 0 (filtre clavier) toutes les entrées sauf le frein à main, et réinitialise les touches gauche/droite de kbdSteer. | 773 |
| `input.padAccelerateBrake(val, filter)` | Compatibilité manette mono-axe : val > 0 va sur throttle (frein à 0), val <= 0 va sur brake avec -val (gaz à 0). | 763 |
| `input.reset()` | Remet à zéro les lisseurs, lastInputs et l'état des assistances, relit les réglages. Appelée par main.lua au reset du véhicule et par initSecondStage. *(interne)* | 694 |
| `input.setAllowedInputSource(itype, source, enabled)` | Restreint ou libère les sources acceptées pour un type d'entrée. source == nil supprime la restriction ; sinon marque la source comme autorisée (enabled true) ou refusée (false). Dès qu'une table existe pour un type, seules les sources à true sont acceptées. | 834 |
| `input.settingsChanged()` | Relit les réglages (settings.getValue) des assistances de direction : stabilisation anti-survirage, réduction de sous-virage, ralentissement et limitation à haute vitesse, autocentrage à basse vitesse. Appelée par reset() et par onSettingsChanged de main.lua. Intervertit les vitesses de début/fin si elles sont inversées. *(interne)* | 783 |
| `input.toggleEvent(itype)` | Bascule une entrée : met val à 0 si elle dépasse 0.5, sinon à 1, avec le filtre 0 (clavier). Ignoré si le type n'existe pas dans state. Ne tient pas compte des sources autorisées. | 738 |
| `input.updateGFX(dt)` | Appelée à chaque frame graphique par main.lua, très tôt (après sensors et ai, avant electrics). Pour chaque entrée : applique le filtre (direct/pad/clavier/IA), la mise en correspondance d'angle et les assistances de direction, borne la valeur, joue les sons de frein à main et publie le résultat dans input[nom] et electrics.values[nom_input]. *(interne)* | 574 |

### Détail des paramètres

#### `input.event(itype, ivalue, filter, angle, lockType, osClockHP, source)`

Enregistre une valeur d'entrée pour la frame suivante. Le filtrage et la publication dans electrics se font dans updateGFX. Ignorée (mais mémorisée dans lastInputs) si des sources sont restreintes pour ce type et que `source` n'en fait pas partie.

- `itype` (*string*) : Type d'entrée : "steering", "throttle", "brake", "parkingbrake", "clutch" ou entrée spécifique au véhicule.
- `ivalue` (*number*) : Valeur brute (steering -1..1, autres 0..1 ; bornée par minLimit/maxLimit après filtrage).
- `filter` (*integer|string*) : FILTER_KBD (0), FILTER_PAD (1), FILTER_DIRECT (2), FILTER_KBD2 (3) ou FILTER_AI.
- `angle` (*number|nil*) : Angle du volant physique en degrés pour la mise en correspondance (steering uniquement).
- `lockType` (*integer|nil*) : Type de verrouillage d'angle : 0 désactivé, 1 normal, 2 plus rapide si nécessaire, 3 désactivé si nécessaire.
- `osClockHP` (*number|nil*) : Horodatage haute précision de l'évènement, publié dans electrics.values.<type>_timestamp.
- `source` (*string|nil*) : Origine de l'évènement ; "local" si nil.

#### `input.kbdSteer(isRight, val, filter)`

Compatibilité clavier multi-touches : mémorise la valeur de la touche gauche ou droite et envoie event('steering', droite - gauche, filter).

- `isRight` (*boolean*) : true pour la touche droite, false pour la gauche.
- `val` (*number*) : Valeur de la touche (0..1).
- `filter` (*integer*) : Filtre à utiliser.

#### `input.padAccelerateBrake(val, filter)`

Compatibilité manette mono-axe : val > 0 va sur throttle (frein à 0), val <= 0 va sur brake avec -val (gaz à 0).

- `val` (*number*) : Axe -1..1 (positif = accélération).
- `filter` (*integer*) : Filtre à utiliser.

#### `input.setAllowedInputSource(itype, source, enabled)`

Restreint ou libère les sources acceptées pour un type d'entrée. source == nil supprime la restriction ; sinon marque la source comme autorisée (enabled true) ou refusée (false). Dès qu'une table existe pour un type, seules les sources à true sont acceptées.

- `itype` (*string*) : Type d'entrée.
- `source` (*string|nil*) : Nom de la source ; nil pour supprimer toute restriction sur ce type.
- `enabled` (*boolean|nil*) : true pour autoriser la source, false pour la refuser.

#### `input.toggleEvent(itype)`

Bascule une entrée : met val à 0 si elle dépasse 0.5, sinon à 1, avec le filtre 0 (clavier). Ignoré si le type n'existe pas dans state. Ne tient pas compte des sources autorisées.

- `itype` (*string*) : Type d'entrée existant (ex. "parkingbrake").

#### `input.updateGFX(dt)`

Appelée à chaque frame graphique par main.lua, très tôt (après sensors et ai, avant electrics). Pour chaque entrée : applique le filtre (direct/pad/clavier/IA), la mise en correspondance d'angle et les assistances de direction, borne la valeur, joue les sons de frein à main et publie le résultat dans input[nom] et electrics.values[nom_input].

- `dt` (*number*) : Pas de temps de simulation en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `allowedInputSources` | table<string, table<string, boolean>> | Sources autorisées par type d'entrée ; absent = toutes. Géré par setAllowedInputSource. |
| `keys` | table | Compatibilité ancienne : toute lecture input.keys[x] est loguée comme obsolète (bindings spécifiques au véhicule à utiliser à la place). |
| `lastFilterType` | integer|string | Dernier filtre de direction vu par updateGFX (-1 au départ). |
| `lastInputs` | table<string, table<string, number>> | Dernière valeur brute reçue par source puis par type d'entrée (vidé au reset). |
| `lowspeedCoef` | nil | Toujours nil (déclaré mais jamais affecté, voir notes). |
| `state` | table<string, table> | Un état par type d'entrée (steering, throttle, brake, parkingbrake, clutch, + entrées véhicule) : val brute, filter, angle, lockType, osClockHP, source, minLimit/maxLimit, smoothers. Recréé par init(). |

## Classe `MT`

Métatable posée sur input.keys, uniquement pour la compatibilité : son __index loggue une erreur (une seule fois) indiquant que l'accès à input.keys est obsolète, puis renvoie rawget(M.keys, key).

| Méthode | Description | Ligne |
|---|---|---|
| `MT.__index(tbl, key)` | Journalise l'utilisation obsolète d'input.keys[key] puis renvoie la valeur brute. | 12 |

## Appels vers le moteur (C++)

- `obj:` `getDirectionVectorRightXYZ`, `getDirectionVectorXYZ`, `getGravity`, `getSmoothRefVelocityXYZ`, `getStaticFrictionCoef`, `queueGameEngineLua`, `wheelTurnRadius`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/input.lua`.*
