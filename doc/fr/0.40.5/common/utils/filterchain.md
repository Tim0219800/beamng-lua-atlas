# `utils_filterchain`

*Fichier : `lua/common/utils/filterchain.lua` · VM : Commun (GE + véhicule) · 272 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("utils/filterchain")`

Preuve de concept de 'chaîne de filtres' fonctionnelle : on décrit une chaîne par des textes comme 'smooth(2)' ou 'interval(0.1, 0.1)' qui sont compilés (load) en une fonction update chaînant les filtres. Les filtres sont dans la table locale F (smooth, interval, scale, digitize, floor, clamp, examine, startdelay) ; chaque filtre est un objet avec une méthode get(self, dt, ...). Se charge avec require('utils/filterchain') mais seule la fonction de test est exportée : la fabrique newFilterchain est locale et inaccessible. Le fichier définit aussi deux globales de debug (locals, getVarByName).

## Exemple

```lua
-- Les filtres se manipulent directement uniquement depuis ce fichier (F est local).
-- Exemple d'idée : chaîne {'smooth(2)', 'clamp(0,1)'}, appelée avec update(dt, valeur).
```

## Remarques

- Seule M.test est exportée ; newFilterchain, F et les classes Smooth/Interval/Startdelay sont locales au fichier (le .md d'index les liste mais elles ne sont pas accessibles de l'extérieur).
- La page d'index indique Smooth:get(sample) et Startdelay:get(sample) : en réalité la signature est get(self, dt, sample).
- Convention : le premier argument de chaque filtre est dt (commonFilterArguments = {'dt'} par défaut) ; la valeur filtrée suit.
- newFilterchain compose les filtres de la fin vers le début (le dernier de la liste est appelé en premier sur l'entrée, d'après la construction de la chaîne s) et fait des print() du code généré.
- Les filtres sont créés via load('return '..texte, nil, 't', F) : l'environnement est F, donc seuls les noms de F sont utilisables dans les chaînes.
- Incohérence : Interval:get renvoie une table {dt, ...} au lieu d'une valeur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `utils_filterchain.test()` | Exemple d'utilisation : crée une chaîne avec le filtre 'interval(0.1, 0.1)' en mode debug (examine) et appelle update 30 fois avec dt = 0.02, en affichant la sortie par dump. *(interne)* | 234 |

## Classe `F`

Table locale des fabriques de filtres (non exportée). Chaque fonction renvoie un objet filtre avec get(self, dt, ...).

| Méthode | Description | Ligne |
|---|---|---|
| `F.clamp(minval, maxval)` | Filtre qui borne la valeur entre minval et maxval. | 123 |
| `F.digitize(threshold)` | Filtre qui renvoie 1 si la valeur dépasse le seuil, sinon 0. | 108 |
| `F.examine(str, commonArgumentsCount)` | Filtre de debug : loggue (niveau D, origine filterchain.examine) le texte str suivi des arguments, et renvoie les arguments à partir de commonArgumentsCount+1 (retire les arguments communs comme dt). | 145 |
| `F.floor()` | Filtre qui renvoie math.floor(valeur). | 117 |
| `F.interval(offsetTime, timeOn, timeOff)` | Fabrique un filtre clignotant (Interval) : alterne état actif et inactif. | 67 |
| `F.scale(scaleVal)` | Filtre qui multiplie la valeur par scaleVal. | 102 |
| `F.smooth(rate)` | Fabrique un filtre de lissage à vitesse limitée (Smooth). | 44 |
| `F.startdelay(startdelay)` | Fabrique un filtre (Startdelay) qui retarde une montée de valeur : tant que l'entrée croît depuis moins de startdelay secondes, la sortie reste à l'ancienne valeur. | 158 |

## Classe `Interval`

Objet renvoyé par F.interval : alterne un état actif (onTime) et inactif (offTime).

| Méthode | Description | Ligne |
|---|---|---|
| `Interval:get(dt, ...)` | Fait avancer le chronomètre interne de dt. Quand l'état est actif, renvoie {dt, ...} (arguments inchangés), sinon {dt, 0, 0, ...} (autant de zéros que d'arguments). | 79 |

## Classe `Smooth`

Objet renvoyé par F.smooth : rapproche son état de l'échantillon à vitesse maximale rate (unités par seconde).

| Méthode | Description | Ligne |
|---|---|---|
| `Smooth:get(dt, sample)` | Fait avancer l'état vers sample d'au plus dt*rate et le renvoie. Au premier appel l'état est initialisé à sample. | 52 |

## Classe `Startdelay`

Objet renvoyé par F.startdelay.

| Méthode | Description | Ligne |
|---|---|---|
| `Startdelay:get(dt, sample)` | Si l'échantillon ne dépasse pas la valeur précédente, la mémorise et la renvoie. S'il la dépasse, renvoie l'ancienne valeur tant que le temps de montée cumulé est inférieur à startdelay, puis l'échantillon. | 167 |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `getVarByName(name, scope)` | GLOBALE de debug : retrouve une variable à partir d'un nom pointé (ex. 'mv.foo') dans une portée (par défaut _G). Le motif utilisé ('([^.]*).(.*)') découpe seulement en deux morceaux au premier séparateur ; fonctionne pour des noms à un ou deux niveaux (déduit du code). | 37 |
| `locals()` | GLOBALE de debug : renvoie une table {nomLocal = valeur} des variables locales de la fonction appelante (debug.getlocal au niveau 2). | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils/filterchain.lua`.*
