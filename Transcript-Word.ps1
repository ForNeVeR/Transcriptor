param(
	$Word
)

$ErrorActionPreference = 'Stop'

$Word = $Word.ToLower()
$uri = "http://www.oxforddictionaries.com/definition/english/$Word"
$result = Invoke-WebRequest $uri

Add-Type -Path .\HtmlAgilityPack.1.4.6\lib\Net45\HtmlAgilityPack.dll

$doc = New-Object HtmlAgilityPack.HtmlDocument
$doc.LoadHtml($result.RawContent)
$container = $doc.DocumentNode.SelectNodes("//div[@class='headpron']")[0]
$transcript = $container.InnerText

if ($transcript -match '/(\S*)') {
	$Matches[1]
} else {
	throw "Cannot parse response for word '$Word'"
}