# `ui_pause_providers_routeData_gamemodes`

*Fichier : `lua/ge/extensions/ui/pause/providers/routeData/gamemodes.lua` · VM : Game Engine (GE) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_routeData_gamemodes` : `extensions.load("ui_pause_providers_routeData_gamemodes")`, puis la globale `ui_pause_providers_routeData_gamemodes`

Fournisseur de données du menu pause pour les modes de jeu multijoueur : liste des modes (composant GamemodesTab), configuration d'un mode (GamemodeSetupView) et réglages du mode en cours (GamemodeSettingsView). Si le multijoueur est actif, il ajoute la liste des joueurs en panneau latéral via routeData_multiplayer.

**Dépendances (chargées avant) :** `ui_pause_providers_routeData_multiplayer`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_routeData_gamemodes.getGamemodeSettingsData(context)` | Renvoie la vue des réglages du mode en cours (GamemodeSettingsView). | 42 |
| `ui_pause_providers_routeData_gamemodes.getGamemodeSetupData(context, params)` | Renvoie la vue de configuration d'un mode (GamemodeSetupView, prop gamemodeName). | 25 |
| `ui_pause_providers_routeData_gamemodes.getGamemodesData(context)` | Renvoie le panneau principal GamemodesTab et, si context.isMultiplayerActive, le panneau latéral de la liste des joueurs. | 16 |

### Détail des paramètres

#### `ui_pause_providers_routeData_gamemodes.getGamemodeSettingsData(context)`

Renvoie la vue des réglages du mode en cours (GamemodeSettingsView).

- `context` (*table*) : Contexte pause.
- **renvoie** : table {mainCardClass, mainPanelContent, sidePanelContents}

#### `ui_pause_providers_routeData_gamemodes.getGamemodeSetupData(context, params)`

Renvoie la vue de configuration d'un mode (GamemodeSetupView, prop gamemodeName).

- `context` (*table*) : Contexte pause.
- `params` (*table|nil*) : Champ lu : gamemodeName.
- **renvoie** : table {mainCardClass, mainPanelContent, sidePanelContents}

#### `ui_pause_providers_routeData_gamemodes.getGamemodesData(context)`

Renvoie le panneau principal GamemodesTab et, si context.isMultiplayerActive, le panneau latéral de la liste des joueurs.

- `context` (*table*) : Contexte pause (champ lu : isMultiplayerActive).
- **renvoie** : table {mainPanelContent, sidePanelContents}

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_pause_providers_routeData_multiplayer"} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/routeData/gamemodes.lua`.*
