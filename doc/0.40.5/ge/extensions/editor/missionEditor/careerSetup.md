# `editor_missionEditor_careerSetup`

*Fichier : `lua/ge/extensions/editor/missionEditor/careerSetup.lua` · VM : Game Engine (GE) · 251 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/careerSetup")` (fichier sous extensions/ mais pas une extension classique)

Section de configuration carrière du Mission Editor (mission.careerSetup) : choix des modes où la mission apparaît (Freeroam, Career), compétence associée (Skill, parmi les branches de carrière), frais d'inscription (Entry Fee) et utilitaires pour les récompenses (clé d'attribut, montant, copier/coller). Charge career_branches pour lister les attributs possibles (money, vouchers et la clé de chaque branche). Le module renvoie un constructeur.

## Remarques

- Les options d'attribut sont money, vouchers, puis branch.attributeKey pour chaque branche renvoyée par career_branches.getSortedBranches().
- Les tampons de saisie sont dans une table locale (inputBuffers) vidée à chaque setMission.
- getMissionIssues ne détecte aucun problème : renvoie toujours une liste vide.
- setMission suppose que mission.careerSetup existe et que l'instance de mission est trouvée (missionInstance.sortedStarKeys) ; sinon erreur.

## Classe `C`

Sous-fenêtre de configuration carrière.

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_careerSetup")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:attributeDropdown()` | Dessine une petite liste déroulante « ... » des clés d'attribut possibles. | 71 |
| `C:draw()` | Point d'entrée de dessin : appelle drawCareerSetup. | 240 |
| `C:drawAddReward(key, rewards)` | Dessine la zone d'ajout d'une récompense (champ clé, bouton +, liste de choix) et les boutons copier et coller de la liste de récompenses. | 119 |
| `C:drawAttributeInput(re, idx, key)` | Dessine le champ texte de la clé d'attribut d'une récompense avec la liste de choix ; met à jour re.attributeKey et marque la mission _dirty. | 91 |
| `C:drawCareerSetup()` | Dessine le tableau principal : cases Freeroam et Career, liste Skill et Entry Fee ; chaque modification écrit dans mission.careerSetup et marque _dirty. | 197 |
| `C:drawEntryFee()` | Dessine l'édition des frais d'inscription de la mission (une ligne par frais avec un bouton « Rem » pour le retirer). | 168 |
| `C:drawRewardAmount(re, idx, key)` | Dessine le champ entier du montant de récompense ; écrit re.rewardAmount et re._originalRewardAmount et marque la mission _dirty. | 108 |
| `C:getMissionIssues(m)` | Appelle setMission puis renvoie la liste des problèmes (toujours vide). | 44 |
| `C:init(missionEditor)` | Constructeur : charge career_branches et construit les listes d'attributs (attributeOptions) et de compétences (skillOptions, triée, avec « (none) »). | 20 |
| `C:setMission(mission)` | Sélectionne la mission : lit careerSetup (showInCareer, showInFreeroam), récupère les clés d'étoiles, vide les tampons et relie l'assistant d'édition du type de mission au conteneur « mission ». | 50 |

**Charge les extensions :** `career_branches`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/careerSetup.lua`.*
