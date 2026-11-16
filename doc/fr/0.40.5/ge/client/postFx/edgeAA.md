# `client_postFx_edgeAA`

*Fichier : `lua/ge/client/postFx/edgeAA.lua` · VM : Game Engine (GE) · 41 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/postFx/edgeAA")`

Détection de contours pour l'anti-aliasing par arêtes. Crée le state block PFX_DefaultEdgeAAStateBlock, le shader PFX_EdgeAADetectShader (edgeDetect.cs.hlsl) et le PostEffect « EdgeDetectPostEffect » (activé, résolution 0,5x0,5, cible #edge, avant ObjTranslucentBin) qui lit #prepass[RT0] et la profondeur. Aucune fonction exportée.

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/postFx/edgeAA.lua`.*
