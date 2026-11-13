# `client_postFx_fog`

*Fichier : `lua/ge/client/postFx/fog.lua` · VM : Game Engine (GE) · 114 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/postFx/fog")`

Brouillard en post-traitement. Crée le PostEffect « FogPostFx » (shader fog.cs.hlsl, priorité 5, activé, hors passes de réflexion) et le PostEffect « UnderwaterFogPostFx » (underwaterFog.cs.hlsl, priorité 4, oneFrameOnly) avec leurs shaders et state blocks. Les callbacks de l'effet sous-marin activent/désactivent le PostEffect de caustiques.

## Remarques

- Les callbacks sont publiés sur la globale UnderwaterFogPostFxCallbacks (via rawset).

## Classe `underwaterFogPostFxCallbacks`

Callbacks appelés par le moteur pour UnderwaterFogPostFx.

| Méthode | Description | Ligne |
|---|---|---|
| `underwaterFogPostFxCallbacks.onDisabled()` | Désactive CausticsPFX s'il existe. | 67 |
| `underwaterFogPostFxCallbacks.onEnabled()` | Active CausticsPFX s'il existe et retourne true. | 59 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/postFx/fog.lua`.*
