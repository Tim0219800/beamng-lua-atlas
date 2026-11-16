# `perf`

*Fichier : `lua/common/utils/perf.lua` · VM : Commun (GE + véhicule) · 138 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `perf`

Petite bibliothèque de mesure de performance par hook : pendant qu'elle est activée, chaque appel/retour de fonction Lua est chronométré, et des statistiques par fonction sont calculées par fenêtres de temps. Se charge avec require('utils/perf'). Réservé au débogage, ralentit fortement l'exécution ; peut alimenter l'UI de debug via un évènement guihooks.

## Exemple

```lua
local perf = require('utils/perf')
perf.enable(1)
-- code à mesurer, et perf.update() à chaque frame
perf.disable()
perf.saveDataToCSV('vehicleloading.csv')
```

## Remarques

- enable() remplace tout hook debug existant ; disable() le retire (debug.sethook()).
- M.update vaut nop tant que enable() n'a pas été appelé : il faut appeler perf.update() à chaque frame une fois activé.
- M.data contient {frameCount, size, memory, fcts = {{f=nom, t=temps cumulé, c=nombre d'appels, s=score}}} plus les champs de srcData ; la mémoire vient de gcinfo().
- Le score s = t * c / (windowSize * 1000) : produit temps cumulé x appels (formule étrange, déduit du code ; il ne s'agit pas d'un simple temps moyen).
- Incohérence : la fenêtre par défaut de enable() est 10 s alors que la variable de module windowSize est initialisée à 2.
- saveDataToCSV écrit l'en-tête ';function, time' puis des lignes 'nom, score' triées par score décroissant ; renvoie false si le fichier ne s'ouvre pas, mais rien (nil) en cas de succès.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `perf.disable()` | Désactive le profilage et remet M.update à nop. | 124 |
| `perf.enable(_windowSize, _guiHook, _srcData)` | Active le profilage par hook (événements 'call' et 'return'). | 116 |
| `perf.getData()` | Force le calcul des statistiques de la fenêtre en cours (et remet les compteurs à zéro), puis renvoie M.data. | 89 |
| `perf.saveDataToCSV(filename)` | Calcule les statistiques courantes et les écrit dans un CSV, trié par score décroissant. | 94 |
| `perf.update()` | À appeler à chaque frame une fois activé : compte les frames et déclenche le calcul des statistiques à chaque fenêtre écoulée. nop si désactivé. | 38 |

### Détail des paramètres

#### `perf.enable(_windowSize, _guiHook, _srcData)`

Active le profilage par hook (événements 'call' et 'return').

- `_windowSize` (*number|nil*) : Durée d'une fenêtre de statistiques en secondes, 10 par défaut
- `_guiHook` (*string|nil*) : Nom d'évènement guihooks.trigger auquel envoyer M.data à chaque fenêtre
- `_srcData` (*table|nil*) : Champs ajoutés tels quels à M.data

#### `perf.getData()`

Force le calcul des statistiques de la fenêtre en cours (et remet les compteurs à zéro), puis renvoie M.data.

- **renvoie** : table Statistiques (voir notes)

#### `perf.saveDataToCSV(filename)`

Calcule les statistiques courantes et les écrit dans un CSV, trié par score décroissant.

- `filename` (*string*) : Fichier de sortie
- **renvoie** : boolean|nil false si ouverture impossible, nil sinon

## Champs

| Champ | Type | Description |
|---|---|---|
| `data` | table | Dernières statistiques calculées (voir notes). Vide tant qu'aucune fenêtre n'est terminée. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils/perf.lua`.*
