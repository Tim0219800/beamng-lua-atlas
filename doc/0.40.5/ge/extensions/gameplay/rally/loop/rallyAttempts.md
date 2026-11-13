# `gameplay_rally_loop_rallyAttempts`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/rallyAttempts.lua` · VM : Game Engine (GE) · 106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_loop_rallyAttempts` : `extensions.load("gameplay_rally_loop_rallyAttempts")`, puis la globale `gameplay_rally_loop_rallyAttempts`

Crée et enregistre une tentative (attempt) de mission pour une boucle de rallye (rally loop) à travers le système de progression des missions (gameplay_missions_progress). Une tentative de fin normale reçoit le temps total, la pénalité, les temps de chaque spéciale (timeSS1, timeSS2…), les données du véhicule et les étoiles gagnées ; une tentative DNF (abandon ou redémarrage) ne reçoit que le type de DNF et le véhicule. Appelé par le gestionnaire de boucle (rallyLoopManager) via l'objet mgr.

## Exemple

```lua
local attempt, totalChange = gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForFinish(mgr)
```

## Remarques

- Les deux fonctions publiques renvoient (attempt, totalChange) dans cet ordre, alors que le commentaire du code ne cite que totalChange (et, pour la fin normale, l'ordre annoncé dans le commentaire est inversé).
- Si mgr:getRallyLoopMissionId() renvoie nil, un log d'erreur est émis et la fonction renvoie nil sans rien enregistrer.
- addVehicleData appelle dump(vData) : la table du véhicule est affichée dans la console à chaque tentative.
- Le module charge rallyLoopStars via require('/lua/ge/extensions/gameplay/rally/loop/rallyLoopStars').

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForDnf(mgr, dnfType)` | Crée une tentative abandonnée (DNF) : marque attempt.dnf = true, enregistre le dnfType et l'id de la mission courante, ajoute le véhicule, agrège et sauvegarde. Aucune étoile ni temps n'est enregistré. | 85 |
| `gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForFinish(mgr)` | Crée une tentative de fin normale : temps et pénalités de mgr, temps de chaque spéciale, véhicule du joueur, notation en étoiles (RallyLoopStars.gradeAttempt), agrégation dans la progression de la mission, puis sauvegarde. | 66 |

### Détail des paramètres

#### `gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForDnf(mgr, dnfType)`

Crée une tentative abandonnée (DNF) : marque attempt.dnf = true, enregistre le dnfType et l'id de la mission courante, ajoute le véhicule, agrège et sauvegarde. Aucune étoile ni temps n'est enregistré.

- `mgr` (*table*) : Gestionnaire de boucle (rallyLoopManager) : doit fournir getRallyLoopMissionId et getCurrentMissionId.
- `dnfType` (*string*) : Type de DNF : "restart" ou "abandon".
- **renvoie** : table|nil L'objet attempt créé (nil si l'id de mission est introuvable).
- **renvoie** : table|nil Résultat d'agrégation (totalChange).

#### `gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForFinish(mgr)`

Crée une tentative de fin normale : temps et pénalités de mgr, temps de chaque spéciale, véhicule du joueur, notation en étoiles (RallyLoopStars.gradeAttempt), agrégation dans la progression de la mission, puis sauvegarde.

- `mgr` (*table*) : Gestionnaire de boucle (rallyLoopManager) : doit fournir getRallyLoopMissionId, getTotalPenalty, getTotalTime, getEventLog et éventuellement getRallyLoopMission.
- **renvoie** : table|nil L'objet attempt créé (nil si l'id de mission est introuvable).
- **renvoie** : table|nil Résultat d'agrégation (totalChange) renvoyé par gameplay_missions_progress.aggregateAttempt.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/rallyAttempts.lua`.*
