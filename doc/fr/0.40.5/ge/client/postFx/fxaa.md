# `client_postFx_fxaa`

*Fichier : `lua/ge/client/postFx/fxaa.lua` · VM : Game Engine (GE) · 51 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/postFx/fxaa")`

Anti-aliasing FXAA. Crée le state block FXAA_StateBlock, le shader FXAA_ShaderData (fxaa.cs.hlsl) et le PostEffect « FXAA_PostEffect » (désactivé au départ, PFXAfterDiffuse, lit et écrit $backBuffer). Activer FXAA désactive SMAA et SMAA T2x.

## Remarques

- Si FXAA_PostEffect existe déjà, rien n'est recréé ; la création des trois objets est groupée dans le même bloc if.

## Classe `fxaa_PostEffectCallbacks`

Callbacks de FXAA_PostEffect (globale FXAA_PostEffectCallbacks).

| Méthode | Description | Ligne |
|---|---|---|
| `fxaa_PostEffectCallbacks.onEnabled()` | Désactive SMAA_PostEffect s'il existe, appelle disableSmaaT2x() si cette globale existe, puis retourne true. | 13 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/postFx/fxaa.lua`.*
