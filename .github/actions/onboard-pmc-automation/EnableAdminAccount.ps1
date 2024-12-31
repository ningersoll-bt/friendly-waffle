param (
    [string]$DbConnectionString = ""
)

Invoke-Sqlcmd -ConnectionString $DbConnectionString -Query "UPDATE [User] SET [Disabled] = 0 WHERE EmailAddress LIKE '%Admin@btpmclouddeploy.com'"