# `client_postFx_maskedScreenBlur`

*Fichier : `lua/ge/client/postFx/maskedScreenBlur.lua` · VM : Game Engine (GE) · 94 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/postFx/maskedScreenBlur")`

Flou d'écran masqué. Crée l'objet « ScreenBlurFX » (type PostEffectMaskedBlur, activé, rendu après OverlayRender, cible à 40 % de l'écran) avec trois sous-effets : flou Y, flou X (shader DOF_Gausian.cs.hlsl) puis SimpleBlendShader qui mélange l'écran net et l'image floue selon le masque #screenBlurMask. Sert par exemple à flouter l'arrière-plan sous des menus. Aucune fonction exportée.

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/postFx/maskedScreenBlur.lua`.*
