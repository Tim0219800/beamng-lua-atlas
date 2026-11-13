# `license`

*Fichier : `lua/ge/extensions/license.lua` · VM : Game Engine (GE) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `license` : `extensions.load("license")`, puis la globale `license`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `license.isAllowedActionsPath(path)` | returns true if it makes sense to load this inputmap | 40 |
| `license.isAllowedInputmapPath(path)` | returns true if it makes sense to load this inputmap | 34 |
| `license.isCommercial()` |  | 19 |
| `license.isValid()` |  | 9 |
| `license.requestState()` |  | 29 |

**Évènements UI (guihooks.trigger) :** `TechLicenseState`

## Appels vers le moteur (C++)

- `ResearchVerifier.` `isTechLicenseVerified`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/license.lua`.*
