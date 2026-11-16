# `controller_sound_reverseWarn`

*Fichier : `lua/vehicle/controller/sound/reverseWarn.lua` · VM : Véhicule · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `sound/reverseWarn` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de bip de marche arrière. Tous les 0.5 s, il teste un electric (par défaut « reverse ») : s'il est > 0, il démarre une boucle sonore de bip ; sinon il l'arrête.

## Remarques

- Clés jbeam lues : electricsName ("reverse"), beepLoopName ("event:>Vehicle>Electrics>Reverse>Beep_01"), beepVolume (1), soundNode_nodes (premier élément = nœud, 0 sinon).
- La source sonore est créée à la première activation (obj:createSFXSource2, AudioDefaultLoop3D) ; le test n'a lieu que toutes les 0.5 s donc la réaction peut avoir jusqu'à 0.5 s de retard.
- reset ne coupe pas le son : isWarning est remis à false mais la boucle déjà lancée n'est pas arrêtée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_sound_reverseWarn.init(jbeamData)` | Lit la configuration jbeam. *(interne)* | 42 |
| `controller_sound_reverseWarn.reset()` | Remet l'état et le minuteur à zéro. *(interne)* | 37 |
| `controller_sound_reverseWarn.updateGFX(dt)` | Chaque frame : démarre ou arrête le bip selon l'electric. *(interne)* | 18 |

### Détail des paramètres

#### `controller_sound_reverseWarn.init(jbeamData)`

Lit la configuration jbeam.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_sound_reverseWarn.updateGFX(dt)`

Chaque frame : démarre ou arrête le bip selon l'electric.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `createSFXSource2`, `cutSFX`, `playSFX`, `setVolume`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/sound/reverseWarn.lua`.*
