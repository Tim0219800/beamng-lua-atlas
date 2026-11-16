# `debug_advancedExternalDebug`

*Fichier : `lua/vehicle/extensions/debug/advancedExternalDebug.lua` · VM : Véhicule · 139 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `debug_advancedExternalDebug` : `extensions.load (VM véhicule)("debug_advancedExternalDebug")`, puis la globale `debug_advancedExternalDebug`

Extension de débogage qui envoie des paquets JSON par UDP à un outil externe (AED, 'Advanced External Debug') sur 127.0.0.1:43812, à 30 envois par seconde, avec un heartbeat prévu à 1 Hz. Les modules du véhicule y déposent leurs paquets via debugPacket ; l'extension y ajoute à chaque frame un paquet principal indiquant si ce véhicule est celui du joueur.

## Exemple

```lua
extensions.debug_advancedExternalDebug.debugPacket({sourceType = 'MON_MODULE', packetType = 'data', valeur = 42})
```

## Remarques

- Chaque paquet reçoit vehicleID = objectId. Les paquets en attente sont envoyés en un seul tableau JSON toutes les 1/30 s (jsonEncode(debugPackets)), puis la liste est vidée.
- Au chargement et à onInit : crée un socket UDP non bloquant (si la globale `socket` existe), pointe vers 127.0.0.1:43812 (peerIP et peerPort sont codés en dur, debugSettings est une table vide) et enregistre un paquet {sourceType='AED', packetType='init'}.
- La réception de commandes (RequestConfig, EnableDebugMode, SetConfig, SetProperty) est codée mais désactivée : l'appel receiveDebugCommands() est commenté dans updateGFX. Si elle était activée, elle utiliserait `subControllerLookup`, une variable qui n'est définie nulle part dans ce fichier.
- sendDebugHeartbeat (envoi de la chaîne 'BNGAED') est défini mais jamais appelé.
- Si udpSocket:send échoue, l'erreur est affichée (print) à chaque tentative.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `debug_advancedExternalDebug.debugPacket(packet)` | Ajoute un paquet à la file d'envoi (vehicleID est ajouté automatiquement). | 19 |
| `debug_advancedExternalDebug.onExtensionLoaded()` | Appelé au chargement de l'extension : appelle onInit. *(interne)* *(hook)* | 127 |
| `debug_advancedExternalDebug.onInit()` | Hook d'initialisation : crée la liaison UDP et signale un nouveau véhicule à l'outil. *(interne)* *(hook)* | 106 |
| `debug_advancedExternalDebug.onReset()` | Hook de reset : vide la file de paquets. *(interne)* *(hook)* | 102 |
| `debug_advancedExternalDebug.updateGFX(dt)` | Appelé chaque frame : ajoute le paquet principal puis envoie les paquets accumulés au rythme de 30 Hz. *(interne)* | 85 |

### Détail des paramètres

#### `debug_advancedExternalDebug.debugPacket(packet)`

Ajoute un paquet à la file d'envoi (vehicleID est ajouté automatiquement).

- `packet` (*table*) : Table sérialisable en JSON, avec de préférence sourceType et packetType.

#### `debug_advancedExternalDebug.updateGFX(dt)`

Appelé chaque frame : ajoute le paquet principal puis envoie les paquets accumulés au rythme de 30 Hz.

- `dt` (*number*) : Pas de temps en secondes.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/debug/advancedExternalDebug.lua`.*
