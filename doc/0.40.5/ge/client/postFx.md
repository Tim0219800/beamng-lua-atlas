# `client_postFx`

*Fichier : `lua/ge/client/postFx.lua` · VM : Game Engine (GE) · 154 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/postFx")`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `client_postFx.applyDefaults()` | Restores the shipped default values for every effect that exposes them, then re-applies<br> the resulting state to the scene objects. | 133 |
| `client_postFx.initPostEffects()` |  | 84 |
| `client_postFx.reloadPostEffects()` |  | 103 |

## Classe `postEffectCallbacks`

| Méthode | Description | Ligne |
|---|---|---|
| `postEffectCallbacks.onEnabled()` |  | 125 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/postFx.lua`.*
