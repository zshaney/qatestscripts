#$language = "VBScript"
#$interface = "1.0"

crt.Screen.Synchronous = True

' This automatically generated script may need to be
' edited in order to work correctly.

Sub Main
    dim ontid, ontinterface, portid, ontsn, ontversion
    ontid        = "1/1/5/1/4"
	ontinterface = "1/1/5/1/4/4"
    portid       = "1/1/5/1/4/4/1"
	ontsn        = "KGB10_V2_B002"
	ontversion   = "SMCT:96000022"
	
    'delete ont
	crt.Screen.Send "configure equipment ont interface " & ontid & " admin-state down" & chr(13)
    crt.Screen.Send "configure equipment ont no interface " & ontid & chr(13)
	
	'delete service vpls
	Dim vlanid:vlanid = 100
	For i = 1 To 7 
	crt.Screen.Send " configure  service  vpls " & vlanid & " shutdown  " & chr(13)
	crt.Screen.Send "configure  service   vpls  " & vlanid & "  sap  lt:1/1/5:"& vlanid & "  shutdown " & chr(13)
	crt.Screen.Send " configure   service  vpls  " & vlanid & "  no sap  lt:1/1/5:"& vlanid & "" & chr(13)
	crt.Screen.Send "configure  service  vpls " & vlanid & "  sap  nt-a:xfp:1:"& vlanid & " shutdown " & chr(13)
	crt.Screen.Send " configure  service  vpls  " & vlanid & " no sap nt-a:xfp:1:" & vlanid & chr(13)
	crt.Screen.Send " configure  service   no  vpls  " & vlanid & chr(13)
	vlanid = vlanid +1
	Next
	
	crt.Screen.Send "configure equipment ont interface " & ontid & " sw-ver-pland " & ontsn & " sernum " & ontversion & chr(13)
	crt.Screen.Send "configure equipment ont interface " & ontid & " admin-state up" & chr(13)	
	
	crt.Screen.Send "configure equipment ont slot " & ontinterface & " planned-card-type 10_100base plndnumdataports 1 plndnumvoiceports 0" & chr(13)
	crt.Screen.Send "configure interface port uni: " & portid & " admin-up" & chr(13)	
	
	crt.Screen.Send "configure service vpls 100 v-vpls vlan 100 customer 1 create" & chr(13)
	crt.Screen.Send "configure service vpls 100 sap lt:1/1/5:100 create" & chr(13)
	crt.Screen.Send "configure service vpls 100 sap nt-a:xfp:1:100 create" & chr(13)
	crt.Screen.Send "configure service vpls 100 no shutdown" & chr(13)
	crt.Screen.Send "configure vlan id 100 mode residential-bridge in-qos-prof-name name:Default_TC0" & chr(13)

	crt.Screen.Send "configure service vpls 101 v-vpls vlan 101 customer 1 create" & chr(13)
	crt.Screen.Send "configure service vpls 101 sap lt:1/1/5:101 create" & chr(13)
	crt.Screen.Send "configure service vpls 101 sap nt-a:xfp:1:101 create" & chr(13)
	crt.Screen.Send "configure service vpls 101 no shutdown" & chr(13)
	crt.Screen.Send "configure vlan id 101 mode residential-bridge in-qos-prof-name name:Default_TC0" & chr(13)

	crt.Screen.Send "configure service vpls 102 v-vpls vlan 102 customer 1 create" & chr(13)
	crt.Screen.Send "configure service vpls 102 sap lt:1/1/5:102 create" & chr(13)
	crt.Screen.Send "configure service vpls 102 sap nt-a:xfp:1:102 create" & chr(13)
	crt.Screen.Send "configure service vpls 102 no shutdown" & chr(13)
	crt.Screen.Send "configure vlan id 102 mode residential-bridge in-qos-prof-name name:Default_TC0" & chr(13)	
	
	crt.Screen.Send "configure service vpls 103 v-vpls vlan 103 customer 1 create" & chr(13)
	crt.Screen.Send "configure service vpls 103 sap lt:1/1/5:103 create" & chr(13)
	crt.Screen.Send "configure service vpls 103 sap nt-a:xfp:1:103 create" & chr(13)
	crt.Screen.Send "configure service vpls 103 no shutdown" & chr(13)
	crt.Screen.Send "configure vlan id 103 mode residential-bridge in-qos-prof-name name:Default_TC0" & chr(13)

	crt.Screen.Send "configure service vpls 104 v-vpls vlan 104 customer 1 create" & chr(13)
	crt.Screen.Send "configure service vpls 104 sap lt:1/1/5:104 create" & chr(13)
	crt.Screen.Send "configure service vpls 104 sap nt-a:xfp:1:104 create" & chr(13)
	crt.Screen.Send "configure service vpls 104 no shutdown" & chr(13)
	crt.Screen.Send "configure vlan id 104 mode residential-bridge in-qos-prof-name name:Default_TC0" & chr(13)

	crt.Screen.Send "configure service vpls 105 v-vpls vlan 105 customer 1 create" & chr(13)
	crt.Screen.Send "configure service vpls 105 sap lt:1/1/5:105 create" & chr(13)
	crt.Screen.Send "configure service vpls 105 sap nt-a:xfp:1:105 create" & chr(13)
	crt.Screen.Send "configure service vpls 105 no shutdown" & chr(13)
	crt.Screen.Send "configure vlan id 105 mode residential-bridge in-qos-prof-name name:Default_TC0" & chr(13)

	crt.Screen.Send "configure service vpls 106 v-vpls vlan 106 customer 1 create" & chr(13)
	crt.Screen.Send "configure service vpls 106 sap lt:1/1/5:106 create" & chr(13)
	crt.Screen.Send "configure service vpls 106 sap nt-a:xfp:1:106 create" & chr(13)
	crt.Screen.Send "configure service vpls 106 no shutdown" & chr(13)
	crt.Screen.Send "configure vlan id 106 mode residential-bridge in-qos-prof-name name:Default_TC0" & chr(13)

	crt.Screen.Send "configure service vpls 107 v-vpls vlan 107 customer 1 create" & chr(13)
	crt.Screen.Send "configure service vpls 107 sap lt:1/1/5:107 create" & chr(13)
	crt.Screen.Send "configure service vpls 107 sap nt-a:xfp:1:107 create" & chr(13)
	crt.Screen.Send "configure service vpls 107 no shutdown" & chr(13)
	crt.Screen.Send "configure vlan id 107 mode residential-bridge in-qos-prof-name name:Default_TC0" & chr(13)	
	
	crt.Screen.Send "configure qos profiles bandwidth UP_100M committed-info-rate 0 assured-info-rate 0 excessive-info-rate 100000" & chr(13)	
	crt.Screen.Send "configure qos interface " & portid & " upstream-queue 0 bandwidth-profile name:UP_100M" & chr(13)
	
	crt.Screen.Send "configure bridge port " & portid & " max-unicast-mac 8" & chr(13)	
	crt.Screen.Send "configure bridge port " & portid & " vlan-id 100" & chr(13)
	crt.Screen.Send "configure bridge port " & portid & " vlan-id 101" & chr(13)
	crt.Screen.Send "configure bridge port " & portid & " vlan-id 102" & chr(13)
	crt.Screen.Send "configure bridge port " & portid & " vlan-id 103" & chr(13)
	crt.Screen.Send "configure bridge port " & portid & " vlan-id 104" & chr(13)
	crt.Screen.Send "configure bridge port " & portid & " vlan-id 105" & chr(13)
	crt.Screen.Send "configure bridge port " & portid & " vlan-id 106" & chr(13)
	crt.Screen.Send "configure bridge port " & portid & " vlan-id 107" & chr(13)
	
	crt.Screen.Send "exit all" & chr(13)
	
	crt.Screen.Send "info configure equipment ont interface " & ontid & chr(13)
	crt.Screen.Send "info configure equipment ont slot " & ontinterface & chr(13)
	'crt.Screen.Send "" & chr(13)
End Sub
