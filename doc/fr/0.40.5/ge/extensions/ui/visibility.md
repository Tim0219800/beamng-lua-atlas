# `ui_visibility`

*Fichier : `lua/ge/extensions/ui/visibility.lua` · VM : Game Engine (GE) · 66 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_visibility` : `extensions.load("ui_visibility")`, puis la globale `ui_visibility`

Affiche ou masque l'interface du jeu : l'UI web (CEF) et les fenêtres imgui. Utile pour les captures d'écran, les vidéos ou les outils. Il mémorise l'état dans M.state (cefVisible, imguiVisible) et diffuse le changement de visibilité CEF.

## Exemple

```lua
ui_visibility.set(false)  -- masque tout
ui_visibility.setCef(true)  -- réaffiche seulement l'UI web
```

## Remarques

- L'état initial est cefVisible = true et imguiVisible = état actuel de Engine.imgui.
- Le changement de visibilité CEF émet l'évènement UI 'onCefVisibilityChanged' (guihooks) et le hook du même nom (extensions.hook), avec un booléen, uniquement si la valeur change.
- get() ne renvoie que l'état CEF, pas l'état imgui.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_visibility.get()` | Renvoie l'état de visibilité général, qui est celui de l'UI web (CEF). | 46 |
| `ui_visibility.getCef()` | Indique si l'UI web (CEF) est visible. | 10 |
| `ui_visibility.getImgui()` | Indique si imgui est activé. | 35 |
| `ui_visibility.set(visible)` | Affiche ou masque en même temps l'UI web et imgui. | 40 |
| `ui_visibility.setCef(visible)` | Affiche ou masque l'UI web ; émet 'onCefVisibilityChanged' (UI et extensions) seulement si l'état change. | 13 |
| `ui_visibility.setImgui(visible)` | Active ou désactive imgui (Engine.imgui.setEnabled) si l'état change. | 27 |
| `ui_visibility.toggle()` | Inverse la visibilité générale (selon get(), donc l'état CEF) et l'applique à CEF et imgui. | 50 |
| `ui_visibility.toggleCef()` | Inverse la visibilité de l'UI web. | 22 |

### Détail des paramètres

#### `ui_visibility.get()`

Renvoie l'état de visibilité général, qui est celui de l'UI web (CEF).

- **renvoie** : boolean true si visible.

#### `ui_visibility.getCef()`

Indique si l'UI web (CEF) est visible.

- **renvoie** : boolean true si visible.

#### `ui_visibility.getImgui()`

Indique si imgui est activé.

- **renvoie** : boolean true si visible.

#### `ui_visibility.set(visible)`

Affiche ou masque en même temps l'UI web et imgui.

- `visible` (*boolean*) : true pour afficher.

#### `ui_visibility.setCef(visible)`

Affiche ou masque l'UI web ; émet 'onCefVisibilityChanged' (UI et extensions) seulement si l'état change.

- `visible` (*boolean*) : true pour afficher.

#### `ui_visibility.setImgui(visible)`

Active ou désactive imgui (Engine.imgui.setEnabled) si l'état change.

- `visible` (*boolean*) : true pour activer.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCefVisibilityChanged` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `onCefVisibilityChanged`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/visibility.lua`.*
