# `editor_missionPlaybook`

*Fichier : `lua/ge/extensions/editor/missionPlaybook.lua` · VM : Game Engine (GE) · 471 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_missionPlaybook` : `extensions.load("editor_missionPlaybook")`, puis la globale `editor_missionPlaybook`

Extension d'éditeur « Mission Playbook » (menu Missions). Un playbook est une liste d'instructions (book.instructions) rejouées sur un slot de carrière pour tester le déblocage des missions : chaque instruction missionAttempt donne une mission et les étoiles obtenues, et est exécutée via gameplay_missions_progress.generateAttempt. Après chaque étape, le hook onPlaybookLogAfterStep est émis pour que les visionneuses (attributs, missions débloquées, arbre) enregistrent leur état dans book.results. La fenêtre permet de sauver/charger un playbook (.missionPlaybook.json, dossier missionPlaybooks/), de rejouer sur le slot courant ou un slot vide (playbookTestingSlot) et de générer automatiquement des playbooks (toutes missions, par tier, par branche, étoiles par défaut ou bonus).

## Exemple

```lua
extensions.load('editor_missionPlaybook')
editor_missionPlaybook.book.instructions[#editor_missionPlaybook.book.instructions+1] = {type = 'missionAttempt', missionId = 'italy/delivery/001-mattress', stars = {piecesBronze = true}}
editor_missionPlaybook.show()
```

## Remarques

- Les entrées « Run » et « Util » du menu sont désactivées tant que la carrière n'est pas active (career_career.isActive()) ; il faut charger la carrière à la main une première fois.
- « Clear Testing Slot » et « Play with Empty Slot » désactivent la carrière, SUPPRIMENT le profil playbookTestingSlot (career_saveSystem.removeProfile) puis le recréent.
- Bug : dans le menu Load, un échec de chargement assigne M.book = M.book.instructions (une liste d'instructions, pas un livre), ce qui casse M.book.page et M.book.results ; il manque probablement « or M.book ».
- onEditorRegisterPreferences ne fait rien (code commenté).
- La génération (generateAndPlaybook) exécute réellement les tentatives sur la progression du slot courant, jusqu'à 10000 étapes ou plus d'étoiles disponibles ; elle modifie la sauvegarde de carrière.
- Du code de débogage (dump) reste actif dans play et getAllRemainingStarCombos.

**Dépendances (chargées avant) :** `gameplay_missions_missions`, `editor_missionPlaybook_attributeViewer`, `editor_missionPlaybook_unlockedMissionsViewer`, `editor_missionPlaybook_missionTreeViewer`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_missionPlaybook.drawBookViewer()` | Dessine le curseur de page (1 à #book.results) et la case « Condensed ». Appelée par onEditorGui. *(interne)* | 430 |
| `editor_missionPlaybook.onDeserialized(data)` | Restaure book et condensed après un rechargement des extensions. *(interne)* *(hook)* | 454 |
| `editor_missionPlaybook.onEditorGui()` | Hook d'éditeur appelé à chaque frame : dessine la fenêtre « Mission Playbook » (menus File, Util, Run, Generate, liste des instructions avec boutons Up/Down/Remove hors mode condensé, bouton « Add... »). *(interne)* *(hook)* | 251 |
| `editor_missionPlaybook.onEditorInitialized()` | Hook appelé quand l'éditeur est initialisé : enregistre la fenêtre (1500x700) et l'entrée de menu « Missions ». *(interne)* *(hook)* | 408 |
| `editor_missionPlaybook.onEditorRegisterPreferences(prefsRegistry)` | Hook d'enregistrement des préférences d'éditeur ; vide. *(interne)* *(hook)* | 415 |
| `editor_missionPlaybook.onSerialize()` | Appelé lors du rechargement des extensions Lua : renvoie {book, condensed} pour sauvegarder l'état. *(interne)* *(hook)* | 446 |
| `editor_missionPlaybook.show()` | Affiche la fenêtre « Mission Playbook ». | 403 |

### Détail des paramètres

#### `editor_missionPlaybook.onDeserialized(data)`

Restaure book et condensed après un rechargement des extensions.

- `data` (*table|nil*) : Données renvoyées par onSerialize.

#### `editor_missionPlaybook.onEditorRegisterPreferences(prefsRegistry)`

Hook d'enregistrement des préférences d'éditeur ; vide.

- `prefsRegistry` (*table*) : Registre de préférences.

#### `editor_missionPlaybook.onSerialize()`

Appelé lors du rechargement des extensions Lua : renvoie {book, condensed} pour sauvegarder l'état.

- **renvoie** : table Données à conserver.

## Champs

| Champ | Type | Description |
|---|---|---|
| `book` | table | Livre courant : {page = integer, instructions = table[], results = table[]}. Sérialisé par onSerialize. |
| `dependencies` | string[] | Extensions chargées avant : gameplay_missions_missions et les trois visionneuses du playbook. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPlaybookLogAfterStep` — écouté par 3 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionPlaybook.lua`.*
