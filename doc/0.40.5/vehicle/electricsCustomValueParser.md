# `electricsCustomValueParser`

*Fichier : `lua/vehicle/electricsCustomValueParser.lua` · VM : Véhicule · 237 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("electricsCustomValueParser")`

Compile et exécute les valeurs électriques personnalisées déclarées dans le jbeam (electrics.customValues : champs electricsName, electricsFunction, electricsDefault). Chaque expression est évaluée chaque frame dans un environnement bac à sable (fonctions math, round, clamp, smoothstep, case, pwm…, et une copie de `electrics`) puis le résultat est recopié dans electrics.values. Utilisé uniquement par electrics.lua.

## Exemple

```lua
-- jbeam (section electrics.customValues)
-- ["electricsName", "electricsFunction", "electricsDefault"],
-- ["myBlink", "pwm(1, 2, 0.5)", 0],
-- ["throttleHalf", "clamp(electrics.throttle * 0.5, 0, 1)", 0]
```

## Remarques

- Une expression est de la forme `electrics.<nom> = <expression>` : les affectations (signe = isolé) sont refusées dans l'expression elle-même.
- Variables disponibles dans l'expression : electrics (copie des valeurs courantes), dt, fonctions de math.*, dump, dumpz, round, square, clamp, smoothstep, smootherstep, smoothmin, sign, case, pwm, logValue.
- case(selector, ...) : avec un booléen, agit comme un ternaire (true -> 1er argument, false -> 2e) ; avec un nombre n, renvoie le (n)ème argument (indexé depuis 1 après floor, avec n=0 renvoyant le dernier faute d'index 0), ou le dernier argument si hors plage.
- pwm(input, frequency, dutyCycle, timeOffset) : renvoie input quand une sinusoïde (fréquence en Hz) normalisée dépasse 1 - dutyCycle, sinon 0. Le temps pwm repart à 0 toutes les 3600 s.
- logValue(value, label) affiche la valeur et la renvoie (aide au débogage).
- Bug/anomalie : `pwm` est déclarée comme fonction globale (function pwm sans local), elle fuit dans l'environnement global du VM véhicule.
- Si la compilation du bloc complet échoue, updateCustomElectricsFunction reste nil et M.updateGFX lèvera une erreur à chaque frame (non protégé).
- L'expression 'electricsFunction' (valeur littérale en-tête de table jbeam mal fusionné) est ignorée volontairement.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `electricsCustomValueParser.compileCustomValueUpdates(customValueData)` | Construit l'environnement bac à sable, analyse chaque valeur custom, initialise electrics.values avec electricsDefault et compile une fonction unique exécutant toutes les affectations. *(interne)* | 165 |
| `electricsCustomValueParser.resetCustomValues()` | Remet dans electrics.values les valeurs electricsDefault de toutes les valeurs custom (appelé au reset). *(interne)* | 117 |
| `electricsCustomValueParser.updateGFX(dt)` | Copie electrics.values dans l'environnement, exécute la fonction compilée puis recopie dans electrics.values les clés personnalisées. Appelé par electrics.updateGFXSecondStep. *(interne)* | 106 |

### Détail des paramètres

#### `electricsCustomValueParser.compileCustomValueUpdates(customValueData)`

Construit l'environnement bac à sable, analyse chaque valeur custom, initialise electrics.values avec electricsDefault et compile une fonction unique exécutant toutes les affectations.

- `customValueData` (*table<integer, table>*) : Liste d'entrées {electricsName, electricsFunction?, electricsDefault?}.
- **renvoie** : nil Rien (nil aussi si la compilation échoue, erreur journalisée).

#### `electricsCustomValueParser.updateGFX(dt)`

Copie electrics.values dans l'environnement, exécute la fonction compilée puis recopie dans electrics.values les clés personnalisées. Appelé par electrics.updateGFXSecondStep.

- `dt` (*number*) : Pas de temps en secondes.

## Classe `customElectricsEnv`

Objet `customElectricsEnv` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `customElectricsEnv.case(selector, ...)` | function used as a case selector, input can be both int and bool as the first argument, any number of arguments after that<br>in case it's a bool, it works like a ternary if, returning the second param if true, the third if false<br>if the selector is an int n, it simply returns the nth+1 param it was given, if n > #params it returns the last given param | 20 |
| `customElectricsEnv.pwm(input, frequency, dutyCycle, timeOffset)` |  | 36 |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `pwm(input, frequency, dutyCycle, timeOffset)` |  | 36 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/electricsCustomValueParser.lua`.*
