# `ui_imgui_luaintf`

*Fichier : `lua/common/extensions/ui/imgui_luaintf.lua` · VM : Commun (GE + véhicule) · 2198 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/ui/imgui_luaintf")` (fichier sous extensions/ mais pas une extension classique)

Fichier généré (≈ 2200 lignes, ~485 fonctions) qui expose presque toute l'API Dear ImGui en Lua sous forme de wrappers très fins vers Engine.imgui (binding C++ du jeu) : NewFrame/Render, fenêtres, widgets (Text, Button, Slider*, Drag*, Input*, Combo, Tree*, Table*, Plot*), ImDrawList_*, styles (PushStyleColor*, PushStyleVar*), IO, polices, et les enums sous forme de constantes M.Xxx_Yyy (ex. WindowFlags_NoTitleBar, Col_Text, Key_*). Ce n'est pas une extension : il renvoie une fonction qui reçoit la table M d'imgui_api. Les suffixes numériques (Button/SmallButton, TreeNode1/TreeNode2, Combo1, PushStyleColor2…) correspondent aux surcharges C++ d'une même fonction.

## Exemple

```lua
-- On l'utilise via ui_imgui :
local im = ui_imgui
if im.Begin('Test') then
  if im.Button('OK') then print('clic') end
end
im.End()
```

## Remarques

- Convention du fichier : chaque wrapper vérifie les paramètres de type 'const char *' ; si nil, il logue une erreur (« Parameter 'x' of function 'F' cannot be nil, as the c type is 'const char *' ») et retourne sans appeler ImGui.
- Les paramètres « pointeur » (bool_p_open, float*, int*...) sont des tables {[0]=valeur} créées par BoolPtr/FloatPtr/IntPtr/ArrayChar (voir imgui_custom_luaintf).
- Les valeurs par défaut sont posées dans les wrappers (ex. flags = 0 si nil).
- Plusieurs fonctions de ce fichier sont réécrites par imgui_custom_luaintf.lua (Begin, InputText, GetKeyIndex...) : la version custom l'emporte puisqu'elle est chargée après.
- Les fonctions de ce fichier ne sont pas listées une à une ici : elles suivent la documentation officielle de Dear ImGui (le suffixe de nom indique la surcharge).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_imgui_luaintf.Begin(string_name, bool_p_open, ImGuiWindowFlags_flags)` | Ouvre une fenêtre (flags 0 par défaut dans cette version ; la version custom met NoFocusOnAppearing). (assignée dynamiquement) | dyn |
| `ui_imgui_luaintf.EndFrame()` | Termine la frame ImGui (géré par le moteur). (assignée dynamiquement) *(interne)* | dyn |
| `ui_imgui_luaintf.GetCurrentContext()` | Renvoie le contexte ImGui courant. (assignée dynamiquement) | dyn |
| `ui_imgui_luaintf.GetKeyIndex(ImGuiKey_key)` | Convertit une touche en index (imgui.GetKeyIndex) ; remplacée par une version no-op dans imgui_custom_luaintf. (assignée dynamiquement) | dyn |
| `ui_imgui_luaintf.GetVersion()` | Renvoie la version de Dear ImGui. (assignée dynamiquement) | dyn |
| `ui_imgui_luaintf.NewFrame()` | Démarre une nouvelle frame ImGui (normalement géré par le moteur). (assignée dynamiquement) *(interne)* | dyn |
| `ui_imgui_luaintf.Render()` | Finalise le rendu ImGui (géré par le moteur). (assignée dynamiquement) *(interne)* | dyn |
| `ui_imgui_luaintf.ShowAboutWindow(bool_p_open)` | Affiche la fenêtre « À propos » d'ImGui. (assignée dynamiquement) | dyn |
| `ui_imgui_luaintf.ShowDebugLogWindow(bool_p_open)` | Affiche la fenêtre de log de debug d'ImGui. (assignée dynamiquement) | dyn |
| `ui_imgui_luaintf.ShowDemoWindow(bool_p_open)` | Affiche la fenêtre de démonstration d'ImGui. (assignée dynamiquement) | dyn |
| `ui_imgui_luaintf.ShowFontSelector(string_label)` | Affiche un sélecteur de police. (assignée dynamiquement) | dyn |
| `ui_imgui_luaintf.ShowMetricsWindow(bool_p_open)` | Affiche la fenêtre de métriques d'ImGui. (assignée dynamiquement) | dyn |
| `ui_imgui_luaintf.ShowStackToolWindow(bool_p_open)` | Affiche l'outil de pile d'ID d'ImGui. (assignée dynamiquement) | dyn |
| `ui_imgui_luaintf.ShowStyleEditor(ImGuiStyle_ref)` | Affiche l'éditeur de style d'ImGui. (assignée dynamiquement) | dyn |
| `ui_imgui_luaintf.ShowStyleSelector(string_label)` | Affiche un sélecteur de style. (assignée dynamiquement) | dyn |
| `ui_imgui_luaintf.ShowUserGuide()` | Affiche le guide utilisateur d'ImGui. (assignée dynamiquement) | dyn |
| `ui_imgui_luaintf.StyleColorsClassic(ImGuiStyle_dst)` | Applique le thème classique. (assignée dynamiquement) | dyn |
| `ui_imgui_luaintf.StyleColorsDark(ImGuiStyle_dst)` | Applique le thème sombre. (assignée dynamiquement) | dyn |
| `ui_imgui_luaintf.StyleColorsLight(ImGuiStyle_dst)` | Applique le thème clair. (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `ui_imgui_luaintf.Begin(string_name, bool_p_open, ImGuiWindowFlags_flags)`

Ouvre une fenêtre (flags 0 par défaut dans cette version ; la version custom met NoFocusOnAppearing). (assignée dynamiquement)

- `string_name` (*string*) : Titre (ne peut pas être nil).
- `bool_p_open` (*table|nil*) : BoolPtr optionnel.
- `ImGuiWindowFlags_flags` (*integer|nil*) : Flags de fenêtre.
- **renvoie** : boolean Vrai si la fenêtre est visible.

#### `ui_imgui_luaintf.GetCurrentContext()`

Renvoie le contexte ImGui courant. (assignée dynamiquement)

- **renvoie** : userdata Contexte.

#### `ui_imgui_luaintf.GetKeyIndex(ImGuiKey_key)`

Convertit une touche en index (imgui.GetKeyIndex) ; remplacée par une version no-op dans imgui_custom_luaintf. (assignée dynamiquement)

- `ImGuiKey_key` (*integer*) : Touche ImGui.
- **renvoie** : integer Index de touche.

#### `ui_imgui_luaintf.GetVersion()`

Renvoie la version de Dear ImGui. (assignée dynamiquement)

- **renvoie** : string Version.

#### `ui_imgui_luaintf.ShowAboutWindow(bool_p_open)`

Affiche la fenêtre « À propos » d'ImGui. (assignée dynamiquement)

- `bool_p_open` (*table|nil*) : BoolPtr optionnel.

#### `ui_imgui_luaintf.ShowDebugLogWindow(bool_p_open)`

Affiche la fenêtre de log de debug d'ImGui. (assignée dynamiquement)

- `bool_p_open` (*table|nil*) : BoolPtr optionnel.

#### `ui_imgui_luaintf.ShowDemoWindow(bool_p_open)`

Affiche la fenêtre de démonstration d'ImGui. (assignée dynamiquement)

- `bool_p_open` (*table|nil*) : BoolPtr optionnel.

#### `ui_imgui_luaintf.ShowFontSelector(string_label)`

Affiche un sélecteur de police. (assignée dynamiquement)

- `string_label` (*string*) : Libellé (ne peut pas être nil).

#### `ui_imgui_luaintf.ShowMetricsWindow(bool_p_open)`

Affiche la fenêtre de métriques d'ImGui. (assignée dynamiquement)

- `bool_p_open` (*table|nil*) : BoolPtr optionnel.

#### `ui_imgui_luaintf.ShowStackToolWindow(bool_p_open)`

Affiche l'outil de pile d'ID d'ImGui. (assignée dynamiquement)

- `bool_p_open` (*table|nil*) : BoolPtr optionnel.

#### `ui_imgui_luaintf.ShowStyleEditor(ImGuiStyle_ref)`

Affiche l'éditeur de style d'ImGui. (assignée dynamiquement)

- `ImGuiStyle_ref` (*userdata|nil*) : Style à éditer, optionnel.

#### `ui_imgui_luaintf.ShowStyleSelector(string_label)`

Affiche un sélecteur de style. (assignée dynamiquement)

- `string_label` (*string*) : Libellé (ne peut pas être nil).
- **renvoie** : boolean Vrai si le style a changé.

#### `ui_imgui_luaintf.StyleColorsClassic(ImGuiStyle_dst)`

Applique le thème classique. (assignée dynamiquement)

- `ImGuiStyle_dst` (*userdata|nil*) : Style cible, optionnel.

#### `ui_imgui_luaintf.StyleColorsDark(ImGuiStyle_dst)`

Applique le thème sombre. (assignée dynamiquement)

- `ImGuiStyle_dst` (*userdata|nil*) : Style cible, optionnel.

#### `ui_imgui_luaintf.StyleColorsLight(ImGuiStyle_dst)`

Applique le thème clair. (assignée dynamiquement)

- `ImGuiStyle_dst` (*userdata|nil*) : Style cible, optionnel.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/extensions/ui/imgui_luaintf.lua`.*
