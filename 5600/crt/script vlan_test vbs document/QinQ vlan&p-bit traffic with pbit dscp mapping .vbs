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
	crt.Screen.Send "vlan 300 smart" & chr(13)
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
				
'Create a gem port (index=1) both mapping to TCONT1 which the max bandwith is set as 1G. 
'Create two gem mapping rule that mapping traffic with particular tag (vid1=300,vid2=150) to gem port1 

'Configure accurate dscp-to-pbits mapping table(dscp=0 to pbit=1,dscp=16 to pbit=3,dscp=32 to pbit=5)	
	crt.Screen.Send "dscp-to-pbits mapping table 0 0 1" & chr(13)
	crt.Screen.Send "dscp-to-pbits mapping table 0 16 3" & chr(13)
	crt.Screen.Send "dscp-to-pbits mapping table 0 32 5" & chr(13)

'Create a ont-lineprofile
	crt.Screen.Send "ont-lineprofile gpon profile-id " & ProfileId & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "tcont 1 dba-profile-id 2" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "gem add 1 eth tcont 1" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "mapping-mode vlan" & chr(13)	  
	crt.Screen.Send "gem mapping 1 1 vlan 300" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "commit" & chr(13)
	crt.Screen.Send "quit" & chr(13)
	
'Configure cvlan(vid=150) and qinq vlan based on native vlan and priority (vid=300&pbit=3) copy-cos on the DUT port.  	
'Create a ont-srvprofile
	crt.Screen.Send "ont-srvprofile gpon profile-id " & ProfileId & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "ont-port eth 1" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "port vlan eth 1 q-in-q 300 priority dscp-mapping 0 user-vlan 150 1" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "commit" & chr(13)
	crt.Screen.Send "quit" & chr(13)
	
'Add ont and bind with right line-profile and service-profile
	crt.Screen.Send "interface gpon 0/6" & chr(13)
	crt.Screen.Send "ont add 0 " & OntId & " sn-auth " & OntSn & " omci" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "ont modify 0 " & OntId & " ont-lineprofile-id " & ProfileId & " ont-srvprofile-id " & ProfileId & chr(13)
	crt.Screen.Send "quit" & chr(13)

'Configure traffic with different user-vlan (vid1=300,vid2=150) transparent to them corresponding svlan (vid1=300,vid2=150) from GEM port1.
	crt.Screen.Send "service-port vlan 300 gpon 0/6/0 ont " & OntId & " gemport 1 multi-service user-vlan 300 tag-transform  transparent" & chr(13)
	crt.Screen.Send chr(13)
	
'Query information	
	crt.Screen.Send "display service-port port 0/6/0" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.Send "display port vlan 0/19/" & UpstrPort & chr(13)
	crt.Screen.Send "display ont info 0 6 0 " & OntId & chr(13)
End Sub
