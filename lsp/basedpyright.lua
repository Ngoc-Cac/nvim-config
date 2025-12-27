-- type checking config
local diagnostic_overrides = {
    reportUnusedClass = "hint",
    reportUnusedFunction = "hint",
    reportUnusedVariable = "hint",

    reportGeneralTypeIssues = false,
    reportPropertyTypeMismatch = false,
    reportFunctionMemberAccess = "hint",
    reportUnusedImport = "hint",

    reportArgumentType = false,
    reportAssertTypeFailure = false,
    reportAttributeAccessIssue = "hint",
    reportInvalidTypeArguments = false,
    reportImplicitOverride = false,

    reportUnknownParameterType = false,
    reportUnknownArgumentType = false,
    reportUnknownLambdaType = false,
    reportUnknownVariableType = false,
    reportUnknownMemberType = false,

    reportMissingParameterType = false,
    reportMissingTypeArgument = false,

    -- basedpyright exclusive
    reportAny = false,
    reportExplicitAny = false,
    reportUnusedParameter = "hint",
    reportUnannotatedClassAttribute = false,
} 
return {
    settings = {
        basedpyright = {
            python = { 
                venvPath = ".",
                venv = ".venv"
            },
            analysis = {
                diagnosticMode = "openFilesOnly",
                autoSearchPaths = true,
                inlayHints = {
                    callArgumentNames = true,
                    variableTypes = false,
                    parameterTypes = false
                },

                diagnosticSeverityOverrides = diagnostic_overrides
            }
        }
    }
}
