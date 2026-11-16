# `flowgraph_nodes_audio_fadeOut`

*Fichier : `lua/ge/extensions/flowgraph/nodes/audio/fadeOut.lua` · VM : Game Engine (GE) · 54 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/audio/fadeOut")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Audio Fade Out » (catégorie once_f_duration, tags sound/audio/volume). Fait descendre le volume global jusqu'au silence : fixe g_FadeTimeMS (= duration en ms) et g_GameLoading = 1 via SFXSystem.setGlobalParameter, puis attend la durée pour signaler la fin. Entrée : duration (s, défaut 1).

## Remarques

- Miroir de Audio Fade In (g_GameLoading = 0 là-bas). À l'arrêt ou au reset du nœud, les deux paramètres sont remis à 0, ce qui annule le fondu.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle reset() à l'arrêt du graphe. | 23 |
| `C:init()` | Met le minuteur à 0. | 19 |
| `C:onNodeReset()` | Appelle reset() quand le nœud est réinitialisé. | 27 |
| `C:reset()` | Remet le minuteur à 0, l'état de durée à 'inactive' et g_FadeTimeMS / g_GameLoading à 0. | 31 |
| `C:work()` | Chaque frame : fait avancer le minuteur (mgr.dtReal) et passe l'état à 'finished' une fois duration atteinte. | 44 |
| `C:workOnce()` | Au premier flux : g_FadeTimeMS = duration*1000, g_GameLoading = 1, état 'started'. | 38 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/audio/fadeOut.lua`.*
