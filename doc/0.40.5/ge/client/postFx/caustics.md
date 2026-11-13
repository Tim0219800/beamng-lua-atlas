# `client_postFx_caustics`

*Fichier : `lua/ge/client/postFx/caustics.lua` · VM : Game Engine (GE) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/postFx/caustics")`

Post-effet de caustiques sous l'eau. Crée (s'ils n'existent pas) le state block PFX_CausticsStateBlock (mélange additif), le shader PFX_CausticsShader (caustics.cs.hlsl) et le PostEffect « CausticsPFX », désactivé par défaut, qui lit le prepass, la profondeur et deux textures caustics_1.png / caustics_2.png. Il est activé et désactivé par les callbacks de UnderwaterFogPostFx (voir fog.lua). Aucune fonction exportée.

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/postFx/caustics.lua`.*
