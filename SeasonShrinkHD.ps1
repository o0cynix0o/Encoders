# Retrieve the list of files passed as command-line arguments
$FilesToBeProcessed = $args

#Varaibles for the script, these need to be set for the environment being used.
$PathToHandBreakCLI = "/opt/homebrew/Cellar/handbrake/1.7.3/bin/HandBrakeCLI"
$PathToHBPreset = "/Users/danielwatson/Scripts/Encoder/Presets/SuperShrinkHD.json"
$PathToOutput = "/Users/danielwatson/Scripts/Reencoded"

#Start of the loop for processing.
foreach ($file in $FilesToBeProcessed) {
    $inputFile = Join-Path -Path $PathToVideo -ChildPath $file
    $outputFile = Join-Path -Path $PathToOutput -ChildPath $file
    $handBrakeCommand = "$PathToHandBreakCLI -i `"$inputFile`" -o `"$outputFile`" --preset-import-file `"$PathToHBPreset`" --preset=`"SuperShrinkHD`""

    # Execute HandBrakeCLI command
    Invoke-Expression $handBrakeCommand
}

Write-Host "All Encodes have been completed."
exit
