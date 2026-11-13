# `flowgraph_link`

*Fichier : `lua/ge/extensions/flowgraph/link.lua` · VM : Game Engine (GE) · 292 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/link")` (fichier sous extensions/ mais pas une extension classique)

Classe 'link' du flowgraph : un lien entre une pin de sortie (sourcePin) et une pin d'entrée (targetPin) de deux nœuds d'un graphe. À la création, il s'enregistre dans graph.links, écrit la pin source dans targetNode.pinIn, tient à jour la liste de flux multiples (_mInFlow) pour les pins de type flow, prévient pins et nœuds (_onLink) et choisit sa couleur d'après le type de pin. Il dessine aussi le lien dans l'éditeur (imgui / ui_flowgraph_editor). Le module renvoie un constructeur : require('/lua/ge/extensions/flowgraph/link')(graph, sourcePin, targetPin).

## Remarques

- Un lien a deux ids : id et hiddenId (utilisé pour le surlignage), tous deux demandés à mgr:getNextFreePinLinkId().
- Sérialisation compacte : {id nœud source, nom pin source, id nœud cible, nom pin cible, hidden}.
- Un lien 'state' → 'state' est dessiné entre les pins de transition (N/S/E/W) selon la position relative des nœuds, avec une étiquette au nom de la pin source.
- convertToQuickAccess remplace les liens issus d'une même pin source par un accès rapide (quickAccess + accessName unique, suffixe numérique si le nom existe) puis supprime la sélection.

## Classe `C`

Objet lien renvoyé par le constructeur.

Le module renvoie un constructeur : `local obj = require("flowgraph_link")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:__onDeserialized(data)` | Restaure l'état masqué depuis data[5]. | 280 |
| `C:__onSerialize()` | Renvoie {sourceNode.id, sourcePin.name, targetNode.id, targetPin.name, hidden}. | 270 |
| `C:convertToQuickAccess()` | Transforme les liens partant de la pin source en accès rapide nommé (voir notes) puis supprime la sélection. | 233 |
| `C:doFlow()` | Demande une animation de flux à la prochaine frame de dessin. | 182 |
| `C:draw()` | Dessine le lien dans l'éditeur avec animation de flux quand la pin source est active à la frame courante (jamais si le manager est arrêté, vitesse nulle en pause). | 111 |
| `C:drawLabel(sPin, tPin)` | Dessine l'étiquette (nom de la pin source) au milieu d'un lien d'état. | 186 |
| `C:drawLinkTooltip()` | Affiche l'infobulle du lien survolé : icône et type de la pin source et sa valeur courante. | 68 |
| `C:getDirPins()` | Pour les liens d'états : renvoie la paire de directions ('E','W' / 'W','E' / 'S','N' / 'N','S') selon la position des nœuds, ou nil,nil sans positions. | 92 |
| `C:init(graph, sourcePin, targetPin)` | Crée le lien, l'enregistre dans le graphe et notifie pins et nœuds. | 9 |
| `C:showContextMenu(menuPos)` | Menu contextuel du lien : masquer / afficher, supprimer (si l'édition est autorisée) et, si la préférence flowgraph.debug.displayIds est active, ids. | 214 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/link.lua`.*
