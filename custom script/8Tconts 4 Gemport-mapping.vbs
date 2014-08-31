#$language = "VBScript"
#$interface = "1.0"

crt.Screen.Synchronous = True

' This automatically generated script may need to be
' edited in order to work correctly.

Sub Main
	dim Count:Count           = 1 
	dim Count1:Count1         = 1 
	dim index1:index1         = 1
	dim index2:index2         = 1
	dim index3:index3         = 0
	dim vlanid:vlanid         = 100
	dim vlanid1:vlanid1       = 100
	dim ProfileId:ProfileId   = 179
	dim OntId:OntId           = 11
	
	crt.Screen.Send "ont-lineprofile gpon profile-id " & ProfileId & chr(13)
	crt.Screen.Send chr(13)

	for i = 1 to 8		
	crt.Screen.Send "tcont " & index1 & " dba-profile-id 2" & chr(13)
	crt.Screen.Send chr(13)		
	index1 = index1 + 1
	next	
	
	crt.Screen.Send "mapping-mode vlan-priority" & chr(13)
	
	for i = 1 to 4
	crt.Screen.Send "gem add " & Count & " eth tcont 0" & chr(13)
	crt.Screen.Send chr(13)		
	crt.Screen.Send "gem mapping " & Count & " 1 vlan  " & vlanid & " priority  " & index3 & chr(13)
	crt.Screen.Send chr(13)
		
		index3 = index3 +1
		if index3 > 3 then
			index3 = index3 - 4
		End If			
				
	Count = Count + 1
	next	
	vlanid = vlanid + 1

	for i = 1 to 4
	crt.Screen.Send "gem add " & Count & " eth tcont 1" & chr(13)
	crt.Screen.Send chr(13)		
	crt.Screen.Send "gem mapping " & Count & " 1 vlan  " & vlanid & " priority  " & index3 & chr(13)
	crt.Screen.Send chr(13)
		
		index3 = index3 +1
		if index3 > 3 then
			index3 = index3 - 4
		End If			
				
	Count = Count + 1
	next	
	vlanid = vlanid + 1

	for i = 1 to 4
	crt.Screen.Send "gem add " & Count & " eth tcont 2" & chr(13)
	crt.Screen.Send chr(13)		
	crt.Screen.Send "gem mapping " & Count & " 1 vlan  " & vlanid & " priority  " & index3 & chr(13)
	crt.Screen.Send chr(13)
		
		index3 = index3 +1
		if index3 > 3 then
			index3 = index3 - 4
		End If			
				
	Count = Count + 1
	next	
	vlanid = vlanid + 1

	for i = 1 to 4
	crt.Screen.Send "gem add " & Count & " eth tcont 3" & chr(13)
	crt.Screen.Send chr(13)		
	crt.Screen.Send "gem mapping " & Count & " 1 vlan  " & vlanid & " priority  " & index3 & chr(13)
	crt.Screen.Send chr(13)
		
		index3 = index3 +1
		if index3 > 3 then
			index3 = index3 - 4
		End If			
				
	Count = Count + 1
	next	
	vlanid = vlanid + 1

	for i = 1 to 4
	crt.Screen.Send "gem add " & Count & " eth tcont 4" & chr(13)
	crt.Screen.Send chr(13)		
	crt.Screen.Send "gem mapping " & Count & " 1 vlan  " & vlanid & " priority  " & index3 & chr(13)
	crt.Screen.Send chr(13)
		
		index3 = index3 +1
		if index3 > 3 then
			index3 = index3 - 4
		End If			
				
	Count = Count + 1
	next	
	vlanid = vlanid + 1

	for i = 1 to 4
	crt.Screen.Send "gem add " & Count & " eth tcont 5" & chr(13)
	crt.Screen.Send chr(13)		
	crt.Screen.Send "gem mapping " & Count & " 1 vlan  " & vlanid & " priority  " & index3 & chr(13)
	crt.Screen.Send chr(13)
		
		index3 = index3 +1
		if index3 > 3 then
			index3 = index3 - 4
		End If			
				
	Count = Count + 1
	next	
	vlanid = vlanid + 1

	for i = 1 to 4
	crt.Screen.Send "gem add " & Count & " eth tcont 6" & chr(13)
	crt.Screen.Send chr(13)		
	crt.Screen.Send "gem mapping " & Count & " 1 vlan  " & vlanid & " priority  " & index3 & chr(13)
	crt.Screen.Send chr(13)
		
		index3 = index3 +1
		if index3 > 3 then
			index3 = index3 - 4
		End If			
				
	Count = Count + 1
	next	
	vlanid = vlanid + 1

	for i = 1 to 4
	crt.Screen.Send "gem add " & Count & " eth tcont 7" & chr(13)
	crt.Screen.Send chr(13)		
	crt.Screen.Send "gem mapping " & Count & " 1 vlan  " & vlanid & " priority  " & index3 & chr(13)
	crt.Screen.Send chr(13)
		
		index3 = index3 +1
		if index3 > 3 then
			index3 = index3 - 4
		End If			
				
	Count = Count + 1
	next	

	
	crt.Screen.Send "commit" & chr(13)
	crt.Screen.Send "quit" & chr(13)
	
	crt.Screen.Send "ont-srvprofile gpon profile-id " & ProfileId & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "ont-port eth 1" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "port vlan eth 1 100" & chr(13) & chr(13)
	crt.Screen.Send "port vlan eth 1 101" & chr(13) & chr(13)
	crt.Screen.Send "port vlan eth 1 102" & chr(13) & chr(13)
	crt.Screen.Send "port vlan eth 1 103" & chr(13) & chr(13)
	crt.Screen.Send "port vlan eth 1 104" & chr(13) & chr(13)
	crt.Screen.Send "port vlan eth 1 105" & chr(13) & chr(13)
	crt.Screen.Send "port vlan eth 1 106" & chr(13) & chr(13)
	crt.Screen.Send "port vlan eth 1 107" & chr(13) & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "commit" & chr(13)
	crt.Screen.Send "quit" & chr(13)

	crt.Screen.Send "interface gpon 0/6" & chr(13)
	crt.Screen.Send "ont modify 0 " & OntId & " ont-lineprofile-id " & ProfileId & " ont-srvprofile-id " & ProfileId & chr(13)
	crt.Screen.Send "quit" & chr(13)
	
	for i = 1 to 4	
	crt.Screen.Send "service-port vlan " & vlanid1 & " gpon 0/6/0 ont " & OntId & " gemport " & Count1 & " multi-service user-vlan " & vlanid1 & " tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	Count1 = Count1 +1
	next
	vlanid1 = vlanid1 +1
	
	for i = 1 to 4	
	crt.Screen.Send "service-port vlan " & vlanid1 & " gpon 0/6/0 ont " & OntId & " gemport " & Count1 & " multi-service user-vlan " & vlanid1 & " tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	Count1 = Count1 +1
	next
	vlanid1 = vlanid1 +1
	
	for i = 1 to 4	
	crt.Screen.Send "service-port vlan " & vlanid1 & " gpon 0/6/0 ont " & OntId & " gemport " & Count1 & " multi-service user-vlan " & vlanid1 & " tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	Count1 = Count1 +1
	next
	vlanid1 = vlanid1 +1
	
	for i = 1 to 4	
	crt.Screen.Send "service-port vlan " & vlanid1 & " gpon 0/6/0 ont " & OntId & " gemport " & Count1 & " multi-service user-vlan " & vlanid1 & " tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	Count1 = Count1 +1
	next
	vlanid1 = vlanid1 +1
	
	for i = 1 to 4	
	crt.Screen.Send "service-port vlan " & vlanid1 & " gpon 0/6/0 ont " & OntId & " gemport " & Count1 & " multi-service user-vlan " & vlanid1 & " tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	Count1 = Count1 +1
	next
	vlanid1 = vlanid1 +1
	
	for i = 1 to 4	
	crt.Screen.Send "service-port vlan " & vlanid1 & " gpon 0/6/0 ont " & OntId & " gemport " & Count1 & " multi-service user-vlan " & vlanid1 & " tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	Count1 = Count1 +1
	next
	vlanid1 = vlanid1 +1
	
	for i = 1 to 4	
	crt.Screen.Send "service-port vlan " & vlanid1 & " gpon 0/6/0 ont " & OntId & " gemport " & Count1 & " multi-service user-vlan " & vlanid1 & " tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	Count1 = Count1 +1
	next
	vlanid1 = vlanid1 +1
	
	for i = 1 to 4	
	crt.Screen.Send "service-port vlan " & vlanid1 & " gpon 0/6/0 ont " & OntId & " gemport " & Count1 & " multi-service user-vlan " & vlanid1 & " tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	Count1 = Count1 +1
	next

	

	
End Sub
