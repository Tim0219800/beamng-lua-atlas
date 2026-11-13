# `editor_raceEditor_testing`

*Fichier : `lua/ge/extensions/editor/raceEditor/testing.lua` · VM : Game Engine (GE) · 170 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/testing")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre « Race Test » de l'éditeur de course : permet d'essayer la course en cours d'édition. Elle crée un objet gameplay/race/race à partir du chemin courant (debug draw activé), propose nombre de tours, téléportation du véhicule sur une position de départ, départ normal ou lancé (Start / Start Rolling, qui désactive l'éditeur), tests de conduite IA (véhicule courant ou tous), puis affiche temps et journal d'événements. Machine à états : setup, race, stopped. Le module renvoie un constructeur : require('/lua/ge/extensions/editor/raceEditor/testing')(raceEditor).

## Remarques

- C:draw n'est appelé que quand la fenêtre est ouverte (editor_raceEditor.onUpdate) ; en état « race », elle appelle race:onUpdate(dt) à chaque frame.
- « AI Drive Test All Vehicles » ne retient que les véhicules à moins de 100 m (distance au carré ≤ 10000) de la position de départ par défaut, si elle existe ; sinon tous les véhicules.
- L'IA est lancée avec startAiVehicle(id, 0.8).
- Les fonctions drawSetup, drawRace, drawStopped utilisent self.race : setupRace doit avoir été appelé avant draw, sinon self.race est nil.

## Classe `C`

Fenêtre de test de course (windowDescription = 'General'). Instanciée avec init(raceEditor). Champs : race (objet gameplay/race/race), state ('setup', 'race' ou 'stopped'), path.

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_testing")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw(dt)` | Dessine l'interface selon l'état (setup, race avec mise à jour de la course, stopped). | 44 |
| `C:drawEventLog()` | Affiche le journal d'événements du premier véhicule via race:inDrawEventlog. | 154 |
| `C:drawRace(dt)` | Interface en course : boutons Stop (abandonne la course pour tous les véhicules et rouvre l'éditeur), State (dump de l'état), Recover (requestRecover), puis temps et journal. | 110 |
| `C:drawSetup()` | Interface de préparation : nombre de tours, boutons « Move to <départ> », Start, Start Rolling, déplacer tous les véhicules aux positions de départ, tests IA. | 55 |
| `C:drawStopped()` | Interface après arrêt : bouton Restart (retour à la préparation), temps et journal. | 131 |
| `C:drawTimes()` | Affiche les temps du premier véhicule via race:inDrawTimes ; un clic bascule l'affichage détaillé. | 142 |
| `C:init(raceEditor)` | Mémorise raceEditor, startIndex = -1 et l'état 'setup'. | 9 |
| `C:setPath(path)` | Définit le chemin de course à tester. | 15 |
| `C:setupRace()` | Crée un nouvel objet race pour le chemin (en conservant le nombre de tours précédent, sinon 1), active useDebugDraw, assigne le véhicule joueur et passe à l'état 'setup'. | 19 |
| `C:startRace(vehIds, enableAi, rollingStart)` | Démarre la course : applique config.rollingStart au chemin, assigne les véhicules, appelle race:startRace(), passe à l'état 'race' et, si enableAi, lance l'IA sur chaque véhicule (vitesse relative 0.8). | 29 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/testing.lua`.*
