# `jbeam_jbeamMod`

*Fichier : `lua/common/extensions/jbeam/jbeamMod.lua` · VM : Commun (GE + véhicule) · 25 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `jbeam_jbeamMod` : `extensions.load("jbeam_jbeamMod")`, puis la globale `jbeam_jbeamMod`

Extension d'exemple (commentaire du fichier : « an example of how you could add things into jbeam loading ») qui montre comment se brancher sur les deux phases de chargement JBeam. Les deux hooks se contentent d'écrire une ligne de log niveau I (« onJbeamLoadingPhase1/2 called :) »). Elle n'est pas chargée par défaut : il faut un extensions.load('jbeam_jbeamMod') (ligne commentée dans le fichier).

## Exemple

```lua
extensions.load('jbeam_jbeamMod')
-- puis copier le module et remplacer les log() par votre propre traitement des données JBeam
```

## Remarques

- Aucun des arguments des hooks n'est utilisé dans le code ; leur sens exact vient du code appelant (non lu ici).
- Les noms de logs utilisent le tag 'extensions.jbeam.jbeamMod'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_jbeamMod.onJbeamLoadingPhase1(loadingProgress, objID, vehicle, unifyJournal, vehicleConfig, vars)` | Hook appelé pendant la phase 1 du chargement JBeam d'un véhicule. Ici : écrit seulement un log « onJbeamLoadingPhase1 called :) ». *(interne)* *(hook)* | 14 |
| `jbeam_jbeamMod.onJbeamLoadingPhase2(loadingProgress, objID, vehicle, unifyJournal, vehicleConfig, vars)` | Hook appelé pendant la phase 2 du chargement JBeam d'un véhicule. Ici : écrit seulement un log « onJbeamLoadingPhase2 called :) ». *(interne)* *(hook)* | 18 |

### Détail des paramètres

#### `jbeam_jbeamMod.onJbeamLoadingPhase1(loadingProgress, objID, vehicle, unifyJournal, vehicleConfig, vars)`

Hook appelé pendant la phase 1 du chargement JBeam d'un véhicule. Ici : écrit seulement un log « onJbeamLoadingPhase1 called :) ».

- `loadingProgress` (*any*) : Non utilisé dans ce fichier.
- `objID` (*integer*) : Non utilisé (déduit du nom : id de l'objet véhicule).
- `vehicle` (*any*) : Non utilisé.
- `unifyJournal` (*any*) : Non utilisé.
- `vehicleConfig` (*table*) : Non utilisé (déduit du nom : configuration du véhicule).
- `vars` (*any*) : Non utilisé.

#### `jbeam_jbeamMod.onJbeamLoadingPhase2(loadingProgress, objID, vehicle, unifyJournal, vehicleConfig, vars)`

Hook appelé pendant la phase 2 du chargement JBeam d'un véhicule. Ici : écrit seulement un log « onJbeamLoadingPhase2 called :) ».

- `loadingProgress` (*any*) : Non utilisé dans ce fichier.
- `objID` (*integer*) : Non utilisé (déduit du nom : id de l'objet véhicule).
- `vehicle` (*any*) : Non utilisé.
- `unifyJournal` (*any*) : Non utilisé.
- `vehicleConfig` (*table*) : Non utilisé (déduit du nom : configuration du véhicule).
- `vars` (*any*) : Non utilisé.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/extensions/jbeam/jbeamMod.lua`.*
