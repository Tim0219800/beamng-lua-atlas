# `editor_toolUtilities_kerbSpec`

*Fichier : `lua/ge/extensions/editor/toolUtilities/kerbSpec.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_kerbSpec` : `extensions.load("editor_toolUtilities_kerbSpec")`, puis la globale `editor_toolUtilities_kerbSpec`

Section unique de bordure (kerb) et de trottoir (footway) à laquelle tous les outils de l'éditeur construisent, et pierre dont elles sont taillées. Les dimensions vivent ici pour qu'une voiture ressente le même ressaut sur une rue, un parking, un pont ou une place. Donne aussi les lignes de texture d'une variante de bordure.

## Remarques

- Spec : slabW 1.65 m (une dalle de large), slabThick 0.12, kerbW 0.15, kerbH 0.12 (12 cm hors de la route), buryM 0.30 (profondeur à partir de laquelle un bord est dit enterré), matériaux slabs_large et m_sidewalk_curb_trim_01.
- La feuille de texture de bordure empile 5 variantes en V (un cinquième chacune) ; l'arête vive doit rester sur la rangée centrale car la normal map y porte un arrondi.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_kerbSpec.kerbRows(variant)` | Renvoie les trois lignes V de la texture occupées par une variante de bordure : le dos de la marche, l'arête et le pied de la face. La variante est tronquée à l'entier et bornée à 0..4 ; une valeur non numérique donne 0. | 35 |

### Détail des paramètres

#### `editor_toolUtilities_kerbSpec.kerbRows(variant)`

Renvoie les trois lignes V de la texture occupées par une variante de bordure : le dos de la marche, l'arête et le pied de la face. La variante est tronquée à l'entier et bornée à 0..4 ; une valeur non numérique donne 0.

- `variant` (*integer|nil*) : Indice de variante, 0 à 4.
- **renvoie** : number Rangée du dos de la marche (variante * 0.2).
- **renvoie** : number Rangée de l'arête (+0.1).
- **renvoie** : number Rangée du pied de la face (+0.2 moins un petit écart de 0.00332).

## Champs

| Champ | Type | Description |
|---|---|---|
| `spec` | table | Dimensions et matériaux : slabW, slabThick, kerbW, kerbH, buryM, slabMaterial, kerbMaterial. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/kerbSpec.lua`.*
