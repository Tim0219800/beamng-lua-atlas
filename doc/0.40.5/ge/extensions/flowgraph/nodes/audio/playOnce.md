# `flowgraph_nodes_audio_playOnce`

*Fichier : `lua/ge/extensions/flowgraph/nodes/audio/playOnce.lua` · VM : Game Engine (GE) · 73 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/audio/playOnce")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Play Sound » (catégorie dynamic_p_duration, mode dynamique 'repeat', tags sound/audio/volume). Joue un échantillon audio avec Engine.Audio.playOnce. Entrées : file (source, défaut 'event:UI_Checkpoint'), channel (caché, défaut 'AudioGui'), et pins cachés volume (défaut 1), pitch (1), fadeInTime (-1), fadeOutTime (-1), unique (false). En mode 'repeat', le son est rejoué à chaque frame de flux ; sinon une seule fois.

## Remarques

- Le pin file accepte aussi des fichiers « .prefab.json » dans le sélecteur de l'éditeur (reste du modèle, sans rapport avec l'audio).
- Ancien pin renommé : source -> file.
- Le résultat de playOnce est stocké dans une variable locale et non utilisé.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:playSound()` | Construit les données (volume, pitch, fades, unique, sampleSource, channel) depuis les pins et appelle Engine.Audio.playOnce(channel, source, data). | 58 |
| `C:postInit()` | Configure l'éditeur : filtre de fichiers du pin file et curseur 0-1 pour volume. | 35 |
| `C:work()` | Si dynamicMode vaut 'repeat', rejoue le son à chaque frame. | 52 |
| `C:workOnce()` | Joue le son une fois (playSound). | 48 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/audio/playOnce.lua`.*
