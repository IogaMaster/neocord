local utils = {}

function utils.get_nvim_distro()
    if utils.module_exists("lazyvim") then
        return "LazyVim"
    elseif utils.module_exists("astronvim") then
        return "AstroNvim"
    elseif utils.module_exists("nvchad") then
        return "NvChad"
    elseif utils.module_exists("lvim") then
        return "LunarVim"
    elseif utils.module_exists("vapour") then
        return "VapourNvim"
    else
        return "Neovim"
    end
end

function utils.module_exists(module)
    local present, presence = pcall(require, module)

    if not present then
        return false
    end

    return true
end

return utils
