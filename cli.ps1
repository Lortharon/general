function Show-Menu {
    Clear-Host
    Write-Host "CLI App" -ForegroundColor Green
    Write-Host "1. Option 1"
    Write-Host "2. Option 2"
    Write-Host "3. Option 3"
    Write-Host "Q. Quit"
}

function Option1 {
    Clear-Host
    Write-Host "You selected Option 1" -ForegroundColor Yellow
    # Add your code for Option 1 here
    Read-Host "Press Enter to continue"
}

function Option2 {
    Clear-Host
    Write-Host "You selected Option 2" -ForegroundColor Yellow
    # Add your code for Option 2 here
    Read-Host "Press Enter to continue"
}

function Option3 {
    Clear-Host
    Write-Host "You selected Option 3" -ForegroundColor Yellow
    # Add your code for Option 3 here
    Read-Host "Press Enter to continue"
}

do {
    Show-Menu
    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        '1' { Option1 }
        '2' { Option2 }
        '3' { Option3 }
    }
} until ($choice -eq 'q' -or $choice -eq 'Q')
