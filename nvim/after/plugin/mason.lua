local status_ok, mason = pcall(require, 'mason')

if not status_ok then
    print('Error loading mason plugin.')
end

mason.setup({
    ui = {
        icons = {
            package_installed = "󰗠",
            package_pending = "",
            package_uninstalled = "",
        },
    },
})
