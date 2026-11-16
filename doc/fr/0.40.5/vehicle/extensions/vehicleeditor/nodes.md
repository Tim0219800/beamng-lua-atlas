# `vehicleeditor_nodes`

*Fichier : `lua/vehicle/extensions/vehicleeditor/nodes.lua` · VM : Véhicule · 20 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `vehicleeditor_nodes` : `extensions.load (VM véhicule)("vehicleeditor_nodes")`, puis la globale `vehicleeditor_nodes`

Petit utilitaire de l'éditeur de véhicule : calcule la masse cumulée de nœuds du véhicule à partir de la masse physique réellement simulée (obj:getNodeMass).

## Exemple

```lua
local total, min, max = vehicleeditor_nodes.calculateNodesWeight()
```

## Remarques

- obj:getNodeMass est appelé jusqu'à 3 fois par nœud (pas mis en cache).
- Masses en kg (déduit : unité des masses de nœuds jbeam).
- Si la table est vide : renvoie 0, -math.huge, math.huge.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `vehicleeditor_nodes.calculateNodesWeight(nodesTbl)` | Somme les masses des nœuds de la table et renvoie aussi la plus petite et la plus grande masse de nœud. | 7 |

### Détail des paramètres

#### `vehicleeditor_nodes.calculateNodesWeight(nodesTbl)`

Somme les masses des nœuds de la table et renvoie aussi la plus petite et la plus grande masse de nœud.

- `nodesTbl` (*table|nil*) : Table de nœuds (chacun avec un champ cid) ; v.data.nodes si nil.
- **renvoie** : number Masse totale.
- **renvoie** : number Masse minimale d'un nœud.
- **renvoie** : number Masse maximale d'un nœud.

## Appels vers le moteur (C++)

- `obj:` `getNodeMass`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/vehicleeditor/nodes.lua`.*
