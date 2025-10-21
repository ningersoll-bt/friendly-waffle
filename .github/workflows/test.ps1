if (Test-Path "results.xml") {    
    [xml]$xmlContent = Get-Content "./results.xml"
    foreach ($testCase in $xmlContent.SelectNodes("//testcase")) {
        if ($testCase.HasAttribute("name") -and $testCase.HasAttribute("classname")) {
            if ($testCase.name.EndsWith($testCase.classname)) {
                $testCase.name = $testCase.name.Substring(0, $testCase.name.Length - $testCase.classname.Length).TrimEnd()
            }

            $testCase.name = $testCase.name + ":"
        }
    }
    
    $xmlContent.Save("$PWD/results.xml")
}