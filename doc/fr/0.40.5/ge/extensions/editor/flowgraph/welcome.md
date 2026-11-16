# `editor_flowgraph_welcome`

*Fichier : `lua/ge/extensions/editor/flowgraph/welcome.lua` · VM : Game Engine (GE) · 245 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/welcome")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre d'accueil « Welcome » (fg_welcome) de l'éditeur Flowgraph. Affiche une image d'en-tête (welcomeHeader.png), une image latérale (welcomeSide.png), une colonne gauche (nouveau projet, ouvrir un projet, 10 derniers fichiers récents) et une colonne droite d'introduction. Un projet de démonstration « Simple Race » est chargé depuis flowgraph/examples/scenarios/simpleRace/race.flow.json.

## Remarques

- Les fichiers récents viennent de la préférence flowgraph.general.recentFiles ; seuls ceux qui existent encore (FS:fileExists) sont listés.
- La fenêtre prend le focus une seule fois à l'ouverture (self.focus).

## Classe `C`

Classe de la fenêtre (windowName 'fg_welcome', windowDescription 'Welcome').

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Hook de désérialisation : vide. | 240 |
| `C:_onSerialize(data)` | Hook de sérialisation : vide. | 236 |
| `C:attach(mgr)` | Mémorise le manager courant. | 15 |
| `C:draw()` | Dessine la fenêtre « Welcome » si elle est visible. Appelée à chaque frame. | 183 |
| `C:drawContent()` | Assemble les images et les deux colonnes de la fenêtre. | 192 |
| `C:drawLeftColumn()` | Dessine « Projects » (New Project via core_flowgraphManager.addManager, Open Project... via le dialogue de fichier) et « Recent Files ». | 96 |
| `C:drawRightColumn()` | Dessine le texte d'introduction de l'éditeur. | 126 |
| `C:init()` | Enregistre la fenêtre (150x300, visible par défaut), charge les textures d'en-tête et latérale, prépare la liste des projets de démo. | 19 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/welcome.lua`.*
