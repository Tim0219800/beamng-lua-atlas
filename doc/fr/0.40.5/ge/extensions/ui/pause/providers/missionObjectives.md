# `ui_pause_providers_missionObjectives`

*Fichier : `lua/ge/extensions/ui/pause/providers/missionObjectives.lua` · VM : Game Engine (GE) · 16 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_missionObjectives` : `extensions.load("ui_pause_providers_missionObjectives")`, puis la globale `ui_pause_providers_missionObjectives`

Fournisseur de données du menu pause pour les objectifs de la mission en cours. Il se contente de renvoyer le résultat de gameplay_missions_missionScreen.getPauseMissionObjectivesData().

**Dépendances (chargées avant) :** `gameplay_missions_missionScreen`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_missionObjectives.getData(context)` | Renvoie les données d'objectifs de mission pour le menu pause (fournies par gameplay_missions_missionScreen). Le contexte est ignoré. | 11 |

### Détail des paramètres

#### `ui_pause_providers_missionObjectives.getData(context)`

Renvoie les données d'objectifs de mission pour le menu pause (fournies par gameplay_missions_missionScreen). Le contexte est ignoré.

- `context` (*table*) : Contexte du menu pause (non utilisé).
- **renvoie** : any Données renvoyées par getPauseMissionObjectivesData.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"gameplay_missions_missionScreen"} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/missionObjectives.lua`.*
