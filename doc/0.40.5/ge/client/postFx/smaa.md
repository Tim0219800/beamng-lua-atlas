# `client_postFx_smaa`

*Fichier : `lua/ge/client/postFx/smaa.lua` · VM : Game Engine (GE) · 274 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/postFx/smaa")`

Anti-aliasing SMAA (Subpixel Morphological Anti-Aliasing). Crée les shaders et state block SMAA_*, les PostEffect SMAA_PostEffect (détection des contours), SMAA_PostEffect1 (poids de mélange) et SMAA_PostEffect2 (mélange de voisinage), ainsi que la variante temporelle SMAA_T2X_* avec SMAA_T2X_Resolve. SMAA 1x et T2x sont exclusifs entre eux et avec FXAA. Définit la globale disableSmaaT2x().

## Remarques

- disableSmaaT2x() désactive SMAA_T2X_PostEffect et remet upscaleMode à 0 sur les vues « main », « splitscreen0..7 », « multiMonitorLeft » et « multiMonitorRight » qui utilisent smaaT2xUpscaleMode (globale lue dans le code, non définie dans ce fichier).
- Les preProcess calculent rtResolution = (1/largeur, 1/hauteur, largeur, hauteur) et le transmettent à $smaaRtMetrics. T2x alterne $smaaSubsampleIndices ("1 1 1 0" ou "2 2 2 0") selon la parité de Engine.Render.getFrameId().
- Callbacks publiés sur les globales SMAA_PostEffectCallbacks et SMAA_T2X_PostEffectCallbacks.

## Classe `smaaPostEffectCallbacks`

Callbacks de SMAA_PostEffect (SMAA 1x).

| Méthode | Description | Ligne |
|---|---|---|
| `smaaPostEffectCallbacks.onEnabled()` | Désactive FXAA_PostEffect et SMAA T2x, retourne true. | 76 |
| `smaaPostEffectCallbacks.preProcess()` | Met à jour la résolution de la cible de rendu (rtResolution) et $smaaRtMetrics sur les trois effets si elle a changé. | 86 |

## Classe `smaaT2xPostEffectCallbacks`

Callbacks de SMAA_T2X_PostEffect (SMAA temporel 2x).

| Méthode | Description | Ligne |
|---|---|---|
| `smaaT2xPostEffectCallbacks.onEnabled()` | Désactive FXAA_PostEffect et SMAA_PostEffect, retourne true. | 188 |
| `smaaT2xPostEffectCallbacks.preProcess()` | Met à jour $smaaRtMetrics et les indices de sous-échantillon ($smaaSubsampleIndices) à chaque image. | 200 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/postFx/smaa.lua`.*
