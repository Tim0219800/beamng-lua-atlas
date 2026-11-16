# `editor_flowgraph_projectSettings`

*Fichier : `lua/ge/extensions/editor/flowgraph/projectSettings.lua` · VM : Game Engine (GE) · 128 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/projectSettings")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre « Project Settings » (projectSettings) de l'éditeur Flowgraph. Elle édite les métadonnées du projet courant : nom, description (512 car. max), auteurs, difficulté (0-100, libellé Easy/Medium/Hard/Very Hard par tranches de 25) et case « Is Scenario ». Affiche aussi le nom de fichier et le dossier de sauvegarde, avec des boutons Save et Save as... (extension .flow.json).

## Remarques

- Chaque modification de nom, d'auteur, de difficulté ou de mode scénario ajoute une entrée d'historique via fgEditor.addHistory.
- En mode debug (préférence flowgraph.debug.editorDebug) la fenêtre affiche une icône si le projet est caché (mgr.hidden) ou transitoire (mgr.transient, non sauvegardable).
- La description est modifiée sans entrée d'historique.
- Le libellé de difficulté utilise floor(valeur/25)+1 : la valeur 100 retombe sur 'Very Hard' grâce au repli, sinon 0-24 Easy, 25-49 Medium, 50-74 Hard, 75-99 Very Hard.

## Classe `C`

Classe de la fenêtre (windowName 'projectSettings', windowDescription 'Project Settings').

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Hook de désérialisation de la fenêtre : vide. | 123 |
| `C:_onSerialize(data)` | Hook de sérialisation de la fenêtre : vide, rien n'est sauvegardé. | 119 |
| `C:attach(mgr)` | Mémorise le manager et prépare les champs ImGui (nom 64 car., auteurs 128 car., pointeur de difficulté) à partir de mgr.name, mgr.authors et mgr.difficulty. | 14 |
| `C:draw()` | Dessine les champs du projet et les boutons Save / Save as.... Save appelle fgEditor.save(), Save as ouvre le dialogue de fichier puis fgEditor.saveAsFile. | 25 |
| `C:init()` | Enregistre la fenêtre dans l'éditeur (150x300, masquée par défaut). | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/projectSettings.lua`.*
