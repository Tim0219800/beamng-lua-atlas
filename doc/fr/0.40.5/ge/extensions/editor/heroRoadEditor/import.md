# `editor_heroRoadEditor_import`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/import.lua` · VM : Game Engine (GE) · 452 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_import` : `extensions.load("editor_heroRoadEditor_import")`, puis la globale `editor_heroRoadEditor_import`

Import de DecalRoads existants dans un nouveau groupe Hero Road. À partir d'une sélection de DecalRoad (ou d'un polygone de sélection), le module estime une ligne centrale de référence (milieu des bords gauche/droit trouvés par recherche exponentielle puis dichotomie à partir de la plus longue route), crée un groupe 'Import N' avec ces nœuds simplifiés (RDP) et transforme chaque DecalRoad en calque (matériau, priorité de rendu, largeur, position latérale normalisée, inversion, fondus). Les DecalRoad utilisés sont supprimés, avec commit d'annulation/rétablissement.

## Remarques

- Constantes : pas de recherche initial 0.1 m, 8 itérations de raffinement, distance de recherche max 50 m, tolérance de largeur 0.1 m (isTrackWidth), tolérance RDP 0.5.
- Position latérale d'un calque = moyenne de (signe * distance * 2 / largeur de référence) sur ses nœuds ; isFlip est décidé par vote majoritaire sur le produit scalaire des tangentes.
- Les boucles ne sont pas gérées (tmpSpline.isLoop = false, TODO dans le code).
- Le groupe créé désactive toutes les couches automatiques (traces de pneus, asphalte endommagé, fissures, réparations, patchs, lignes centrales/de rive/de voie, fondus de bord).
- L'annulation recrée les DecalRoad supprimés (nom, champs, nœuds, groupe parent) ; le rétablissement les supprime à nouveau par nom.
- Un DecalRoad dans le polygone suffit à importer toute la route dès qu'un seul de ses nœuds est dedans (pos:inPolygon).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_import.importFromPolygon(polygon)` | Cherche tous les DecalRoad dont au moins un nœud est dans le polygone, puis appelle importSelectedIntoNewGroup avec eux. | 426 |
| `editor_heroRoadEditor_import.importSelectedIntoNewGroup(decalRoads)` | Importe les DecalRoad donnés dans un nouveau groupe Hero Road : calcule la spline de référence, crée le groupe, génère les calques, supprime les DecalRoad (et leurs groupes parents devenus vides) et enregistre l'action 'Import DecalRoads into Hero Road' dans l'historique. Ne fait rien si la liste est vide. | 351 |

### Détail des paramètres

#### `editor_heroRoadEditor_import.importFromPolygon(polygon)`

Cherche tous les DecalRoad dont au moins un nœud est dans le polygone, puis appelle importSelectedIntoNewGroup avec eux.

- `polygon` (*table*) : Polygone de sélection (liste de points) accepté par vec3:inPolygon.

#### `editor_heroRoadEditor_import.importSelectedIntoNewGroup(decalRoads)`

Importe les DecalRoad donnés dans un nouveau groupe Hero Road : calcule la spline de référence, crée le groupe, génère les calques, supprime les DecalRoad (et leurs groupes parents devenus vides) et enregistre l'action 'Import DecalRoads into Hero Road' dans l'historique. Ne fait rien si la liste est vide.

- `decalRoads` (*table*) : Tableau d'objets DecalRoad de la scène.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `Sim.` `getUniqueName`, `upcast`
- `obj:` `delete`, `getID`, `registerObject`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/import.lua`.*
