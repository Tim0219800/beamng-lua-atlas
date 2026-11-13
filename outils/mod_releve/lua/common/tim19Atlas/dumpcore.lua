-- tim19Atlas : relevé de l'API Lua vivante (lecture seule, n'écrit que le fichier de sortie).
-- Commun aux VM GE et véhicule.

local M = {}

local rawget, rawequal, type, pairs, pcall, tostring = rawget, rawequal, type, pairs, pcall, tostring
local getmt = debug and debug.getmetatable or getmetatable

local function fnInfo(f)
  local r = { kind = "function" }
  local ok, info = pcall(debug.getinfo, f, "Su")
  if ok and info then
    r.what = info.what
    if info.what ~= "C" then
      r.source = info.short_src
      r.line = info.linedefined
    end
    r.nparams = info.nparams
    r.vararg = info.isvararg
    if info.what ~= "C" and info.nparams and info.nparams > 0 then
      local ps = {}
      for i = 1, info.nparams do
        local okl, name = pcall(debug.getlocal, f, i)
        ps[i] = okl and name or ("p" .. i)
      end
      r.params = ps
    end
  end
  return r
end

local function bindType(mt)
  if type(mt) ~= "table" then return nil end
  local t = rawget(mt, "___type") or rawget(mt, "__type")
  if type(t) == "string" then return t end
  return nil
end

local function sortedKeys(t)
  local ks = {}
  for k in pairs(t) do
    if type(k) == "string" then ks[#ks + 1] = k end
  end
  table.sort(ks)
  return ks
end

-- Classe C++ exposée par luaBinding : [1]=getters [2]=setters [3]=super
local function describeClass(mt)
  local c = { type = bindType(mt), methods = {}, getters = {}, setters = {}, constants = {} }
  local sup = rawget(mt, 3)
  if type(sup) == "table" then c.super = bindType(sup) or "?" end
  for _, k in ipairs(sortedKeys(mt)) do
    local v = rawget(mt, k)
    if k:sub(1, 2) ~= "__" and k ~= "___type" then
      if type(v) == "function" then c.methods[#c.methods + 1] = k
      else c.constants[k] = type(v) end
    end
  end
  local idx = rawget(mt, "__index")
  if type(idx) == "table" and not rawequal(idx, mt) then
    for _, k in ipairs(sortedKeys(idx)) do
      if k:sub(1, 2) ~= "__" and type(rawget(idx, k)) == "function" then c.methods[#c.methods + 1] = k end
    end
  end
  for slot, dst in pairs({ [1] = c.getters, [2] = c.setters }) do
    local t = rawget(mt, slot)
    if type(t) == "table" then
      for _, k in ipairs(sortedKeys(t)) do
        local v = rawget(t, k)
        if type(v) == "function" then dst[#dst + 1] = k
        elseif slot == 1 then c.constants[k] = type(v) end
      end
    end
  end
  return c
end

local function describeValue(v, depth, seen)
  local tv = type(v)
  if tv == "function" then return fnInfo(v) end
  if tv == "table" or tv == "userdata" or tv == "cdata" then
    local r = { kind = tv }
    local ok, mt = pcall(getmt, v)
    local bt = ok and bindType(mt)
    if bt then r.class = bt end
    if tv == "table" and not bt and depth > 0 and not seen[v] then
      seen[v] = true
      local fields, n = {}, 0
      for _, k in ipairs(sortedKeys(v)) do
        n = n + 1
        if n > 400 then r.truncated = true break end
        local okv, fv = pcall(rawget, v, k)
        if okv then fields[k] = describeValue(fv, depth - 1, seen) end
      end
      r.fields = fields
    end
    return r
  end
  if tv == "string" then return { kind = "string", value = #v <= 80 and v or nil } end
  if tv == "number" or tv == "boolean" then return { kind = tv, value = v } end
  return { kind = tv }
end

function M.collect(vmName)
  local out = { vm = vmName, globals = {}, classes = {} }
  pcall(function() out.version = beamng_versionb or (beamng_version and tostring(beamng_version)) end)
  out.lua = _VERSION
  pcall(function() out.jit = jit and jit.version end)

  local seen = {}
  local function addClass(mt)
    local bt = bindType(mt)
    if bt and not out.classes[bt] then
      local ok, c = pcall(describeClass, mt)
      if ok then out.classes[bt] = c end
      local sup = rawget(mt, 3)
      if type(sup) == "table" then addClass(sup) end
    end
  end
  for _, k in ipairs(sortedKeys(_G)) do
    if k ~= "_G" and k ~= "package" then
      local ok, d = pcall(describeValue, rawget(_G, k), 2, seen)
      out.globals[k] = ok and d or { kind = "error" }
    end
  end

  -- classes : registre + métatables rencontrées
  -- sous-modules C++ (Engine.Render, Engine.Audio...) : tables typées imbriquées
  out.modules = {}
  local function walkModule(path, t, depth)
    if depth > 4 or type(t) ~= "table" then return end
    local okm, mt = pcall(getmt, t)
    local bt = bindType(t) or (okm and bindType(mt)) or nil
    if not bt and depth == 0 then return end
    if out.modules[path] then return end
    local fns = {}
    for _, src in ipairs({ t, (okm and type(mt) == "table") and mt or {} }) do
      for _, k in ipairs(sortedKeys(src)) do
        if k:sub(1, 2) ~= "__" and type(rawget(src, k)) == "function" then fns[#fns + 1] = k end
      end
    end
    out.modules[path] = { type = bt, functions = fns }
    if bt then
      addClass(t)
      if okm and mt then addClass(mt) end
    end
    for _, k in ipairs(sortedKeys(t)) do
      local okv, sub = pcall(rawget, t, k)
      if okv and type(sub) == "table" then walkModule(path .. "." .. k, sub, depth + 1) end
    end
    if okm and type(mt) == "table" then
      for _, k in ipairs(sortedKeys(mt)) do
        local sub = rawget(mt, k)
        if type(sub) == "table" and k:sub(1, 2) ~= "__" then walkModule(path .. "." .. k, sub, depth + 1) end
      end
    end
  end
  for _, k in ipairs(sortedKeys(_G)) do
    local v = rawget(_G, k)
    if type(v) == "table" then pcall(walkModule, k, v, 0) end
  end

  -- instances : objets de la scène (classes d'instance des SimObject) et véhicule joueur
  out.instances = {}
  local function addInstance(o, label)
    local okm, mt = pcall(getmt, o)
    local bt = okm and bindType(mt)
    if bt then
      addClass(mt)
      out.instances[bt] = out.instances[bt] or label
    end
  end
  if scenetree and scenetree.getAllObjects then
    local okn, names = pcall(scenetree.getAllObjects)
    if okn and type(names) == "table" then
      local n = 0
      for _, name in pairs(names) do
        n = n + 1
        if n > 20000 then break end
        local okf, o = pcall(scenetree.findObject, name)
        if okf and o then pcall(addInstance, o, tostring(name)) end
      end
    end
  end
  pcall(function() addInstance(getPlayerVehicle(0), "getPlayerVehicle(0)") end)
  pcall(function() addInstance(obj, "obj") end)
  pcall(function() addInstance(vec3(1, 2, 3), "vec3()") end)
  pcall(function() addInstance(quat(0, 0, 0, 1), "quat()") end)

  local okR, reg = pcall(debug.getregistry)
  if okR and type(reg) == "table" then
    for k, v in pairs(reg) do
      if type(v) == "table" then pcall(addClass, v) end
    end
  end
  for _, k in ipairs(sortedKeys(_G)) do
    local v = rawget(_G, k)
    local ok, mt = pcall(getmt, v)
    if ok then pcall(addClass, mt) end
    if type(v) == "table" then pcall(addClass, v) end
  end
  return out
end

function M.write(vmName, path)
  local data = M.collect(vmName)
  local ok, err = pcall(jsonWriteFile, path, data, true)
  local n = 0
  for _ in pairs(data.classes) do n = n + 1 end
  log(ok and "I" or "E", "tim19Atlas", string.format("releve %s -> %s (%d classes) %s", vmName, path, n, ok and "" or tostring(err)))
  return ok
end

return M
