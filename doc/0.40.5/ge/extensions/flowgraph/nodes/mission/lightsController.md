# `flowgraph_nodes_mission_lightsController`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/lightsController.lua` · VM : Game Engine (GE) · 162 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/lightsController")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Lights Controller' (categorie repeat_instant) pour le feu de depart du drag race (version basee sur la vitesse). Meme sequence que Countdown Lights Controller (arbre Pro ou classique), mais le faux depart est detecte avec le pin 'velocity' > 0,5. Sorties : flow, disqualified, started.

## Remarques

- self.lights n'est cree que par l'impulsion 'reset' : sans reset prealable, work provoque une erreur.
- flow est toujours true en sortie.
- La description du noeud est identique a celle des autres noeuds de lumieres de drag race.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet l'etat et les sorties a zero. | 46 |
| `C:init()` | Meme initialisation. | 54 |
| `C:initLights()` | Recherche les lumieres de stage et du compte a rebours dans la scene. | 23 |
| `C:work()` | Sur reset : remet l'etat et cache les lumieres. Sinon fait avancer le minuteur, gere les ambres/vert, passe started=true, detecte le faux depart (velocity > 0,5) : disqualified=true, ambres et rouge droit allumes. | 62 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/lightsController.lua`.*
