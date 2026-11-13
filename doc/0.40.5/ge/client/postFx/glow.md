# `client_postFx_glow`

*Fichier : `lua/ge/client/postFx/glow.lua` · VM : Game Engine (GE) · 90 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/postFx/glow")`

Effet de lueur (glow). Crée les shaders de flou séparable PFX_GlowBlurVertShader et PFX_GlowBlurHorzShader, le shader de combinaison PFX_GlowCombineShader et le PostEffect « GlowPostFx » (rendu après GlowBin, résolution 0,5x0,5, lit #glowbuffer) auquel sont ajoutés trois sous-effets : flou vertical, flou horizontal puis combinaison avec $backBuffer. Aucune fonction exportée.

## Remarques

- Dans le code, le flou « Vert » a BLUR_DIR=(0,1) et le « Horz » BLUR_DIR=(1,0).
- La variable locale du PostEffect principal s'appelle gammaPostFX (nom hérité d'un copier-coller) mais l'objet enregistré est GlowPostFx.

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/postFx/glow.lua`.*
