param (
	$Phrase
)

$ErrorActionPreference = 'Stop'

$transcripts = $Phrase.Split(' ') | % { ./Transcript-Word.ps1 $_ }
$transcript = [string]::Join(' ', $transcripts)
"[$transcript]"
	