# `ui_gamemodes_gamemodesTabProvider`

*Fichier : `lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua` · VM : Game Engine (GE) · 113 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gamemodes_gamemodesTabProvider` : `extensions.load("ui_gamemodes_gamemodesTabProvider")`, puis la globale `ui_gamemodes_gamemodesTabProvider`

Façade utilisée par l'onglet « modes de jeu » de l'UI. Selon qu'une session multijoueur existe (multiplayer_sessionManager.getCurrentSession() non nil), les appels sont redirigés vers multiplayer_uiBackend_multiplayerUIManager, sinon vers gameplay_multiseat_gamemodeManager (écran partagé). Chaque fonction vérifie que le module cible est chargé et ne fait rien sinon.

## Remarques

- restartGamemode ne fait rien en session réseau ; selectGamemode, deselectGamemode, startReadyUp, stopReadyUp, setOwnerPreReadyRole et requestSetOwnGamemodeRole ne font rien hors session réseau.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gamemodes_gamemodesTabProvider.deselectGamemode()` | Réseau uniquement : l'hôte désélectionne le mode (deselectGamemodeForOwner). | 61 |
| `ui_gamemodes_gamemodesTabProvider.requestGamemodeData()` | Demande à envoyer à l'UI les données des modes de jeu (requestMultiplayerTabData en réseau, requestGamemodeData en écran partagé). | 8 |
| `ui_gamemodes_gamemodesTabProvider.requestSetOwnGamemodeRole(role)` | Réseau uniquement : demande à changer son propre rôle dans le mode de jeu. | 93 |
| `ui_gamemodes_gamemodesTabProvider.restartGamemode(name, settings)` | Redémarre un mode de jeu en écran partagé (gamemodeManager.restart). Sans effet en session réseau. | 44 |
| `ui_gamemodes_gamemodesTabProvider.selectGamemode(name)` | Réseau uniquement : l'hôte sélectionne un mode (selectGamemodeForOwner). | 53 |
| `ui_gamemodes_gamemodesTabProvider.setOwnerPreReadyRole(role)` | Réseau uniquement : définit le rôle de l'hôte avant la phase « prêt ». | 85 |
| `ui_gamemodes_gamemodesTabProvider.startGamemode(name, settings)` | Démarre un mode de jeu (multiplayerUIManager.startGamemode ou gamemodeManager.start). | 20 |
| `ui_gamemodes_gamemodesTabProvider.startReadyUp(gamemodeInfo)` | Réseau uniquement : lance la phase « prêt » des joueurs pour un mode. | 69 |
| `ui_gamemodes_gamemodesTabProvider.stopGamemode()` | Arrête le mode de jeu en cours (stopGamemode en réseau, stop en écran partagé). | 32 |
| `ui_gamemodes_gamemodesTabProvider.stopReadyUp()` | Réseau uniquement : arrête la phase « prêt ». | 77 |

### Détail des paramètres

#### `ui_gamemodes_gamemodesTabProvider.requestSetOwnGamemodeRole(role)`

Réseau uniquement : demande à changer son propre rôle dans le mode de jeu.

- `role` (*any*) : Rôle souhaité (déduit du code : transmis tel quel).

#### `ui_gamemodes_gamemodesTabProvider.restartGamemode(name, settings)`

Redémarre un mode de jeu en écran partagé (gamemodeManager.restart). Sans effet en session réseau.

- `name` (*string*) : Nom du mode de jeu.
- `settings` (*table|nil*) : Réglages du mode.

#### `ui_gamemodes_gamemodesTabProvider.selectGamemode(name)`

Réseau uniquement : l'hôte sélectionne un mode (selectGamemodeForOwner).

- `name` (*string*) : Nom du mode de jeu.

#### `ui_gamemodes_gamemodesTabProvider.setOwnerPreReadyRole(role)`

Réseau uniquement : définit le rôle de l'hôte avant la phase « prêt ».

- `role` (*any*) : Rôle (déduit du code : transmis tel quel).

#### `ui_gamemodes_gamemodesTabProvider.startGamemode(name, settings)`

Démarre un mode de jeu (multiplayerUIManager.startGamemode ou gamemodeManager.start).

- `name` (*string*) : Nom du mode de jeu.
- `settings` (*table|nil*) : Réglages du mode (déduit du code : transmis tels quels).

#### `ui_gamemodes_gamemodesTabProvider.startReadyUp(gamemodeInfo)`

Réseau uniquement : lance la phase « prêt » des joueurs pour un mode.

- `gamemodeInfo` (*table*) : Informations du mode (déduit du code : transmises telles quelles).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua`.*
