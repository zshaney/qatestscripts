#$language = "VBScript"
#$interface = "1.0"

crt.Screen.Synchronous = True

' This automatically generated script may need to be
' edited in order to work correctly.

Sub Main
'Define variables OntSn = "16*x" UpstrPort = 0 or 1
    dim OntId, ProfileId, OntSn, UpstrPort, Srvport, Srvport1, Srvport2
	OntId     = 2
	ProfileId = 1053
	OntSn     = "534D43548E00004B"
	UpstrPort = 0
	Srvport   = 8010
	
	Srvport1 = Srvport + 1
	Srvport2 = Srvport + 2
	
'OLT VLAN configuration		
	crt.Screen.Send "vlan 10smart" & chr(13)
	crt.Screen.Send "port vlan 10 0/19 " & UpstrPort & chr(13)
	
'Remove the old configuration
    crt.Screen.Send "btv" & chr(13)
	crt.Screen.Send "igmp user delete service-port " & Srvport & chr(13)
	crt.Screen.Send "y" & chr(13)
	crt.Screen.Send "quit" & chr(13)	
	crt.Screen.Send "undo service-port port 0/6/0 ont " & OntId & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "y" & chr(13)
	crt.Screen.Send "interface gpon 0/6" & chr(13)
	crt.Screen.Send "ont delete 0 " & OntId & chr(13)
	crt.Screen.Send "quit" & chr(13)
	crt.Screen.Send "undo ont-lineprofile gpon profile-id " & ProfileId & chr(13)
	crt.Screen.Send "undo ont-srvprofile gpon profile-id " & ProfileId & chr(13)
	
	
'Create a ont-lineprofile
	crt.Screen.Send "ont-lineprofile gpon profile-id " & ProfileId & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "tcont 1 dba-profile-id 2" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem add 1 eth tcont 1" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "mapping-mode vlan" & chr(13)
	crt.Screen.Send "gem mapping 1 1 vlan 100" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem mapping 1 2 vlan 200" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem mapping 1 3 vlan 300" & chr(13)
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
	crt.Screen.Send "port vlan eth 1 300" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "multicast-forward tag translation 10" & chr(13)
	crt.Screen.Send "commit" & chr(13)
	crt.Screen.Send "quit" & chr(13)
	
'Add ont and bind with right line-profile and service-profile
	crt.Screen.Send "interface gpon 0/6" & chr(13)
	crt.Screen.Send "ont add 0 " & OntId & " sn-auth " & OntSn & " omci" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "ont modify 0 " & OntId & " ont-lineprofile-id " & ProfileId & " ont-srvprofile-id " & ProfileId & chr(13)
	crt.Screen.Send "quit" & chr(13)
	
'Create a igmp program(group ip:224.4.4.4) in multicast-vlan 1000 Then add corresponding igmp user and igmp multicast-vlan member on the OLT. 	
	crt.Screen.Send "service-port " & Srvport & " vlan 1000 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 100" & chr(13)
	crt.Screen.Send chr(13)	 
	crt.Screen.Send "service-port " & Srvport1 & " vlan 1000 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 200" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "service-port " & Srvport2 & " vlan 1000 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 300" & chr(13)
	crt.Screen.Send chr(13)
	
'native vlan	
	crt.Screen.Send "interface giu  0/19" & chr(13)
	crt.Screen.Send "native-vlan  0  vlan  1000" & chr(13)
	crt.Screen.Send "quit" & chr(13)
	
'mvlan
    crt.Screen.Send "multicast-vlan 1000" & chr(13)
	crt.Screen.Send "igmp uplink-port 0/19/" & UpstrPort & chr(13)
	crt.Screen.Send "igmp mode proxy" & chr(13)
	crt.Screen.Send "y" & chr(13)
	
'btv	
	crt.Screen.Send "btv" & chr(13)
    crt.Screen.Send "igmp uplink-port-mode default" & chr(13)
	crt.Screen.Send "y" & chr(13)	
	
'add profile
    crt.Screen.Send "multicast-vlan 1000" & chr(13)
	crt.Screen.Send "igmp program add ip 224.4.4.4" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "igmp program add ip 224.5.5.5" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "igmp program add ip 224.6.6.6" & chr(13)
	crt.Screen.Send chr(13)
	
'add user
    crt.Screen.Send "btv" & chr(13)	
	crt.Screen.Send "igmp user add service-port " & Srvport & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "igmp user add service-port " & Srvport1 & chr(13)
	crt.Screen.Send chr(13)
    crt.Screen.Send "igmp user add service-port " & Srvport2 & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "multicast-vlan 1000" & chr(13)
	crt.Screen.Send "igmp multicast-vlan member service-port " & Srvport & " " & chr(13)
	crt.Screen.Send "igmp multicast-vlan member service-port " & Srvport1 & " " & chr(13)
	crt.Screen.Send "igmp multicast-vlan member service-port " & Srvport2 & " " & chr(13)
	crt.Screen.Send "quit" & chr(13)
	
'Query information	
	crt.Screen.Send "display service-port port 0/6/0" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "display igmp user all" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "display port vlan 0/19/" & UpstrPort & chr(13)
	crt.Screen.Send "display ont info 0 6 0 " & OntId & chr(13)
End Sub
