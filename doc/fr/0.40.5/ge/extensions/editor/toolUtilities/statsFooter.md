# `editor_toolUtilities_statsFooter`

*Fichier : `lua/ge/extensions/editor/toolUtilities/statsFooter.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_statsFooter` : `extensions.load("editor_toolUtilities_statsFooter")`, puis la globale `editor_toolUtilities_statsFooter`

Pied de page de statistiques partagé par les outils « kit » de l'éditeur : affiche des stats « Libellé N » en ImGui et la ligne dynamique des triangles dessinés, de la distance et du nombre de pièces affichées (calculés par triLive). Utilise la palette 'crystal' de style.lua.

## Remarques

- À appeler dans une fenêtre ImGui ; les fonctions dessinent directement avec im.TextColored et im.SameLine.
- Tant que triLive a des formes à mesurer (toScan > 0), liveRow n'affiche que « Drawn tris : scanning N shapes ».

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_statsFooter.item(label, val, col, lead, tip)` | Dessine une stat « Libellé N » : libellé terne, nombre coloré, barre « \| » ternie devant (sauf en début de ligne). | 16 |
| `editor_toolUtilities_statsFooter.liveRow(instances, unique, fresh)` | Affiche triangles dessinés (« Drawn tris »), portée (« Range », en mètres) et pièces dessinées sur placées (« Drawing »). `unique` est ajouté tel quel aux triangles car sans LOD. Met à jour triLive (note si fresh, scanStep, update). | 26 |

### Détail des paramètres

#### `editor_toolUtilities_statsFooter.item(label, val, col, lead, tip)`

Dessine une stat « Libellé N » : libellé terne, nombre coloré, barre « | » ternie devant (sauf en début de ligne).

- `label` (*string*) : Libellé.
- `val` (*any*) : Valeur affichée via tostring ; 0 si nil/false.
- `col` (*ImVec4*) : Couleur du nombre.
- `lead` (*boolean|nil*) : Vrai : début de ligne, pas de barre.
- `tip` (*string|nil*) : Infobulle.

#### `editor_toolUtilities_statsFooter.liveRow(instances, unique, fresh)`

Affiche triangles dessinés (« Drawn tris »), portée (« Range », en mètres) et pièces dessinées sur placées (« Drawing »). `unique` est ajouté tel quel aux triangles car sans LOD. Met à jour triLive (note si fresh, scanStep, update).

- `instances` (*table*) : Entrées triLive.
- `unique` (*number*) : Triangles de la géométrie unique, ajoutés en entier.
- `fresh` (*boolean|nil*) : La liste a changé depuis la dernière fois (peut contenir une forme jamais mesurée).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/statsFooter.lua`.*
