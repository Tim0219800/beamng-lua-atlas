# `ui_liveries_fill`

*Fichier : `lua/ge/extensions/ui/liveries/fill.lua` · VM : Game Engine (GE) · 77 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_liveries_fill` : `extensions.load("ui_liveries_fill")`, puis la globale `ui_liveries_fill`

Gère la couche de remplissage de base (« fill layer ») d'une livrée dans l'éditeur de livrées. Il s'appuie sur editor_api_dynamicDecals pour créer ou retrouver la couche tout en bas de la pile, et sur ui_liveries_paint pour lire et modifier sa couleur. L'écran de peinture de l'interface l'utilise pour afficher et changer la couleur de fond du véhicule.

## Remarques

- baseFillLayerUid est un état local au module : il vaut nil tant que setup ou bindLoadedLayer n'a pas réussi, et après teardown.
- La couche créée par setup utilise la palette EDITABLE_COLOR_PALETTE_MAP_ID (0), donc elle affiche sa propre couleur.

**Dépendances (chargées avant) :** `editor_api_dynamicDecals`, `ui_liveries_paint`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_liveries_fill.bindLoadedLayer()` | Après chargement d'une livrée existante, cherche dans la pile de couches la première couche de type fill et mémorise son uid. Journalise un avertissement et renvoie false si aucune n'existe (l'écran de peinture reste alors inactif). | 21 |
| `ui_liveries_fill.getPaint()` | Renvoie la peinture de la couche de base (via ui_liveries_paint.getLayerPaint) complétée par paint.vehicleColor = {r, g, b, a} lue sur la couleur du véhicule du joueur 0. Renvoie nil, avec un avertissement, si aucune couche de base n'est liée. | 45 |
| `ui_liveries_fill.setPaint(paint)` | Applique une peinture à la couche de base en déléguant à ui_liveries_paint.setLayerPaint. Renvoie false, avec un avertissement, si aucune couche de base n'est liée. | 67 |
| `ui_liveries_fill.setup(vehicleColor)` | Crée la couche de remplissage de base d'une nouvelle livrée : règle l'id de palette et la couleur par défaut des couches fill, puis ajoute la couche et mémorise son uid. Renvoie false si l'API de décalques n'est pas chargée ou si vehicleColor est absent. | 10 |
| `ui_liveries_fill.teardown()` | Oublie l'uid de la couche de base. Ne supprime pas la couche elle-même. | 41 |

### Détail des paramètres

#### `ui_liveries_fill.bindLoadedLayer()`

Après chargement d'une livrée existante, cherche dans la pile de couches la première couche de type fill et mémorise son uid. Journalise un avertissement et renvoie false si aucune n'existe (l'écran de peinture reste alors inactif).

- **renvoie** : boolean true si une couche fill a été trouvée.

#### `ui_liveries_fill.getPaint()`

Renvoie la peinture de la couche de base (via ui_liveries_paint.getLayerPaint) complétée par paint.vehicleColor = {r, g, b, a} lue sur la couleur du véhicule du joueur 0. Renvoie nil, avec un avertissement, si aucune couche de base n'est liée.

- **renvoie** : table|nil Table layerUid, color, metallic, roughness, presets et vehicleColor.

#### `ui_liveries_fill.setPaint(paint)`

Applique une peinture à la couche de base en déléguant à ui_liveries_paint.setLayerPaint. Renvoie false, avec un avertissement, si aucune couche de base n'est liée.

- `paint` (*table*) : Table avec color {r, g, b, a} normalisée entre 0 et 1 (metallic et roughness sont ignorés pour une couche fill).
- **renvoie** : boolean true si la couche a été mise à jour.

#### `ui_liveries_fill.setup(vehicleColor)`

Crée la couche de remplissage de base d'une nouvelle livrée : règle l'id de palette et la couleur par défaut des couches fill, puis ajoute la couche et mémorise son uid. Renvoie false si l'API de décalques n'est pas chargée ou si vehicleColor est absent.

- `vehicleColor` (*Point4F|table*) : Couleur du véhicule passée à setFillLayerColor (type déduit du code).
- **renvoie** : boolean true si une couche a été créée et son uid mémorisé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant celle-ci : editor_api_dynamicDecals et ui_liveries_paint. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/liveries/fill.lua`.*
