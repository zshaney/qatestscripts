#$language = "VBScript"
#$interface = "1.0"

crt.Screen.Synchronous = True

' This automatically generated script may need to be
' edited in order to work correctly.

Sub Main
'Define variables OntSn = "16*x" UpstrPort = 0 or 1
    dim OntId, ProfileId, OntSn, UpstrPort
	OntId     = 2
	ProfileId = 1153
	OntSn     = "534D43548E00004B"
	UpstrPort = 0
	
'OLT VLAN configuration		
	crt.Screen.Send "vlan 100 smart" & chr(13)
    crt.Screen.Send "vlan 101 smart" & chr(13)
	crt.Screen.Send "vlan 102 smart" & chr(13)
	crt.Screen.Send "vlan 103 smart" & chr(13)
	crt.Screen.Send "vlan 104 smart" & chr(13)
	crt.Screen.Send "vlan 105 smart" & chr(13)
	crt.Screen.Send "vlan 106 smart" & chr(13)
	crt.Screen.Send "vlan 107 smart" & chr(13)
	crt.Screen.Send "port vlan 100 0/19 " & UpstrPort & chr(13)
	crt.Screen.Send "port vlan 101 0/19 " & UpstrPort & chr(13)
	crt.Screen.Send "port vlan 102 0/19 " & UpstrPort & chr(13)
	crt.Screen.Send "port vlan 103 0/19 " & UpstrPort & chr(13)
	crt.Screen.Send "port vlan 104 0/19 " & UpstrPort & chr(13)
	crt.Screen.Send "port vlan 105 0/19 " & UpstrPort & chr(13)
	crt.Screen.Send "port vlan 106 0/19 " & UpstrPort & chr(13)
	crt.Screen.Send "port vlan 107 0/19 " & UpstrPort & chr(13)
	
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
'Create a gem mapping rule that mapping traffic with different tag (vid=100-107) to gem port1 

'Create a ont-lineprofile
	crt.Screen.Send "ont-lineprofile gpon profile-id " & ProfileId & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "tcont 1 dba-profile-id 2" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem add 1 eth tcont 1" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "mapping-mode vlan" & chr(13)	
	crt.Screen.Send "gem mapping 1 0 vlan 100" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem mapping 1 1 vlan 101" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem mapping 1 2 vlan 102" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem mapping 1 3 vlan 103" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem mapping 1 4 vlan 104" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem mapping 1 5 vlan 105" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem mapping 1 6 vlan 106" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem mapping 1 7 vlan 107" & chr(13)
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
	crt.Screen.Send "port vlan eth 1 101" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "port vlan eth 1 102" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "port vlan eth 1 103" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "port vlan eth 1 104" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "port vlan eth 1 105" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "port vlan eth 1 106" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "port vlan eth 1 107" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "commit" & chr(13)
	crt.Screen.Send "quit" & chr(13)
	
'Add ont and bind with right line-profile and service-profile	
	crt.Screen.Send "interface gpon 0/6" & chr(13)
	crt.Screen.Send "ont add 0 " & OntId & " sn-auth " & OntSn & " omci" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "ont modify 0 " & OntId & " ont-lineprofile-id " & ProfileId & " ont-srvprofile-id " & ProfileId & chr(13)
	crt.Screen.Send "quit" & chr(13)

'Configure traffic with different user-vlan (vid=100-107) transparent to them corresponding svlan (vid=100-107) expectively all from GEM port1.
	crt.Screen.Send "service-port vlan 100 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 100 tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "service-port vlan 101 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 101 tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "service-port vlan 102 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 102 tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "service-port vlan 103 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 103 tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "service-port vlan 104 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 104 tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "service-port vlan 105 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 105 tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "service-port vlan 106 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 106 tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "service-port vlan 107 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 107 tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	
'Query information	
	crt.Screen.Send "display service-port port 0/6/0" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "display port vlan 0/19/" & UpstrPort & chr(13)
	crt.Screen.Send "display ont info 0 6 0 " & OntId & chr(13)
End Sub
