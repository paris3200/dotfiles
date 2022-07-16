local status_ok, ledger = pcall(require, "ledger")
if not status_ok then return
end


local opts = {
  ledger_maxwidth = 80,
  ledger_align_at = 60,
  ledger_fillstring = '    -',
}

--ledger.setup(setup)
--ledger.register(mappings, opts)
ledger.register(opts)
