# `client_lighting_basic_init`

*Fichier : `lua/ge/client/lighting/basic/init.lua` · VM : Game Engine (GE) · 92 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/lighting/basic/init")`

Light manager « Basic Lighting ». Crée le state block BL_ProjectedShadowSBData, le shader BL_ProjectedShadowShaderData et le matériau BL_ProjectedShadowMaterial (ombres projetées), charge shadowFilter, puis publie la table globale BLMCallbacks. onActivate active AL_FormatToken et crée un RenderPassManager « BL_ProjectedShadowRPM » avec un RenderFastMgr, ajoutés à RootGroup ; onDeactivate désactive AL_FormatToken et supprime ce RenderPassManager.

## Remarques

- Les biais de profondeur (zBias/zSlopeBias) valent +1 si $Scene::useReversedDepthBuffer est vrai, sinon -5.
- onDeactivate appelle renderPassManager:delete() sans tester que BL_ProjectedShadowRPM existe : erreur si désactivé sans activation préalable.
- blendEnable est assigné deux fois de suite (doublon inoffensif).

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/lighting/basic/init.lua`.*
