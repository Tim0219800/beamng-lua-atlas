# `flowgraph_pin`

*Fichier : `lua/ge/extensions/flowgraph/pin.lua` · VM : Game Engine (GE) · 398 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/pin")` (fichier sous extensions/ mais pas une extension classique)

Classe `pin` du flowgraph : représente une broche d'entrée ou de sortie d'un nœud (nom, type, direction, valeur, liens). Le module renvoie un constructeur : `require('flowgraph_pin')(graph, node, direction, type, name, default, description)`. Les moddeurs de nœuds la manipulent via `self.pinIn.<nom>` / `self.pinOut.<nom>` (champ `.value`, `:isUsed()`, `:valueSetVec3/Quat`). Le reste (dessin, tooltip, menu) sert à l'éditeur ImGui.

## Remarques

- Le suivi d'usage (`enableUsageTracking = true`) remplace le `__index`/`__newindex` de la table de classe : lire ou écrire `pin.value` accède en réalité à `_value` et met à jour `_frameLastUsed` avec le compteur de frames du manager.
- Comme les métatables modifiées sont celles de la classe partagée (`getmetatable(self)`), ce comportement s'applique à tous les pins.
- `valueSetVec3` et `valueSetQuat` réutilisent la même table `valueHelperTable` (pas d'allocation) : ne pas conserver la table renvoyée entre deux frames ; vec3 met `[4] = nil`.
- Pour un pin `in` hors flux, un seul lien est gardé (`links[1]`) ; pour les flux ou les sorties, plusieurs liens s'empilent.
- `pinMode` vaut 'normal' par défaut ; 'hardcoded' signifie valeur fixée dans l'éditeur (le pin compte alors comme utilisé).
- Dans `_draw_in`, `constValue` est vérifié par `~= nil` pour afficher un cadenas.

## Classe `C`

Pin de flowgraph. Champs notables : graph, id, name, type (string ou liste de types), direction ('in'/'out'), node, default, defaultValue, description, hidden, links, hardTemplates, impulse, chainFlow, tableType, pinMode, quickAccess.

Le module renvoie un constructeur : `local obj = require("flowgraph_pin")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_draw_in(builder, style, alpha, simpleDraw, constValue, outWidth)` | Dessine un pin d'entrée dans l'éditeur (icône de type, nom, valeur constante éventuelle avec cadenas). | 99 |
| `C:_draw_out(builder, style, alpha, simpleDraw, const, outWidth)` | Dessine un pin de sortie dans l'éditeur (nom aligné à droite puis icône). | 132 |
| `C:_getCalculatedWidth(simpleDraw)` | Calcule la largeur d'affichage du pin (icône + texte + marge). | 164 |
| `C:_onLink(link)` | Appelé quand un lien est créé : remplace `links[1]` (entrée hors flux) ou ajoute le lien ; rend le pin visible. | 347 |
| `C:_onUnlink(link)` | Appelé quand un lien est supprimé : le retire de la liste. | 356 |
| `C:draw(builder, style, isHeader, constValue, outWidth)` | Dessine le pin (selon `direction`) avec la bonne opacité, gère le clic (sélection du nœud) et mémorise le survol. | 262 |
| `C:drawTooltip(mgr)` | Affiche l'infobulle ImGui du pin : nom, type valide ou connecté, type de table et description. | 188 |
| `C:getFirstConnectedLink()` | Renvoie le premier lien du pin (`links[1]`), ou nil. | 79 |
| `C:getTableType()` | Si le pin est de type table (ou inclut table), renvoie `tableType` (ou 'generic') ; sinon une chaîne vide. | 156 |
| `C:getTypeWithImpulseAndChain()` | Renvoie 'impulse' si le pin est une impulsion, 'chainFlow' s'il est en flux chaîné, sinon son type (utilisé pour choisir l'icône). | 152 |
| `C:highlightLinks()` | Marque tous les liens du pin comme surlignés (`_highlight = true`). | 256 |
| `C:hoverDraw(mgr)` | Si le pin est survolé, surligne ses liens et affiche son infobulle. | 299 |
| `C:init(graph, node, direction, type, name, default, description)` | Constructeur : enregistre le graphe, obtient un id unique du manager (`getNextFreePinLinkId`), stocke nom/type/direction/valeur par défaut et active le suivi d'usage de `value`. Un pin de sortie de type `delegate` reçoit `hasOutputDelegates = true`. | 13 |
| `C:isActive()` | Pendant la création d'un lien, dit si ce pin peut servir de cible (actif) ou s'il doit être grisé. | 180 |
| `C:isUsed()` | Renvoie true si le pin a au moins un lien ou si sa valeur est codée en dur (`pinMode == 'hardcoded'`). Utilisé par certains nœuds pour sauter des calculs inutiles. | 369 |
| `C:showContextMenu(menuPos, main)` | Menu contextuel du pin dans l'éditeur : accès rapide, masquer le pin (si sans lien), afficher/masquer ses liens, debug. | 306 |
| `C:valueSetQuat(v)` | Écrit un quaternion dans `value` sous forme de table {x, y, z, w} réutilisée. | 383 |
| `C:valueSetVec3(v)` | Écrit un vecteur dans `value` sous forme de table {x, y, z} réutilisée (sans allocation). | 373 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/pin.lua`.*
