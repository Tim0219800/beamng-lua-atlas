# `controller_bypassDampers`

*Fichier : `lua/vehicle/controller/bypassDampers.lua` · VM : Véhicule · 215 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `bypassDampers` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire pour amortisseurs à canaux de dérivation (bypass shocks, type tout-terrain/Trophy truck) : l'amortissement d'une poutre change selon son déplacement le long de zones successives. À chaque pas physique il mesure le déplacement de la poutre d'amortisseur par rapport à sa longueur au repos et applique via `obj:setBoundedBeamDamp` les coefficients de la zone correspondante. Il joue aussi un son de soupape quand le sens de déplacement s'inverse. Ordre d'appel : `defaultOrder = 80`.

## Remarques

- Clés jbeam lues par init : `dampers` (table d'en-tête avec `name`, `beamName` : nom jbeam de la poutre) et `zones` (table d'en-tête avec `zoneDistance`, `beamDamp`, `beamDampFast`, `beamDampRebound`, `beamDampReboundFast`, `beamDampVelocitySplit`, `beamDampVelocitySplitRebound` ; tous à 1 par défaut, le dernier reprend `beamDampVelocitySplit`). Les zones sont triées par `zoneDistance` croissante ; chaque zone va jusqu'au début de la suivante (la dernière jusqu'à l'infini). `zoneDistance` est le déplacement en m par rapport à la longueur au repos (positif = compression).
- Clés lues par initSounds : `emitValveSounds` (true), `valveSoundEventCompression` ("event:>Vehicle>Suspension>bypassShock_01>bypassShock_in"), `valveSoundEventRebound` ("...bypassShock_out"), `valveSoundMaxVolume` (0.5), `valveSoundMinVelocity` (0.05 m/s), `valveSoundMaxVelocity` (0.2 m/s).
- Le son est émis au noeud id1 de la poutre, dans updateGFX, depuis les mesures de update.
- Le champ interne des réglages de son s'appelle `maxValocity` dans le code (faute de frappe sans conséquence).
- Si une poutre nommée est introuvable, init plante sur `v.data.beams[nil]` : le nom de poutre doit exister.
- `damperZones` n'est jamais vidé dans init : un second init (sans rechargement du module) dupliquerait les zones.
- initLastStage et reset sont vides.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_bypassDampers.init(jbeamData)` | Retrouve les poutres des amortisseurs par nom et construit la liste triée des zones d'amortissement. *(interne)* | 138 |
| `controller_bypassDampers.initLastStage()` | Vide. *(interne)* | 203 |
| `controller_bypassDampers.initSounds(jbeamData)` | Lit les réglages des sons de soupape depuis le jbeam. *(interne)* | 127 |
| `controller_bypassDampers.reset()` | Vide (rien à remettre à zéro). *(interne)* | 124 |
| `controller_bypassDampers.update(dt)` | Pas physique : pour chaque amortisseur, calcule déplacement et vitesse, détecte l'inversion de sens (son de soupape), trouve la zone courante et applique ses coefficients d'amortissement si elle a changé. *(interne)* | 36 |
| `controller_bypassDampers.updateGFX(dt)` | Chaque frame : joue les sons de soupape mis en attente par update. *(interne)* | 105 |

### Détail des paramètres

#### `controller_bypassDampers.init(jbeamData)`

Retrouve les poutres des amortisseurs par nom et construit la liste triée des zones d'amortissement.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_bypassDampers.initSounds(jbeamData)`

Lit les réglages des sons de soupape depuis le jbeam.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_bypassDampers.update(dt)`

Pas physique : pour chaque amortisseur, calcule déplacement et vitesse, détecte l'inversion de sens (son de soupape), trouve la zone courante et applique ses coefficients d'amortissement si elle a changé.

- `dt` (*number*) : Pas physique en secondes.

#### `controller_bypassDampers.updateGFX(dt)`

Chaque frame : joue les sons de soupape mis en attente par update.

- `dt` (*number*) : Pas de temps en secondes (non utilisé).

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80 : rang d'appel par défaut. |
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getBeamLength`, `getBeamRestLength`, `setBoundedBeamDamp`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/bypassDampers.lua`.*
