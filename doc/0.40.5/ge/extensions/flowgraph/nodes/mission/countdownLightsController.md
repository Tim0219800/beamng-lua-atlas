# `flowgraph_nodes_mission_countdownLightsController`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/countdownLightsController.lua` · VM : Game Engine (GE) · 169 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/countdownLightsController")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Countdown Lights Controller' (categorie repeat_instant) pour le feu de depart du drag race. Allume les ambres puis le vert en suivant le temps (arbre 'Pro' : 3 ambres simultanes a 2,0 s puis vert a 2,4 s ; arbre classique : ambres successifs, vert a 2,5 s). Si le vehicule bouge de plus de 0,2 (pin 'distance') avant le vert, c'est un faux depart : disqualified=true et feux rouges. Sorties : flow, disqualified, started.

## Remarques

- self.lights n'est cree que par initLights, appele seulement sur l'impulsion 'reset' : sans reset prealable, work provoque une erreur (indexation de nil).
- La description du noeud ('Updates the lights for the Drag Races missions') est la meme que celle de Lights Controller et UpdateDisplay.
- flow est toujours true en sortie.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet l'etat (started, starttimer, jumpStarted, timerOn) et les sorties a zero. | 40 |
| `C:init()` | Meme initialisation. | 49 |
| `C:initLights()` | Recherche les objets lumineux du compte a rebours dans la scene (Amberlight1-3, Greenlight, Redlight, gauche/droite). | 23 |
| `C:work()` | Sur reset : remet l'etat et cache toutes les lumieres (initLights). Sinon fait avancer le minuteur (dtSim), allume/eteint les lumieres selon proTree, passe started=true au vert, detecte le faux depart. | 58 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/countdownLightsController.lua`.*
