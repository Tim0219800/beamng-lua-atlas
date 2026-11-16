# `editor_missionEditor_objectives`

*Fichier : `lua/ge/extensions/editor/missionEditor/objectives.lua` · VM : Game Engine (GE) · 587 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/objectives")` (fichier sous extensions/ mais pas une extension classique)

Panneau « Objectives / Career Setup » de l'éditeur de missions. Il configure les étoiles de la mission (starsActive, defaultStarKeys pour les 3 étoiles par défaut, étoiles bonus), les récompenses par étoile (starRewards : attributeKey + rewardAmount) et les textes de fin (starOutroTexts, avec traduction par défaut). Il contient aussi des vérifications (getMissionIssues) et un mode « Raw » JSON. Charge l'extension career_branches pour proposer les attributs de récompense (money, beamXP, vouchers, plus les attributeKey des branches). Le module renvoie un constructeur : require(...)(missionEditor).

## Remarques

- Bug : le mode Raw appelle pushStyle("red") et popStyle() qui ne sont pas définies dans ce fichier (globales nil) ; une erreur de JSON dans l'éditeur brut provoquerait donc une erreur Lua au moment d'afficher le message.
- getMissionIssues : « Star X using default translations » (minor), « has no text and no default » ou « is not translated » (error), « No Stars set at all! » (error si showInCareer, sinon warning), récompense à 0 (error, seulement si showInCareer).
- Cocher une étoile l'assigne au premier emplacement libre parmi les 3 étoiles par défaut ; la décocher la retire de ces emplacements.
- Les stats « Summary » additionnent rewardAmount par attributeKey pour toutes les étoiles, les étoiles par défaut et les étoiles bonus.

## Classe `C`

Instance du panneau Objectives. Champs : missionEditor, mission, missionInstance (gameplay_missions_missions.getMissionById), careerSetup, attributeOptions, skillOptions, copiedStars (presse-papiers par type de mission), starKeysSorted.

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_objectives")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:attributeDropdown()` | Petit combo « ... » listant attributeOptions. | 171 |
| `C:draw()` | Dessine l'en-tête « Career Setup » (case Raw, copier/coller de la configuration par type de mission) puis drawCareerSetup ou l'éditeur JSON brut de mission.careerSetup. | 505 |
| `C:drawAddReward(key, rewards)` | Contrôles d'ajout d'une récompense (texte, combo, +) et boutons copier/coller des récompenses. | 219 |
| `C:drawAttributeInput(re, idx, key)` | Champ texte + combo pour l'attributeKey d'une récompense ; met à jour re.attributeKey. | 191 |
| `C:drawCareerSetup()` | Dessine toute la configuration : liste des étoiles avec cases à cocher, emplacement, éditeur du type, récompenses, textes de fin, puis résumé (étoiles par défaut, bonus, totaux de récompenses). | 371 |
| `C:drawDefaultStar(defaultIndex)` | Combo pour choisir quelle étoile active occupe l'emplacement d'étoile par défaut donné. Non appelée dans ce fichier. | 148 |
| `C:drawOutroText(key)` | Ligne d'édition du texte de fin d'une étoile (ou « noStarUnlocked »), avec icônes d'état de la traduction par défaut et de la traduction actuelle. | 328 |
| `C:drawRewardAmount(re, idx, key)` | Champ entier pour rewardAmount ; mémorise aussi _originalRewardAmount. | 208 |
| `C:drawStarRewards(key)` | Affiche et édite la liste des récompenses d'une étoile (suppression par bouton « Rem », ajout). | 268 |
| `C:getMissionIssues(m)` | Appelle setMission(m) puis renvoie les problèmes d'étoiles, de textes et de récompenses de la mission. | 46 |
| `C:getStarLabel(key)` | Renvoie le libellé traduit (_tr) de l'étoile, en gérant les libellés sous forme de fonction, de chaîne ou de table {txt}. | 133 |
| `C:init(missionEditor)` | Constructeur : charge career_branches et construit les listes attributeOptions et skillOptions (branches avec isSkill). | 20 |
| `C:setMission(mission)` | Définit la mission courante, récupère son instance de jeu, les clés d'étoiles triées et l'éditeur du type de mission (setContainer(mission, 'mission')). | 113 |
| `C:starSlotSelector(key)` | Combo pour placer l'étoile en « Bonus Star » ou en « Default Star N ». | 300 |

**Charge les extensions :** `career_branches`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/objectives.lua`.*
