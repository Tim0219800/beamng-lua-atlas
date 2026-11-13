# `client_lighting_advanced_shaders`

*Fichier : `lua/ge/client/lighting/advanced/shaders.lua` · VM : Game Engine (GE) · 227 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/lighting/advanced/shaders")`

Déclare, si absents, les objets de rendu de l'éclairage avancé (deferred) : state blocks AL_VectorLightState et AL_ConvexLightState, shaders et matériaux pour les lumières directionnelles (AL_VectorLightShader/Material, cible « lightinfo »), ponctuelles (AL_PointLight*), spot (AL_SpotLight*) et particules (AL_ParticlePointLight*), ainsi que les matériaux par défaut AL_DefaultPrePassMaterial et AL_DefaultShadowMaterial (double face). Chargé par lighting/advanced/init.lua. Aucune fonction exportée ; seul un moddeur de rendu bas niveau s'y intéresse.

## Remarques

- Les matériaux lisent les G-buffers (#prepass[RT0..RT5], #prepass[Depth]), la shadow map ($dynamiclight), les cookies ($dynamiclightmask, #cloudTransmittanceCookie) et les masques #ssaoMask, #sssMask, #sunShadowMask.
- AL_ConvexLightState choisit zFunc GFXCmpLessEqual si $Scene::useReversedDepthBuffer est vrai, sinon GFXCmpGreaterEqual ; stencilRef = 4 pour les deux state blocks de lumière.
- Les shadow maps sont échantillonnées en SamplerClampPoint (commentaire du code : certaines cartes ne filtrent pas de façon identique).

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/lighting/advanced/shaders.lua`.*
