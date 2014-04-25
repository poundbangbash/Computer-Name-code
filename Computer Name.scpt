try
	set cpuName to (do shell script "scutil --get ComputerName")
	set ipAddress to do shell script "ifconfig | grep -B 3 active | grep -w \"inet\" | awk {'print $2'}"
	set utunAddress to do shell script "ifconfig | grep -A 1 \"utun\" | grep -w \"inet\" | awk {'print $2'}"
	set myAddresses to ipAddress & "
" & utunAddress
	set theResult to display dialog "Computer Name: 
" & cpuName & "
	
IP Address: 
" & myAddresses buttons {"Copy IP to Clipboard", "Copy Name to Clipboard", "OK"} default button 3
	if button returned of theResult is "Copy Name to Clipboard" then
		set the clipboard to cpuName
	else if button returned of theResult is "Copy IP to Clipboard" then
		set the clipboard to ipAddress
	end if
	
end try