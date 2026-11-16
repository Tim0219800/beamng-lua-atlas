# `editor_missionEditor_general`

*Fichier : `lua/ge/extensions/editor/missionEditor/general.lua` · VM : Game Engine (GE) · 121 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/general")` (fichier sous extensions/ mais pas une extension classique)

Section « General » du Mission Editor : édite le nom et la description de la mission (champs texte ImGui) et affiche une icône de traduction (verte si _tr trouve une traduction, rouge sinon, avec la traduction en infobulle). Le module renvoie un constructeur : require('/lua/ge/extensions/editor/missionEditor/general')(missionEditor). Toute modification met mission._dirty = true.

## Remarques

- La description peut être une chaîne ou une table ; une table n'est pas modifiable (elle est affichée avec dumps).
- Tampons ImGui : nom 1024 caractères, description 2048.
- Bug mineur : getMissionIssues compare la traduction avec le nom sans tester le type du nom ; seul le cas de description gère explicitement une table.

## Classe `C`

Sous-fenêtre de la section General, créée par le constructeur renvoyé par le module.

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_general")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw()` | Dessine les champs Name et Description et leurs icônes de traduction ; enregistre les modifications dans la mission à la fin de l'édition. | 52 |
| `C:getMissionIssues(m)` | Appelle setMission puis renvoie les problèmes : nom manquant (error), description manquante (error), nom sans traduction (warning), description sans traduction (warning). | 22 |
| `C:init(missionEditor)` | Constructeur : mémorise la référence au missionEditor et prépare les champs recommandés (attributs recommandés de gameplay_missions_missions). | 11 |
| `C:setMission(mission)` | Sélectionne la mission à éditer : crée les tampons du nom et de la description et efface les traductions en cache. | 40 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/general.lua`.*
