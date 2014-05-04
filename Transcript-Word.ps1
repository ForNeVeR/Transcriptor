param(
	$Word
)

$ErrorActionPreference = 'Stop'

$uri = "http://www.wordreference.com/definition/$Word"
$result = Invoke-WebRequest $uri

Add-Type -Path .\HtmlAgilityPack.1.4.6\lib\Net45\HtmlAgilityPack.dll

$doc = New-Object HtmlAgilityPack.HtmlDocument
$doc.LoadHtml($result.RawContent)
$transcript = $doc.GetElementById('pronWR').InnerText

if ($transcript -match '/(.*?)/') {
	$Matches[1]
} else {
	throw "Cannot parse response for word '$Word'"
}