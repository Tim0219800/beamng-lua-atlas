# `ui_imguiUtils`

*Fichier : `lua/common/extensions/ui/imguiUtils.lua` · VM : Commun (GE + véhicule) · 616 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_imguiUtils` : `extensions.load("ui_imguiUtils")`, puis la globale `ui_imguiUtils`

Boîte à outils ImGui de haut niveau (ui_imguiUtils) : changement d'échelle d'UI, chargement de textures, boutons-menus déroulants (DropdownButton/Selectable/Select), affichage récursif d'une table Lua en arbre ou en colonnes clé/valeur, petite appli clé/valeur, et affichage d'un flottant échantillonné avec min/max (SampleFloatDisplay). Utile pour les outils de debug en ImGui d'un moddeur. Tout passe par ui_imgui ; certaines fonctions supposent la présence de l'éditeur (editor.uiIconImageButton).

## Exemple

```lua
local iu = ui_imguiUtils
-- dans un callback ImGui :
iu.SampleFloatDisplay('rpm', electrics.values.rpm, 0.5, 1)
iu.addRecursiveTreeTable(maTable, '/ma', false)
```

## Remarques

- DropdownButton, DropdownSelectable et DropdownSelect appellent editor.uiIconImageButton quand une icône est fournie : cela exige que l'éditeur (global editor) soit chargé.
- DropdownSelectable utilise imgui.tooltip, défini dans imgui_custom_luaintf.
- SampleFloatDisplay mémorise un état par id ImGui (GetID1) dans sampleFloatDisplayState et alimente dataTbl à chaque appel sans jamais le vider : fuite mémoire lente si utilisé en continu.
- CreateSampleFloatDisplay : le graphique PlotLines est commenté ; seul le texte est affiché. Clic droit = reset, PageUp/PageDown = intervalle ±0.05 s (survol uniquement).
- addRecursiveTreeTable : les sous-tables de plus de 3 éléments à profondeur > 2 sont repliées dans un CollapsingHeader. Les userdata float3 sont affichés en float3(x,y,z), les fonctions listent leurs variables locales.
- renderSubTree utilise la variable globale noColumns (non définie dans la portée locale, donc nil) : l'option noColumns n'est pas propagée aux sous-niveaux.
- keyValueTable appelle imgui.Columns(2, tostring(k)) avec une variable k non définie à ce stade (nil) : l'identifiant de colonnes est donc « nil ».
- IsWindowHovered attend windowSize comme pointeur ImVec2 (windowSize[0].x), pas comme ImVec2 simple.
- changeUIScale multiplie l'échelle par GetWindowDpiScale() sauf si l'éditeur est présent avec la préférence ui.general.dpiAware à faux ; il écrit imgui.uiscale[0] et FontGlobalScale.
- Les fonctions locales pointToLine, getlocal, testTableRecursive etc. ne sont pas exportées.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_imguiUtils.CreateKeyValApp(window, section, tbl, callback)` | Crée une fenêtre ImGui simple avec un TreeNode qui affiche une table Lua clé/valeur. | 305 |
| `ui_imguiUtils.CreateSampleFloatDisplay(sampleTimeInSeconds, startingValue, precision)` | Crée un afficheur de flottant échantillonné : l'objet renvoyé a une méthode draw(newValue) qui montre la valeur échantillonnée toutes les sampleTime secondes, avec infobulle (dernière, échantillonnée, min, max). | 548 |
| `ui_imguiUtils.DropdownButton(label, size, items, icon, horizontal)` | Affiche un bouton (texte ou icône) qui ouvre un popup listant des items DropdownItem, à placer sous le bouton ou à sa droite (horizontal). | 61 |
| `ui_imguiUtils.DropdownItem(label, icon, func, tooltip)` | Crée un élément pour DropdownButton. | 43 |
| `ui_imguiUtils.DropdownSelect(label, size, selectedItem, items, horizontal, excludeCurrent)` | Liste déroulante : le bouton affiche l'item courant items[selectedItem[0]] ; le popup permet d'en choisir un autre. | 194 |
| `ui_imguiUtils.DropdownSelectable(label, items, icon, iconSize, popupWidth, onChangeFunc, tooltip, itemsRMB)` | Bouton ouvrant un popup d'items à cocher (DropdownSelectableItem) ; le clic droit peut ouvrir un second menu (itemsRMB). | 114 |
| `ui_imguiUtils.DropdownSelectableItem(label, active, func, tooltip)` | Crée un élément pour DropdownSelectable. | 52 |
| `ui_imguiUtils.IsWindowHovered(windowPos, windowSize)` | Teste si la souris est dans un rectangle de fenêtre donné (position + taille). | 276 |
| `ui_imguiUtils.SampleFloatDisplay(id, value, sampleTimeInSeconds, precision)` | Version à une seule ligne de CreateSampleFloatDisplay : crée l'afficheur à la première utilisation (clé = imgui.GetID1(id)), puis le dessine avec value. | 607 |
| `ui_imguiUtils.addRecursiveTreeTable(data, fullpath, noColumns, highlightCallback, itemCallback)` | Affiche n'importe quelle valeur Lua : tables en arbre ou en colonnes, booléens/nombres/chaînes colorés, float3, fonctions (noms des variables locales), autres types avec tostring. | 418 |
| `ui_imguiUtils.cell(a, b)` | Affiche deux textes dans deux cellules de colonne (Text puis NextColumn deux fois). | 487 |
| `ui_imguiUtils.changeUIScale(uiscale)` | Définit l'échelle d'interface ImGui (imgui.uiscale[0]) et la FontGlobalScale de l'IO, en tenant compte de la mise à l'échelle DPI de la fenêtre selon la préférence de l'éditeur. | 10 |
| `ui_imguiUtils.displayKeyValues(tbl)` | Affiche les paires clé : valeur d'une table Lua ; les sous-tables deviennent des TreeNode récursifs. | 286 |
| `ui_imguiUtils.drawCursorPos(posX, posY)` | Dessine une petite croix rouge (8 px) à une position d'écran, par défaut la position actuelle du curseur ImGui ; sert à déboguer le placement. | 26 |
| `ui_imguiUtils.keyValueTable(data, fullpath, highlightCallback, itemCallback)` | Affiche une table en deux colonnes (clés triées / valeurs récursives). | 351 |
| `ui_imguiUtils.texObj(path)` | Charge une texture via ImTextureHandler et renvoie une table utilisable avec ImGui. | 33 |

### Détail des paramètres

#### `ui_imguiUtils.CreateKeyValApp(window, section, tbl, callback)`

Crée une fenêtre ImGui simple avec un TreeNode qui affiche une table Lua clé/valeur.

- `window` (*string*) : Titre de la fenêtre.
- `section` (*string*) : Titre du TreeNode.
- `tbl` (*table*) : Table à afficher.
- `callback` (*function|nil*) : Appelé quand le TreeNode est ouvert, avant l'affichage.

#### `ui_imguiUtils.CreateSampleFloatDisplay(sampleTimeInSeconds, startingValue, precision)`

Crée un afficheur de flottant échantillonné : l'objet renvoyé a une méthode draw(newValue) qui montre la valeur échantillonnée toutes les sampleTime secondes, avec infobulle (dernière, échantillonnée, min, max).

- `sampleTimeInSeconds` (*number|nil*) : Intervalle d'échantillonnage, 1 par défaut.
- `startingValue` (*number|nil*) : Valeur initiale, 0 par défaut.
- `precision` (*integer|nil*) : Décimales, 6 par défaut.
- **renvoie** : table ValueSampler avec precision et draw.

#### `ui_imguiUtils.DropdownButton(label, size, items, icon, horizontal)`

Affiche un bouton (texte ou icône) qui ouvre un popup listant des items DropdownItem, à placer sous le bouton ou à sa droite (horizontal).

- `label` (*string*) : Texte du bouton.
- `size` (*ImVec2|nil*) : Taille du bouton.
- `items` (*table*) : Liste d'items DropdownItem.
- `icon` (*any|nil*) : Icône ; sinon bouton texte.
- `horizontal` (*boolean|nil*) : Popup à droite plutôt qu'en dessous, items sur une ligne.
- **renvoie** : boolean Voir le code : renvoie false dans les chemins observés.

#### `ui_imguiUtils.DropdownItem(label, icon, func, tooltip)`

Crée un élément pour DropdownButton.

- `label` (*string*) : Texte.
- `icon` (*any|nil*) : Icône.
- `func` (*function*) : Callback appelé à la sélection.
- `tooltip` (*string|nil*) : Infobulle.
- **renvoie** : table {label, icon, func, tooltip}.

#### `ui_imguiUtils.DropdownSelect(label, size, selectedItem, items, horizontal, excludeCurrent)`

Liste déroulante : le bouton affiche l'item courant items[selectedItem[0]] ; le popup permet d'en choisir un autre.

- `label` (*string*) : Identifiant ImGui (ajouté après ##).
- `size` (*ImVec2|nil*) : Taille du bouton.
- `selectedItem` (*table*) : Pointeur entier (IntPtr), indice [0] = item sélectionné.
- `items` (*table*) : Liste d'items avec label et icon.
- `horizontal` (*boolean|nil*) : Popup à droite.
- `excludeCurrent` (*boolean|nil*) : Masque l'item courant dans la liste (déduit du nom).
- **renvoie** : boolean Voir le code ; false par défaut.

#### `ui_imguiUtils.DropdownSelectable(label, items, icon, iconSize, popupWidth, onChangeFunc, tooltip, itemsRMB)`

Bouton ouvrant un popup d'items à cocher (DropdownSelectableItem) ; le clic droit peut ouvrir un second menu (itemsRMB).

- `label` (*string*) : Texte du bouton.
- `items` (*table*) : Items DropdownSelectableItem.
- `icon` (*any|nil*) : Icône, sinon SmallButton.
- `iconSize` (*ImVec2|nil*) : Taille d'icône avant échelle UI, 32x32 par défaut.
- `popupWidth` (*number|nil*) : Largeur du popup.
- `onChangeFunc` (*function|nil*) : Callback de changement.
- `tooltip` (*string|nil*) : Infobulle.
- `itemsRMB` (*table|nil*) : Items du menu clic droit.
- **renvoie** : boolean false dans les chemins observés.

#### `ui_imguiUtils.DropdownSelectableItem(label, active, func, tooltip)`

Crée un élément pour DropdownSelectable.

- `label` (*string*) : Texte.
- `active` (*boolean*) : État sélectionné.
- `func` (*function*) : Callback appelé à la sélection.
- `tooltip` (*string|nil*) : Infobulle.
- **renvoie** : table {label, active, func, tooltip}.

#### `ui_imguiUtils.IsWindowHovered(windowPos, windowSize)`

Teste si la souris est dans un rectangle de fenêtre donné (position + taille).

- `windowPos` (*ImVec2*) : Position, ex. im.GetWindowPos().
- `windowSize` (*table*) : Taille sous forme de pointeur : windowSize[0].x / .y utilisés.
- **renvoie** : boolean Vrai si la souris est strictement à l'intérieur.

#### `ui_imguiUtils.SampleFloatDisplay(id, value, sampleTimeInSeconds, precision)`

Version à une seule ligne de CreateSampleFloatDisplay : crée l'afficheur à la première utilisation (clé = imgui.GetID1(id)), puis le dessine avec value.

- `id` (*string*) : Identifiant unique de l'affichage.
- `value` (*number*) : Valeur courante.
- `sampleTimeInSeconds` (*number|nil*) : Intervalle (première création).
- `precision` (*integer|nil*) : Décimales (première création).

#### `ui_imguiUtils.addRecursiveTreeTable(data, fullpath, noColumns, highlightCallback, itemCallback)`

Affiche n'importe quelle valeur Lua : tables en arbre ou en colonnes, booléens/nombres/chaînes colorés, float3, fonctions (noms des variables locales), autres types avec tostring.

- `data` (*any*) : Valeur à afficher.
- `fullpath` (*string*) : Chemin courant ; le nombre de « / » donne la profondeur.
- `noColumns` (*boolean|nil*) : Force l'arbre plutôt que les colonnes.
- `highlightCallback` (*function|nil*) : Callback de survol.
- `itemCallback` (*function|nil*) : Callback begin/end par entrée.

#### `ui_imguiUtils.cell(a, b)`

Affiche deux textes dans deux cellules de colonne (Text puis NextColumn deux fois).

- `a` (*string*) : Texte colonne 1.
- `b` (*string*) : Texte colonne 2.

#### `ui_imguiUtils.changeUIScale(uiscale)`

Définit l'échelle d'interface ImGui (imgui.uiscale[0]) et la FontGlobalScale de l'IO, en tenant compte de la mise à l'échelle DPI de la fenêtre selon la préférence de l'éditeur.

- `uiscale` (*number*) : Échelle souhaitée (1 = 100 %).

#### `ui_imguiUtils.displayKeyValues(tbl)`

Affiche les paires clé : valeur d'une table Lua ; les sous-tables deviennent des TreeNode récursifs.

- `tbl` (*table|nil*) : Table à afficher.

#### `ui_imguiUtils.drawCursorPos(posX, posY)`

Dessine une petite croix rouge (8 px) à une position d'écran, par défaut la position actuelle du curseur ImGui ; sert à déboguer le placement.

- `posX` (*number|nil*) : X écran ; défaut : position de fenêtre + curseur X.
- `posY` (*number|nil*) : Y écran ; défaut : position de fenêtre + curseur Y.

#### `ui_imguiUtils.keyValueTable(data, fullpath, highlightCallback, itemCallback)`

Affiche une table en deux colonnes (clés triées / valeurs récursives).

- `data` (*table*) : Table.
- `fullpath` (*string*) : Chemin courant (ex. '/root'), utilisé pour les ids ImGui.
- `highlightCallback` (*function|nil*) : Appelé (path, key, value) quand un élément est survolé.
- `itemCallback` (*function|nil*) : Appelé (begin, path, key, value) avant (true) puis après (false) chaque entrée ; le retour de l'appel begin décide si l'entrée est affichée.

#### `ui_imguiUtils.texObj(path)`

Charge une texture via ImTextureHandler et renvoie une table utilisable avec ImGui.

- `path` (*string*) : Chemin de l'image, ex. '/ui/...png'.
- **renvoie** : table {file = nom du fichier, path, tex = ImTextureHandler, texId (hérité, ne pas utiliser), size = taille}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `sampleFloatDisplayState` | table | États des affichages échantillonnés, indexés par id ImGui. |

## Classe `ValueSampler`

Objet interne renvoyé par CreateSampleFloatDisplay : mesure le temps, mémorise la valeur échantillonnée st et le min/max observés.

| Méthode | Description | Ligne |
|---|---|---|
| `ValueSampler:get(sample)` | Ajoute le temps écoulé, met à jour min/max avec l'échantillon, et renvoie la valeur échantillonnée. | 523 |
| `ValueSampler:reset()` | Remet min/max, valeur échantillonnée et temps à zéro. | 534 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/extensions/ui/imguiUtils.lua`.*
