# `gameplay_crashTest_crashTestCountdown`

*Fichier : `lua/ge/extensions/gameplay/crashTest/crashTestCountdown.lua` · VM : Game Engine (GE) · 50 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crashTest_crashTestCountdown` : `extensions.load("gameplay_crashTest_crashTestCountdown")`, puis la globale `gameplay_crashTest_crashTestCountdown`

Compte à rebours affiché pendant le scénario de crash test. Chaque seconde entière franchie, il envoie un message à l'UI (évènement ScenarioFlashMessage) avec le chiffre restant et un son de décompte, puis « Go! » avec un son de départ quand le temps est écoulé, et appelle alors le callback donné.

## Exemple

```lua
gameplay_crashTest_crashTestCountdown.startNewCountdown(3, function() print('go') end)
```

## Remarques

- Le temps décroît avec dtSim (temps de simulation), donc il s'arrête en pause.
- Le message est de la forme {{texte, 0.95, appelLua, true}} ; le troisième élément est un appel Lua joué par l'UI (Engine.Audio.playOnce).
- Le nom de la fonction interne updateCoundown contient une faute de frappe (sans effet).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crashTest_crashTestCountdown.onUpdate(dtReal, dtSim)` | Hook appelé à chaque image : fait avancer le compte à rebours s'il est en cours. *(interne)* *(hook)* | 40 |
| `gameplay_crashTest_crashTestCountdown.startNewCountdown(duration, callback_)` | Démarre un compte à rebours de duration secondes. Le callback est appelé quand le décompte arrive à 0 (au moment du « Go! »). | 11 |

### Détail des paramètres

#### `gameplay_crashTest_crashTestCountdown.onUpdate(dtReal, dtSim)`

Hook appelé à chaque image : fait avancer le compte à rebours s'il est en cours.

- `dtReal` (*number*) : Delta temps réel (s), non utilisé.
- `dtSim` (*number*) : Delta temps simulation (s).

#### `gameplay_crashTest_crashTestCountdown.startNewCountdown(duration, callback_)`

Démarre un compte à rebours de duration secondes. Le callback est appelé quand le décompte arrive à 0 (au moment du « Go! »).

- `duration` (*number*) : Durée en secondes.
- `callback_` (*function|nil*) : Fonction appelée à la fin du compte à rebours.

**Évènements UI (guihooks.trigger) :** `ScenarioFlashMessage`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crashTest/crashTestCountdown.lua`.*
