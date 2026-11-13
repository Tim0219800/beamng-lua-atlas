# `core_gameContext`

*Fichier : `lua/ge/extensions/core/gameContext.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_gameContext` : `extensions.load("core_gameContext")`, puis la globale `core_gameContext`

Extension GE `core_gameContext` : petit relais vers `gameplay_markerInteraction` (contexte de jeu courant) et vers l'UI (changement de mission en avant-plan). Fournit aussi le libellé d'avertissement « expérimental » affiché pour la carrière et les missions de rallye.

## Remarques

- getGameContext charge gameplay_markerInteraction à la demande et renvoie son contexte ; renvoie {} si l'extension n'est pas disponible. Le contenu du contexte est défini dans gameplay_markerInteraction.
- toggleMenues est une fonction vide (corps vide) : probablement un reste de code.
- getWIPWarningLabel suppose que gameplay_missions_missionManager, gameplay_missions_missions et career_career sont chargées (sinon erreur Lua).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_gameContext.getGameContext(...)` | Renvoie le contexte de jeu fourni par gameplay_markerInteraction.getGameContext(...) en chargeant l'extension si besoin. | 7 |
| `core_gameContext.getWIPWarningLabel()` | Clé de traduction du bandeau « expérimental » : 'ui.rally.experimentalWarning' si la mission de premier plan est de type rallyStage, rallyLoop ou rallyLoop2 et que le réglage rallyHideExperimentalBanner est faux ; 'ui.career.experimentalWarning' si la carrière est active ; sinon nil. | 25 |
| `core_gameContext.onAnyMissionChanged(state, mission)` | Hook appelé quand l'état d'une mission change : transmet à l'UI l'évènement guihooks 'onAnyMissionChanged' (state, id de la mission). *(interne)* *(hook)* | 21 |
| `core_gameContext.toggleMenues()` | Ne fait rien (fonction vide). | 17 |

### Détail des paramètres

#### `core_gameContext.getGameContext(...)`

Renvoie le contexte de jeu fourni par gameplay_markerInteraction.getGameContext(...) en chargeant l'extension si besoin.

- `...` (*any*) : Arguments transmis tels quels à gameplay_markerInteraction.getGameContext.
- **renvoie** : table Contexte de jeu, ou {} si l'extension est indisponible.

#### `core_gameContext.getWIPWarningLabel()`

Clé de traduction du bandeau « expérimental » : 'ui.rally.experimentalWarning' si la mission de premier plan est de type rallyStage, rallyLoop ou rallyLoop2 et que le réglage rallyHideExperimentalBanner est faux ; 'ui.career.experimentalWarning' si la carrière est active ; sinon nil.

- **renvoie** : string|nil Clé de traduction ou nil.

#### `core_gameContext.onAnyMissionChanged(state, mission)`

Hook appelé quand l'état d'une mission change : transmet à l'UI l'évènement guihooks 'onAnyMissionChanged' (state, id de la mission).

- `state` (*string*) : Nouvel état de la mission (valeur définie par le gestionnaire de missions).
- `mission` (*table|nil*) : Mission concernée ; seul mission.id est envoyé.

**Évènements UI (guihooks.trigger) :** `onAnyMissionChanged`

**Charge les extensions :** `gameplay_markerInteraction`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/gameContext.lua`.*
