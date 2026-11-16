# `flowgraph_nodes_ui_updatedUI_endScreenBegin`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua` · VM : Game Engine (GE) · 375 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin")` (fichier sous extensions/ mais pas une extension classique)

Nœud « EndScreen Begin » (catégorie par défaut, couleur ui). Commence la construction de l'écran de fin d'une mission : à la première frame avec flow actif, il appelle modules.ui:startUIBuilding('endScreen'), construit les boutons (Retry, Continuer au début, Continuer ici, boutons personnalisés, missions suivantes) puis active le pin build. Les nœuds « EndScreen ... » chaînés ensuite ajoutent les panneaux, et un nœud « Screen Finish » termine la construction. Pins : entrées flow, reset (impulsion), change (table, résultat d'une tentative), customBtnsFirst (caché), contStartActive / contHereActive (cachés, true) et un pin string + un pin bool « _active » par bouton personnalisé ; sorties flow, build (chainFlow), retry, contStart, contHere et un flow par bouton personnalisé. S'exécute tant que flow est actif.

## Remarques

- Le pin flow de sortie est toujours remis à false en fin de work ; seul build (une frame) sert à chaîner les panneaux.
- Le bouton « Continuer ici » n'existe en carrière que si le joueur utilise son propre véhicule ; en tutoriel de carrière seul ce bouton reste.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état du nœud. | 46 |
| `C:_executionStopped()` | Appelé à l'arrêt du projet ; ferme le dialogue. | 54 |
| `C:_onDeserialized(nodeData)` | Recharge les boutons personnalisés puis recrée les pins. | 156 |
| `C:_onSerialize(res)` | Sauvegarde la liste des boutons personnalisés (options). | 152 |
| `C:buttonPushed(action)` | Appelé quand un bouton est cliqué : met à true le pin de sortie du même nom que l'action, puis ferme le dialogue (navigation vers « play »). | 161 |
| `C:closeDialogue()` | Si l'écran a été construit, navigue vers l'écran « play » pour fermer l'écran de fin. | 325 |
| `C:drawCustomProperties()` | Dessine dans l'éditeur flowgraph la liste des boutons personnalisés (champ texte par bouton, boutons « add » et « rem »). Renvoie la raison de la modification (chaîne) ou nil. | 62 |
| `C:init()` | Initialise open=false, la liste des boutons personnalisés, data.includeRetryButton=true et le minuteur d'auto-skip. | 33 |
| `C:onClientEndMission()` | Hook appelé à la fin de la mission côté client ; ferme le dialogue. | 58 |
| `C:onNodeReset()` | Remet les pins de sortie à false et réinitialise open/built. | 331 |
| `C:onResetGameplay()` | Hook appelé lors d'un reset du gameplay ; si l'écran est ouvert et que le bouton Retry est inclus, navigue vers « play » et active le pin retry. | 171 |
| `C:openDialogue()` | Émet le hook onEndScreenUIOpened et construit la liste de boutons : Retry (avec frais d'entrée en carrière, désactivé si le joueur ne peut pas payer), Continuer au début (ou retour aux scénarios si lancé comme scénario), Continuer ici (hors carrière, ou carrière avec véhicule du joueur), restriction en tutoriel, boutons personnalisés, puis boutons « Start Next Mission ». L'ordre est inversé et le premier bouton reçoit le focus. | 179 |
| `C:postInit()` | Appelé juste après init, une fois les pins créés. | 41 |
| `C:updateButtons()` | Recrée les pins du nœud pour chaque nom de bouton de self.options : pin d'entrée string (libellé), pin d'entrée bool « <nom>_active » (caché, true par défaut) et pin de sortie flow. Reconnecte les liens existants quand le nom n'a pas changé. | 97 |
| `C:work()` | Si reset est actif, réinitialise le nœud. Quand flow est actif et que l'écran n'est pas encore construit, démarre la construction UI et ouvre le dialogue. Gère l'auto-skip : si startingOptions.autoSkipEndScreen est défini, arrête la mission après 2 s de temps réel. | 342 |
| `C:workOnce()` | Variante exécutée une seule fois par le moteur flowgraph (corps vide ici). | 339 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEndScreenUIOpened` — écouté par 1 module(s)
- `onResetGameplay` — écouté par 5 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua`.*
