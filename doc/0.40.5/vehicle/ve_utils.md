# `ve_utils`

*Fichier : `lua/vehicle/ve_utils.lua` · VM : Véhicule · 293 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("ve_utils")`

Utilitaires globaux propres à la VM véhicule, chargés par require("ve_utils") : chronomètre haute précision, conversion de tables jbeam à en-tête en liste de dictionnaires, sauvegarde de jbeam compilé en texte, couleurs de contraste, génération de courbes interpolées (Catmull-Rom) et conversion psi -> Pa. Le module ne retourne pas de table M utile : tout est défini comme fonction globale.

## Exemple

```lua
local t = HighPerfTimer()
-- ... travail ...
local ms = t:stop() -- durée en millisecondes
local curve = createCurve({{0,0},{1000,50},{7000,200}})
local torque = curve[floor(rpm)]
```

## Remarques

- Les fonctions sont globales (pas de préfixe ve_utils.) ; un `require` suffit pour les définir.
- HighPerfTimer : os.clockhp() est en secondes, getTime/stop/stopAndReset renvoient des millisecondes.
- _HighPerfTimer:getTime() renvoie l'horloge absolue en ms (os.clockhp()*1000), pas le temps écoulé : pour la durée, utiliser stop().
- createCurve : les x des points doivent être des entiers croissants (l'index du tableau résultat est x lui-même, de floor(x1) à floor(xn)). Avec returnArray=true et ffi dispo, renvoie un float[?] C de taille xn+1 indexé à partir de 0.
- createCurve avec 3 points ou plus utilise un spline Catmull-Rom ; avec 2 points une droite ; avec moins de 2 renvoie nil.
- PSItoPascal ajoute 101325 : le résultat est une pression absolue, pas relative.
- getContrastColor/getContrastColorStringRGB cyclent sur 17 couleurs (i % 17) de la palette jetColor.
- saveCompiledJBeamRecursive écrit un pseudo-JSON (ordre des clés non garanti car pairs()) et n'échappe pas les guillemets des chaînes.

## Classe `_HighPerfTimer`

Chronomètre renvoyé par HighPerfTimer(). Stocke l'instant de départ en secondes dans self[1].

| Méthode | Description | Ligne |
|---|---|---|
| `_HighPerfTimer:getTime()` | Renvoie l'horloge haute précision absolue en millisecondes (pas la durée écoulée). | 33 |
| `_HighPerfTimer:reset()` | Redémarre le chronomètre à l'instant présent. | 18 |
| `_HighPerfTimer:stop()` | Renvoie le temps écoulé depuis le départ, en millisecondes, sans redémarrer. | 22 |
| `_HighPerfTimer:stopAndReset()` | Renvoie le temps écoulé en millisecondes et redémarre le chronomètre. | 26 |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `HighPerfTimer()` | Crée un chronomètre haute précision démarré à l'instant de création (basé sur os.clockhp). | 14 |
| `PSItoPascal(psi)` | Convertit une pression relative en psi en pression absolue en pascals : psi * 6894.757 + 101325. | 290 |
| `createCurve(points, returnArray)` | Construit une table de recherche dense à partir de points {x, y} : un tableau dont l'index est x (entier) et la valeur y interpolée. Droite pour 2 points, spline Catmull-Rom pour 3 ou plus. Sert par exemple aux courbes de couple moteur. | 265 |
| `getContrastColor(i, a)` | Renvoie une couleur du jeu tirée de la palette jet selon l'indice, pour distinguer des courbes ou des éléments de debug. | 224 |
| `getContrastColorStringRGB(i)` | Même palette que getContrastColor mais renvoie une chaîne hexadécimale CSS. | 228 |
| `saveCompiledJBeam(data, filename, lvl)` | Sauvegarde des données jbeam compilées dans un fichier texte (ouvre, écrit via saveCompiledJBeamRecursive, ferme). Sert au débogage. | 211 |
| `saveCompiledJBeamRecursive(f, data, level)` | Écrit récursivement une table de données au format texte type JSON dans un fichier ouvert, avec une indentation dépendant du niveau et un commentaire d'en-tête pour chaque table ayant un partPath. | 119 |
| `tableFromHeaderTable(entry)` | Convertit une table jbeam au format « première ligne = en-tête, lignes suivantes = valeurs » en liste de dictionnaires {colonne=valeur}. Une ligne qui est un dictionnaire seul définit des options communes appliquées aux lignes suivantes ; un dictionnaire placé en dernière colonne fusionne ses options dans la ligne. Si une ligne a un champ id, il est renommé name. | 37 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/ve_utils.lua`.*
