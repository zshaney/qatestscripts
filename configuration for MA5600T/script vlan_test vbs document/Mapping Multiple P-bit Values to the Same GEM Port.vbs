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
	
'Configure DUT on the OLT as the following: Create a gem port (index=1,index=2) both mapping to TCONT1 which the max bandwith is set as 1G.
'Create a gem mapping rule that mapping traffic with different tag (pbit1=1,pbit2=2) to gem port1 	
'Create a ont-lineprofile 
	crt.Screen.Send "ont-lineprofile gpon profile-id " & ProfileId & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "tcont 1 dba-profile-id 2" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem add 1 eth tcont 1" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem add 2 eth tcont 1" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "mapping-mode priority" & chr(13)	
	crt.Screen.Send "gem mapping 1 1 priority 1" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem mapping 1 2 priority 2" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem mapping 2 1 priority 3" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem mapping 2 2 priority 4" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "commit" & chr(13)
	crt.Screen.Send "quit" & chr(13)
	
'Create a ont-srvprofile	
	crt.Screen.Send "ont-srvprofile gpon profile-id " & ProfileId & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "ont-port eth 1" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "port vlan eth 1 100" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "port vlan eth 1 200" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "commit" & chr(13)
	crt.Screen.Send "quit" & chr(13)
	
'Add ont and bind with right line-profile and service-profile	
	crt.Screen.Send "interface gpon 0/6" & chr(13)
	crt.Screen.Send "ont add 0 " & OntId & " sn-auth " & OntSn & " omci" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "ont modify 0 " & OntId & " ont-lineprofile-id " & ProfileId & " ont-srvprofile-id " & ProfileId & chr(13)
	crt.Screen.Send "quit" & chr(13)

'Create another gem mapping rule that mapping traffic with different tag (pbit3=3,pbit4=4) to gem port2 Configure traffic with different user-vlan (vid1=100,vid2=200) transparent to them corresponding svlan (vid1=100,vid2=200) from GEM port1 and GEM port2 expectively.
	crt.Screen.Send "service-port vlan 100 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 100 tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "service-port vlan 200 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 200 tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	
'Query information		
	crt.Screen.Send "display service-port port 0/6/0" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "display port vlan 0/19/" & UpstrPort & chr(13)
	crt.Screen.Send "display ont info 0 6 0 " & OntId & chr(13)
End Sub
