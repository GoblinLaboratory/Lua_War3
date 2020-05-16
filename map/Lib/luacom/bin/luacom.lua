if not luacom then
  local init, err1, err2 = loadlib("luacom-lua5-1.2.dll","luacom_openlib")
  assert (init, (err1 or '')..(err2 or ''))
  init()
end

return nil
