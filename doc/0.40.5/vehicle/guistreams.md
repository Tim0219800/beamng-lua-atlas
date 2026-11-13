# `streams`

*Fichier : `lua/vehicle/guistreams.lua` · VM : Véhicule · 169 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `streams`

Flux de données envoyés à l'UI (apps du HUD) à haute fréquence. Chaque flux a un nom (wheelInfo, engineInfo, stats, electrics, sensors, environment, genericGraphAdvanced…) ; l'UI indique ceux dont elle a besoin via setRequiredStreams, et seuls ceux-là sont calculés puis mis en file avec guihooks.queueStream. Accessible en globale `streams` (main.lua : streams = require('guistreams')). guihooks.lua appelle streams.update() lors de l'envoi.

## Exemple

```lua
if streams.willSend('myStream') then
  guihooks.queueStream('myStream', {value = 42})
end
streams.drawGraph('speed', electrics.values.wheelspeed)
```

## Remarques

- willSend(name) est vrai seulement si guihooks.updateStreams (calculé dans main.lua:onGraphicsStep = flux actifs ET indicateur d'actualisation UI de obj) est vrai et si le flux est demandé : utile pour éviter de construire des données inutilement.
- hasActiveStreams() renvoie true tant que setRequiredStreams n'a jamais été appelée (par prudence au démarrage), puis seulement s'il reste au moins un flux demandé.
- wheelInfo : par roue, tableau à index numériques : [1] nom, [2] rayon, [3] wheelDir, [4] vitesse angulaire, [5] propulsionTorque, [6] lastSlip, [7] 0 (obsolète), [8] downForce, [9] brakingTorque, [10] brakeTorque, [11..13] centre statique de la roue x,y,z, [14] décalage le long de l'axe, [15] rotatorType ('wheel' par défaut), [16] parkingTorque. Les tables par roue sont réutilisées (cache).
- sensors : gx, gy, gz, gx2, gy2, gz2, forceAtWheelNorm, forceAtDriverNorm, curForceLimitNorm, torqueCurrent (hydros), position {x,y,z}, roll, pitch, yaw, gravity. environment : temperature (K), pressure (obj:getEnvPressure). stats : obj:calcBeamStats() + tri_count + collidable_tri_count. engineInfo : controller.mainController.engineInfo. electrics : electrics.values.
- La table streamsHandlers (une fonction par flux) est locale et n'est pas exportée dans M ; seuls reset, update, setRequiredStreams, willSend, hasActiveStreams et drawGraph le sont.
- drawGraph envoie le flux 'genericGraphAdvanced' avec un compteur de frame _fidx qui s'incrémente à chaque appel et la valeur de chaque clé k.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `streams.drawGraph(k, val)` | Ajoute une valeur au graphe générique avancé de l'UI (flux 'genericGraphAdvanced'), si ce flux est demandé. | 151 |
| `streams.hasActiveStreams()` | Indique si au moins un flux est demandé (ou si la liste n'a jamais été définie). Utilisé par main.lua:onGraphicsStep. *(interne)* | 146 |
| `streams.reset()` | Vide les flux demandés et le cache des positions statiques de roues. *(interne)* | 21 |
| `streams.setRequiredStreams(state)` | Définit la liste des flux demandés par l'UI (remplace la précédente). Appelée par le moteur/l'UI. *(interne)* | 137 |
| `streams.update()` | Appelée par guihooks lors de l'envoi des flux : exécute le gestionnaire de chaque flux demandé (ceux de streamsHandlers) qui met ses données en file. *(interne)* | 128 |
| `streams.willSend(name)` | Indique si un flux doit être envoyé cette frame (flux demandé par l'UI et envoi actif). | 17 |

### Détail des paramètres

#### `streams.drawGraph(k, val)`

Ajoute une valeur au graphe générique avancé de l'UI (flux 'genericGraphAdvanced'), si ce flux est demandé.

- `k` (*string*) : Nom de la série.
- `val` (*number*) : Valeur courante.

#### `streams.hasActiveStreams()`

Indique si au moins un flux est demandé (ou si la liste n'a jamais été définie). Utilisé par main.lua:onGraphicsStep.

- **renvoie** : boolean true si des flux sont actifs.

#### `streams.setRequiredStreams(state)`

Définit la liste des flux demandés par l'UI (remplace la précédente). Appelée par le moteur/l'UI.

- `state` (*string[]*) : Liste de noms de flux.

#### `streams.willSend(name)`

Indique si un flux doit être envoyé cette frame (flux demandé par l'UI et envoi actif).

- `name` (*string*) : Nom du flux.
- **renvoie** : boolean|nil Vrai si le flux doit être produit (peut renvoyer nil/false sinon).

## Classe `streamsHandlers`

Table locale (non exportée) des gestionnaires de flux, une fonction sans argument par nom de flux ; update() les appelle.

| Méthode | Description | Ligne |
|---|---|---|
| `streamsHandlers.electrics()` | Met en file electrics.values. | 100 |
| `streamsHandlers.engineInfo()` | Met en file controller.mainController.engineInfo. | 89 |
| `streamsHandlers.environment()` | Met en file température et pression ambiantes. | 122 |
| `streamsHandlers.sensors()` | Met en file accélérations, forces de volant, position, roulis/tangage/lacet et gravité. | 104 |
| `streamsHandlers.stats()` | Met en file obj:calcBeamStats() complété par tri_count et collidable_tri_count. | 93 |
| `streamsHandlers.wheelInfo()` | Construit et met en file le flux 'wheelInfo' (voir notes pour le format par roue). | 26 |

## Appels vers le moteur (C++)

- `obj:` `calcBeamStats`, `getCollidableTriangleCount`, `getEnvPressure`, `getEnvTemperature`, `getGravity`, `getPositionXYZ`, `getRollPitchYaw`, `getTriangleCount`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/guistreams.lua`.*
