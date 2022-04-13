strUrl = WScript.Arguments.Item(0) 
strFile = WScript.Arguments.Item(1) 
Dim DataBin 
Dim HTTPGET 
Set HTTPGET = CreateObject("Microsoft.XMLHTTP") 
HTTPGET.Open "GET", strURL, False 
HTTPGET.Send  DataBin = HTTPGET.ResponseBody 
Const adTypeBinary=1 
Const adSaveCreateOverWrite=2 
Dim wget1 
Set wget1 = CreateObject("ADODB.Stream") 
wget1.Type = adTypeBinary 
wget1.Open 
wget1.Write DataBin 
wget1.SaveToFile strFile, adSaveCreateOverWrite 
