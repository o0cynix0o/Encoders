param (
    [string]$sourceDir = $args[0]
)

if (-not $sourceDir) {
    Write-Host "Please drag and drop a folder onto this script."
    exit
}

# Specify the video file extensions
$videoExtensions = @('*.mp4', '*.mkv', '*.avi', '*.mov', '*.wmv', '*.iso', '*.webm')

# Initialize variables to store information about the largest video file
$largestVideoFile = $null
$largestSize = 0

# Loop through each video file extension
foreach ($ext in $videoExtensions) {
    # Get all video files with the current extension in the source directory
    $videoFiles = Get-ChildItem -Path $sourceDir -Filter $ext | Where-Object { $_.Length -gt 0 }
    
    # Loop through each video file to find the largest one
    foreach ($file in $videoFiles) {
        $fileSize = $file.Length
        if ($fileSize -gt $largestSize) {
            $largestSize = $fileSize
            $largestVideoFile = $file.FullName
        }
    }
}

# Output the name of the largest video file
if (-not $largestVideoFile) {
    Write-Host "No video files found in the specified directory."
    exit
}

# Convert the largest video file to MKV format using HandBrakeCLI
$outputDir = "G:\Downloads\Movies"
$outputFileName = $largestVideoFile | Split-Path -Leaf
$outputFilePath = "$outputDir\$($outputFileName.Replace('.', '_')).mkv"
Write-Host "Processing video file: $largestVideoFile"

# Start HandBrakeCLI process and display output on the screen
Start-Process -FilePath "HandBrakeCLI" -ArgumentList "-i `"$largestVideoFile`" -o `"$outputFilePath`" --preset-import-gui --verbose=1" -NoNewWindow -Wait

#Ending Script
Write-Host "Conversion complete."
exit