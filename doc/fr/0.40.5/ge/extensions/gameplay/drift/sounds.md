# `gameplay_drift_sounds`

*Fichier : `lua/ge/extensions/gameplay/drift/sounds.lua` · VM : Game Engine (GE) · 216 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_sounds` : `extensions.load("gameplay_drift_sounds")`, puis la globale `gameplay_drift_sounds`

Gère les sons d'interface du drift (événements FMOD UI>Career>Drift_*) : un son continu pendant un drift dont la hauteur suit le facteur de performance, un son à chaque nouveau palier, à chaque changement de combo, à l'annulation du drift (crash/spinout) et à la validation des points. Contient aussi une fenêtre imgui « Drift audio » pour simuler un drift en debug. Chargé par gameplay_drift_general tant que l'extension d'affichage drift est chargée.

## Remarques

- Sons : continuousDrift = event:>UI>Career>Drift_Counting, newTier = Drift_Tier, newCombo1 = Drift_Combo_1x, newCombo5 = Drift_Combo_5x, driftCanceled = Drift_Canceled, pointsConfirmed = Drift_PointsReceived.
- Le son continu est coupé quand le drift est en pause ou gelé (gameplay_drift_general.getPaused/getFrozen) ; sinon il joue tant que gameplay_drift_drift.getIsDrifting() est vrai.
- Le volume du son de palier est tierData.order - 1 (donc 0 pour le palier d'ordre 1).
- Le son de combo utilise comboChange <= 0.2 pour choisir Combo_1x, sinon Combo_5x.
- La fonction locale reset() n'est pas exportée : general.reset ne peut donc pas l'appeler.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_sounds.getDriftDebugInfo()` | Renvoie {default=false, canBeChanged=true} pour la fenêtre de debug drift. | 67 |
| `gameplay_drift_sounds.onDriftCompletedScored(data)` | Hook : joue le son de points reçus. *(interne)* *(hook)* | 186 |
| `gameplay_drift_sounds.onDriftCrash()` | Hook : joue le son d'annulation du drift. *(interne)* *(hook)* | 172 |
| `gameplay_drift_sounds.onDriftDebugChanged(value)` | Hook : à la désactivation du debug, arrête la simulation de drift (gameplay_drift_drift.simulateADrift()). *(interne)* *(hook)* | 180 |
| `gameplay_drift_sounds.onDriftNewCombo(data)` | Hook : joue le son de combo 1x ou 5x selon l'ampleur du changement. *(interne)* *(hook)* | 159 |
| `gameplay_drift_sounds.onDriftSpinout()` | Hook : joue le son d'annulation du drift. *(interne)* *(hook)* | 176 |
| `gameplay_drift_sounds.onExtensionUnloaded()` | Hook : supprime la source audio du son continu au déchargement. *(interne)* *(hook)* | 195 |
| `gameplay_drift_sounds.onNewDriftTierReached(tierData)` | Hook : joue le son de nouveau palier. *(interne)* *(hook)* | 153 |
| `gameplay_drift_sounds.onUpdate(dtReal, _dtSim, dtRaw)` | Appelé à chaque frame : au premier appel crée la source audio du son continu, affiche la fenêtre de debug, puis joue/arrête le son continu et met à jour son paramètre pitch et sa position (caméra). *(interne)* *(hook)* | 135 |

### Détail des paramètres

#### `gameplay_drift_sounds.getDriftDebugInfo()`

Renvoie {default=false, canBeChanged=true} pour la fenêtre de debug drift.

- **renvoie** : table {default = false, canBeChanged = true}

#### `gameplay_drift_sounds.onDriftCompletedScored(data)`

Hook : joue le son de points reçus.

- `data` (*table*) : Données du drift scoré (inutilisées).

#### `gameplay_drift_sounds.onDriftDebugChanged(value)`

Hook : à la désactivation du debug, arrête la simulation de drift (gameplay_drift_drift.simulateADrift()).

- `value` (*boolean*) : Nouvel état du debug.

#### `gameplay_drift_sounds.onDriftNewCombo(data)`

Hook : joue le son de combo 1x ou 5x selon l'ampleur du changement.

- `data` (*table*) : {comboChange = number}.

#### `gameplay_drift_sounds.onNewDriftTierReached(tierData)`

Hook : joue le son de nouveau palier.

- `tierData` (*table*) : Données du palier ; order sert au volume.

#### `gameplay_drift_sounds.onUpdate(dtReal, _dtSim, dtRaw)`

Appelé à chaque frame : au premier appel crée la source audio du son continu, affiche la fenêtre de debug, puis joue/arrête le son continu et met à jour son paramètre pitch et sa position (caméra).

- `dtReal` (*number*) : Delta temps réel (inutilisé).
- `_dtSim` (*number*) : Delta temps simulé, mémorisé pour les transitions de debug.
- `dtRaw` (*number*) : Delta temps brut (inutilisé).

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onNewDriftTierReached` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/sounds.lua`.*
