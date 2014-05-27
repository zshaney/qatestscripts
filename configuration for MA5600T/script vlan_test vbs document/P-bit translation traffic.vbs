#$language = "VBScript"
#$interface = "1.0"

crt.Screen.Synchronous = True

' This automatically generated script may need to be
' edited in order to work correctly.

Sub Main
'Define variables OntSn = "16*x" UpstrPort = 0 or 1
    dim OntId, ProfileId, OntSn, UpstrPort
	OntId     = 50
	ProfileId = 1011
	OntSn     = "4C51444596000066"
	UpstrPort = 0

'OLT VLAN configuration	
	crt.Screen.Send "vlan 100 smart" & chr(13)
	crt.Screen.Send "vlan 200 smart" & chr(13)
	crt.Screen.Send "port vlan 100 0/19 " & UpstrPort & chr(13)
	crt.Screen.Send "port vlan 200 0/19 " & UpstrPort & chr(13)
	
'Remove the old configuration	
	crt.Screen.Send "undo service-port port 0/6/0 ont " & OntId & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "y" & chr(13)
	crt.Screen.Send "interface gpon 0/6" & chr(13)
	crt.Screen.Send "ont delete 0 " & OntId & chr(13)
	crt.Screen.Send "quit" & chr(13)
	crt.Screen.Send "undo ont-lineprofile gpon profile-id " & ProfileId & chr(13)
	crt.Screen.Send "undo ont-srvprofile gpon profile-id " & ProfileId & chr(13)
				
'Create a gem port (index=1) both mapping to TCONT1 which the max bandwith is set as 1G. 
'Create a gem mapping rule that mapping traffic with particular tag (vid=100) to gem port1 
'Create a ont-lineprofile
	crt.Screen.Send "ont-lineprofile gpon profile-id " & ProfileId & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "tcont 1 dba-profile-id 2" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem add 1 eth tcont 1" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem add 2 eth tcont 1" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "mapping-mode vlan-priority" & chr(13)	
	crt.Screen.Send "gem mapping 1 1 vlan 100 priority 1" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem mapping 2 1 vlan 200 priority 3" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "commit" & chr(13)
	crt.Screen.Send "quit" & chr(13)

'Create a gem mapping rule that mapping traffic with particular tag (vid=100&pbit=1) to gem port1. 
'Create another gem mapping rule that mapping traffic with particular tag(vid=200&pbit=3) to gem port2.	
'Create a ont-srvprofile	
	crt.Screen.Send "ont-srvprofile gpon profile-id " & ProfileId & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "ont-port eth 1" & chr(13)
	crt.Screen.Send chr(13)	
	crt.Screen.Send "port vlan eth 1 translation 100 1 user-vlan 100 0" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "port vlan eth 1 translation 200 3 user-vlan 200 0" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "commit" & chr(13)
	crt.Screen.Send "quit" & chr(13)
	
'Add ont and bind with right line-profile and service-profile
	crt.Screen.Send "interface gpon 0/6" & chr(13)
	crt.Screen.Send "ont add 0 " & OntId & " sn-auth " & OntSn & " omci" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "ont modify 0 " & OntId & " ont-lineprofile-id " & ProfileId & " ont-srvprofile-id " & ProfileId & chr(13)
	crt.Screen.Send "quit" & chr(13)

'Create two cvlan(vid1=100&pbit1=0,vid2=200&pbit2=0) to translate to correspongding user-vlan(vid1=100&pbit1=1,vid2=200&pbit2=3) expectively on the DUT port. 
	crt.Screen.Send "service-port vlan 100 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 100 tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "service-port vlan 200 gpon 0/6/0 ont " & OntId & " gemport 2 multi-service user-vlan 200 tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	
'Query information
	crt.Screen.Send "display service-port port 0/6/0" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "display port vlan 0/19/" & UpstrPort & chr(13)
	crt.Screen.Send "display ont info 0 6 0 " & OntId & chr(13)
End Sub
