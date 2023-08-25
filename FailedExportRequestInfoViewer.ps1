# Cengiz YILMAZ
# Microsoft MVP -MCT
# cengizyilmaz.net

Get all failed MailboxExportRequests
$FailedRequests = Get-MailboxExportRequest -Status Failed

# Loop through each failed request and display information
foreach ($Request in $FailedRequests) {
    try {
        # Get the mailbox associated with the request
        $Mailbox = Get-Mailbox -Identity $Request.Mailbox
        
        # Display information about the failed request
        Write-Host "Mailbox: $($Mailbox.PrimarySmtpAddress)"
        Write-Host "Database: $($Mailbox.Database)"
        Write-Host "Server: $($Mailbox.ServerName)"
        Write-Host "---------------------------------------"
    } catch {
        Write-Host "Error retrieving information for $($Request.Mailbox): $_.Exception.Message"
    }
}