-- type checking config
local diagnostic_overrides = {
    reportUnusedClass = "hint",
    reportUnusedFunction = "hint",
    reportUnusedVariable = "hint",
    reportUnusedImport = "hint",
    reportUnusedCallResult = false,

    reportFunctionMemberAccess = "hint",
    reportAttributeAccessIssue = "hint",
    reportPrivateUsage = false,
    reportPrivateImportUsage = false,

    reportGeneralTypeIssues = false,
    reportPropertyTypeMismatch = false,

    reportArgumentType = false,
    reportReturnType = false,
    reportAssertTypeFailure = false,
    reportInvalidTypeArguments = false,
    reportImplicitOverride = false,
    reportCallIssue = false,

    reportOptionalSubscript = false,
    reportOptionalMemberAccess = false,
    reportOptionalCall = false,

    reportPossiblyUnboundVariable = "hint",

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
    reportPrivateLocalImportUsage = false,
    reportMissingTypeStubs = false,
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
