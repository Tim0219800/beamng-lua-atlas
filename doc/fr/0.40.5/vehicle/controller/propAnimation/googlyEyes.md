# `controller_propAnimation_googlyEyes`

*Fichier : `lua/vehicle/controller/propAnimation/googlyEyes.lua` · VM : Véhicule · 96 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `propAnimation/googlyEyes` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire humoristique d'« yeux » de véhicule : agrandit ou rétrécit des poutres taguées (poutres d'yeux, limiteurs, attaches) selon l'accélération verticale (sensors.gz) pour faire gonfler les yeux ; ils sont à taille maximale à l'ignition 3 (démarreur).

## Remarques

- Clés jbeam lues : eyeBeamTag ("eyeBeam"), eyeLimiterBeamTag ("eyeLimiterBeam"), eyeAttachmentBeamTag ("eyeAttachmentBeam") ; maxSizeCoef (1), minSizeCoef (1), minSizeBoundCoef (1), maxSizeBoundCoef (1), attachmentMinSizeCoef (1), attachmentMaxSizeCoef (1), sizeSmoothingShrink (5), sizeSmoothingGrow (5), gravityMaxSizeCoef (1).
- Les poutres sont retrouvées via beamstate.tagBeamMap[tag] ; leur longueur est modifiée par obj:setBeamLength et la borne longue des poutres limiteuses par obj:setBoundedBeamLongBound.
- Piège : sizeSmoothingShrink est passé comme premier argument (taux « in ») du lisseur et sizeSmoothingGrow comme second (« out ») : leurs rôles dépendent de la convention de newTemporalSmoothingNonLinear.
- Tous les coefficients valent 1 par défaut : sans configuration le contrôleur ne change rien.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_propAnimation_googlyEyes.init(jbeamData)` | Retrouve les poutres par tag, mémorise leurs longueurs de repos et lit les coefficients jbeam. *(interne)* | 52 |
| `controller_propAnimation_googlyEyes.reset(jbeamData)` | Remet le lisseur de taille à 1. *(interne)* | 48 |
| `controller_propAnimation_googlyEyes.updateGFX(dt)` | Chaque frame : calcule le coefficient de taille selon sensors.gz et ajuste longueurs et bornes des poutres. *(interne)* | 23 |

### Détail des paramètres

#### `controller_propAnimation_googlyEyes.init(jbeamData)`

Retrouve les poutres par tag, mémorise leurs longueurs de repos et lit les coefficients jbeam.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_propAnimation_googlyEyes.reset(jbeamData)`

Remet le lisseur de taille à 1.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_propAnimation_googlyEyes.updateGFX(dt)`

Chaque frame : calcule le coefficient de taille selon sensors.gz et ajuste longueurs et bornes des poutres.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getBeamRestLength`, `setBeamLength`, `setBoundedBeamLongBound`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/propAnimation/googlyEyes.lua`.*
