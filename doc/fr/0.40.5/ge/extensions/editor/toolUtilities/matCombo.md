# `editor_toolUtilities_matCombo`

*Fichier : `lua/ge/extensions/editor/toolUtilities/matCombo.lua` · VM : Game Engine (GE) · 65 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_matCombo` : `extensions.load("editor_toolUtilities_matCombo")`, puis la globale `editor_toolUtilities_matCombo`

Sélecteur imgui de couche de matériau de terrain (liste déroulante) pour les outils de l'éditeur. Les couches sont indexées à partir de 0, comme l'index de peinture ; -1 signifie « auto », résolu via util.findMaterialIdx. Un bouton remet la valeur par défaut.

## Remarques

- Le noms viennent de util.getMaterialNames() (indices 0..#names).
- La fonction ne modifie rien : elle renvoie la nouvelle valeur choisie, c'est à l'appelant de la stocker.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_matCombo.draw(cur, opts)` | Dessine une ligne de sélecteur (bouton de remise à zéro, puis liste déroulante). Renvoie la nouvelle valeur si l'utilisateur a changé la sélection ou remis le défaut, sinon nil. | 28 |

### Détail des paramètres

#### `editor_toolUtilities_matCombo.draw(cur, opts)`

Dessine une ligne de sélecteur (bouton de remise à zéro, puis liste déroulante). Renvoie la nouvelle valeur si l'utilisateur a changé la sélection ou remis le défaut, sinon nil.

- `cur` (*integer|string|nil*) : Valeur courante (index de couche, -1 = auto) ; convertie par tonumber, sinon opts.default.
- `opts` (*table*) : id (obligatoire, id imgui), label, default (valeur par défaut), allowAuto (propose l'entrée Auto), autoNames (noms à chercher pour l'auto), tooltip.
- **renvoie** : integer|nil Nouvel index choisi, ou nil si rien n'a changé.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/matCombo.lua`.*
