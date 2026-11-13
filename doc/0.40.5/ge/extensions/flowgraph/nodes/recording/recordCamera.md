# `flowgraph_nodes_recording_recordCamera`

*Fichier : `lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua` · VM : Game Engine (GE) · 97 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/recording/recordCamera")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Record Camera' (categorie repeat_f_duration). Enregistre un trajet de camera par images cles : la premiere impulsion 'snap' demarre l'enregistrement, chaque 'snap' suivant ajoute une cle (pos, rot, temps os.clock). L'impulsion 'stop' termine et cree dans MissionGroup un objet SimPath avec un Marker par cle (position, rotation, timeToNext). Sortie 'filename' : nom genere (prefix + os.time()).

## Remarques

- Le premier snap demarre l'enregistrement et ajoute aussi la premiere cle (les deux tests sont evalues dans la meme frame).
- Les noms de marqueurs sont 'maker_N' (faute de frappe pour marker).

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet l'etat inactif, vide le trajet et memorise l'heure de depart. | 30 |
| `C:drawMiddle(builder, style)` | Affiche l'etat et le nombre de cles. | 88 |
| `C:finishUp()` | Cree le SimPath et les Marker (maker_N) depuis le trajet enregistre, renseigne timeToNext et ecrit filename. | 36 |
| `C:init()` | Etat de duree 'inactive' et trajet vide. | 25 |
| `C:work()` | Etat inactive : snap demarre l'enregistrement. Etat started : snap ajoute une cle ; stop passe a 'finished' et appelle finishUp. | 69 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua`.*
