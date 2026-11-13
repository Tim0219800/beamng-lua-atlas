# `jbeam_optimization`

*Fichier : `lua/common/jbeam/optimization.lua` · VM : Commun (GE + véhicule) · 242 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/optimization")`

Étapes de finalisation des données jbeam avant envoi à la physique. assignCIDs numérote chaque ligne des sections « valides » avec un cid continu (0, 1, 2...) dans un ordre déterministe (clés triées) et calcule vehicle.maxIDs. process réordonne les nœuds de poutres (id1 < id2), supprime les champs inutiles à l'exécution, remplace les références objet par des cid (hydros, roues), retire les sections désactivées (disableSection) puis supprime vehicle.validTables.

## Remarques

- Ordre des cid des nœuds : d'abord les nœuds fixes, puis les nœuds sans collision (collision == false), puis tous les autres (nœuds non fixes à la fin), chaque groupe trié par clé.
- Les sections hors nœuds sont numérotées par ordre alphabétique des clés de ligne.
- optimize échange id1/id2 d'une poutre quand id1 > id2 et met à jour son cid avec la clé de table ; il n'est pas exporté.
- cleanup (non exporté) supprime group et engineGroup (sauf en mode debug), les chaînes vides (sauf la clé mesh), et remet à nil les valeurs par défaut des nœuds, poutres et triangles pour alléger les données.
- dereference (non exporté) remplace hydro.beam par hydro.beamCID et les listes de poutres/nœuds des roues par des cid.
- Une section dont la ligne d'indice 0 contient disableSection est supprimée du véhicule.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_optimization.assignCIDs(vehicle)` | Attribue à chaque ligne des sections listées dans vehicle.validTables un cid continu et enregistre le nombre de lignes par section dans vehicle.maxIDs. *(interne)* | 53 |
| `jbeam_optimization.process(vehicle, debugEnabled)` | Optimise et nettoie les données du véhicule : poutres id1<id2, nettoyage des valeurs par défaut, déréférencement en cid, suppression des sections désactivées et de validTables. *(interne)* | 218 |

### Détail des paramètres

#### `jbeam_optimization.assignCIDs(vehicle)`

Attribue à chaque ligne des sections listées dans vehicle.validTables un cid continu et enregistre le nombre de lignes par section dans vehicle.maxIDs.

- `vehicle` (*table*) : Données jbeam du véhicule (avec validTables), modifiées en place.
- **renvoie** : boolean Toujours true.

#### `jbeam_optimization.process(vehicle, debugEnabled)`

Optimise et nettoie les données du véhicule : poutres id1<id2, nettoyage des valeurs par défaut, déréférencement en cid, suppression des sections désactivées et de validTables.

- `vehicle` (*table*) : Données jbeam du véhicule.
- `debugEnabled` (*boolean|nil*) : Si vrai, conserve les champs group et engineGroup.
- **renvoie** : boolean Toujours true.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/optimization.lua`.*
