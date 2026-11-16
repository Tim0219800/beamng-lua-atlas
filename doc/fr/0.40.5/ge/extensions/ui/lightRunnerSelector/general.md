# `ui_lightRunnerSelector_general`

*Fichier : `lua/ge/extensions/ui/lightRunnerSelector/general.lua` · VM : Game Engine (GE) · 23 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_lightRunnerSelector_general` : `extensions.load("ui_lightRunnerSelector_general")`, puis la globale `ui_lightRunnerSelector_general`

Backend du sélecteur en grille pour l'assistant Vue LightRunner. Il réutilise les mêmes niveaux/pistes que la course rapide (scenario_quickRaceLoader) : seule la sélection de véhicule est restreinte (voiture/camion compatibles powerglow), ailleurs dans les filtres du sélecteur de véhicules. Le module copie simplement dans M toutes les fonctions du backend créé par `oneshotRaceSelector/core` avec le descripteur `quickRaceTrackDescriptor.build("lightRunnerSelector")`.

## Remarques

- Les fonctions exportées sont celles fabriquées par createBackend (non listées dans la page auto) ; ce fichier ne définit rien d'autre que `dependencies`.

**Dépendances (chargées avant) :** `scenario_quickRaceLoader`

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {"scenario_quickRaceLoader"}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/lightRunnerSelector/general.lua`.*
