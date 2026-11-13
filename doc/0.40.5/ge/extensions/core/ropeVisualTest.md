# `core_ropeVisualTest`

*Fichier : `lua/ge/extensions/core/ropeVisualTest.lua` · VM : Game Engine (GE) · 2137 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_ropeVisualTest` : `extensions.load("core_ropeVisualTest")`, puis la globale `core_ropeVisualTest`

Bac à sable de développement pour les cordes visuelles (rope visuals) du moteur : une interface ImGui permet de créer, cloner et régler des cordes (ancres A et B, directions, nombre de noeuds, diamètre, amortissement, rigidité de flexion, XPBD, collisions, limite d'étirement, module de Young, masse, gravité, vent, matériau), d'animer les ancres, de déplacer les noeuds à la souris et de mesurer les temps de simulation et de rendu. Il n'est pas destiné au gameplay : il sert à tester le système de cordes (fonctions globales createRopeVisual, getAllRopeVisuals, getRopeVisual).

## Exemple

```lua
extensions.load('core_ropeVisualTest') -- la fenêtre ImGui s'affiche ensuite via onUpdate
```

## Remarques

- Presque tout le fichier (plus de 2000 lignes) est du code d'interface ImGui dans onUpdate ; l'extension n'exporte que quatre hooks et aucun champ.
- Animations d'ancre disponibles : 0 aucune, 1 wiggle, 2 cercle, 3 route cabossée, 4 rectangle, 5 marche aléatoire, 6 sinusoïde, 7 balayage de direction (Dir Sweep, seulement la direction tourne).
- onUpdate applique les animations à toutes les cordes suivies, gère le survol et le glisser des noeuds quand les noeuds de debug sont affichés, et dessine avec debugDrawer.
- Les réglages de l'interface sont conservés lors d'un rechargement de Lua par onSerialize/onDeserialized (champ uiState) ; ils peuvent aussi être sauvegardés dans un JSON via l'UI (rope_parameters.json par défaut).
- Valeurs par défaut de l'UI : 32 noeuds, diamètre 0.12 m, amortissement 0.995, rigidité de flexion 0.6, gravité (0, 0, -9.81), E = 1e7, 60 FPS de simulation, ancres A (0,0,3) et B (5,0,3).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_ropeVisualTest.onDeserialized(serializedData)` | Hook appelé après rechargement : restaure l'état de l'interface depuis serializedData.uiState, remet à 0 le décalage de clonage, puis reprend les cordes déjà existantes dans le moteur (positions de base, réglages de debug désactivés) et sélectionne la première. *(interne)* *(hook)* | 2013 |
| `core_ropeVisualTest.onExtensionUnloaded()` | Hook de déchargement : réinitialise les positions de base, les réglages de debug, le décalage de clonage et les statistiques de performance. *(interne)* *(hook)* | 700 |
| `core_ropeVisualTest.onSerialize()` | Hook appelé avant un rechargement des extensions Lua : renvoie {uiState = ...} avec tout l'état de l'interface (ancres, directions, propriétés de corde, toggles, physique, rendu, animation, debug). *(interne)* *(hook)* | 617 |
| `core_ropeVisualTest.onUpdate(dt)` | Hook de mise à jour par image : met à jour les statistiques de performance, le temps d'animation, les positions de base de la corde sélectionnée, applique les animations d'ancre à toutes les cordes, gère l'interaction avec les noeuds et dessine l'interface ImGui et les aides de debug. *(interne)* *(hook)* | 979 |

### Détail des paramètres

#### `core_ropeVisualTest.onDeserialized(serializedData)`

Hook appelé après rechargement : restaure l'état de l'interface depuis serializedData.uiState, remet à 0 le décalage de clonage, puis reprend les cordes déjà existantes dans le moteur (positions de base, réglages de debug désactivés) et sélectionne la première.

- `serializedData` (*{uiState: table}|nil*) : Table produite par onSerialize.

#### `core_ropeVisualTest.onSerialize()`

Hook appelé avant un rechargement des extensions Lua : renvoie {uiState = ...} avec tout l'état de l'interface (ancres, directions, propriétés de corde, toggles, physique, rendu, animation, debug).

- **renvoie** : {uiState: table} État de l'interface à restaurer.

#### `core_ropeVisualTest.onUpdate(dt)`

Hook de mise à jour par image : met à jour les statistiques de performance, le temps d'animation, les positions de base de la corde sélectionnée, applique les animations d'ancre à toutes les cordes, gère l'interaction avec les noeuds et dessine l'interface ImGui et les aides de debug.

- `dt` (*number*) : Durée de l'image en secondes.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawArrow`, `drawLineInstance`, `drawSphere`, `drawText`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/ropeVisualTest.lua`.*
