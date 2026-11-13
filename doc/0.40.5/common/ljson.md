# `ljson`

*Fichier : `lua/common/ljson.lua` · VM : Commun (GE + véhicule) · 363 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("ljson")`

Ancien parseur SJSON écrit en Lua pur (Lua 5.1), conservé quand json.lua est passé à string.buffer de LuaJIT. Il décode le format SJSON d'Autodesk (JSON étendu) utilisé par les fichiers jbeam et de configuration. Rarement utile à un moddeur (préférer json.decode, plus rapide), mais il tolère les mêmes extensions et produit des erreurs avec numéro de ligne.

## Exemple

```lua
local t = require('ljson').decode(readFile('mon.sjson'))
```

## Remarques

- Extensions SJSON acceptées : commentaires // et /* */ (les commentaires /* imbriqués sont une erreur), virgules traitées comme des espaces (donc facultatives), clés sans guillemets (caractères [A-Za-z0-9_]), séparateur de clé ':' ou '=', dictionnaire racine sans accolades (suite de clé:valeur), valeurs Infinity et 1#INF00 (-> math.huge).
- Échappements de chaîne reconnus après '\' : t n f r b " \ et, de façon surprenante dans le code, un retour à la ligne (-> '\n'), le chiffre 9 (-> tabulation) et le chiffre 0 (-> CR). Les autres '\x' laissent la barre oblique telle quelle.
- Pendant le décodage, le ramasse-miettes est arrêté (collectgarbage('stop')) puis relancé ; une erreur de syntaxe lève error() avec 'message near line N, <texte de la ligne>'. L'état du module (chaîne source) est global au module : decode n'est pas réentrant.
- Dans ljson, les clés en double ne sont pas signalées (la dernière gagne) ; jsonDebug.lua est la même base avec avertissements de doublons.
- Les nombres sont lus à la main (partie entière, fractionnaire par multiplication de 0.1 : pas d'exactitude binaire parfaite pour les décimales ; les exposants utilisent tonumber).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ljson.decode(si)` | Décode un texte SJSON/JSON en table Lua. Renvoie nil si si est nil. Lève une erreur avec numéro de ligne si le texte est invalide. | 233 |

### Détail des paramètres

#### `ljson.decode(si)`

Décode un texte SJSON/JSON en table Lua. Renvoie nil si si est nil. Lève une erreur avec numéro de ligne si le texte est invalide.

- `si` (*string|nil*) : texte SJSON
- **renvoie** : table|nil valeur décodée

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/ljson.lua`.*
