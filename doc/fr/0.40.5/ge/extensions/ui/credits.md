# `ui_credits`

*Fichier : `lua/ge/extensions/ui/credits.lua` · VM : Game Engine (GE) · 163 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_credits` : `extensions.load("ui_credits")`, puis la globale `ui_credits`

Joue la musique des crédits (évènement FMOD « event:>Music>credits » sur le canal AudioGui) avec des fondus de volume. Le chargement de l'extension lance la musique avec un fondu d'entrée de 0,4 s ; le déchargement supprime la source sonore.

## Exemple

```lua
extensions.load('ui_credits')
-- plus tard :
ui_credits.stopWithFade(1.0, function() extensions.unload('ui_credits') end)
```

## Remarques

- Le fondu est progressé dans onUpdate avec dtReal (temps réel, indépendant de la pause).
- La durée minimale d'un fondu est 0,001 s.
- Les fonctions de volume ne font rien si l'objet son n'a pas de méthode setVolume.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_credits.onExtensionLoaded()` | Hook appelé au chargement de l'extension : lance startWithFade avec la durée par défaut (0,4 s). *(interne)* *(hook)* | 123 |
| `ui_credits.onExtensionUnloaded()` | Hook appelé au déchargement : arrête et supprime la source sonore et libère le groupe de paramètres. *(interne)* *(hook)* | 127 |
| `ui_credits.onUpdate(dtReal)` | Hook appelé à chaque frame : fait avancer le fondu en cours et appelle son callback à la fin. *(interne)* *(hook)* | 132 |
| `ui_credits.startWithFade(duration)` | Crée la source sonore des crédits si besoin, la démarre à volume 0 si elle ne joue pas encore, puis fait un fondu vers le volume 1. | 85 |
| `ui_credits.stopWithFade(duration, onStopped)` | Fait un fondu vers 0 puis arrête et supprime la source, puis appelle onStopped. S'il n'y a pas de son, arrête immédiatement. | 105 |

### Détail des paramètres

#### `ui_credits.onUpdate(dtReal)`

Hook appelé à chaque frame : fait avancer le fondu en cours et appelle son callback à la fin.

- `dtReal` (*number*) : Temps réel écoulé depuis la dernière frame (s).

#### `ui_credits.startWithFade(duration)`

Crée la source sonore des crédits si besoin, la démarre à volume 0 si elle ne joue pas encore, puis fait un fondu vers le volume 1.

- `duration` (*number|nil*) : Durée du fondu en secondes (défaut 0,4).
- **renvoie** : boolean false si la source sonore n'a pas pu être créée, sinon true.

#### `ui_credits.stopWithFade(duration, onStopped)`

Fait un fondu vers 0 puis arrête et supprime la source, puis appelle onStopped. S'il n'y a pas de son, arrête immédiatement.

- `duration` (*number|nil*) : Durée du fondu en secondes (défaut 0,4).
- `onStopped` (*function|nil*) : Callback sans argument appelé une fois la musique arrêtée.

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/credits.lua`.*
