# `ui_fadeScreen`

*Fichier : `lua/ge/extensions/ui/fadeScreen.lua` · VM : Game Engine (GE) · 104 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_fadeScreen` : `extensions.load("ui_fadeScreen")`, puis la globale `ui_fadeScreen`

Fondu au noir de l'écran piloté depuis Lua. Envoie l'évènement UI « LoadingScreen » (active + paramètres fadeIn/pause/fadeOut/data), règle les paramètres audio globaux FMOD g_FadeTimeMS et g_GameLoading, et prévient les autres extensions via le hook onScreenFadeState quand l'UI signale que l'écran est noir (1), que la pause est finie (2) ou que le fondu retour est terminé (3). Sert aux chargements de niveau, téléportations et transitions.

## Exemple

```lua
ui_fadeScreen.cycle(0.5, 0.2, 0.5)  -- noir, pause, retour
-- ou : ui_fadeScreen.start(1, {title='Chargement'}) ... ui_fadeScreen.stop(1)
```

## Remarques

- Durées en secondes.
- start/stop/cycle sont des alias de fadeToBlack/fadeFromBlack/fadeSequence.
- onScreenFadeState : 1 = écran entièrement noir, 2 = fin de la pause, 3 = fondu retour terminé. L'état 1 n'est diffusé qu'après delayFrames (3) frames d'onGuiUpdate pour être sûr que l'écran est noir ; isBlack() ne devient vrai qu'à ce moment, si le noir a été demandé.
- En mode headless (headless_mode), aucun UI : fadeToBlack met isBlack à true et diffuse l'état 1 immédiatement, fadeFromBlack diffuse l'état 3.
- fadeSequence impose une pause minimale de 0,05 s (un TODO indique qu'une pause nulle casse des choses).
- Le fondu d'une séquence repasse automatiquement à fadeFromBlack à l'état 2 ; un fadeToBlack seul reste sur noir (pause -1) jusqu'à fadeFromBlack.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_fadeScreen.cycle(fadeIn, pause, fadeOut, screenData, args)` | Alias de fadeSequence. | 61 |
| `ui_fadeScreen.fadeFromBlack(fade, args)` | Revient du noir (LoadingScreen active=false avec fadeOut), remet g_GameLoading à 0. Alias : stop. | 42 |
| `ui_fadeScreen.fadeSequence(fadeIn, pause, fadeOut, screenData, args)` | Fondu complet : au noir, pause, puis retour. Alias : cycle. | 61 |
| `ui_fadeScreen.fadeToBlack(fade, screenData, args)` | Lance un fondu vers le noir et y reste. screenData est affiché pendant la pause. Règle aussi les paramètres audio globaux (sauf useGlobalAudioFade == false). Alias : start. | 15 |
| `ui_fadeScreen.isBlack()` | Indique si l'écran est confirmé noir (après le délai de delayFrames frames). | 97 |
| `ui_fadeScreen.onGuiUpdate()` | Hook par frame GUI : une fois le délai écoulé, diffuse les états en attente par extensions.hook('onScreenFadeState', state) et enchaîne le fadeFromBlack d'une séquence à l'état 2. *(interne)* *(hook)* | 75 |
| `ui_fadeScreen.onScreenFadeStateDelayed(state)` | Appelé par l'UI/le moteur quand l'état du fondu change (1, 2 ou 3) : met l'état en file et relance le compteur de frames ; onGuiUpdate le diffuse ensuite par onScreenFadeState. *(interne)* *(hook)* | 70 |
| `ui_fadeScreen.start(fade, screenData, args)` | Alias de fadeToBlack. | 15 |
| `ui_fadeScreen.stop(fade, args)` | Alias de fadeFromBlack. | 42 |

### Détail des paramètres

#### `ui_fadeScreen.cycle(fadeIn, pause, fadeOut, screenData, args)`

Alias de fadeSequence.

- `fadeIn` (*number|nil*) : Durée du fondu vers le noir.
- `pause` (*number|nil*) : Durée de la pause.
- `fadeOut` (*number|nil*) : Durée du fondu retour.
- `screenData` (*table|nil*) : Contenu affiché pendant la pause.
- `args` (*table|nil*) : Options.

#### `ui_fadeScreen.fadeFromBlack(fade, args)`

Revient du noir (LoadingScreen active=false avec fadeOut), remet g_GameLoading à 0. Alias : stop.

- `fade` (*number|nil*) : Durée du fondu retour en secondes (défaut 1).
- `args` (*table|nil*) : Options ; useGlobalAudioFade=false pour ne pas toucher à l'audio global.

#### `ui_fadeScreen.fadeSequence(fadeIn, pause, fadeOut, screenData, args)`

Fondu complet : au noir, pause, puis retour. Alias : cycle.

- `fadeIn` (*number|nil*) : Durée du fondu vers le noir (défaut 1).
- `pause` (*number|nil*) : Durée de la pause sur noir (minimum 0,05 s).
- `fadeOut` (*number|nil*) : Durée du fondu retour (défaut fadeIn).
- `screenData` (*table|nil*) : Contenu affiché pendant la pause : {image, title, text}.
- `args` (*table|nil*) : Options transmises aux fondus (useGlobalAudioFade).

#### `ui_fadeScreen.fadeToBlack(fade, screenData, args)`

Lance un fondu vers le noir et y reste. screenData est affiché pendant la pause. Règle aussi les paramètres audio globaux (sauf useGlobalAudioFade == false). Alias : start.

- `fade` (*number|nil*) : Durée du fondu en secondes (défaut 1).
- `screenData` (*table|nil*) : Contenu affiché pendant la pause : {image, title, text}.
- `args` (*table|nil*) : Options ; useGlobalAudioFade=false pour ne pas toucher à l'audio global.

#### `ui_fadeScreen.isBlack()`

Indique si l'écran est confirmé noir (après le délai de delayFrames frames).

- **renvoie** : boolean true si l'écran est noir.

#### `ui_fadeScreen.onScreenFadeStateDelayed(state)`

Appelé par l'UI/le moteur quand l'état du fondu change (1, 2 ou 3) : met l'état en file et relance le compteur de frames ; onGuiUpdate le diffuse ensuite par onScreenFadeState.

- `state` (*integer*) : 1 = noir atteint, 2 = fin de pause, 3 = fondu retour terminé.

#### `ui_fadeScreen.start(fade, screenData, args)`

Alias de fadeToBlack.

- `fade` (*number|nil*) : Durée du fondu en secondes.
- `screenData` (*table|nil*) : Contenu {image, title, text} affiché pendant la pause.
- `args` (*table|nil*) : Options.

#### `ui_fadeScreen.stop(fade, args)`

Alias de fadeFromBlack.

- `fade` (*number|nil*) : Durée du fondu retour en secondes.
- `args` (*table|nil*) : Options.

## Champs

| Champ | Type | Description |
|---|---|---|
| `delayFrames` | number | Nombre de frames d'attente avant de diffuser onScreenFadeState (3 par défaut). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onScreenFadeState` — écouté par 10 module(s)

**Évènements UI (guihooks.trigger) :** `LoadingScreen`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/fadeScreen.lua`.*
