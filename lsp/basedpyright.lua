-- type checking config
local diagnostic_overrides = {
    reportUnusedCallResult = false,

    reportFunctionMemberAccess = "hint",
    reportAttributeAccessIssue = "hint",
    reportPrivateImportUsage = false,

    reportGeneralTypeIssues = false,

    reportAssignmentType = false,
    reportReturnType = false,
    reportAssertTypeFailure = false,
    reportInvalidTypeArguments = false,
    reportInvalidTypeForm = "hint",
    reportCallIssue = false,
    reportConstantRedefinition = "hint",

    reportOptionalSubscript = false,
    reportOptionalMemberAccess = false,
    reportOptionalCall = false,

    reportPossiblyUnboundVariable = "hint",
}
return { settings = { basedpyright = {
    python = {
        venvPath = ".",
        venv = ".venv"
    },
    analysis = {
        typeCheckingMode = "basic",
        diagnosticMode = "openFilesOnly",
        autoSearchPaths = true,
        autoImportCompletions = false,
        inlayHints = {
            callArgumentNames = true,
            variableTypes = false,
            parameterTypes = false
        },

        diagnosticSeverityOverrides = diagnostic_overrides
    }
}}}
