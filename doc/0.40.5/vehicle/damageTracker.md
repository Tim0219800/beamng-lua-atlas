# `damageTracker`

*Fichier : `lua/vehicle/damageTracker.lua` · VM : Véhicule · 127 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `damageTracker`

Registre des états de dommage du véhicule, organisés par groupe puis par nom (ex. groupe 'energyStorage', nom du réservoir). Chaque changement est mis en file et envoyé à l'UI toutes les 1/3 s via le hook `DamageData`, avec des callbacks optionnels pour d'autres modules. Un moddeur appelle setDamage pour signaler une panne et getDamage pour la lire.

## Exemple

```lua
damageTracker.setDamage("engine", "overheat", true, true)   -- notifie aussi l'UI
local broken = damageTracker.getDamage("engine", "overheat")
damageTracker.setDamageTemporary("engine", "overheat", true, false, 5)
```

## Remarques

- Le message UI utilise la clé de traduction `vehicle.<group>.<name>.<value>` et n'est envoyé qu'aux joueurs assis (guihooks.messageForSeatedPlayers).
- setDamage ne fait rien si la valeur est inchangée. Il active la boucle updateGFXDirty, qui se remet à nop dès que plus rien n'est à envoyer ni à expirer.
- damageData est envoyé en entier au hook DamageData ; les callbacks reçoivent (damageData, damageDataDelta) où damageDataDelta ne contient que les changements depuis le dernier envoi.
- getDamage renvoie false (et non nil) pour un couple inconnu ou une valeur nil/false.
- init vide aussi la liste des callbacks (registerDamageUpdateCallback), reset ne la vide pas.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `damageTracker.getDamage(group, name)` | Lit l'état de dommage d'un couple groupe/nom. | 78 |
| `damageTracker.init()` | Appelé à la création du véhicule : vide données, deltas, callbacks et temporisations. *(interne)* | 106 |
| `damageTracker.registerDamageUpdateCallback(callback)` | Ajoute un callback appelé à chaque envoi de DamageData avec (damageData, damageDataDelta). Ignoré si nil. | 91 |
| `damageTracker.reset()` | Appelé au reset : vide données, deltas et temporisations (garde les callbacks). *(interne)* | 98 |
| `damageTracker.sendNow()` | Force l'envoi du hook DamageData et des callbacks à la prochaine frame (remet le minuteur à 0). | 82 |
| `damageTracker.setDamage(group, name, value, notifyUI)` | Définit l'état de dommage d'un couple groupe/nom (annule toute temporisation en cours sur ce couple). | 46 |
| `damageTracker.setDamageTemporary(group, name, value, timeoutValue, timeout, notifyUI)` | Comme setDamage mais programme un retour à timeoutValue après timeout secondes. | 72 |
| `damageTracker.updateGFX(dt)` | Vaut nop au repos ; devient updateGFXDirty quand un dommage change ou doit expirer. Envoie périodiquement DamageData et décompte les dommages temporaires. Appelé chaque frame par la boucle principale. (assignée dynamiquement) *(interne)* | dyn |
| `damageTracker.willSend()` | Indique si un envoi vient juste d'être armé (minuteur à sa valeur pleine) et qu'un premier joueur est assis. | 87 |

### Détail des paramètres

#### `damageTracker.getDamage(group, name)`

Lit l'état de dommage d'un couple groupe/nom.

- `group` (*string*) : Groupe.
- `name` (*string*) : Nom.
- **renvoie** : any La valeur, ou false si absente.

#### `damageTracker.registerDamageUpdateCallback(callback)`

Ajoute un callback appelé à chaque envoi de DamageData avec (damageData, damageDataDelta). Ignoré si nil.

- `callback` (*function*) : function(damageData, damageDataDelta).

#### `damageTracker.setDamage(group, name, value, notifyUI)`

Définit l'état de dommage d'un couple groupe/nom (annule toute temporisation en cours sur ce couple).

- `group` (*string*) : Groupe de dommage (ex. 'energyStorage').
- `name` (*string*) : Nom dans le groupe.
- `value` (*boolean|number|string*) : Valeur du dommage (en pratique true/false).
- `notifyUI` (*boolean|nil*) : Si vrai, affiche un message à l'écran.

#### `damageTracker.setDamageTemporary(group, name, value, timeoutValue, timeout, notifyUI)`

Comme setDamage mais programme un retour à timeoutValue après timeout secondes.

- `group` (*string*) : Groupe.
- `name` (*string*) : Nom.
- `value` (*any*) : Valeur immédiate.
- `timeoutValue` (*any*) : Valeur appliquée à l'expiration.
- `timeout` (*number*) : Délai en secondes.
- `notifyUI` (*boolean|nil*) : Notifier l'UI à l'application immédiate.

#### `damageTracker.updateGFX(dt)`

Vaut nop au repos ; devient updateGFXDirty quand un dommage change ou doit expirer. Envoie périodiquement DamageData et décompte les dommages temporaires. Appelé chaque frame par la boucle principale. (assignée dynamiquement)

- `dt` (*number*) : Pas de temps en secondes.

#### `damageTracker.willSend()`

Indique si un envoi vient juste d'être armé (minuteur à sa valeur pleine) et qu'un premier joueur est assis.

- **renvoie** : boolean true si l'envoi est imminent.

**Évènements UI (guihooks.trigger) :** `DamageData`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/damageTracker.lua`.*
