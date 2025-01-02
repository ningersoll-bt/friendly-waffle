param (
    [string]$DbConnectionString,
    [string]$AcceptedDomain = "example.com"
)

Invoke-Sqlcmd -ConnectionString "$DbConnectionString" -Query "INSERT INTO [AcceptedDomain](Id, Domain, Created) VALUES (NEWID(), '$AcceptedDomain', GETDATE())"