# `flowgraph_nodes_career_careerVehicleSelect`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua` · VM : Game Engine (GE) · 164 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/careerVehicleSelect")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Career Vehicle Select » (behaviour once + singleActive, dépend de core_input_bindings). Ouvre le menu carrière 'menu.careerVehicleSelect' où le joueur choisit entre 3 véhicules, pour les tester ou les choisir. Entrées : flow, reset (impulsion), description (string ou table de traduction), et pour chaque véhicule i=1..3 : vehNimage, vehNname, vehNbrand, vehNdesc, vehNtestDisabled. Sorties flow (une seule à vrai selon le bouton) : test1, pick1, test2, pick2, test3, pick3. Les boutons de l'UI rappellent le nœud par une commande Lua générée (getCmd).

## Remarques

- _executionStarted est défini deux fois ; la seconde définition écrase la première et ne réinitialise pas open/done.
- Les fonctions closed() et started() existent mais ne sont pas appelées dans ce fichier (elles peuvent l'être depuis l'UI).
- Le pin de sortie « flow » est utilisé par started() alors que le schéma ne déclare aucun pin de sortie nommé flow (hors flow implicite).

**Dépendances (chargées avant) :** `core_input_bindings`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Au démarrage du graphe : met toutes les sorties à faux et _active à faux. | 53 |
| `C:_executionStopped()` | Ferme la fenêtre si elle est ouverte puis reset(). | 72 |
| `C:buttonPushed(action)` | Appelée par l'UI : met à vrai uniquement le pin de sortie portant le nom de l'action (test1, pick2…). | 85 |
| `C:closeDialogue()` | Marque la fenêtre comme fermée et inactive. | 95 |
| `C:closed()` | Marque le choix comme terminé (done) et inactif. | 126 |
| `C:getCmd(action)` | Construit la commande Lua que le bouton de l'UI exécutera pour rappeler buttonPushed sur ce nœud. | 91 |
| `C:init()` | Met open et done à faux. | 48 |
| `C:onClientEndMission()` | Hook : remet open et _active à faux à la fin de mission côté client. | 139 |
| `C:openDialogue()` | Construit les données des 3 véhicules (image, marque, nom, description, codes des boutons, testDisabled) et navigue vers 'menu.careerVehicleSelect'. | 100 |
| `C:postInit()` | Vide. | 62 |
| `C:reset()` | Remet done, open et _active à faux. | 79 |
| `C:started()` | Ferme la fenêtre, met le pin flow de sortie à vrai et done à vrai. | 132 |
| `C:work()` | Si reset est actif : ferme, réinitialise et met les sorties à faux. Sinon, ouvre la fenêtre une fois quand flow est actif et que ce n'est pas déjà fait. | 144 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua`.*
