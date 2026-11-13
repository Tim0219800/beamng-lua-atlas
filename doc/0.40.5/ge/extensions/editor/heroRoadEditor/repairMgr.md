# `editor_heroRoadEditor_repairMgr`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/repairMgr.lua` · VM : Game Engine (GE) · 171 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_repairMgr` : `extensions.load("editor_heroRoadEditor_repairMgr")`, puis la globale `editor_heroRoadEditor_repairMgr`

Rendu des amas de réparations (patchs d'asphalte) d'une route du Hero Road Editor. Chaque amas group.repairs[i] (créé dans l'onglet Features) devient une dispersion pseudo-aléatoire à graine fixe d'instances de décalques posées sur la chaussée via editor.addDecalInstanceWithTan, avec un DecalData partagé par matériau. C'est de la surface seule : aucun impact sur maillage, trottoirs ou collision. Le résultat est une fonction pure des paramètres de l'amas et de sa graine, donc identique après sauvegarde ou annulation.

## Remarques

- Les handles de décalques (userdata) sont gardés dans un store du module indexé par group.id, pas sur le groupe, car la table du groupe est encodée en buffer pour l'annulation/les sessions et ne peut pas sérialiser de userdata.
- Paramètres d'un amas (valeurs par défaut) : coverage 0.7, offset 0.0, lengthM 8.0 (min 0.5), sizeMin 0.6, sizeMax 1.4, density 0.6, t 0.5 (position normalisée le long de la route), seed 1, rotJitter 1.0, material.
- Nombre de patchs = round(density * lengthM * largeur de bande), borné entre 1 et 300.
- Le matériau doit être un vrai matériau de décalque en atlas (asphalt_patches : 4 lignes x 2 colonnes) ; les frames 0 et 4 sont ignorées (patchFrames = 1,2,3,5,6,7). Priorité de rendu 6 (sous les marquages, 12+), décollement de 0.03 m.
- Largeur de route : group.leftExtM / rightExtM, sinon la moitié de divWidths[1] (ou 5 m).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_repairMgr.clearRepairs(group)` | Supprime les instances de décalques de réparation du groupe et leurs modèles DecalData, puis oublie son entrée du store. Appelé à chaque reconstruction et au démontage. | 41 |
| `editor_heroRoadEditor_repairMgr.updateRepairs(group)` | Reconstruit la dispersion de décalques de chaque amas placé (appelle d'abord clearRepairs). Ne fait rien de plus si la route n'a pas de réparations, moins de 2 divPoints, pas de binormales, pas de dossier de scène ou une longueur nulle. | 144 |

### Détail des paramètres

#### `editor_heroRoadEditor_repairMgr.clearRepairs(group)`

Supprime les instances de décalques de réparation du groupe et leurs modèles DecalData, puis oublie son entrée du store. Appelé à chaque reconstruction et au démontage.

- `group` (*table|nil*) : Groupe Hero Road.

#### `editor_heroRoadEditor_repairMgr.updateRepairs(group)`

Reconstruit la dispersion de décalques de chaque amas placé (appelle d'abord clearRepairs). Ne fait rien de plus si la route n'a pas de réparations, moins de 2 divPoints, pas de binormales, pas de dossier de scène ou une longueur nulle.

- `group` (*table|nil*) : Groupe Hero Road (repairs, divPoints, binormals, divWidths, sceneTreeFolderId).

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/repairMgr.lua`.*
