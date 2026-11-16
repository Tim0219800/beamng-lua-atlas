# `editor_drivePathEditor`

*Fichier : `lua/ge/extensions/editor/drivePathEditor.lua` · VM : Game Engine (GE) · 1248 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_drivePathEditor` : `extensions.load("editor_drivePathEditor")`, puis la globale `editor_drivePathEditor`

Drive Path Editor de l'éditeur de monde : outil pour dessiner des trajets (splines) que des véhicules IA suivent, en mode libre (nœuds posés à la main, avec largeurs et profil de vitesse) ou en mode graphe de navigation (choix de nœuds du navgraph de la carte). Il permet aussi d'enregistrer un trajet en conduisant et de lancer la lecture (ai.driveUsingPath). Ce fichier est l'interface principale : fenêtre, entrées souris/clavier et rendu ; la logique des splines est dans drivePathEditor/splineMgr, la lecture dans playback et l'enregistrement dans record.

## Remarques

- Mode d'édition déclaré : editor.editModes.drivePathSplineEditMode (« Drive Path Spline »). À l'activation, l'IA de tous les véhicules est arrêtée (ai.setState mode stop).
- Bornes de l'interface : délai de départ 0 à 60 s, vitesse de route 0 à 100 m/s, agressivité 0.3 à 1.0, tours 1 à 10 ; unités de vitesse affichées : m/s, mph ou kph (kph par défaut).
- onEditorGui met toujours à jour les splines « dirty », même outil inactif, et dessine seulement leurs coques ; si l'outil est actif, la fenêtre est dessinée, puis lecture/enregistrement, sinon l'éditeur de spline.
- onSerialize sérialise toutes les splines puis les supprime de la scène ; onDeserialized les recrée et relie les véhicules.
- Le fichier du module n'exporte que la sélection croisée (setSelectedSplineIdx/NodeIdx) et les hooks ; tout le reste est local.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_drivePathEditor.onClientEndMission()` | Hook appelé à la sortie de la carte : supprime toutes les splines de chemin, même désactivées, pour éviter des pointeurs TSStatic invalides au chargement suivant. *(interne)* *(hook)* | 1231 |
| `editor_drivePathEditor.onDeserialized(data)` | Hook de restauration : recrée les splines depuis les données, recalcule la table id vers index et relie de nouveau les véhicules. Ne fait rien si data est vide. *(interne)* *(hook)* | 99 |
| `editor_drivePathEditor.onEditorGui()` | Hook de l'éditeur appelé chaque frame : met à jour les splines, dessine la fenêtre, gère la lecture, l'enregistrement, les entrées et le rendu du mode libre ou du mode navgraph. *(interne)* *(hook)* | 1087 |
| `editor_drivePathEditor.onEditorInitialized()` | Hook : déclare le mode d'édition « Drive Path Spline » (icône cône de signalisation) et enregistre la fenêtre (300x700). *(interne)* *(hook)* | 1217 |
| `editor_drivePathEditor.onSerialize()` | Hook de sauvegarde avant rechargement des extensions : renvoie la liste des splines sérialisées et supprime les splines de la scène. *(interne)* *(hook)* | 86 |
| `editor_drivePathEditor.setSelectedNodeIdx(idx)` | Définit le nœud sélectionné (pour la sélection partagée entre outils). | 83 |
| `editor_drivePathEditor.setSelectedSplineIdx(idx)` | Définit la spline sélectionnée (pour la sélection partagée entre outils). | 80 |

### Détail des paramètres

#### `editor_drivePathEditor.onDeserialized(data)`

Hook de restauration : recrée les splines depuis les données, recalcule la table id vers index et relie de nouveau les véhicules. Ne fait rien si data est vide.

- `data` (*table|nil*) : tableau renvoyé par onSerialize

#### `editor_drivePathEditor.onSerialize()`

Hook de sauvegarde avant rechargement des extensions : renvoie la liste des splines sérialisées et supprime les splines de la scène.

- **renvoie** : table tableau de splines sérialisées

#### `editor_drivePathEditor.setSelectedNodeIdx(idx)`

Définit le nœud sélectionné (pour la sélection partagée entre outils).

- `idx` (*integer*) : index de nœud (base 1)

#### `editor_drivePathEditor.setSelectedSplineIdx(idx)`

Définit la spline sélectionnée (pour la sélection partagée entre outils).

- `idx` (*integer*) : index de spline (base 1)

## Appels vers le moteur (C++)

- `be:` `enterVehicle`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/drivePathEditor.lua`.*
