# `client_lighting_basic_shadowFilter`

*Fichier : `lua/ge/client/lighting/basic/shadowFilter.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/lighting/basic/shadowFilter")`

Crée le filtre de flou des ombres de l'éclairage basique : deux ShaderData (BL_ShadowFilterShaderV et BL_ShadowFilterShaderH, même compute shader shadowFilter.cs.hlsl avec BLUR_DIR = (1,0) puis (0,1)) et un PostEffect « BL_ShadowFilterPostFx » qui enchaîne les deux passes. Chargé par lighting/basic/init.lua. Aucune fonction exportée.

## Remarques

- La variable du second passage s'appelle aussi bl_ShadowFilterShaderH dans le code mais désigne un PostEffect (nom réutilisé) ; il est enregistré sans nom.
- Le shader nommé « ...V » reçoit la direction horizontale (1,0) et le « ...H » la verticale (0,1) : les suffixes ne correspondent pas à la direction réelle.

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/lighting/basic/shadowFilter.lua`.*
