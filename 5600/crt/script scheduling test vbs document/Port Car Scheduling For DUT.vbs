﻿#$language = "VBScript"
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
	crt.Screen.Send "vlan 200 smart" & chr(13)
	crt.Screen.Send "vlan 300 smart" & chr(13)
	crt.Screen.Send "port vlan 100 0/19 " & UpstrPort & chr(13)
	crt.Screen.Send "port vlan 200 0/19 " & UpstrPort & chr(13)
	crt.Screen.Send "port vlan 300 0/19 " & UpstrPort & chr(13)
	
'Remove the old configuration	
	crt.Screen.Send "undo service-port port 0/6/0 ont " & OntId & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "y" & chr(13)
	crt.Screen.Send "interface gpon 0/6" & chr(13)
	crt.Screen.Send "ont delete 0 " & OntId & chr(13)
	crt.Screen.Send "quit" & chr(13)
	crt.Screen.Send "undo ont-lineprofile gpon profile-id " & ProfileId & chr(13)
	crt.Screen.Send "undo ont-srvprofile gpon profile-id " & ProfileId & chr(13)
	
	crt.Screen.Send "traffic table ip index 11 cir 10240 cbs 10240 pir 20480 pbs 20480 color-policy cos priority 1 priority-policy tag-In-package" & chr(13)
	crt.Screen.Send "traffic table ip index 12 cir 20480 cbs 20480 pir 40960 pbs 40960 color-policy cos priority 1 priority-policy tag-In-package" & chr(13)
		
'Create a gem port (index=1) mapping to TCONT1 which the max bandwith is set as 1G. 
'Create a gem mapping rule that mapping traffic with particular tag (vid=1000) to gem port1. 
'Create a ont-lineprofile
	crt.Screen.Send "ont-lineprofile gpon profile-id " & ProfileId & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "qos-mode priority-queue" & chr(13)
	crt.Screen.Send "tcont 1 dba-profile-id 10" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem add 1 eth tcont 1" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "mapping-mode vlan" & chr(13)
	crt.Screen.Send "gem mapping 1 1 vlan 100" & chr(13)
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
	crt.Screen.Send "port car eth 1 inbound 11 outbound 12" & chr(13)
	crt.Screen.Send "commit" & chr(13)
	crt.Screen.Send "quit" & chr(13)
	
'Add ont and bind with right line-profile and service-profile
	crt.Screen.Send "interface gpon 0/6" & chr(13)
	crt.Screen.Send "ont add 0 " & OntId & " sn-auth " & OntSn & " omci" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "ont modify 0 " & OntId & " ont-lineprofile-id " & ProfileId & " ont-srvprofile-id " & ProfileId & chr(13)
	crt.Screen.Send "ont port attribute 0 " & OntId & " eth 1 speed 1000 duplex full" & chr(13)
	crt.Screen.Send "ont port attribute 0 " & OntId & " eth 1 flow-control on" & chr(13)
	crt.Screen.Send "quit" & chr(13)
	
'Configure traffic with particular user-vlan (vid=1000) transparent to it corresponding svlan (vid=1000) from GEM port1.	
	crt.Screen.Send "service-port 8001 vlan 100 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 100" & chr(13)
	crt.Screen.Send chr(13)
	
'Query information	
	crt.Screen.Send "display service-port port 0/6/0" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "display port vlan 0/19/" & UpstrPort & chr(13)
	crt.Screen.Send "display ont info 0 6 0 " & OntId & chr(13)
End Sub
