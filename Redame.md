Post-Processing Script for TV Episodes Conversion to HEVC

Welcome to the Post-Processing Script repository! This repository contains a batch script designed to convert an entire season’s worth of TV episodes into HEVC (High-Efficiency Video Coding) format. This script is written in old-school batch format and aims to simplify the conversion process for users.

Features

	•	Batch Processing: Convert an entire season of TV episodes with a single command.
	•	HEVC Encoding: Utilizes ffmpeg to encode videos to HEVC format, providing efficient compression and high-quality video.
	•	Automated Workflow: Automatically detects and processes all episodes in the specified directory.
	•	Customizable Settings: Easily modify encoding settings to suit your preferences.

Requirements

	•	Operating System: Windows
	•	Dependencies:
	•	ffmpeg: Ensure ffmpeg is installed and accessible via the command line.

Installation

	1.	Download and Install ffmpeg:
	•	Download ffmpeg from the official website.
	•	Extract the downloaded archive.
	•	Add the path of the ffmpeg executable to your system’s PATH environment variable.
	2.	Clone the Repository:

git clone https://github.com/yourusername/tv-episodes-hevc-converter.git
cd tv-episodes-hevc-converter



Usage

	1.	Prepare Your Episodes:
	•	Place all episodes of the season you want to convert into a single directory.
	2.	Run the Script:
	•	Open a Command Prompt window.
	•	Navigate to the directory containing the batch script.
	•	Execute the script with the following command:

convert_to_hevc.bat "path\to\your\episodes\directory"


	3.	Wait for the Conversion:
	•	The script will process each episode in the directory, converting them to HEVC format.
	•	Converted files will be saved in the same directory with an _hevc suffix.

Script Details

convert_to_hevc.bat

@echo off
setlocal

REM Set the path to ffmpeg executable
set "ffmpeg_path=C:\path\to\ffmpeg\bin\ffmpeg.exe"

REM Check if the input directory is provided
if "%~1"=="" (
    echo Usage: convert_to_hevc.bat "path\to\your\episodes\directory"
    exit /b 1
)

REM Set the input directory
set "input_dir=%~1"

REM Loop through all video files in the input directory
for %%f in ("%input_dir%\*.mp4") do (
    echo Processing "%%f"...
    set "output_file=%%~dpnf_hevc.mp4"
    "%ffmpeg_path%" -i "%%f" -c:v libx265 -crf 28 -c:a copy "%output_file%"
)

echo Conversion complete!
endlocal
pause

Customization

	•	Video Quality: Adjust the -crf value (e.g., -crf 28) to change the output quality. Lower values result in higher quality and larger file sizes.
	•	Audio Codec: Modify -c:a copy to change the audio codec if needed.

Contributing

Contributions are welcome! If you have suggestions for improvements or encounter any issues, please open an issue or submit a pull request.

License

This project is licensed under the MIT License. See the LICENSE file for more details.

Acknowledgements

	•	ffmpeg for providing the powerful video processing tool used in this script.

Thank you for using this post-processing script! Happy converting!
