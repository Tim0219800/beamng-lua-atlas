# `networking_editorToolchain`

*Fichier : `lua/common/extensions/networking/editorToolchain.lua` · VM : Commun (GE + véhicule) · 214 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `networking_editorToolchain` : `extensions.load("networking_editorToolchain")`, puis la globale `networking_editorToolchain`

Serveur TCP (port 7000, toutes interfaces) qui permet à un outil externe (éditeur JBeam, etc.) de dialoguer avec le jeu. Les clients envoient des commandes JSON (ping, init, getPlayerVehicleInfo, selectNodes, subscribe) et reçoivent des réponses (pong, siminfo, playerVehicleInfo, data). Il peut aussi surligner des nœuds du véhicule joueur dans le monde 3D et diffuser en continu positions de nœuds et vitesse. Non chargé par défaut (ligne commentée extensions.load('networking_editorToolchain')) ; une fois chargé, il reste en mémoire (unload mode 'manual').

## Exemple

```lua
extensions.load('networking_editorToolchain')
-- le client se connecte sur le port 7000 et envoie {"cmd":"ping"}
```

## Remarques

- Écoute sur '*' port 7000 : accessible depuis le réseau tant que l'extension est chargée.
- Commandes reconnues : ping (-> pong), init (-> siminfo : versions, buildtype, chemins du jeu et utilisateur), getPlayerVehicleInfo (-> playerVehicleInfo ou noPlayerVehicle), selectNodes (liste de noms de nœuds à surligner), subscribe. Toute autre commande renvoie {cmd='error'}.
- Types d'abonnement gérés : 'nodePositions' (uniquement avec what == '*') et 'velocity' ; envoyés à chaque onPreRender.
- Le surlignage dessine une sphère rouge de rayon 0.1 m et le nom du nœud via debugDrawer.
- Un message 'disconnect' supprime les abonnements du client et remet selectedNodes à nil (efface le surlignage pour tous les clients).
- Le serveur est détruit dans onExtensionUnloaded ; onInit passe l'extension en setExtensionUnloadMode(M, 'manual').

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `networking_editorToolchain.onExtensionLoaded()` | Hook appelé au chargement de l'extension : crée le serveur TCPServer sur '*':7000. *(interne)* *(hook)* | 183 |
| `networking_editorToolchain.onExtensionUnloaded()` | Hook appelé au déchargement : détruit le serveur s'il existe. *(interne)* *(hook)* | 187 |
| `networking_editorToolchain.onInit()` | Hook d'initialisation : règle le mode de déchargement de l'extension sur 'manual'. *(interne)* *(hook)* | 202 |
| `networking_editorToolchain.onPreRender(dtReal, dtSim, dtRaw)` | Appelé chaque frame avant le rendu : lit les messages reçus et les traite, renvoie le contexte véhicule aux clients si le véhicule joueur a changé, dessine les nœuds sélectionnés puis envoie les données des abonnements (positions de nœuds, vitesse). *(interne)* *(hook)* | 126 |
| `networking_editorToolchain.onVehicleSpawned(vehID)` | Hook appelé à l'apparition d'un véhicule : si c'est le véhicule joueur 0, marque le contexte véhicule comme à renvoyer aux clients. *(interne)* *(hook)* | 194 |
| `networking_editorToolchain.onVehicleSwitched(_, _, player)` | Hook appelé quand le joueur change de véhicule : si le joueur est nil ou 0, marque le contexte véhicule à renvoyer aux clients. *(interne)* *(hook)* | 198 |

### Détail des paramètres

#### `networking_editorToolchain.onPreRender(dtReal, dtSim, dtRaw)`

Appelé chaque frame avant le rendu : lit les messages reçus et les traite, renvoie le contexte véhicule aux clients si le véhicule joueur a changé, dessine les nœuds sélectionnés puis envoie les données des abonnements (positions de nœuds, vitesse).

- `dtReal` (*number*) : Delta temps réel (s), non utilisé.
- `dtSim` (*number*) : Delta temps simulation (s), non utilisé.
- `dtRaw` (*number*) : Delta temps brut (s), non utilisé.

#### `networking_editorToolchain.onVehicleSpawned(vehID)`

Hook appelé à l'apparition d'un véhicule : si c'est le véhicule joueur 0, marque le contexte véhicule comme à renvoyer aux clients.

- `vehID` (*integer*) : Id du véhicule créé.

#### `networking_editorToolchain.onVehicleSwitched(_, _, player)`

Hook appelé quand le joueur change de véhicule : si le joueur est nil ou 0, marque le contexte véhicule à renvoyer aux clients.

- `_` (*any*) : Premier argument ignoré.
- `_` (*any*) : Premier argument ignoré.
- `player` (*integer|nil*) : Index du joueur concerné.

## Appels vers le moteur (C++)

- `FS:` `getGamePath`, `getUserPath`
- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawSphere`, `drawText`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/extensions/networking/editorToolchain.lua`.*
