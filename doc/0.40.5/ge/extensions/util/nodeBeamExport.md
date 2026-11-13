# `util_nodeBeamExport`

*Fichier : `lua/ge/extensions/util/nodeBeamExport.lua` · VM : Game Engine (GE) · 125 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_nodeBeamExport` : `extensions.load("util_nodeBeamExport")`, puis la globale `util_nodeBeamExport`

Exporteur minimal du véhicule du joueur : écrit dans un fichier JSON (.nbexport.json) la liste des nœuds (position et nom éventuel) et des poutres (identifiants de nœuds) du véhicule actif, sous forme d'un graphe point/arête. Utile pour visualiser ou analyser la structure physique d'un véhicule dans un outil externe. Les noms de fichier sont numérotés automatiquement (export_<N>.nbexport.json) dans le dossier du véhicule.

## Exemple

```lua
extensions.util_nodeBeamExport.exportFile()
```

## Remarques

- Les positions viennent de veh:getNodePosition(id) (coordonnées relatives au nœud de référence du véhicule) et sont converties en {x, z, -y} avant écriture (commentaire du code : « Z-up »).
- Les poutres sont lues depuis vdata.vdata.beams (champs id1, id2, cid) ; l'id vaut -1 si cid est absent.
- Le fichier contient aussi vehicle = {id, jbeam, name} ; exportFile renvoie false si aucun véhicule joueur ou aucune donnée n'est disponible.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_nodeBeamExport.exportFile(filename)` | Construit le graphe du véhicule actif et l'écrit en JSON. Sans nom de fichier, utilise suggestFilename(). Crée le dossier de destination si nécessaire et logue le résultat. | 97 |
| `util_nodeBeamExport.suggestFilename()` | Propose le prochain nom libre export_<N>.nbexport.json dans le dossier du véhicule actif (cherche les fichiers existants pour incrémenter N) ; crée le dossier au besoin. | 70 |

### Détail des paramètres

#### `util_nodeBeamExport.exportFile(filename)`

Construit le graphe du véhicule actif et l'écrit en JSON. Sans nom de fichier, utilise suggestFilename(). Crée le dossier de destination si nécessaire et logue le résultat.

- `filename` (*string|nil*) : Chemin du fichier de sortie (défaut : export_<N>.nbexport.json dans le dossier du véhicule)
- **renvoie** : boolean true si l'écriture a réussi, false sinon

#### `util_nodeBeamExport.suggestFilename()`

Propose le prochain nom libre export_<N>.nbexport.json dans le dossier du véhicule actif (cherche les fichiers existants pour incrémenter N) ; crée le dossier au besoin.

- **renvoie** : string|nil Chemin proposé, ou nil (erreur loguée) si aucun dossier de véhicule n'est disponible

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/nodeBeamExport.lua`.*
