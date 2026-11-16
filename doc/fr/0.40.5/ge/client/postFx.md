# `client_postFx`

*Fichier : `lua/ge/client/postFx.lua` · VM : Game Engine (GE) · 154 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/postFx")`

Gestionnaire des post-effets (PostFX) du jeu. À l'import il crée les objets communs : state blocks PFX_DefaultStateBlock et PFX_DefaultBlitStateBlock, shaders PFX_PassthruShader et PFX_PassthruComputeShader, et les PostEffect AL_FormatBlit et AL_UpscaleBilinear (désactivés au départ). Il charge les effets de client/postFx/* (caustics, dof, edgeAA, fog, fxaa, glow, maskedScreenBlur, smaa, ssao, screenSpaceShadows) et sait ré-appliquer les valeurs par défaut de SSAO et du DOF.

## Remarques

- initPostEffects et reloadPostEffects contiennent le même code (un require par effet) ; require met en cache, donc le rechargement n'exécute les modules qu'une fois sauf si le cache est vidé.
- La table globale postEffectCallbacks est publiée via rawset sur _G ; son onEnabled retourne toujours true.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `client_postFx.applyDefaults()` | Réapplique les valeurs par défaut de ssao et dof (applyDefaults de chaque module), active ou désactive l'objet SSAOPostFx selon $SSAOPostFx::Enable, puis appelle dof.updateDOFSettings(). | 133 |
| `client_postFx.initPostEffects()` | Charge tous les modules de post-effets et conserve les références vers dof et ssao. *(interne)* | 84 |
| `client_postFx.reloadPostEffects()` | Identique à initPostEffects (appelée par reloadClient). *(interne)* | 103 |

## Classe `postEffectCallbacks`

Table de callbacks globale (_G.postEffectCallbacks) utilisée par le moteur pour les PostEffect.

| Méthode | Description | Ligne |
|---|---|---|
| `postEffectCallbacks.onEnabled()` | Appelée quand un PostEffect est activé ; retourne true (autorise l'activation). | 125 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/postFx.lua`.*
