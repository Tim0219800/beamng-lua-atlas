# `controller_mechanics_beamChain`

*Fichier : `lua/vehicle/controller/mechanics/beamChain.lua` · VM : Véhicule · 78 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `mechanics/beamChain` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur de mécanique (type "auxiliary") qui relie deux poutres en série : à chaque pas physique, si la somme de leurs longueurs dépasse leur longueur combinée initiale, l'excès est retiré à parts égales des deux (obj:setBeamLength). Utile pour simuler une chaîne ou un câble à deux tronçons. Si l'une des poutres casse, l'autre est cassée aussi et le système se désactive.

## Remarques

- Clé jbeam : beamTag (obligatoire), tag de poutre qui doit correspondre à exactement 2 poutres (beamstate.tagBeamMap) ; sinon une erreur est journalisée et le contrôleur reste inactif (update et updateGFX restent nil).
- Le hook beamBroken(id, energy) est appelé par le moteur quand une poutre casse.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_mechanics_beamChain.beamBroken(id, energy)` | Hook : appelé quand une poutre casse ; si c'est l'une des deux, casse l'autre et désactive la chaîne. *(interne)* | 34 |
| `controller_mechanics_beamChain.init(jbeamData)` | Retrouve les deux poutres du tag et mémorise leur longueur combinée. *(interne)* | 48 |
| `controller_mechanics_beamChain.reset(jbeamData)` | Réactive la chaîne. *(interne)* | 44 |
| `controller_mechanics_beamChain.update(dt)` | Chaque pas physique : retire l'excès de longueur à parts égales des deux poutres. (assignée dynamiquement) *(interne)* | dyn |
| `controller_mechanics_beamChain.updateGFX(dt)` | Ne fait rien. (assignée dynamiquement) *(interne)* | dyn |

### Détail des paramètres

#### `controller_mechanics_beamChain.beamBroken(id, energy)`

Hook : appelé quand une poutre casse ; si c'est l'une des deux, casse l'autre et désactive la chaîne.

- `id` (*integer*) : Identifiant (cid) de la poutre cassée.
- `energy` (*number*) : Énergie de rupture.

#### `controller_mechanics_beamChain.init(jbeamData)`

Retrouve les deux poutres du tag et mémorise leur longueur combinée.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_mechanics_beamChain.reset(jbeamData)`

Réactive la chaîne.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_mechanics_beamChain.update(dt)`

Chaque pas physique : retire l'excès de longueur à parts égales des deux poutres. (assignée dynamiquement)

- `dt` (*number*) : Pas de temps (s).

#### `controller_mechanics_beamChain.updateGFX(dt)`

Ne fait rien. (assignée dynamiquement)

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `breakBeam`, `getBeamLength`, `setBeamLength`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/mechanics/beamChain.lua`.*
