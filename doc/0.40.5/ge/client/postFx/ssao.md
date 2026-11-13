# `ssaoModule`

*Fichier : `lua/ge/client/postFx/ssao.lua` · VM : Game Engine (GE) · 91 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `ssaoModule`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ssaoModule.applyDefaults()` |  | 35 |
| `ssaoModule.getContrast()` |  | 44 |
| `ssaoModule.getRadius()` |  | 45 |
| `ssaoModule.setBentNormalDebugEnabled(enabled)` | Inspect the generated world-space bent-normal map without changing materials.<br> This debug effect is created on demand and has no cost while disabled. | 49 |
| `ssaoModule.setContrast(value)` |  | 15 |
| `ssaoModule.setRadius(value)` |  | 25 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/postFx/ssao.lua`.*
