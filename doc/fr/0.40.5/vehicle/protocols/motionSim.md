# `protocols_motionSim`

*Fichier : `lua/vehicle/protocols/motionSim.lua` · VM : Véhicule · 66 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("protocols/motionSim")`

Protocole UDP « MotionSim » (format 'BNG1') pour piloter une plateforme de mouvement : envoie position, vitesse, accélération (sans gravité), vecteur haut, angles, vitesses et accélérations angulaires du véhicule joueur. Chargé et géré par protocols.lua (jamais appelé directement). Adresse, port et fréquence viennent des réglages protocols_motionSim_address, _port et _maxUpdateRate. Utilise le pas de physique, donc coûteux mais précis (jusqu'à 2000 Hz).

## Exemple

```lua
-- Activation : réglage 'protocols_motionSim_enabled'. Les paquets sont émis sur UDP vers protocols_motionSim_address:protocols_motionSim_port.
```

## Remarques

- Paquet (struct C, tous les flottants sont 32 bits) : char format[4] = "BNG1" ; posX,posY,posZ ; velX,velY,velZ ; accX,accY,accZ ; upX,upY,upZ ; rollPos,pitchPos,yawPos ; rollVel,pitchVel,yawVel ; rollAcc,pitchAcc,yawAcc. Les valeurs viennent des champs correspondants de protocols.lua (lissées).
- Documentation externe du format : https://go.beamng.com/protocols (indiquée dans le code ; toute modification de la struct doit y être reportée).
- Les commentaires de fin de ligne du code (« return 4567 », « return "127.0.0.1" ») sont des valeurs d'exemple/défaut : le code lit réellement les réglages utilisateur.
- Aucune validation : si les lisseurs de protocols.lua ne sont pas encore initialisés, des champs peuvent être nil lors de fillStruct (valeur 0 attendue par ffi).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `protocols_motionSim.fillStruct(o, dtSim)` | Remplit le paquet avec les valeurs courantes de protocols.lua (position, vitesse, accélération, vecteur haut, angles, vitesses et accélérations angulaires). *(interne)* | 42 |
| `protocols_motionSim.getAddress()` | Adresse IP de destination, lue dans le réglage protocols_motionSim_address. *(interne)* | 14 |
| `protocols_motionSim.getMaxUpdateRate()` | Fréquence maximale d'envoi en Hz, lue dans le réglage protocols_motionSim_maxUpdateRate. *(interne)* | 16 |
| `protocols_motionSim.getPort()` | Port UDP de destination, lu dans le réglage protocols_motionSim_port. *(interne)* | 15 |
| `protocols_motionSim.getStructDefinition()` | Renvoie la définition C de la structure du paquet (texte passé à ffi.cdef). *(interne)* | 23 |
| `protocols_motionSim.init()` | Initialisation du protocole (ne fait rien). *(interne)* | 12 |
| `protocols_motionSim.isPhysicsStepUsed()` | Indique que ce protocole est mis à jour à chaque pas de physique. *(interne)* | 18 |
| `protocols_motionSim.reset()` | Réinitialisation du protocole (ne fait rien). *(interne)* | 13 |

### Détail des paramètres

#### `protocols_motionSim.fillStruct(o, dtSim)`

Remplit le paquet avec les valeurs courantes de protocols.lua (position, vitesse, accélération, vecteur haut, angles, vitesses et accélérations angulaires).

- `o` (*cdata*) : Struct C du paquet à remplir.
- `dtSim` (*number*) : Temps de simulation accumulé depuis le dernier envoi (non utilisé ici).

#### `protocols_motionSim.getAddress()`

Adresse IP de destination, lue dans le réglage protocols_motionSim_address.

- **renvoie** : string Adresse IP (par défaut typique 127.0.0.1).

#### `protocols_motionSim.getMaxUpdateRate()`

Fréquence maximale d'envoi en Hz, lue dans le réglage protocols_motionSim_maxUpdateRate.

- **renvoie** : number Hz.

#### `protocols_motionSim.getPort()`

Port UDP de destination, lu dans le réglage protocols_motionSim_port.

- **renvoie** : integer Numéro de port.

#### `protocols_motionSim.getStructDefinition()`

Renvoie la définition C de la structure du paquet (texte passé à ffi.cdef).

- **renvoie** : string Corps de la struct C.

#### `protocols_motionSim.isPhysicsStepUsed()`

Indique que ce protocole est mis à jour à chaque pas de physique.

- **renvoie** : boolean Toujours true.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/protocols/motionSim.lua`.*
