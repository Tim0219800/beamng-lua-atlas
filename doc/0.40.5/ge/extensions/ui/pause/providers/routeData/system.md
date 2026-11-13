# `ui_pause_providers_routeData_system`

*Fichier : `lua/ge/extensions/ui/pause/providers/routeData/system.lua` · VM : Game Engine (GE) · 228 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_routeData_system` : `extensions.load("ui_pause_providers_routeData_system")`, puis la globale `ui_pause_providers_routeData_system`

Fournisseur de données du menu pause pour la page Système. Il construit le rail de boutons en trois groupes : topSystemButtons (Options, Mods, HUD, Statistiques), firstDriveButtons (redémarrer, réinitialiser la progression, passer en freeroam, seulement pendant l'expérience First Drive) et exitSystemButtons (déconnexion multijoueur, quitter vers le menu principal, quitter le jeu avec confirmation).

## Remarques

- Le bouton HUD est omis en écran partagé (render_splitScreen.getCurrentConfiguration()).
- Mods et HUD sont désactivés pendant le tutoriel First Drive (context.isFirstDriveActive).
- pushRoute locale considère tout retour différent de false comme un succès, contrairement à d'autres modules qui lisent result.result.

**Dépendances (chargées avant) :** `ui_pause_actions`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_routeData_system.getSystemData(context)` | Renvoie {heading = ui.pause.system, sidePanelContents = nil, rail = groupes de boutons}. Chaque bouton est enregistré via ui_pause_actions.registerButton (donc exécutable ensuite avec executeAction). | 219 |

### Détail des paramètres

#### `ui_pause_providers_routeData_system.getSystemData(context)`

Renvoie {heading = ui.pause.system, sidePanelContents = nil, rail = groupes de boutons}. Chaque bouton est enregistré via ui_pause_actions.registerButton (donc exécutable ensuite avec executeAction).

- `context` (*table*) : Contexte pause (champs lus : mode, isMultiplayerActive, isFirstDriveActive, isFirstDriveGuided).
- **renvoie** : table Données de la page système.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_pause_actions"} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/routeData/system.lua`.*
