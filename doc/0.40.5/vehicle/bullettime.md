# `bullettime`

*Fichier : `lua/vehicle/bullettime.lua` · VM : Véhicule · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `bullettime`

Ancienne API de ralenti (bullet time) côté véhicule, conservée pour la compatibilité des mods. Elle ne fait que relayer vers `simTimeAuthority` dans le moteur de jeu (GE Lua). Les fonctions dépréciées affichent un toast d'erreur dans l'UI et loguent une trace ; il faut utiliser `get`, `set` ou `selectPreset`.

## Exemple

```lua
local scale = bullettime.get() -- échelle de temps actuelle
bullettime.set(0.5)             -- demi-vitesse
```

## Remarques

- L'ancien champ `bullettime.simulationSpeed` est encore lu via une métatable : il renvoie `get() * 100` et logue une erreur de dépréciation (une seule fois).
- `set(v)` envoie à simTimeAuthority la valeur `1/v` : v est donc un facteur de vitesse (0.5 = moitié moins vite) ; v = 0 donnerait une division par zéro (inf).
- `update`, `reset` et `slowMotion` sont tous la même fonction `deprecated` ; `requestValue` appelle aussi deprecated puis transmet la requête.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `bullettime.get()` | Renvoie l'échelle de temps de simulation actuelle (`obj:getSimulationTimeScale()`). | 13 |
| `bullettime.requestValue()` | Déprécié : affiche l'avertissement puis appelle `simTimeAuthority.requestValue()` côté GE. | 25 |
| `bullettime.reset()` | Déprécié (même fonction que update) : toast d'erreur et trace. | 8 |
| `bullettime.selectPreset(v)` | Demande à `simTimeAuthority.selectPreset` (côté GE) de choisir un préréglage de vitesse. | 21 |
| `bullettime.set(v)` | Demande au moteur de jeu de changer la vitesse de simulation, en exécutant `simTimeAuthority.set(1/v)` côté GE. | 17 |
| `bullettime.slowMotion()` | Déprécié (même fonction que update) : toast d'erreur et trace. | 8 |
| `bullettime.update()` | Déprécié : affiche un toast d'erreur « Deprecated API: bullettime » et logue une trace. | 8 |

### Détail des paramètres

#### `bullettime.get()`

Renvoie l'échelle de temps de simulation actuelle (`obj:getSimulationTimeScale()`).

- **renvoie** : number Échelle de temps (1 = temps réel).

#### `bullettime.selectPreset(v)`

Demande à `simTimeAuthority.selectPreset` (côté GE) de choisir un préréglage de vitesse.

- `v` (*any*) : Préréglage, sérialisé par dumps (déduit du code).

#### `bullettime.set(v)`

Demande au moteur de jeu de changer la vitesse de simulation, en exécutant `simTimeAuthority.set(1/v)` côté GE.

- `v` (*number*) : Facteur de vitesse voulu (déduit du code : la valeur envoyée est 1/v).

**Évènements UI (guihooks.trigger) :** `toastrMsg`

## Appels vers le moteur (C++)

- `obj:` `getSimulationTimeScale`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/bullettime.lua`.*
