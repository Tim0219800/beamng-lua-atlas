# `ui_visibility`

*Fichier : `lua/ge/extensions/ui/visibility.lua` · VM : Game Engine (GE) · 66 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_visibility` : `extensions.load("ui_visibility")`, puis la globale `ui_visibility`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_visibility.get()` |  | 46 |
| `ui_visibility.getCef()` | CEF ui visibility | 10 |
| `ui_visibility.getImgui()` |  | 35 |
| `ui_visibility.set(visible)` | general ui visibility | 40 |
| `ui_visibility.setCef(visible)` |  | 13 |
| `ui_visibility.setImgui(visible)` | IMGUI ui visibility | 27 |
| `ui_visibility.toggle()` |  | 50 |
| `ui_visibility.toggleCef()` |  | 22 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCefVisibilityChanged` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `onCefVisibilityChanged`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/visibility.lua`.*
