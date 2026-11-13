# `career_modules_branches_landing`

*Fichier : `lua/ge/extensions/career/modules/branches/landing.lua` · VM : Game Engine (GE) · 756 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_branches_landing` : `extensions.load("career_modules_branches_landing")`, puis la globale `career_modules_branches_landing`

Fournit à l'UI carrière les données de la page d'accueil de progression (domaines, branches, compétences) : titres, fils d'Ariane, niveau/XP, déblocages, ligues et missions formatées. Ajoute aussi le bouton 'landing page APM' dans le menu ordinateur. Un moddeur l'utilise surtout pour comprendre le format des tables envoyées à l'écran career.branchPage.

## Exemple

```lua
local data = career_modules_branches_landing.getLandingPageData('apm')
print(data.heading, #data.branches)
```

## Remarques

- Sans pathId (nil, '' ou 'undefined'), getLandingPageData liste les domaines (branch.isDomain) avec target 'landing' s'ils ont des branches enfants, sinon 'skillPage'.
- Avec un pathId, la page liste les enfants (target 'skillPage'), calcule niveau/XP (career_branches.calcBranchLevelFromValue), multiplicateur de récompense hérité des parents et, pour une branche ou compétence, ses ligues avec missions formatées.
- Le domaine par défaut des suggestions est 'apm'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_branches_landing.formatDriftSpot(ds)` | Formate un spot de drift comme une mission pour l'UI (skill 'drift', icône 'drift02', objectifs accomplis en étoiles par défaut). | 482 |
| `career_modules_branches_landing.formatMission(m)` | Formate une mission pour l'UI : skill, id, icône, label, description, type, progression formatée, startable, aperçu, vignette, verrouillée (non visible) et canStartFromProgressScreen (déclencheur de type 'league'). | 457 |
| `career_modules_branches_landing.getBranchSkillCardData(branchId)` | Renvoie les infos d'une carte de branche/compétence pour l'UI (nom, descriptions, niveau, libellé de niveau, niveau max atteint, débloquée, icône, couleur…). Appelle career_branches.checkUnlocks() au préalable. | 342 |
| `career_modules_branches_landing.getLandingPageData(pathId)` | Construit toute la table de la page de progression : heading, description, branches, breadcrumbs, et pour une branche : skillInfo, skills, leagues (missions formatées), isBranch. | 603 |
| `career_modules_branches_landing.getSuggestedMissionsForDomain(domainId)` | Parcourt récursivement les branches/compétences du domaine (hors en développement) et renvoie jusqu'à deux missions suggérées : une jamais jouée (0 étoile) et une partiellement terminée (sinon une seconde jamais jouée). | 578 |
| `career_modules_branches_landing.onComputerAddFunctions(menuData, computerFunctions)` | Hook de career_modules_computer : si la facilité a la fonction 'apmLandingPage', ajoute un bouton général qui navigue vers 'career.branchPage' (pathId 'apm', retour 'career.computer'), désactivé tant que le véhicule de départ n'est pas acheté. *(interne)* *(hook)* | 739 |
| `career_modules_branches_landing.openBigMapWithMissionSelected(missionId)` | Ouvre la grande carte (freeroam_bigMapMode.enterBigMap) instantanément avec la mission sélectionnée, route de retour 'career.branchPage.bigmap'. | 443 |
| `career_modules_branches_landing.resolveBranchTitle(pathId)` | Titre traduit d'une branche (branchHeading ou name) ; si absente ou manquante, renvoie le titre traduit de la page d'accueil (ui.career.landingPage.name). | 594 |

### Détail des paramètres

#### `career_modules_branches_landing.formatDriftSpot(ds)`

Formate un spot de drift comme une mission pour l'UI (skill 'drift', icône 'drift02', objectifs accomplis en étoiles par défaut).

- `ds` (*table*) : Spot de drift (champs id, info, saveData).
- **renvoie** : table Entrée formatée pour l'UI.

#### `career_modules_branches_landing.formatMission(m)`

Formate une mission pour l'UI : skill, id, icône, label, description, type, progression formatée, startable, aperçu, vignette, verrouillée (non visible) et canStartFromProgressScreen (déclencheur de type 'league').

- `m` (*table*) : Mission (gameplay_missions_missions).
- **renvoie** : table Mission formatée pour l'UI.

#### `career_modules_branches_landing.getBranchSkillCardData(branchId)`

Renvoie les infos d'une carte de branche/compétence pour l'UI (nom, descriptions, niveau, libellé de niveau, niveau max atteint, débloquée, icône, couleur…). Appelle career_branches.checkUnlocks() au préalable.

- `branchId` (*string*) : Id de la branche.
- **renvoie** : table branchInfo pour l'UI.

#### `career_modules_branches_landing.getLandingPageData(pathId)`

Construit toute la table de la page de progression : heading, description, branches, breadcrumbs, et pour une branche : skillInfo, skills, leagues (missions formatées), isBranch.

- `pathId` (*string|nil*) : Id du domaine/branche ; nil, '' ou 'undefined' pour la page racine.
- **renvoie** : table Données de la page pour l'UI.

#### `career_modules_branches_landing.getSuggestedMissionsForDomain(domainId)`

Parcourt récursivement les branches/compétences du domaine (hors en développement) et renvoie jusqu'à deux missions suggérées : une jamais jouée (0 étoile) et une partiellement terminée (sinon une seconde jamais jouée).

- `domainId` (*string|nil*) : Id du domaine ; 'apm' par défaut.
- **renvoie** : table[] Missions formatées suggérées.

#### `career_modules_branches_landing.onComputerAddFunctions(menuData, computerFunctions)`

Hook de career_modules_computer : si la facilité a la fonction 'apmLandingPage', ajoute un bouton général qui navigue vers 'career.branchPage' (pathId 'apm', retour 'career.computer'), désactivé tant que le véhicule de départ n'est pas acheté.

- `menuData` (*table*) : Données du menu (computerFacility, hasBoughtStarterVehicle…).
- `computerFunctions` (*table*) : Table {general, vehicleSpecific} à compléter.

#### `career_modules_branches_landing.openBigMapWithMissionSelected(missionId)`

Ouvre la grande carte (freeroam_bigMapMode.enterBigMap) instantanément avec la mission sélectionnée, route de retour 'career.branchPage.bigmap'.

- `missionId` (*string*) : Id de la mission à sélectionner.

#### `career_modules_branches_landing.resolveBranchTitle(pathId)`

Titre traduit d'une branche (branchHeading ou name) ; si absente ou manquante, renvoie le titre traduit de la page d'accueil (ui.career.landingPage.name).

- `pathId` (*string|nil*) : Id de la branche.
- **renvoie** : string Titre traduit.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCareerProgressPageGetTasklistData` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/branches/landing.lua`.*
