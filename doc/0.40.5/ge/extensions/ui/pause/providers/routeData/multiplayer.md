# `ui_pause_providers_routeData_multiplayer`

*Fichier : `lua/ge/extensions/ui/pause/providers/routeData/multiplayer.lua` · VM : Game Engine (GE) · 124 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_routeData_multiplayer` : `extensions.load("ui_pause_providers_routeData_multiplayer")`, puis la globale `ui_pause_providers_routeData_multiplayer`

Fournisseur de données du menu pause pour le multijoueur : page d'accueil multijoueur (boutons Paramètres de session / Modes de jeu / Gérer les joueurs), réglages de session (PauseMultiplayerSessionTab) et liste des joueurs (PauseMultiplayerPlayerList). Les actions sont en lecture seule en mode freeroamTutorial.

## Remarques

- Plusieurs libellés sont en anglais en dur, non traduits : « Session Settings », « Create Session... », « Manage Players », « Players », « Read-only in this mode ».
- getMultiplayerData accède à multiplayer_gamemodeManager.getCurrentGamemodeExt() : le bouton Modes de jeu mène à pause.gamemodeSettings si un mode tourne, sinon à pause.gamemodes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_routeData_multiplayer.getMultiplayerData(context)` | Renvoie la page d'accueil multijoueur avec trois boutons de navigation (routes pause.multiplayer.settings, pause.gamemodes ou pause.gamemodeSettings, pause.multiplayer.playerList). Les deux derniers ne sont activés que si une session multijoueur est active. | 30 |
| `ui_pause_providers_routeData_multiplayer.getMultiplayerPlayerListData()` | Renvoie la page de gestion des joueurs (composant PauseMultiplayerPlayerList avec interactive = true). | 103 |
| `ui_pause_providers_routeData_multiplayer.getMultiplayerSettingsData()` | Renvoie la page de réglages de session (composant PauseMultiplayerSessionTab) avec la liste des joueurs en panneau latéral. | 88 |
| `ui_pause_providers_routeData_multiplayer.getPlayerListSidePanelContents()` | Renvoie le contenu du panneau latéral « Joueurs » (titre ui.multiplayer.players et composant PauseMultiplayerPlayerList). Aussi utilisé par routeData_gamemodes. | 13 |

### Détail des paramètres

#### `ui_pause_providers_routeData_multiplayer.getMultiplayerData(context)`

Renvoie la page d'accueil multijoueur avec trois boutons de navigation (routes pause.multiplayer.settings, pause.gamemodes ou pause.gamemodeSettings, pause.multiplayer.playerList). Les deux derniers ne sont activés que si une session multijoueur est active.

- `context` (*table*) : Contexte pause (champs lus : isMultiplayerActive, mode).
- **renvoie** : table {active, disabledReason, mainPanelContent, sidePanelContents}

#### `ui_pause_providers_routeData_multiplayer.getMultiplayerPlayerListData()`

Renvoie la page de gestion des joueurs (composant PauseMultiplayerPlayerList avec interactive = true).

- **renvoie** : table {mainPanelContent}

#### `ui_pause_providers_routeData_multiplayer.getMultiplayerSettingsData()`

Renvoie la page de réglages de session (composant PauseMultiplayerSessionTab) avec la liste des joueurs en panneau latéral.

- **renvoie** : table {mainPanelContent, sidePanelContents}

#### `ui_pause_providers_routeData_multiplayer.getPlayerListSidePanelContents()`

Renvoie le contenu du panneau latéral « Joueurs » (titre ui.multiplayer.players et composant PauseMultiplayerPlayerList). Aussi utilisé par routeData_gamemodes.

- **renvoie** : table Liste de panneaux latéraux.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/routeData/multiplayer.lua`.*
