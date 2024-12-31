param (
    [string]$DbConnectionString
)

Invoke-Sqlcmd -ConnectionString $DbConnectionString -Query "UPDATE [SystemParameter] SET [ParameterValue] = 1 WHERE [ParameterName] = 'APIKeyClientEnabled'"