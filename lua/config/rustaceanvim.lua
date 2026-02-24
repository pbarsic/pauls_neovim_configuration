local host = "127.0.0.1"
local port = 27631

local function lspmux_available()
  local chan = vim.fn.sockconnect("tcp", host .. ":" .. port, { rpc = false })
  if chan <= 0 then
    return false
  end
  vim.fn.chanclose(chan)
  return true
end

local cmd = { "nc", host, tostring(port) }

if lspmux_available() and vim.fn.executable(cmd[1]) == 1 then
  vim.g.rustaceanvim = {
    server = {
      cmd = cmd,
      init_options = {
        lspMux = {
            version = "1",
            method = "connect",
            server = "rust-analyzer",
        },
      },
    },
  }
end

