RELOAD = function(...)
  return require('plenary.reload').reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

INS = function(tbl)
  print(vim.inspect(tbl))
end
