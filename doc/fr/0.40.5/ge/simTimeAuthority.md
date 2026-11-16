# `simTimeAuthority`

*Fichier : `lua/ge/simTimeAuthority.lua` · VM : Game Engine (GE) · 325 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `simTimeAuthority`

Autorité sur la vitesse du temps de simulation : pause, ralenti (bullet time) et reprise, avec lissage. Un moddeur l'utilise pour mettre le jeu en pause, régler un ralenti (0.001 à 1) ou empiler des demandes de pause (pushPauseRequest/popPauseRequest). Il synchronise le moteur C++ (be:setSimulationTimeScale, be:setEnabled) et le replay (core_replay), et prévient l'interface (messages bullettime).

## Exemple

```lua
simTimeAuthority.set(0.25)        -- ralenti au quart de vitesse (lissé)
simTimeAuthority.pause(true)      -- pause
simTimeAuthority.pushPauseRequest('monMod')
-- ... plus tard
simTimeAuthority.popPauseRequest('monMod')
```

## Remarques

- Les valeurs de vitesse sont limitées à [0.001, 1] par setTargetSpeed (clamp) : il n'y a pas de vitesse accélérée > 1 malgré les commentaires '2=fastmotion' du code.
- Les commentaires d'origine de get/getReal/set/setInstant sont décalés dans la page automatique : get() renvoie la vitesse DEMANDÉE (désirée), getReal() la vitesse EN VIGUEUR (après lissage), set() change la vitesse avec lissage progressif, setInstant() change aussi la valeur lissée immédiatement.
- Pendant la lecture d'un replay (core_replay.state.state == 'playback'), pause/pauseSmooth/togglePause/selectPreset délèguent au replay au lieu du moteur.
- pause() ne fait rien s'il n'y a pas de niveau chargé (getCurrentLevelIdentifier() nil) ; pause() fixe be:setEnabled et la vitesse tout de suite, alors que pauseSmooth() passe par une transition lissée jusqu'à vitesse 0.
- Pile de pause : pushPauseRequest/popPauseRequest comptent par identifiant (un même id n'est compté qu'une fois). À la dernière levée, la simulation ne reprend que si elle n'était pas déjà en pause avant le premier push. Les deux fonctions sont sans effet si core_intapi.debug_isPauseAllowed() renvoie faux.
- Les 12 crans de ralenti (selectionSlot) sont 1/1000, 1/500, 1/200, 1/100, 1/50, 1/32, 1/16, 1/8, 1/4, 1/2, 3/4 et 1 ; le cran de ralenti instantané et le cran 'toggle' valent le cran 8 (1/8).
- Au chargement du module, simulationSpeed est lu dans le moteur (be:getSimulationTimeScale()) pour rester synchrone après un rechargement du Lua GE ; selectionSlot est choisi comme le cran le plus proche.
- onSerialize/onDeserialized ont un TODO dans le code ('verify this is working') ; onDeserialized vide aussi la pile de pause.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `simTimeAuthority.clearPauseStack()` | Vide toutes les demandes de pause et reprend la simulation (pause(false)). | 269 |
| `simTimeAuthority.get()` | Renvoie la vitesse de simulation demandée (cible, pas forcément atteinte). | 152 |
| `simTimeAuthority.getInitialTimeScale()` | Renvoie la vitesse sauvegardée avant la dernière pause : c'est celle qui sera restaurée à la reprise. | 292 |
| `simTimeAuthority.getPause()` | Indique si le temps est en pause : état de pause du replay en lecture, sinon not be:getEnabled(). | 34 |
| `simTimeAuthority.getReal()` | Renvoie la vitesse effectivement appliquée au moteur (tient compte du lissage). | 148 |
| `simTimeAuthority.onDeserialized(data)` | Hook appelé après un rechargement du Lua GE : restaure simulationSpeed et la vitesse initiale, puis vide la pile de pause. *(interne)* *(hook)* | 284 |
| `simTimeAuthority.onSerialize()` | Hook appelé avant un rechargement du Lua GE : renvoie la vitesse demandée et la vitesse initiale. *(interne)* *(hook)* | 279 |
| `simTimeAuthority.onUIInitialised()` | Hook appelé quand l'interface est initialisée : vide la pile de pause (clearPauseStack). *(interne)* *(hook)* | 275 |
| `simTimeAuthority.pause(paused, playPauseSound)` | Met en pause ou reprend instantanément. Diffuse le hook onSimTimePauseCalled(paused). En pause : sauvegarde la vitesse courante, vitesse 0, be:setEnabled(false). À la reprise : restaure la vitesse sauvegardée avec lissage. Sans effet si l'état demandé est déjà celui en cours ou si aucun niveau n'est chargé. | 170 |
| `simTimeAuthority.pauseSmooth(paused, rateLimit, startAccel, stopAccel, playPauseSound)` | Pause ou reprise avec transition lissée de la vitesse (ralentissement progressif jusqu'à 0, ou accélération). Diffuse le hook simTimePauseCalled(paused). Les taux sont donnés par l'appelant et servent pour cette seule transition. | 199 |
| `simTimeAuthority.popPauseRequest(id)` | Retire une demande de pause identifiée. Quand le compteur retombe à 0 et que le jeu n'était pas en pause avant la première demande, la simulation reprend. | 256 |
| `simTimeAuthority.pushPauseRequest(id)` | Ajoute une demande de pause identifiée et met en pause. Mémorise si le jeu était déjà en pause à la première demande. Un même id n'est compté qu'une fois. | 242 |
| `simTimeAuthority.reportSpeed(speed, simplified)` | Affiche à l'écran (guihooks 'Message', catégorie bullettime) un message sur la vitesse : accéléré, temps réel, ralenti (simplifié) ou ralenti d'un facteur calculé avec l'option courante. | 64 |
| `simTimeAuthority.requestValue()` | Envoie à l'interface la vitesse demandée courante (guihooks 'BullettimeValueChanged'). | 166 |
| `simTimeAuthority.selectPreset(val)` | Sélectionne un cran de ralenti avec des touches de direction. Pendant un replay, pilote la vitesse du replay à la place. | 122 |
| `simTimeAuthority.set(val)` | Change la vitesse de simulation demandée (lissage progressif jusqu'à la nouvelle valeur) et affiche le message de vitesse simplifié. La valeur est limitée à [0.001, 1]. Une valeur non numérique est refusée avec une erreur loguée. | 156 |
| `simTimeAuthority.setInstant(val)` | Comme set, mais force aussi la valeur lissée : la vitesse est appliquée sans transition. Ne montre pas de message. | 161 |
| `simTimeAuthority.togglePause(playPauseSound)` | Bascule pause/reprise. Diffuse le hook onTogglePause ; en replay appelle core_replay.togglePlay(). | 229 |
| `simTimeAuthority.update(...)` | Fonction de mise à jour enregistrée auprès du système d'extensions : applique à chaque appel le lissage de vitesse en cours (envoie la vitesse au moteur via be:setSimulationTimeScale et physicsEngineEvent) et se désactive à la fin de la transition. Elle sert d'enveloppe car un pointeur de fonction enregistré ne peut pas être remplacé par nop. *(interne)* | 297 |

### Détail des paramètres

#### `simTimeAuthority.get()`

Renvoie la vitesse de simulation demandée (cible, pas forcément atteinte).

- **renvoie** : number 1 = temps réel, 0.5 = ralenti, 0 = pause.

#### `simTimeAuthority.getInitialTimeScale()`

Renvoie la vitesse sauvegardée avant la dernière pause : c'est celle qui sera restaurée à la reprise.

- **renvoie** : number Vitesse à restaurer.

#### `simTimeAuthority.getPause()`

Indique si le temps est en pause : état de pause du replay en lecture, sinon not be:getEnabled().

- **renvoie** : boolean true si en pause.

#### `simTimeAuthority.getReal()`

Renvoie la vitesse effectivement appliquée au moteur (tient compte du lissage).

- **renvoie** : number Vitesse en vigueur.

#### `simTimeAuthority.onDeserialized(data)`

Hook appelé après un rechargement du Lua GE : restaure simulationSpeed et la vitesse initiale, puis vide la pile de pause.

- `data` (*table*) : Table renvoyée par onSerialize : {simulationSpeed, initialTimeScale}.

#### `simTimeAuthority.onSerialize()`

Hook appelé avant un rechargement du Lua GE : renvoie la vitesse demandée et la vitesse initiale.

- **renvoie** : table {simulationSpeed = number, initialTimeScale = number}.

#### `simTimeAuthority.pause(paused, playPauseSound)`

Met en pause ou reprend instantanément. Diffuse le hook onSimTimePauseCalled(paused). En pause : sauvegarde la vitesse courante, vitesse 0, be:setEnabled(false). À la reprise : restaure la vitesse sauvegardée avec lissage. Sans effet si l'état demandé est déjà celui en cours ou si aucun niveau n'est chargé.

- `paused` (*boolean*) : true pour pause, false pour reprise.
- `playPauseSound` (*boolean|nil*) : true pour jouer le son de pause (event:>UI>Main>Pause) en entrant en pause.

#### `simTimeAuthority.pauseSmooth(paused, rateLimit, startAccel, stopAccel, playPauseSound)`

Pause ou reprise avec transition lissée de la vitesse (ralentissement progressif jusqu'à 0, ou accélération). Diffuse le hook simTimePauseCalled(paused). Les taux sont donnés par l'appelant et servent pour cette seule transition.

- `paused` (*boolean*) : true pour pause, false pour reprise.
- `rateLimit` (*number|nil*) : Taux maximal de variation de la vitesse (20 par défaut si nil).
- `startAccel` (*number|nil*) : Accélération au début de la transition (10 par défaut).
- `stopAccel` (*number|nil*) : Décélération à la fin de la transition (3 par défaut).
- `playPauseSound` (*boolean|nil*) : true pour jouer le son de pause.

#### `simTimeAuthority.popPauseRequest(id)`

Retire une demande de pause identifiée. Quand le compteur retombe à 0 et que le jeu n'était pas en pause avant la première demande, la simulation reprend.

- `id` (*string*) : Identifiant de la demande (le même que pour pushPauseRequest).

#### `simTimeAuthority.pushPauseRequest(id)`

Ajoute une demande de pause identifiée et met en pause. Mémorise si le jeu était déjà en pause à la première demande. Un même id n'est compté qu'une fois.

- `id` (*string*) : Identifiant unique de l'appelant.

#### `simTimeAuthority.reportSpeed(speed, simplified)`

Affiche à l'écran (guihooks 'Message', catégorie bullettime) un message sur la vitesse : accéléré, temps réel, ralenti (simplifié) ou ralenti d'un facteur calculé avec l'option courante.

- `speed` (*number*) : Vitesse à annoncer.
- `simplified` (*boolean*) : true : message générique de ralenti sans facteur ni indice de cran.

#### `simTimeAuthority.selectPreset(val)`

Sélectionne un cran de ralenti avec des touches de direction. Pendant un replay, pilote la vitesse du replay à la place.

- `val` (*string*) : '^' : bascule entre temps réel et le dernier cran de ralenti ; 'v' : cran de ralenti instantané (1/8) ; '<' : cran plus lent ; '>' : cran plus rapide.

#### `simTimeAuthority.set(val)`

Change la vitesse de simulation demandée (lissage progressif jusqu'à la nouvelle valeur) et affiche le message de vitesse simplifié. La valeur est limitée à [0.001, 1]. Une valeur non numérique est refusée avec une erreur loguée.

- `val` (*number*) : Nouvelle vitesse (1 = temps réel, 0.5 = moitié).

#### `simTimeAuthority.setInstant(val)`

Comme set, mais force aussi la valeur lissée : la vitesse est appliquée sans transition. Ne montre pas de message.

- `val` (*number*) : Nouvelle vitesse (limitée à [0.001, 1]).

#### `simTimeAuthority.togglePause(playPauseSound)`

Bascule pause/reprise. Diffuse le hook onTogglePause ; en replay appelle core_replay.togglePlay().

- `playPauseSound` (*boolean|nil*) : true pour jouer le son de pause.

#### `simTimeAuthority.update(...)`

Fonction de mise à jour enregistrée auprès du système d'extensions : applique à chaque appel le lissage de vitesse en cours (envoie la vitesse au moteur via be:setSimulationTimeScale et physicsEngineEvent) et se désactive à la fin de la transition. Elle sert d'enveloppe car un pointeur de fonction enregistré ne peut pas être remplacé par nop.

- `...` (*any*) : Arguments de la mise à jour ; le premier est dt (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `selectionSlot` | integer | Indice (1 à 12) du cran de ralenti sélectionné dans la table interne des crans (12 = temps réel). |
| `simulationSpeed` | number | Vitesse de simulation demandée (cible), 1 = temps réel, 0 = pause, 0.001 minimum hors pause. Initialisée depuis be:getSimulationTimeScale(). |
| `simulationSpeedReal` | number | Vitesse actuellement appliquée au moteur après lissage (mise à jour par la fonction update). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onSimTimePauseCalled`
- `onTogglePause` — écouté par 1 module(s)
- `simTimePauseCalled`

**Évènements UI (guihooks.trigger) :** `BullettimeValueChanged`, `Message`

## Appels vers le moteur (C++)

- `be:` `getEnabled`, `getSimulationTimeScale`, `setEnabled`, `setSimulationTimeScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/simTimeAuthority.lua`.*
