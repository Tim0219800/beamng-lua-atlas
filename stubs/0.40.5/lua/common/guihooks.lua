---@meta
-- tim19Atlas stub generated from lua/common/guihooks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Passerelle Lua vers l'interface HTML/JS (CEF). Permet de déclencher des hooks JS côté UI (guihooks.trigger) et d'envoyer des flux de données (streams) à haute fréquence pour les applications d'UI. Présent dans la VM GE (via `be`) et dans la VM véhicule (via `obj`) ; les deux envoient par queueHookJS/queueStreamDataJS. Un moddeur s'en sert pour afficher un message, mettre à jour une app UI ou tracer des valeurs dans l'app 'Generic Graph'.
--- Accès : globale `guihooks`
---@class guihooks
---@field queueStream function queueStream(key, value) : met en cache la donnée de flux `key` pour envoi ultérieur par sendStreams (VM véhicule : seulement si updateStreams est vrai). nop si ni `obj` ni `be`.
---@field send function Alias de queueStream.
guihooks = {}

--- Alimente l'app UI 'Generic Graph' (stream 'genericGraphSimple'). Chaque argument est une table {clé, valeur, échelle, unité, renderNegatives, couleur}; valeurs par défaut : clé '#i', valeur 0, échelle 1, unité '', renderNegatives false, couleur RGBA dégradé jet. Renvoie la liste normalisée. Exemple : graph({'foo',foo}, {'bar',bar,100}, {'baz',baz,nil,'m/s',false,nil}).
---Source : lua/common/guihooks.lua:151
---@param a table|nil premier graphe {clé, valeur, échelle, unité, renderNegatives, couleur} (ignoré si nil/false)
---@param ... table autres graphes, même format
---@return table[]  liste des graphes avec valeurs par défaut remplies
function guihooks.graph(a, ...) end

--- Comme graph, et enregistre aussi chaque appel comme une ligne d'un CSV en mémoire (csvlib). Le premier appel crée le fichier et fixe les colonnes (clé + unité). Écrire sur disque avec graphWithCSVWrite().
---Source : lua/common/guihooks.lua:167
---@param filename string|nil nom du fichier CSV (pris au premier appel ; défaut graphcsv.<date>.csv)
---@param ... table graphes, mêmes arguments que graph
function guihooks.graphWithCSV(filename, ...) end

--- Écrit le CSV accumulé par graphWithCSV dans le fichier ; journalise une erreur si aucun CSV n'existe.
---Source : lua/common/guihooks.lua:185
function guihooks.graphWithCSVWrite() end

--- Affiche un message dans l'UI via le hook 'Message' (données {msg, ttl, category, icon, availableOptionsCount, currentOptionIndex}). Ne fait rien si playerInfo.firstPlayerSeated est faux.
---Source : lua/common/guihooks.lua:126
---@param msg string texte (clé de traduction possible, déduit du code UI)
---@param ttl number|nil durée d'affichage en secondes, défaut 5
---@param category string|nil catégorie du message, défaut ''
---@param icon string|nil icône
---@param availableOptionsCount integer|nil nombre d'options (menus de choix)
---@param currentOptionIndex integer|nil option courante
function guihooks.message(msg, ttl, category, icon, availableOptionsCount, currentOptionIndex) end

--- Envoie le hook 'Message' une fois pour chaque joueur assis (playerInfo.seatedPlayers), avec le champ data.player. Accepte soit les mêmes arguments que message, soit une seule table {msg=..., ...} passée en premier argument (ttl nil).
---Source : lua/common/guihooks.lua:132
---@param msg string|table texte ou table de données avec champ msg
---@param ttl number|nil durée, défaut 5
---@param category string|nil catégorie, défaut ''
---@param icon string|nil icône
---@param availableOptionsCount integer|nil nombre d'options
---@param currentOptionIndex integer|nil option courante
function guihooks.messageForSeatedPlayers(msg, ttl, category, icon, availableOptionsCount, currentOptionIndex) end

--- Remet updateStreams à false, vide le cache de streams et envoie le hook 'VehicleReset' si le premier joueur est assis. Appelé lors d'un reset du véhicule/de la VM.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/guihooks.lua:97
function guihooks.reset() end

--- Envoie à l'UI tous les streams mis en cache par queueStream puis vide le cache. Appelé par le moteur (VM véhicule : depuis onGraphicsStep ; ne doit pas être appelé depuis GE d'après le commentaire du code).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/guihooks.lua:88
function guihooks.sendStreams() end

--- Déclenche le hook JS `hookName` côté UI avec les arguments donnés (encodés en JSON dans un tableau). Les valeurs nil sont ignorées. Sensible au ramasse-miettes (réutilise une table temporaire) : ne pas la modifier à la légère.
---Source : lua/common/guihooks.lua:26
---@param hookName string nom du hook JS
---@param ... any arguments sérialisables en JSON (nil ignorés)
function guihooks.trigger(hookName, ...) end

--- Comme trigger mais pour un client UI précis identifié par targetDsmId.
---Source : lua/common/guihooks.lua:41
---@param targetDsmId integer identifiant du client/UI cible
---@param hookName string nom du hook JS
---@param ... any arguments (nil ignorés)
function guihooks.triggerClient(targetDsmId, hookName, ...) end

--- Déclenche un hook JS en passant du JS brut (inséré tel quel entre crochets, pas d'échappement ni d'encodage JSON). À n'utiliser qu'avec du texte de confiance.
---Source : lua/common/guihooks.lua:54
---@param hookName string nom du hook JS
---@param rawJs any code JS brut converti avec tostring
function guihooks.triggerRawJS(hookName, rawJs) end

--- Envoie immédiatement une donnée de flux (stream) à l'UI sous le nom streamName (encodée en JSON).
---Source : lua/common/guihooks.lua:58
---@param streamName string nom du stream
---@param streamData any donnée sérialisable en JSON
function guihooks.triggerStream(streamName, streamData) end

