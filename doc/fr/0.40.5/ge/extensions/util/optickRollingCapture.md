# `util_optickRollingCapture`

*Fichier : `lua/ge/extensions/util/optickRollingCapture.lua` · VM : Game Engine (GE) · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_optickRollingCapture` : `extensions.load("util_optickRollingCapture")`, puis la globale `util_optickRollingCapture`

Capture « glissante » pour le profileur Optick. Un premier appel à toggle() démarre un enregistrement qui ne garde que les 20 dernières secondes ; un second appel arrête l'enregistrement, sauvegarde la capture dans <dossier utilisateur>/optick/optick_rolling_<date>.opt et ouvre Optick si la fonction globale launchOptick existe. Un message UI de 10 s confirme chaque étape.

## Exemple

```lua
extensions.util_optickRollingCapture.toggle()
```

## Remarques

- La durée de la fenêtre (20 s) est fixée dans le fichier (windowSeconds).
- L'état est déterminé par Engine.Profiler.isCapturing() : toute capture Optick déjà en cours sera arrêtée et sauvegardée par toggle().

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_optickRollingCapture.toggle()` | Démarre une capture glissante de 20 s si aucune capture n'est en cours ; sinon arrête la capture, la sauvegarde dans le dossier optick/ de l'utilisateur et lance Optick dessus. | 18 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `getUserPath`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/optickRollingCapture.lua`.*
