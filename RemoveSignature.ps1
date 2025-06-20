   function Remove-Signature {
       param(
           [string]$signedFile = "path\to\your\script.ps1"
       )
       $filecontent = Get-Content $signedFile
       $signatureLineNumber = ($filecontent | Select-String "SIG # Begin signature block").LineNumber
       if ($signatureLineNumber) {
           $filecontent[0..($signatureLineNumber - 2)] | Set-Content $signedFile
       } else {
           Write-Host "No signature found in the script."
       }
   }