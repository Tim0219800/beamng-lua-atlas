# `flowgraph_builder`

*Fichier : `lua/ge/extensions/flowgraph/builder.lua` · VM : Game Engine (GE) · 440 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/builder")` (fichier sous extensions/ mais pas une extension classique)

Constructeur de nœuds de l'éditeur flowgraph (portage Lua en cours d'une classe C++ de l'exemple blueprints de imgui-node-editor). Il organise le dessin d'un nœud en étapes (begin, header, content, input, middle, output, end), mesure les groupes ImGui de chaque zone, dessine la texture d'en-tête et aligne la largeur du nœud sur la grille de 14 pixels. Utilisé par basenode:draw ; sans intérêt hors de l'éditeur.

## Exemple

```lua
local builder = require('/lua/ge/extensions/flowgraph/builder')()
builder:Begin(node.id)
builder:Header(im.ImVec4(0.2,0.4,0.8,1)) ; im.TextUnformatted('Titre') ; builder:EndHeader()
builder:Input(pin) ; im.Text('in') ; builder:EndInput()
builder:Middle() ; im.Text('milieu')
builder:Output(pin) ; im.Text('out') ; builder:EndOutput()
builder:End(node)
```

## Remarques

- Le module renvoie une fonction : require(...)(options) crée une instance (la table options, si fournie, devient l'objet) et appelle init().
- La machine à états self.CurrentStage vaut 'invalid' hors dessin. SetStage ouvre/ferme les groupes et ID ImGui et mesure leftPinSize, centerSize, rightPinSize, HeaderRect, ContentRect, NodeRect.
- Bug : createRect().is_empty utilise les variables globales w et h (nil) au lieu de res.w/res.h ; elle renvoie toujours false.
- C:init empile des styles (NodeBorder, NodeRounding) sur ui_flowgraph_editor sans les dépiler dans la même fonction.
- drawDebug vaut true à l'initialisation ; basenode:draw le règle ensuite selon la préférence flowgraph.debug.viewMode == 'geometry'.
- Largeur de la sortie : le padding avant le groupe 'output' arrondit la largeur du nœud à un multiple de 14 px et tient compte de expectedHeaderWidth.

## Classe `C`

Instance de builder créée par require('...flowgraph/builder')(opts).

Le module renvoie un constructeur : `local obj = require("flowgraph_builder")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:Begin(nodeID)` | Commence un nœud : réinitialise l'en-tête, empile NodePadding, appelle BeginNode et passe à l'étape 'begin'. | 55 |
| `C:BeginPinDynamic(pin)` | Appelle Input ou Output selon pin.direction ('in' ou 'out'). | 156 |
| `C:End(node)` | Termine le nœud : passe à l'étape 'end', appelle node:customDrawEnd(self) s'il existe, EndNode, dessine la texture d'en-tête arrondie, la ligne de séparation et les rectangles de debug, puis revient à 'invalid'. | 68 |
| `C:EndHeader()` | Ferme l'en-tête et passe à l'étape 'content'. | 133 |
| `C:EndInput()` | Termine le pin d'entrée courant (EndPin). | 151 |
| `C:EndOutput()` | Termine le pin de sortie courant (EndPin). | 193 |
| `C:EndPin()` | Appelle ui_flowgraph_editor.EndPin(). | 406 |
| `C:EndPinDynamic(pin)` | Appelle EndInput ou EndOutput selon pin.direction. | 164 |
| `C:Header(color)` | Ouvre la zone d'en-tête avec la couleur donnée. | 128 |
| `C:Input(pin)` | Ouvre (si besoin) la zone d'entrées et commence un pin d'entrée. | 137 |
| `C:Middle()` | Passe à l'étape 'middle' (zone centrale du nœud, pour drawMiddle). | 172 |
| `C:Output(pin)` | Ouvre (si besoin) la zone de sorties et commence un pin de sortie. | 179 |
| `C:Pin(pin, kind)` | Appelle ui_flowgraph_editor.BeginPin(pin.id, kind). | 386 |
| `C:SetStage(stage)` | Change l'étape de dessin : ferme les groupes de l'ancienne étape en mesurant leurs rectangles, puis ouvre ceux de la nouvelle. Pour 'output', ajoute un padding pour arrondir à la grille. | 206 |
| `C:expectOutPinWidth(width)` | Mémorise la largeur attendue des pins de sortie, utilisée pour aligner le nœud sur la grille. | 198 |
| `C:init()` | Initialise l'état (stage 'invalid', tailles à 0, texture d'en-tête art/imgui_node_header_alt.png) et empile les styles NodeBorder/NodeRounding. | 36 |
| `C:makeAlignmentPin(pin)` | Dessine un pin d'entrée factice (dummy de 12 px de haut) servant à aligner les nœuds qui n'ont aucune entrée visible. | 417 |
| `C:setExpectedHeaderSize(width)` | Mémorise la largeur attendue de l'en-tête (texte + icônes). | 202 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/builder.lua`.*
