# `protocols`

*Fichier : `lua/vehicle/protocols.lua` · VM : Véhicule · 282 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `protocols`

Gestionnaire des protocoles de télémétrie UDP du véhicule (OutGauge pour tableaux de bord externes, MotionSim pour plateformes de mouvement). Au init, il charge chaque module de lua/vehicle/protocols/*.lua activé dans les réglages, ouvre un socket UDP par protocole, remplit un paquet C (ffi) à la fréquence demandée (temps réel, pas temps de simulation) et l'envoie. Il calcule aussi les grandeurs lissées partagées (vitesse, accélération, angles et vitesses angulaires) que les modules lisent dans protocols.xxx. N'agit que pour le premier joueur assis, et jamais en multi-siège.

## Exemple

```lua
-- Un module de protocole perso : lua/vehicle/protocols/monProto.lua doit exposer
-- init, reset (facultatifs), getAddress, getPort, getMaxUpdateRate, isPhysicsStepUsed, getStructDefinition, fillStruct(o, dtSim)
-- Il est activé par le réglage protocols_others_enabled.
```

## Remarques

- Réglages lus : protocols_outgauge_enabled, protocols_motionSim_enabled, protocols_others_enabled (tous les autres fichiers du dossier), multiseat (désactive tout), et protocols_smoothing_<velX|velY|velZ|accX|accY|accZ|rollPos|pitchPos|yawPos|rollVel|pitchVel|yawVel|rollAcc|pitchAcc|yawAcc> pour les constantes de lissage exponentiel.
- Champs lus par les modules de protocole dans la table protocols (M) : posX, posY, posZ (m, monde), velXSmoothed/velYSmoothed/velZSmoothed (m/s), accXSmoothed/accYSmoothed/accZSmoothed (m/s², signe inversé des capteurs, gravité non incluse selon le commentaire de motionSim), upX/upY/upZ (vecteur haut du véhicule), rollPosSmoothed/pitchPosSmoothed/yawPosSmoothed (angles ; roll et yaw négatifs « par convention des simulateurs »), rollVelSmoothed/pitchVelSmoothed/yawVelSmoothed (rad/s), rollAccSmoothed/pitchAccSmoothed/yawAccSmoothed (rad/s², dérivée des vitesses lissées). Ces champs sont créés dynamiquement à la première mise à jour des lisseurs.
- L'envoi a lieu à l'horloge murale : updatePeriod = 1 / getMaxUpdateRate() ; un protocole qui utilise le pas physique (isPhysicsStepUsed vrai) est mis à jour dans update(), les autres dans updateGFX().
- Le paquet est remis à zéro (ffi.fill) avant chaque fillStruct ; il est envoyé en UDP à (getAddress(), getPort()) même si fillStruct a quitté tôt (voir outgauge.fillStruct : paquet entièrement nul envoyé quand le véhicule n'est pas initialisé).
- La structure C est déclarée une seule fois par nom de protocole (typedef 'protocol_<nom>_t'). Une modification de getStructDefinition d'un module déjà chargé demande un redémarrage (ctrl-R ne suffit pas car la définition ffi persiste).
- Les fichiers du dossier protocols sont listés une seule fois (filesCache) : un nouveau fichier n'est vu qu'après rechargement du Lua (ctrl-R).
- M.update et M.updateGFX sont des nop au chargement et remplacés dans init() ; ⚠ nop est un global du jeu.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `protocols.destroy()` | Ferme les sockets UDP de tous les protocoles actifs et vide la liste. *(interne)* | 193 |
| `protocols.init()` | Détruit les protocoles existants, puis (si activés dans les réglages et si on n'est pas en multi-siège) charge, initialise et active chaque module de protocole trouvé, installe update/updateGFX et initialise les lisseurs. *(interne)* | 206 |
| `protocols.isPhysicsStepUsed()` | Indique si au moins un protocole actif demande le pas de physique ; sert à enregistrer update() dans la boucle de physique. *(interne)* | 257 |
| `protocols.onPlayersChanged(anyPlayerSeated)` | Hook appelé quand les joueurs assis changent : si un premier joueur est assis, remet les lisseurs à zéro. *(interne)* *(hook)* | 265 |
| `protocols.reset()` | Remet à zéro les lisseurs et appelle reset() de chaque module de protocole qui en définit une. *(interne)* | 125 |
| `protocols.settingsChanged()` | Hook appelé quand les réglages utilisateur changent : relance init() pour appliquer les nouveaux réglages de protocoles. *(interne)* | 261 |

### Détail des paramètres

#### `protocols.isPhysicsStepUsed()`

Indique si au moins un protocole actif demande le pas de physique ; sert à enregistrer update() dans la boucle de physique.

- **renvoie** : boolean true si un protocole utilise le pas physique.

#### `protocols.onPlayersChanged(anyPlayerSeated)`

Hook appelé quand les joueurs assis changent : si un premier joueur est assis, remet les lisseurs à zéro.

- `anyPlayerSeated` (*boolean*) : Vrai si au moins un joueur est assis (non utilisé directement).

## Champs

| Champ | Type | Description |
|---|---|---|
| `update` | function | nop, ou updatePhysics(dtSim) si au moins un protocole utilise le pas physique. Appelée à chaque pas de physique. |
| `updateGFX` | function | nop, ou la mise à jour graphique si au moins un protocole n'utilise pas le pas physique. |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `obj:` `getDirectionVectorUp`, `getPositionXYZ`, `getRollPitchYaw`, `getRollPitchYawAngularVelocity`, `getVelocityXYZ`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/protocols.lua`.*
