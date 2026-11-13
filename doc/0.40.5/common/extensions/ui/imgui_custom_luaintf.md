# `ui_imgui_custom_luaintf`

*Fichier : `lua/common/extensions/ui/imgui_custom_luaintf.lua` · VM : Commun (GE + véhicule) · 447 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/ui/imgui_custom_luaintf")` (fichier sous extensions/ mais pas une extension classique)

Ajouts écrits à la main à l'API ImGui (par opposition à imgui_luaintf.lua, généré). Le fichier renvoie une fonction qui reçoit la table M d'imgui_api et y définit : constructeurs de valeurs/pointeurs (ImVec2, ImVec4, BoolPtr, IntPtr, FloatPtr, DoublePtr, ArrayChar, ArrayInt, ArrayFloat), versions personnalisées de Begin/InputText/InputTextMultiline/Combo1/OpenPopup/SetDragDropPayload, gestion de polices, d'échelle, de textures, aides (ShowHelpMarker, tooltip, tooltipWrapped, HighlightText, HeaderText, BeginDisabled), wrappers de moniteur/ini, et les widgets Knob. Il est chargé après imgui_luaintf, donc ses définitions écrasent celles du fichier généré.

## Exemple

```lua
local im = ui_imgui
local val = im.FloatPtr(0.5)
im.SliderFloat('x', val, 0, 1)
im.tooltip('Aide')
```

## Remarques

- En GE, les « pointeurs » sont de simples tables {[0] = valeur} : lire/écrire val[0]. BoolPtr/IntPtr/FloatPtr/DoublePtr renvoient {[0]=0 ou false} si le type de l'argument est incorrect (log commenté). BoolPtr convertit 0/1 en booléen.
- ArrayChar(len, val) renvoie un string.buffer pré-rempli (tampon texte pour InputText) ; ffi.string(buf) ou tostring pour relire.
- Begin(): flags par défaut = WindowFlags_NoFocusOnAppearing (et non 0 comme dans la version générée). Si le nom est nil, une erreur est loguée et la fonction retourne.
- InputText: buf_size par défaut 2^32, flags 0 ; le callback passé est ignoré (nil transmis).
- GetKeyIndex est un no-op (renvoie l'index) depuis ImGui 1.87.
- GetContentRegionAvailWidth et GetWindowContentRegionWidth sont des wrappers ajoutés car supprimés de la version récente d'ImGui.
- TableSetSortSpecsDirty utilise M.TableGetSortSpecs().SpecsDirty.
- Bug : headerDefaultColor est construit avec ImVec4(1,0.6,0,8,0.75), soit 5 arguments (le 5e est ignoré, w vaut 8 au lieu d'un 0.8 probable).
- Alias de compatibilité : SelectableFlags_AllowItemOverlap = SelectableFlags_AllowOverlap, Mod_Shortcut = Mod_Ctrl, Key_ModCtrl/Shift/Alt/Super vers Mod_*.
- uiscale = {[0] = 1} : échelle d'UI globale utilisée par ui_imguiUtils et tooltipWrapped. plotLineColor = 4288453788 et plotLineBgColor = 2323270185 sont des couleurs ImU32 par défaut.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_imgui_custom_luaintf.ArrayChar(len, val)` | Crée un tampon texte (string.buffer) de taille len, éventuellement pré-rempli avec val. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.ArrayFloat(size)` | Tableau de flottants indexé depuis 0, initialisé à 0. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.ArrayInt(size)` | Tableau d'entiers indexé depuis 0, initialisé à 0. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.Begin(string_name, bool_p_open, ImGuiWindowFlags_flags)` | Ouvre une fenêtre ImGui. Flags par défaut : WindowFlags_NoFocusOnAppearing. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.BeginDisabled(disable)` | Début d'une zone désactivée (true par défaut). (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.BoolPtr(x)` | Crée un pointeur booléen {[0]=bool} (0/1 convertis, autre type -> false). (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.Combo1(label, current_item, items, items_count, popup_max_height_in_items)` | Liste déroulante sur un tableau de chaînes ; items_count calculé avec #items si nil, hauteur max -1 par défaut. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.DoublePtr(x)` | Crée un pointeur double {[0]=n}. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.EndDisabled()` | Fin de zone désactivée. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.FloatPtr(x)` | Crée un pointeur flottant {[0]=n} (0 si x n'est pas un nombre). (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.GetContentRegionAvailWidth()` | Largeur disponible (GetContentRegionAvail().x). (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.HeaderText(text, color)` | Affiche un texte d'en-tête avec la police cairo_regular_medium ; couleur par défaut ImVec4(1,0.6,0,8,0.75). (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.HighlightSelectable(label, highlightText, selected)` | Comme HighlightText mais dessine en plus un fond de surbrillance quand l'élément est survolé (Col_HeaderHovered/HeaderActive) ou sélectionné (Col_Header). Ne renvoie rien. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.HighlightText(label, highlightText)` | Affiche label avec la sous-chaîne highlightText en orange (matchColor). Si highlightText est vide, tout le label est coloré. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.ImColorByRGB(r, g, b, a)` | Crée un ImColor depuis des composantes 0-255 (alpha 255 par défaut) et renseigne Value en 0-1. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.ImGuiIO_FontGlobalScale(io, value)` | Écrit io.FontGlobalScale. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.ImTextureHandler(path)` | Crée un handler de texture et lui affecte path comme identifiant. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.ImTextureHandlerIsCached(path)` | Indique si la texture est déjà en cache. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.ImVec2(x, y)` | Crée un ImVec2 (x, y). (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.ImVec4(x, y, z, w)` | Crée un ImVec4 (x, y, z, w). (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.InputText(label, buf, buf_size, flags, callback, user_data, editEnded)` | Champ texte sur un tampon ArrayChar ; taille par défaut 2^32, flags 0. Le callback est ignoré. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.InputTextMultiline(label, buf, buf_size, size, flags, callback, user_data)` | Champ texte multiligne ; taille (0,0) et flags 0 par défaut. Le callback est ignoré. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.IntPtr(x)` | Crée un pointeur entier {[0]=n} (0 si x n'est pas un nombre). (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.Knob(string_label, floatPtr_value, float_v_min, float_v_max, float_speed, string_format, ImGuiKnobVariant_variant, float_size, ImGuiKnobFlags_flags, int_steps)` | Bouton rotatif (knob) pour un flottant. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.KnobInt(string_label, intPtr_value, int_v_min, int_v_max, float_speed, string_format, ImGuiKnobVariant_variant, float_size, ImGuiKnobFlags_flags, int_steps)` | Knob pour un entier ; mêmes paramètres que Knob avec un IntPtr. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.SetDragDropPayload(string_type, void_data, size_t_sz, ImGuiCond_cond)` | Définit le payload de glisser-déposer ; erreur loguée si type ou data est nil ; cond 0 par défaut. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.ShowHelpMarker(desc, sameLine)` | Affiche « (?) » grisé ; au survol, infobulle avec desc sur 35 caractères de large. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.getCurrentMonitorSize()` | Renvoie la taille du moniteur courant. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.getMainViewPortId()` | Id du viewport principal. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.getMonitorIndex()` | Index du moniteur (imgui.getMonitorIndex). (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.loadIniSettingsFromDisk(filename)` | Charge les réglages ImGui (.ini) depuis un fichier. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.saveIniSettingsToDisk(filename)` | Enregistre les réglages ImGui (.ini) dans un fichier. (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.tooltip(message)` | Si l'élément précédent est survolé, affiche message en infobulle (SetTooltip). (assignée dynamiquement) | dyn |
| `ui_imgui_custom_luaintf.tooltipWrapped(message, wrapWidth)` | Comme tooltip mais avec retour à la ligne à wrapWidth pixels (350 par défaut, multiplié par uiscale[0]). (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `ui_imgui_custom_luaintf.ArrayChar(len, val)`

Crée un tampon texte (string.buffer) de taille len, éventuellement pré-rempli avec val. (assignée dynamiquement)

- `len` (*integer*) : Taille en octets.
- `val` (*string|nil*) : Texte initial.
- **renvoie** : userdata string.buffer.

#### `ui_imgui_custom_luaintf.ArrayFloat(size)`

Tableau de flottants indexé depuis 0, initialisé à 0. (assignée dynamiquement)

- `size` (*integer*) : Taille.
- **renvoie** : table Tableau [0..size-1].

#### `ui_imgui_custom_luaintf.ArrayInt(size)`

Tableau d'entiers indexé depuis 0, initialisé à 0. (assignée dynamiquement)

- `size` (*integer*) : Taille.
- **renvoie** : table Tableau [0..size-1].

#### `ui_imgui_custom_luaintf.Begin(string_name, bool_p_open, ImGuiWindowFlags_flags)`

Ouvre une fenêtre ImGui. Flags par défaut : WindowFlags_NoFocusOnAppearing. (assignée dynamiquement)

- `string_name` (*string*) : Titre/identifiant.
- `bool_p_open` (*table|nil*) : BoolPtr pour la croix de fermeture.
- `ImGuiWindowFlags_flags` (*integer|nil*) : Flags de fenêtre.
- **renvoie** : boolean Vrai si le contenu doit être dessiné.

#### `ui_imgui_custom_luaintf.BeginDisabled(disable)`

Début d'une zone désactivée (true par défaut). (assignée dynamiquement)

- `disable` (*boolean|nil*) : Désactive si vrai ou nil.

#### `ui_imgui_custom_luaintf.BoolPtr(x)`

Crée un pointeur booléen {[0]=bool} (0/1 convertis, autre type -> false). (assignée dynamiquement)

- `x` (*boolean|number*) : Valeur initiale.
- **renvoie** : table {[0]=bool}

#### `ui_imgui_custom_luaintf.Combo1(label, current_item, items, items_count, popup_max_height_in_items)`

Liste déroulante sur un tableau de chaînes ; items_count calculé avec #items si nil, hauteur max -1 par défaut. (assignée dynamiquement)

- `label` (*string*) : Libellé.
- `current_item` (*table*) : IntPtr de l'élément courant.
- `items` (*table*) : Tableau de chaînes.
- `items_count` (*integer|nil*) : Nombre d'éléments.
- `popup_max_height_in_items` (*integer|nil*) : -1 par défaut.
- **renvoie** : boolean Vrai si changé.

#### `ui_imgui_custom_luaintf.DoublePtr(x)`

Crée un pointeur double {[0]=n}. (assignée dynamiquement)

- `x` (*number*) : Valeur initiale.
- **renvoie** : table {[0]=n}

#### `ui_imgui_custom_luaintf.FloatPtr(x)`

Crée un pointeur flottant {[0]=n} (0 si x n'est pas un nombre). (assignée dynamiquement)

- `x` (*number*) : Valeur initiale.
- **renvoie** : table {[0]=n}

#### `ui_imgui_custom_luaintf.GetContentRegionAvailWidth()`

Largeur disponible (GetContentRegionAvail().x). (assignée dynamiquement)

- **renvoie** : number Largeur.

#### `ui_imgui_custom_luaintf.HeaderText(text, color)`

Affiche un texte d'en-tête avec la police cairo_regular_medium ; couleur par défaut ImVec4(1,0.6,0,8,0.75). (assignée dynamiquement)

- `text` (*string*) : Texte.
- `color` (*ImVec4|nil*) : Couleur.

#### `ui_imgui_custom_luaintf.HighlightSelectable(label, highlightText, selected)`

Comme HighlightText mais dessine en plus un fond de surbrillance quand l'élément est survolé (Col_HeaderHovered/HeaderActive) ou sélectionné (Col_Header). Ne renvoie rien. (assignée dynamiquement)

- `label` (*string*) : Texte.
- `highlightText` (*string*) : Sous-chaîne.
- `selected` (*boolean*) : État sélectionné.

#### `ui_imgui_custom_luaintf.HighlightText(label, highlightText)`

Affiche label avec la sous-chaîne highlightText en orange (matchColor). Si highlightText est vide, tout le label est coloré. (assignée dynamiquement)

- `label` (*string*) : Texte.
- `highlightText` (*string*) : Sous-chaîne à surligner.

#### `ui_imgui_custom_luaintf.ImColorByRGB(r, g, b, a)`

Crée un ImColor depuis des composantes 0-255 (alpha 255 par défaut) et renseigne Value en 0-1. (assignée dynamiquement)

- `r` (*number*) : Rouge 0-255.
- `g` (*number*) : Vert 0-255.
- `b` (*number*) : Bleu 0-255.
- `a` (*number|nil*) : Alpha 0-255.
- **renvoie** : ImColor Couleur.

#### `ui_imgui_custom_luaintf.ImGuiIO_FontGlobalScale(io, value)`

Écrit io.FontGlobalScale. (assignée dynamiquement)

- `io` (*userdata*) : Résultat de GetIO().
- `value` (*number*) : Échelle.

#### `ui_imgui_custom_luaintf.ImTextureHandler(path)`

Crée un handler de texture et lui affecte path comme identifiant. (assignée dynamiquement)

- `path` (*string*) : Chemin de la texture.
- **renvoie** : userdata ImTextureHandler (méthodes getID, getSize…).

#### `ui_imgui_custom_luaintf.ImTextureHandlerIsCached(path)`

Indique si la texture est déjà en cache. (assignée dynamiquement)

- `path` (*string*) : Chemin.
- **renvoie** : boolean Vrai si en cache.

#### `ui_imgui_custom_luaintf.ImVec2(x, y)`

Crée un ImVec2 (x, y). (assignée dynamiquement)

- `x` (*number*) : X.
- `y` (*number*) : Y.
- **renvoie** : ImVec2 Vecteur.

#### `ui_imgui_custom_luaintf.ImVec4(x, y, z, w)`

Crée un ImVec4 (x, y, z, w). (assignée dynamiquement)

- `x` (*number*) : X / R.
- `y` (*number*) : Y / G.
- `z` (*number*) : Z / B.
- `w` (*number*) : W / A.
- **renvoie** : ImVec4 Vecteur.

#### `ui_imgui_custom_luaintf.InputText(label, buf, buf_size, flags, callback, user_data, editEnded)`

Champ texte sur un tampon ArrayChar ; taille par défaut 2^32, flags 0. Le callback est ignoré. (assignée dynamiquement)

- `label` (*string*) : Libellé.
- `buf` (*userdata*) : Tampon ArrayChar.
- `buf_size` (*integer|nil*) : Taille max.
- `flags` (*integer|nil*) : InputTextFlags.
- `callback` (*any*) : Ignoré.
- `user_data` (*any*) : Données utilisateur.
- `editEnded` (*any*) : Non utilisé.
- **renvoie** : boolean Vrai si modifié.

#### `ui_imgui_custom_luaintf.InputTextMultiline(label, buf, buf_size, size, flags, callback, user_data)`

Champ texte multiligne ; taille (0,0) et flags 0 par défaut. Le callback est ignoré. (assignée dynamiquement)

- `label` (*string*) : Libellé.
- `buf` (*userdata*) : Tampon ArrayChar.
- `buf_size` (*integer|nil*) : Taille max.
- `size` (*ImVec2|nil*) : Taille.
- `flags` (*integer|nil*) : Flags.
- `callback` (*any*) : Ignoré.
- `user_data` (*any*) : Données utilisateur.
- **renvoie** : boolean Vrai si modifié.

#### `ui_imgui_custom_luaintf.IntPtr(x)`

Crée un pointeur entier {[0]=n} (0 si x n'est pas un nombre). (assignée dynamiquement)

- `x` (*number*) : Valeur initiale.
- **renvoie** : table {[0]=n}

#### `ui_imgui_custom_luaintf.Knob(string_label, floatPtr_value, float_v_min, float_v_max, float_speed, string_format, ImGuiKnobVariant_variant, float_size, ImGuiKnobFlags_flags, int_steps)`

Bouton rotatif (knob) pour un flottant. (assignée dynamiquement)

- `string_label` (*string*) : Libellé.
- `floatPtr_value` (*table*) : FloatPtr.
- `float_v_min` (*number*) : Min.
- `float_v_max` (*number*) : Max.
- `float_speed` (*number|nil*) : Vitesse.
- `string_format` (*string|nil*) : Format d'affichage.
- `ImGuiKnobVariant_variant` (*integer|nil*) : KnobVariant_*.
- `float_size` (*number|nil*) : Taille.
- `ImGuiKnobFlags_flags` (*integer|nil*) : KnobFlags_*.
- `int_steps` (*integer|nil*) : Nombre de crans.
- **renvoie** : boolean Vrai si la valeur change.

#### `ui_imgui_custom_luaintf.KnobInt(string_label, intPtr_value, int_v_min, int_v_max, float_speed, string_format, ImGuiKnobVariant_variant, float_size, ImGuiKnobFlags_flags, int_steps)`

Knob pour un entier ; mêmes paramètres que Knob avec un IntPtr. (assignée dynamiquement)

- `string_label` (*string*) : Libellé.
- `intPtr_value` (*table*) : IntPtr.
- `int_v_min` (*integer*) : Min.
- `int_v_max` (*integer*) : Max.
- `float_speed` (*number|nil*) : Vitesse.
- `string_format` (*string|nil*) : Format.
- `ImGuiKnobVariant_variant` (*integer|nil*) : KnobVariant_*.
- `float_size` (*number|nil*) : Taille.
- `ImGuiKnobFlags_flags` (*integer|nil*) : KnobFlags_*.
- `int_steps` (*integer|nil*) : Crans.
- **renvoie** : boolean Vrai si la valeur change.

#### `ui_imgui_custom_luaintf.SetDragDropPayload(string_type, void_data, size_t_sz, ImGuiCond_cond)`

Définit le payload de glisser-déposer ; erreur loguée si type ou data est nil ; cond 0 par défaut. (assignée dynamiquement)

- `string_type` (*string*) : Type de payload.
- `void_data` (*any*) : Données.
- `size_t_sz` (*integer*) : Taille.
- `ImGuiCond_cond` (*integer|nil*) : Condition.
- **renvoie** : boolean Résultat d'imgui.SetDragDropPayload.

#### `ui_imgui_custom_luaintf.ShowHelpMarker(desc, sameLine)`

Affiche « (?) » grisé ; au survol, infobulle avec desc sur 35 caractères de large. (assignée dynamiquement)

- `desc` (*string*) : Texte d'aide.
- `sameLine` (*boolean|nil*) : Si true, SameLine avant.

#### `ui_imgui_custom_luaintf.getCurrentMonitorSize()`

Renvoie la taille du moniteur courant. (assignée dynamiquement)

- **renvoie** : ImVec2 Taille en pixels.

#### `ui_imgui_custom_luaintf.getMainViewPortId()`

Id du viewport principal. (assignée dynamiquement)

- **renvoie** : integer Id.

#### `ui_imgui_custom_luaintf.getMonitorIndex()`

Index du moniteur (imgui.getMonitorIndex). (assignée dynamiquement)

- **renvoie** : integer Index.

#### `ui_imgui_custom_luaintf.loadIniSettingsFromDisk(filename)`

Charge les réglages ImGui (.ini) depuis un fichier. (assignée dynamiquement)

- `filename` (*string*) : Chemin.

#### `ui_imgui_custom_luaintf.saveIniSettingsToDisk(filename)`

Enregistre les réglages ImGui (.ini) dans un fichier. (assignée dynamiquement)

- `filename` (*string*) : Chemin.

#### `ui_imgui_custom_luaintf.tooltip(message)`

Si l'élément précédent est survolé, affiche message en infobulle (SetTooltip). (assignée dynamiquement)

- `message` (*string*) : Texte.

#### `ui_imgui_custom_luaintf.tooltipWrapped(message, wrapWidth)`

Comme tooltip mais avec retour à la ligne à wrapWidth pixels (350 par défaut, multiplié par uiscale[0]). (assignée dynamiquement)

- `message` (*string*) : Texte.
- `wrapWidth` (*number|nil*) : Largeur de retour à la ligne.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/extensions/ui/imgui_custom_luaintf.lua`.*
