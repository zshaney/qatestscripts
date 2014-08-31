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
	crt.Screen.Send "configure  service  vpls 300   shutdown" & chr(13)
	crt.Screen.Send "configure  service   vpls  300  sap  lt:1/1/5:300  shutdown" & chr(13)
	crt.Screen.Send "configure   service  vpls  300  no sap  lt:1/1/5:300" & chr(13)
	crt.Screen.Send "configure  service  vpls 300  sap  nt-a:xfp:1:300 shutdown" & chr(13)
	crt.Screen.Send "configure  service  vpls  300 no sap nt-a:xfp:1:300" & chr(13)
	crt.Screen.Send "configure  service   no  vpls  300" & chr(13)
	
	crt.Screen.Send "configure equipment ont interface " & ontid & " sw-ver-pland " & ontsn & " sernum " & ontversion & chr(13)
	crt.Screen.Send "configure equipment ont interface " & ontid & " admin-state up" & chr(13)	
	
	crt.Screen.Send "configure equipment ont slot" & ontinterface & " planned-card-type 10_100base plndnumdataports 1 plndnumvoiceports 0" & chr(13)
	crt.Screen.Send "configure interface port uni:" & portid & " admin-up" & chr(13)	
	
	crt.Screen.Send "configure service vpls 300 v-vpls vlan 300 customer 1 create" & chr(13)
	crt.Screen.Send "configure service vpls 300 sap lt:1/1/5:300 create" & chr(13)
	crt.Screen.Send "configure service vpls 300 sap nt-a:xfp:1:300 create" & chr(13)
	crt.Screen.Send "configure service vpls 300 no shutdown" & chr(13)
	crt.Screen.Send "configure vlan id 300 mode residential-bridge in-qos-prof-name name:Default_TC0" & chr(13)
	crt.Screen.Send "configure qos profiles bandwidth UP_100M committed-info-rate 0 assured-info-rate 0 excessive-info-rate 100000" & chr(13)	
	crt.Screen.Send "configure qos interface " & portid & " upstream-queue 0 bandwidth-profile name:UP_100M" & chr(13)
	
	crt.Screen.Send "configure bridge port " & portid & " max-unicast-mac 8" & chr(13)	
	crt.Screen.Send "configure vlan priority-regen 25 profile-name PBIT1TO2 pbit1 2" & chr(13)
	crt.Screen.Send "configure bridge port " & portid & " vlan-id 150 qos profile:25 vlan-scope local network-vlan 300" & chr(13)
	
	crt.Screen.Send "exit all" & chr(13)
	
	crt.Screen.Send "info configure equipment ont interface" & ontid & chr(13)
	crt.Screen.Send "info configure equipment ont slot" & ontinterface & chr(13)
	'crt.Screen.Send "" & chr(13)
End Sub
