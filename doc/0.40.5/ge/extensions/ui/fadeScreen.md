# `ui_fadeScreen`

*Fichier : `lua/ge/extensions/ui/fadeScreen.lua` · VM : Game Engine (GE) · 104 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_fadeScreen` : `extensions.load("ui_fadeScreen")`, puis la globale `ui_fadeScreen`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_fadeScreen.cycle(fadeIn, pause, fadeOut, screenData, args)` |  | 61 |
| `ui_fadeScreen.fadeFromBlack(fade, args)` |  | 42 |
| `ui_fadeScreen.fadeSequence(fadeIn, pause, fadeOut, screenData, args)` |  | 61 |
| `ui_fadeScreen.fadeToBlack(fade, screenData, args)` | screenData = content {image, title, text} that is displayed during the pause phase | 15 |
| `ui_fadeScreen.isBlack()` |  | 97 |
| `ui_fadeScreen.onGuiUpdate()` | *(hook)* | 75 |
| `ui_fadeScreen.onScreenFadeStateDelayed(state)` | this delay is needed so we can be sure that the screen is completely black before moving on. *(hook)* | 70 |
| `ui_fadeScreen.start(fade, screenData, args)` | screenData = content {image, title, text} that is displayed during the pause phase | 15 |
| `ui_fadeScreen.stop(fade, args)` |  | 42 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `delayFrames` | number |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onScreenFadeState` — écouté par 10 module(s)

**Évènements UI (guihooks.trigger) :** `LoadingScreen`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/fadeScreen.lua`.*
