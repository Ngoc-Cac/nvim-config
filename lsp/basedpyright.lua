return {
    settings = {
        basedpyright = {
            venvPath = ".",
            analysis = {
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "off",
                autoSearchPaths = true,
                -- configFilePath = "pyrightconfig.json",
                inlayHints = {
                    callArgumentNames = true,
                    variableTypes = false,
                    parameterTypes = false
                }
            }
        }
    }
}
