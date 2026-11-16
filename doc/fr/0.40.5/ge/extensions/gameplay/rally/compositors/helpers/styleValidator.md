# `gameplay_rally_compositors_helpers_styleValidator`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/helpers/styleValidator.lua` · VM : Game Engine (GE) · 539 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_compositors_helpers_styleValidator` : `extensions.load("gameplay_rally_compositors_helpers_styleValidator")`, puis la globale `gameplay_rally_compositors_helpers_styleValidator`

Vérifie la cohérence interne d'un style de compositeur de notes de rallye (fichier sous compositors/styles/). Il contrôle la table distance (callsEnabled, liens avec seuils croissants, unités base/large/point, arrondis, max), les composants componentTypes (corner avec numbering/intensité/longueurs/direction, caution, modifiers, modifierAliases) et les notes système via notebook/systemPacenotes. Il n'impose aucun schéma commun entre styles : chaque style peut définir ses propres types. Chaque erreur est journalisée (log 'E', tag styleValidator) et la validation s'arrête à la première erreur.

## Remarques

- Les plages d'intensité/longueur doivent être des tables {min, max} explicites (pas {a, b}), contiguës depuis 0 : chaque min égale le max précédent ; max peut manquer seulement sur la dernière plage et doit être supérieur à min.
- distance.links doit être un tableau non vide de {threshold = number, text = string|nil} à seuils strictement croissants.
- Les clés de premier niveau de componentTypes autorisées sont : corner, caution, modifiers, modifierAliases ; toute autre clé est refusée (les modificateurs atomiques vont dans componentTypes.modifiers).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_compositors_helpers_styleValidator.validate(style, name)` | Valide un style. Appelé par textCompositor:load après application des calibrages ; en cas d'échec le style n'est pas chargé. | 495 |

### Détail des paramètres

#### `gameplay_rally_compositors_helpers_styleValidator.validate(style, name)`

Valide un style. Appelé par textCompositor:load après application des calibrages ; en cas d'échec le style n'est pas chargé.

- `style` (*table*) : Table du style (distance, componentTypes, system...).
- `name` (*string|nil*) : Nom du style pour les messages d'erreur ('?' par défaut).
- **renvoie** : boolean true si le style est valide.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/helpers/styleValidator.lua`.*
