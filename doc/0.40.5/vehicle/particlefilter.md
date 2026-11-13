# `particlefilter`

*Fichier : `lua/vehicle/particlefilter.lua` · VM : Véhicule · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `particlefilter`

Filtre d'émission de particules lors des collisions de noeuds. main.lua remplit la table partagée particlefilter.particleData à chaque onNodeCollision puis appelle nodeCollision(p) : si la vitesse perpendiculaire dépasse un seuil lié à la profondeur de pénétration, il cherche dans la table des règles de particules (particles.getMaterialsParticlesTable, issue de particles.json) les règles correspondant à la paire de matériaux et, pour celles dont compareFunc(p) est vrai, émet les particules via obj:addParticleVelWidthTypeCount.

## Remarques

- Seuil : perpendicularVel > depth x (0.5 / physicsDt), où physicsDt est la globale de main.lua (pas de physique).
- Clé de recherche : materialID1 x 10000 + materialID2 dans materialsMap. Chaque règle r fournit compareFunc, veloMult, width, particleType, count.
- Les valeurs initiales de particleData sont des 0 (même pour pos, normal, nodeVel qui sont ensuite remplis avec des vecteurs). Le champ est nommé materialID1/materialID2 (avec D majuscule) alors que le paramètre de main.lua s'appelle materialId1/materialId2.
- Le commentaire de debug du code mentionne p.particleType qui n'existe pas dans particleData.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `particlefilter.nodeCollision(p)` | Évalue une collision de noeud et émet des particules si le seuil de vitesse est dépassé et si une règle de la paire de matériaux accepte (compareFunc). Appelée par main.lua:onNodeCollision à chaque collision. *(interne)* | 25 |

### Détail des paramètres

#### `particlefilter.nodeCollision(p)`

Évalue une collision de noeud et émet des particules si le seuil de vitesse est dépassé et si une règle de la paire de matériaux accepte (compareFunc). Appelée par main.lua:onNodeCollision à chaque collision.

- `p` (*table*) : Données de collision au format de particleData.

## Champs

| Champ | Type | Description |
|---|---|---|
| `particleData` | table | Table réutilisée (évite des allocations) décrivant la collision courante : id1 (noeud), pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialID1, materialID2. Remplie par main.lua:onNodeCollision. |

## Appels vers le moteur (C++)

- `obj:` `addParticleVelWidthTypeCount`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/particlefilter.lua`.*
