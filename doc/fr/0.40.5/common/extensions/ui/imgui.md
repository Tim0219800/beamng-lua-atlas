# `ui_imgui`

*Fichier : `lua/common/extensions/ui/imgui.lua` · VM : Commun (GE + véhicule) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_imgui` : `extensions.load("ui_imgui")`, puis la globale `ui_imgui`

Extension ui_imgui : point d'entrée d'ImGui pour les moddeurs Lua. Dans la VM du jeu (GE) elle devient simplement le module ui/imgui_api (aucun wrapper) ; les centaines de fonctions ImGui (Begin, Text, Button…) et leurs enums viennent donc de imgui_luaintf.lua et imgui_custom_luaintf.lua. Elle récupère le contexte ImGui principal au chargement et active le style BeamNG.

## Exemple

```lua
local im = ui_imgui
if im.Begin('Ma fenêtre') then
  im.Text('Bonjour')
end
im.End()
```

## Remarques

- setEnabled n'est défini que dans la VM 'game' et se contente de loguer une erreur « imgui cannot be switched on or off in GE lua ». Dans une autre VM, M.setEnabled vaut nil (la variable locale n'est jamais assignée).
- M.flags est simplement bit.bor : sert à combiner des flags ImGui.
- Les champs et fonctions ImGui ne sont ajoutés que si vmType == 'game' (M = require imgui_api) ; sinon M est un module vide avec flags/hooks.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_imgui.onExtensionLoaded()` | Hook appelé au chargement (y compris rechargement dynamique) : récupère de nouveau le contexte ImGui principal. *(interne)* *(hook)* | 29 |
| `ui_imgui.onImGuiReady()` | Hook appelé quand ImGui est prêt la première fois : récupère le contexte principal (M.ctx = Engine.imgui.GetMainContext()) et appelle Engine.imgui.enableBeamNGStyle(). *(interne)* *(hook)* | 22 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `flags` | function | Alias de bit.bor, pour combiner des flags (im.flags(im.WindowFlags_NoMove, im.WindowFlags_NoResize)). |
| `setEnabled` | function|nil | En GE : fonction qui loggue une erreur (impossible d'activer/désactiver imgui côté GE). nil hors VM game. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/extensions/ui/imgui.lua`.*
