# `flowgraph_nodes_audio_fade`

*Fichier : `lua/ge/extensions/flowgraph/nodes/audio/fade.lua` · VM : Game Engine (GE) · 100 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/audio/fade")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Audio Channel Fade » (tags sound/audio/volume, icône audiotrack). Fait un fondu du volume d'un canal audio FMOD (par défaut 'AudioChannelMaster') vers le silence ou vers le volume précédent, avec plus de contrôle que les nœuds Fade In/Out. Entrées : flow, fadeDown (descend vers volumeMin), fadeUp (remonte vers volumeMax), duration (s, défaut 1), channel, volumeMin (défaut 0) et volumeMax (défaut 1) cachés. Sorties : fadeDone (flow) et volume (volume courant). S'exécute à chaque frame (work). Utilise un minuteur interne (mgr.dtReal) pour des raisons de compatibilité.

## Remarques

- Anciens pins renommés (legacyPins) : fadeTime -> duration, fadeIn -> fadeDown, fadeOut -> fadeUp (le mappage fadeIn/fadeOut semble inversé par rapport au sens, mais c'est ce que fait le code).
- Si fadeDown et fadeUp sont actifs en même temps, le mode est 0 (aucun fondu).
- À l'arrêt du graphe, le volume du canal est remis à sa valeur de base (getChannelVolume(canal, false)).
- Si volumeMax n'est pas fourni, la cible de remontée est le volume « non fondu » du canal.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | À l'arrêt du graphe : restaure le volume de base du canal puis reset(). | 49 |
| `C:init()` | Appelle reset(). | 45 |
| `C:reset()` | Remet à zéro minuteur, mode, volumes et canal. | 37 |
| `C:work()` | Chaque frame, si flow est actif : lit le volume du canal, détecte un changement de mode (descente/montée), avance le minuteur et applique Engine.Audio.setChannelVolume par interpolation linéaire ; met fadeDone à vrai à la fin. | 56 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/audio/fade.lua`.*
