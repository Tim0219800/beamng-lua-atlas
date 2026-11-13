# `lightrunner_lightrunnerConfigurator`

*Fichier : `lua/ge/extensions/lightrunner/lightrunnerConfigurator.lua` · VM : Game Engine (GE) · 55 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `lightrunner_lightrunnerConfigurator` : `extensions.load("lightrunner_lightrunnerConfigurator")`, puis la globale `lightrunner_lightrunnerConfigurator`

Configurateur de l'assistant (wizard) « Light Runner » : course rapide sur le niveau glow_city. Il construit un descripteur à partir de quickRaceConfiguratorDescriptor (backend de grille lightRunnerSelector, clé de route lightrunnerWizard, type de course lightRunner, restriction de véhicule lightRunner) et le passe à oneshotRaceCore.createConfigurator. Le module renvoyé expose donc l'API du configurateur (getSelection, selectLevel, selectMiddle, selectVehicle, updateSetting, getConfiguration, start, onWizard…RouteEnter) décrite dans oneshotRaceCore.

## Remarques

- Sélection par défaut (à la première entrée dans l'assistant) : niveau glow_city, piste « Argon Curves » (ou la première piste du niveau), véhicule sbr / config powerglow.
- Le démarrage de la course passe par scenario_quickRaceLoader.startQuickrace avec le type « lightRunner ».

**Dépendances (chargées avant) :** `scenario_quickRaceLoader`, `core_highscores`, `ui_vehicleSelector_general`, `ui_lightRunnerSelector_general`

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | scenario_quickRaceLoader, core_highscores, ui_vehicleSelector_general, ui_lightRunnerSelector_general. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/lightrunner/lightrunnerConfigurator.lua`.*
