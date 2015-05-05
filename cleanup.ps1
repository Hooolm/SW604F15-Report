# GET LIST OF FILES:
$files = get-childitem ./ -include *.aux, *.auxlock, *.bbl, *.bcf, *.blg, *.gnuplot, *.loa, *.lof, *.log, *.out, *.run.xml, *.toc, *blx.bib, *.synctex -recurse

# IF THERE ARE FILES:
if ($files.count -gt 0) 
{
    "The following " + $files.count + " files have been found:"
    write-output $files | select-object Name, DirectoryName | format-table -auto
    
    # CREATE A QUESTION:
    $title = "DELETE FILES"
    $message = "Do you want to delete these files?"
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Deletes all the above files."
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "Retains all the above files."
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
    
    $result = $host.ui.PromptForChoice($title, $message, $options, 0) 
    if ($result -eq 0) # IF YES
    {
        $files | foreach ($_) {remove-item $_.fullname}; "Deleted. Press any key to exit."
    }
    else # IF NO
    {
        "Nothing has happened. Press any key to exit."
    }
}
else
{
    "There are no files to be deleted. Press any key to exit."
}

# PRESS ANY KEY:
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")