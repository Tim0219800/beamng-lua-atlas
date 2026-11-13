# `telemetry_core.test`

*Fichier : `lua/ge/extensions/telemetry/core.test.lua` · VM : Game Engine (GE) · 14 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_core.test` : `extensions.load("telemetry_core.test")`, puis la globale `telemetry_core.test`

Test unitaire de telemetry/core (extensions.testFramework_TestManager:runTestFiles("core")).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_core.test.testTelemetryPlatformSupport(ctx)` | Vérifie que isPlatformSupported renvoie false pour 'ps5' et 'ps5pro' et true pour la plateforme PC (chaîne vide). *(interne)* | 7 |

### Détail des paramètres

#### `telemetry_core.test.testTelemetryPlatformSupport(ctx)`

Vérifie que isPlatformSupported renvoie false pour 'ps5' et 'ps5pro' et true pour la plateforme PC (chaîne vide).

- `ctx` (*table*) : Contexte du framework de test.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/core.test.lua`.*
