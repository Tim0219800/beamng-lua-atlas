# `quickrace_quickraceConfigurator`

*Fichier : `lua/ge/extensions/quickrace/quickraceConfigurator.lua` · VM : Game Engine (GE) · 27 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `quickrace_quickraceConfigurator` : `extensions.load("quickrace_quickraceConfigurator")`, puis la globale `quickrace_quickraceConfigurator`

Configurateur de l'assistant de course rapide (quickrace) : niveau, piste, véhicule et réglages (marche arrière, départ lancé, nombre de tours, heure du jour, graine). Il construit un descripteur via quickRaceConfiguratorDescriptor (backend quickraceSelector, clé de route quickraceWizard, sans type de course ni restriction de véhicule) et le passe à oneshotRaceCore.createConfigurator. Le module renvoyé expose l'API du configurateur décrite dans oneshotRaceCore.

## Remarques

- Pas de sélection par défaut : l'utilisateur choisit niveau, piste et véhicule lui-même.
- Le démarrage passe par scenario_quickRaceLoader.startQuickrace.

**Dépendances (chargées avant) :** `scenario_quickRaceLoader`, `core_highscores`, `ui_vehicleSelector_general`, `ui_quickraceSelector_general`

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | scenario_quickRaceLoader, core_highscores, ui_vehicleSelector_general, ui_quickraceSelector_general. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/quickrace/quickraceConfigurator.lua`.*
