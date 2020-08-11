################################################################################
#
# PowerShell Profile
#


################################################################################
#
# Init
#

function prompt {
    # TODO: Different administrator prompt

    # (: [17:00] Documents\PowerShell
    # >

    if ($?) { # last exit was good
        Write-Host -NoNewline -ForegroundColor Yellow "`n(: "
    } else { # last exit was bad
        Write-Host -Nonewline -ForegroundColor Red "`n:( "
    }

    Write-Host "[$(Get-Date -UFormat '{0:HH}:{0:mm}')] $(($pwd -Split '\\')[-2])\$(($pwd -Split '\\')[-1])"
    "$('>' * ($nestedPromptlevel + 2)) "
}

Set-Location "C:\Users\$($env:username)\Documents\git"
Write-Host "`n$("=" * $Host.RawUI.WindowSize.Width)"
