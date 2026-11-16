# `career_modules_debug_insuranceDebug`

*Fichier : `lua/ge/extensions/career/modules/debug/insuranceDebug.lua` · VM : Game Engine (GE) · 16 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_insuranceDebug` : `extensions.load("career_modules_debug_insuranceDebug")`, puis la globale `career_modules_debug_insuranceDebug`

Onglet de debug carrière « Insurance ». Ajoute une seule entrée de menu '> Reset insurance data' qui appelle career_modules_insurance_insurance.resetPlPolicyData() (réinitialise les données de police d'assurance du joueur).

## Remarques

- Outil de développement ; debugOrder = 1.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_insuranceDebug.drawDebugFunctions()` | Dessine l'entrée '> Reset insurance data' ; au clic, réinitialise les données de police d'assurance. *(interne)* | 9 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | 'Insurance'. |
| `debugOrder` | number | Ordre de tri (1). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/insuranceDebug.lua`.*
