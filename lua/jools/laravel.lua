local status, laravel = pcall(require, "laravel")
if not status then
  return
end

laravel.setup({})
