
##############################################################
# This Script has been generated by Ixia ScriptGen
#      Software Version : ixos 4.10.250.18 SP6         
##############################################################


package req IxTclHal

# Command Option Mode - Full (generate full configuration)


if {[isUNIX]} {
	if {[ixConnectToTclServer 192.168.24.194]} {
		ixPuts "Error connecting to Tcl Server 192.168.24.194 "
		return 1
	}
}


######### Chassis- 192.168.24.194 #########

ixConnectToChassis   {192.168.24.194}

chassis                      get               "192.168.24.194"
set chassis	  [chassis cget -id]
set card     10
set lanport     1
set wanport     2
set portList {}

ixPortClearOwnership $chassis $card $lanport force
ixPortClearOwnership $chassis $card $wanport force

set lan_da1 "00 09 00 00 01 01"
set lan_sa1 "00 09 00 00 02 01"
set lan_da2 "00 09 00 00 01 02"
set lan_sa2 "00 09 00 00 02 02"
set lan_da3 "00 09 00 00 01 03"
set lan_sa3 "00 09 00 00 02 03"

set wan_da1 "00 09 00 00 02 01"
set wan_sa1 "00 09 00 00 01 01"

######### Card Type : 10/100/1000 STXS4 ############

card                         setDefault        
card                         config            -txFrequencyDeviation               0
card                         set               $chassis $card
card                         write             $chassis $card

######### Chassis-192.168.24.194 Card-10  Port-1 #########

port                         setFactoryDefaults $chassis $card $lanport
port                         setPhyMode        $::portPhyModeCopper $chassis $card $lanport

filter                       setDefault        
filter                       config            -captureTriggerDA                   addr1
filter                       config            -captureTriggerSA                   addr1
filter                       config            -captureFilterDA                    addr1
filter                       config            -captureFilterSA                    addr1
filter                       config            -captureTriggerEnable               true
filter                       config            -captureFilterEnable                true
filter                       set               $chassis $card $lanport
filterPallette               setDefault        
filterPallette               config            -DA1                                $wan_da1
filterPallette               config            -DAMask1                            "00 00 00 00 00 07"
filterPallette               config            -SA1                                $wan_sa1
filterPallette               config            -SAMask1                            "00 00 00 00 00 07"
filterPallette               set               $chassis $card $lanport
lappend                      portList          [list $chassis $card $lanport]

ixWritePortsToHardware       portList          
ixCheckLinkState             portList          

######### Chassis-192.168.24.194 Card-10  Port-1 #########

set streamId 1

#  Stream 1
stream                       setDefault        
stream                       config            -name                               "stream1"
stream                       config            -enable                             true
stream                       config            -region                             0
stream                       config            -numBursts                          1
stream                       config            -numFrames                          3
stream                       config            -ifg                                9999424.0
stream                       config            -ifgType                            gapFixed
stream                       config            -ifgMIN                             96.0
stream                       config            -ifgMAX                             160.0
stream                       config            -ibg                                9999424.0
stream                       config            -enableIbg                          false
stream                       config            -isg                                9999424.0
stream                       config            -enableIsg                          false
stream                       config            -gapUnit                            gapNanoSeconds
stream                       config            -percentPacketRate                  0.0672
stream                       config            -fpsRate                            100.0
stream                       config            -bpsRate                            51200.0
stream                       config            -rateMode                           usePercentRate
stream                       config            -preambleSize                       8
stream                       config            -sa                                 $lan_sa1
stream                       config            -saRepeatCounter                    idle
stream                       config            -saStep                             1
stream                       config            -saMaskValue                        "00 00 00 00 00 00"
stream                       config            -saMaskSelect                       "00 00 00 00 00 00"
stream                       config            -enableSaContinueFromLastValue      false
stream                       config            -da                                 $lan_da1
stream                       config            -daRepeatCounter                    idle
stream                       config            -daStep                             1
stream                       config            -daMaskValue                        "00 00 00 00 00 00"
stream                       config            -daMaskSelect                       "00 00 00 00 00 00"
stream                       config            -enableDaContinueFromLastValue      false
stream                       config            -framesize                          64
stream                       config            -frameSizeType                      sizeFixed
stream                       config            -frameSizeMIN                       64
stream                       config            -frameSizeMAX                       64
stream                       config            -frameSizeStep                      1
stream                       config            -enableTimestamp                    false
stream                       config            -fcs                                good
stream                       config            -patternType                        incrByte
stream                       config            -dataPattern                        x00010203
stream                       config            -pattern                            "00 01 02 03"
stream                       config            -frameType                          "08 00"
stream                       config            -numDA                              16
stream                       config            -numSA                              16
stream                       config            -dma                                advance
stream                       config            -rxTriggerEnable                    false
stream                       config            -asyncIntEnable                     true
stream                       config            -loopCount                          1
stream                       config            -returnToId                         1
stream                       config            -enforceMinGap                      12
stream                       config            -enableSourceInterface              false
stream                       config            -sourceInterfaceDescription         ""
stream                       config            -startTxDelayUnit                   4
stream                       config            -startTxDelay                       0.0
protocol                     setDefault        
protocol                     config            -name                               ipV4
protocol                     config            -appName                            noType
protocol                     config            -ethernetType                       ethernetII
protocol                     config            -enable802dot1qTag                  vlanSingle
protocol                     config            -enableISLtag                       false
protocol                     config            -enableMPLS                         false
ip                           setDefault        
ip                           config            -precedence                         routine
ip                           config            -delay                              normalDelay
ip                           config            -throughput                         normalThruput
ip                           config            -reliability                        normalReliability
ip                           config            -identifier                         0
ip                           config            -cost                               0
ip                           config            -reserved                           0
ip                           config            -totalLength                        42
ip                           config            -lengthOverride                     false
ip                           config            -fragment                           may
ip                           config            -lastFragment                       last
ip                           config            -fragmentOffset                     0
ip                           config            -ttl                                64
ip                           config            -ipProtocol                         ipV4ProtocolReserved255
ip                           config            -useValidChecksum                   true
ip                           config            -sourceIpAddr                       "0.0.0.0"
ip                           config            -sourceIpMask                       "255.0.0.0"
ip                           config            -sourceIpAddrMode                   ipIdle
ip                           config            -sourceIpAddrRepeatCount            10
ip                           config            -sourceClass                        classA
ip                           config            -enableSourceSyncFromPpp            false
ip                           config            -destIpAddr                         "0.0.0.0"
ip                           config            -destIpMask                         "255.0.0.0"
ip                           config            -destIpAddrMode                     ipIdle
ip                           config            -destIpAddrRepeatCount              10
ip                           config            -destClass                          classA
ip                           config            -destMacAddr                        "00 DE BB 00 00 02"
ip                           config            -destDutIpAddr                      "0.0.0.0"
ip                           config            -options                            ""
ip                           config            -enableDestSyncFromPpp              false
ip                           config            -qosMode                            ipV4ConfigDscp
ip                           config            -dscpMode                           ipV4DscpCustom
ip                           config            -dscpValue                          0x00
ip                           config            -classSelector                      ipV4DscpClass1
ip                           config            -assuredForwardingClass             ipV4DscpAssuredForwardingClass1
ip                           config            -assuredForwardingPrecedence        ipV4DscpPrecedenceLowDrop
ip                           set               $chassis $card $lanport

vlan                         setDefault        
vlan                         config            -vlanID                             100
vlan                         config            -userPriority                       0
vlan                         config            -cfi                                resetCFI
vlan                         config            -mode                               vIdle
vlan                         config            -repeat                             10
vlan                         config            -step                               1
vlan                         config            -maskval                            "0000XXXXXXXXXXXX"
vlan                         config            -protocolTagId                      vlanProtocolTag8100
vlan                         set               $chassis $card $lanport

if {[port isValidFeature $chassis $card $lanport $::portFeatureTableUdf]} { 
	tableUdf setDefault
	tableUdf clearColumns
	tableUdf set $chassis $card $lanport
}


if {[port isValidFeature $chassis $card $lanport $::portFeatureRandomFrameSizeWeightedPair]} { 
	weightedRandomFramesize setDefault
	weightedRandomFramesize set $chassis $card $lanport
}

stream                       set               $chassis $card $lanport $streamId
incr                         streamId          
#  Stream 2
stream                       setDefault        
stream                       config            -name                               "stream2"
stream                       config            -enable                             true
stream                       config            -region                             0
stream                       config            -numBursts                          1
stream                       config            -numFrames                          3
stream                       config            -ifg                                9999424.0
stream                       config            -ifgType                            gapFixed
stream                       config            -ifgMIN                             96.0
stream                       config            -ifgMAX                             160.0
stream                       config            -ibg                                9999424.0
stream                       config            -enableIbg                          false
stream                       config            -isg                                9999424.0
stream                       config            -enableIsg                          false
stream                       config            -gapUnit                            gapNanoSeconds
stream                       config            -percentPacketRate                  0.0672
stream                       config            -fpsRate                            100.0
stream                       config            -bpsRate                            51200.0
stream                       config            -rateMode                           usePercentRate
stream                       config            -preambleSize                       8
stream                       config            -sa                                 $lan_sa2
stream                       config            -saRepeatCounter                    idle
stream                       config            -saStep                             1
stream                       config            -saMaskValue                        "00 00 00 00 00 00"
stream                       config            -saMaskSelect                       "00 00 00 00 00 00"
stream                       config            -enableSaContinueFromLastValue      false
stream                       config            -da                                 $lan_da2
stream                       config            -daRepeatCounter                    idle
stream                       config            -daStep                             1
stream                       config            -daMaskValue                        "00 00 00 00 00 00"
stream                       config            -daMaskSelect                       "00 00 00 00 00 00"
stream                       config            -enableDaContinueFromLastValue      false
stream                       config            -framesize                          64
stream                       config            -frameSizeType                      sizeFixed
stream                       config            -frameSizeMIN                       64
stream                       config            -frameSizeMAX                       64
stream                       config            -frameSizeStep                      1
stream                       config            -enableTimestamp                    false
stream                       config            -fcs                                good
stream                       config            -patternType                        incrByte
stream                       config            -dataPattern                        x00010203
stream                       config            -pattern                            "00 01 02 03"
stream                       config            -frameType                          "08 00"
stream                       config            -numDA                              16
stream                       config            -numSA                              16
stream                       config            -dma                                advance
stream                       config            -rxTriggerEnable                    false
stream                       config            -asyncIntEnable                     true
stream                       config            -loopCount                          1
stream                       config            -returnToId                         1
stream                       config            -enforceMinGap                      12
stream                       config            -enableSourceInterface              false
stream                       config            -sourceInterfaceDescription         ""
stream                       config            -startTxDelayUnit                   4
stream                       config            -startTxDelay                       0.0
protocol                     setDefault        
protocol                     config            -name                               ipV4
protocol                     config            -appName                            noType
protocol                     config            -ethernetType                       ethernetII
protocol                     config            -enable802dot1qTag                  vlanSingle
protocol                     config            -enableISLtag                       false
protocol                     config            -enableMPLS                         false
ip                           setDefault        
ip                           config            -precedence                         routine
ip                           config            -delay                              normalDelay
ip                           config            -throughput                         normalThruput
ip                           config            -reliability                        normalReliability
ip                           config            -identifier                         0
ip                           config            -cost                               0
ip                           config            -reserved                           0
ip                           config            -totalLength                        42
ip                           config            -lengthOverride                     false
ip                           config            -fragment                           may
ip                           config            -lastFragment                       last
ip                           config            -fragmentOffset                     0
ip                           config            -ttl                                64
ip                           config            -ipProtocol                         ipV4ProtocolReserved255
ip                           config            -useValidChecksum                   true
ip                           config            -sourceIpAddr                       "0.0.0.0"
ip                           config            -sourceIpMask                       "255.0.0.0"
ip                           config            -sourceIpAddrMode                   ipIdle
ip                           config            -sourceIpAddrRepeatCount            10
ip                           config            -sourceClass                        classA
ip                           config            -enableSourceSyncFromPpp            false
ip                           config            -destIpAddr                         "0.0.0.0"
ip                           config            -destIpMask                         "255.0.0.0"
ip                           config            -destIpAddrMode                     ipIdle
ip                           config            -destIpAddrRepeatCount              10
ip                           config            -destClass                          classA
ip                           config            -destMacAddr                        "00 DE BB 00 00 02"
ip                           config            -destDutIpAddr                      "0.0.0.0"
ip                           config            -options                            ""
ip                           config            -enableDestSyncFromPpp              false
ip                           config            -qosMode                            ipV4ConfigDscp
ip                           config            -dscpMode                           ipV4DscpCustom
ip                           config            -dscpValue                          0x10
ip                           config            -classSelector                      ipV4DscpClass1
ip                           config            -assuredForwardingClass             ipV4DscpAssuredForwardingClass1
ip                           config            -assuredForwardingPrecedence        ipV4DscpPrecedenceLowDrop
ip                           set               $chassis $card $lanport

vlan                         setDefault        
vlan                         config            -vlanID                             100
vlan                         config            -userPriority                       0
vlan                         config            -cfi                                resetCFI
vlan                         config            -mode                               vIdle
vlan                         config            -repeat                             10
vlan                         config            -step                               1
vlan                         config            -maskval                            "0000XXXXXXXXXXXX"
vlan                         config            -protocolTagId                      vlanProtocolTag8100
vlan                         set               $chassis $card $lanport

if {[port isValidFeature $chassis $card $lanport $::portFeatureTableUdf]} { 
	tableUdf setDefault
	tableUdf clearColumns
	tableUdf set $chassis $card $lanport
}


if {[port isValidFeature $chassis $card $lanport $::portFeatureRandomFrameSizeWeightedPair]} { 
	weightedRandomFramesize setDefault
	weightedRandomFramesize set $chassis $card $lanport
}

stream                       set               $chassis $card $lanport $streamId
incr                         streamId          
#  Stream 3
stream                       setDefault        
stream                       config            -name                               "stream3"
stream                       config            -enable                             true
stream                       config            -region                             0
stream                       config            -numBursts                          1
stream                       config            -numFrames                          3
stream                       config            -ifg                                9999424.0
stream                       config            -ifgType                            gapFixed
stream                       config            -ifgMIN                             192.0
stream                       config            -ifgMAX                             256.0
stream                       config            -ibg                                9999424.0
stream                       config            -enableIbg                          false
stream                       config            -isg                                9999424.0
stream                       config            -enableIsg                          false
stream                       config            -gapUnit                            gapNanoSeconds
stream                       config            -percentPacketRate                  0.0672
stream                       config            -fpsRate                            100.0
stream                       config            -bpsRate                            51200.0
stream                       config            -rateMode                           usePercentRate
stream                       config            -preambleSize                       8
stream                       config            -sa                                 $lan_sa3
stream                       config            -saRepeatCounter                    idle
stream                       config            -saStep                             1
stream                       config            -saMaskValue                        "00 00 00 00 00 00"
stream                       config            -saMaskSelect                       "00 00 00 00 00 00"
stream                       config            -enableSaContinueFromLastValue      false
stream                       config            -da                                 $lan_da3
stream                       config            -daRepeatCounter                    idle
stream                       config            -daStep                             1
stream                       config            -daMaskValue                        "00 00 00 00 00 00"
stream                       config            -daMaskSelect                       "00 00 00 00 00 00"
stream                       config            -enableDaContinueFromLastValue      false
stream                       config            -framesize                          64
stream                       config            -frameSizeType                      sizeFixed
stream                       config            -frameSizeMIN                       64
stream                       config            -frameSizeMAX                       64
stream                       config            -frameSizeStep                      1
stream                       config            -enableTimestamp                    false
stream                       config            -fcs                                good
stream                       config            -patternType                        incrByte
stream                       config            -dataPattern                        x00010203
stream                       config            -pattern                            "00 01 02 03"
stream                       config            -frameType                          "08 00"
stream                       config            -numDA                              16
stream                       config            -numSA                              16
stream                       config            -dma                                gotoFirst
stream                       config            -rxTriggerEnable                    false
stream                       config            -asyncIntEnable                     true
stream                       config            -loopCount                          1
stream                       config            -returnToId                         1
stream                       config            -enforceMinGap                      12
stream                       config            -enableSourceInterface              false
stream                       config            -sourceInterfaceDescription         ""
stream                       config            -startTxDelayUnit                   4
stream                       config            -startTxDelay                       0.0
protocol                     setDefault        
protocol                     config            -name                               ipV4
protocol                     config            -appName                            noType
protocol                     config            -ethernetType                       ethernetII
protocol                     config            -enable802dot1qTag                  vlanSingle
protocol                     config            -enableISLtag                       false
protocol                     config            -enableMPLS                         false
ip                           setDefault        
ip                           config            -precedence                         routine
ip                           config            -delay                              normalDelay
ip                           config            -throughput                         normalThruput
ip                           config            -reliability                        normalReliability
ip                           config            -identifier                         0
ip                           config            -cost                               0
ip                           config            -reserved                           0
ip                           config            -totalLength                        42
ip                           config            -lengthOverride                     false
ip                           config            -fragment                           may
ip                           config            -lastFragment                       last
ip                           config            -fragmentOffset                     0
ip                           config            -ttl                                64
ip                           config            -ipProtocol                         ipV4ProtocolReserved255
ip                           config            -useValidChecksum                   true
ip                           config            -sourceIpAddr                       "0.0.0.0"
ip                           config            -sourceIpMask                       "255.0.0.0"
ip                           config            -sourceIpAddrMode                   ipIdle
ip                           config            -sourceIpAddrRepeatCount            10
ip                           config            -sourceClass                        classA
ip                           config            -enableSourceSyncFromPpp            false
ip                           config            -destIpAddr                         "0.0.0.0"
ip                           config            -destIpMask                         "255.0.0.0"
ip                           config            -destIpAddrMode                     ipIdle
ip                           config            -destIpAddrRepeatCount              10
ip                           config            -destClass                          classA
ip                           config            -destMacAddr                        "00 DE BB 00 00 02"
ip                           config            -destDutIpAddr                      "0.0.0.0"
ip                           config            -options                            ""
ip                           config            -enableDestSyncFromPpp              false
ip                           config            -qosMode                            ipV4ConfigDscp
ip                           config            -dscpMode                           ipV4DscpCustom
ip                           config            -dscpValue                          0x20
ip                           config            -classSelector                      ipV4DscpClass1
ip                           config            -assuredForwardingClass             ipV4DscpAssuredForwardingClass1
ip                           config            -assuredForwardingPrecedence        ipV4DscpPrecedenceLowDrop
ip                           set               $chassis $card $lanport

vlan                         setDefault        
vlan                         config            -vlanID                             100
vlan                         config            -userPriority                       0
vlan                         config            -cfi                                resetCFI
vlan                         config            -mode                               vIdle
vlan                         config            -repeat                             10
vlan                         config            -step                               1
vlan                         config            -maskval                            "0000XXXXXXXXXXXX"
vlan                         config            -protocolTagId                      vlanProtocolTag8100
vlan                         set               $chassis $card $lanport

if {[port isValidFeature $chassis $card $lanport $::portFeatureTableUdf]} { 
	tableUdf setDefault
	tableUdf clearColumns
	tableUdf set $chassis $card $lanport
}


if {[port isValidFeature $chassis $card $lanport $::portFeatureRandomFrameSizeWeightedPair]} { 
	weightedRandomFramesize setDefault
	weightedRandomFramesize set $chassis $card $lanport
}

stream                       set               $chassis $card $lanport $streamId
incr                         streamId          
ixWriteConfigToHardware      portList          -noProtocolServer



after 2000
ixPuts "################### lanport upstream ######################"

ixClearPortStats $chassis $card $lanport
ixClearPortStats $chassis $card $wanport
after 1000

ixStartPortTransmit $chassis $card $lanport
ixStartPortCapture $chassis $card $wanport
after 5000
#ixCheckPortTransmitDone $chassis $card $lanport
ixStopPortCapture $chassis $card $wanport
ixStopPortTransmit $chassis $card $lanport

captureBuffer get $chassis $card $wanport 1 30

set Flag1 0
set Mark1 0
for {set i 1} {$i <= 30} {incr i} {
	if { [captureBuffer getframe $i] } {
	   ixPuts "Error ! failed to get captureBuffer on $chassis $card $wanport"	
	   break
	} else {
	       set capFrame [captureBuffer cget -frame]
	       set typeField [lrange $capFrame 0 15]
	       set tarValue [format "%s %s 81 00 20 64" $lan_da1 $lan_sa1 ]
	       if {$typeField == $tarValue	} {
              incr Flag1
	          ixPuts "It is expected that receiving a Vlan=100 Priority =1 upstream stream1 ."
	          break
	          } else { 
	                puts $typeField
	                incr Mark1
	          }
	}		  
}
if {$Mark1 == 30} {
    ixPuts "error ! not receiving Vlan=100 Priority =1 upstream stream1"
}



set Flag2 0
set Mark2 0
for {set j 1} {$j <= 30} {incr j} {
	if { [captureBuffer getframe $j] } {
	    ixPuts "Error ! failed to get captureBuffer on $chassis $card $wanport"	
	    break
	} else {
	     set capFrame [captureBuffer cget -frame]
	     set typeField [lrange $capFrame 0 15]
	     set tarValue [format "%s %s 81 00 60 64" $lan_da2 $lan_sa2 ]
	     if {$typeField == $tarValue} {
            incr Flag2
	        ixPuts "It is expected that receiving a Vlan=100 Priority =3 upstream stream2 ."
	        break
	     } else { 
	           puts $typeField
	           incr Mark2
	     }
    }
}	
if {$Mark2 == 30} {
    ixPuts "error ! not receiving Vlan=100 Priority =3 upstream stream2"
}

set Flag3 0
set Mark3 0
for {set k 1} {$k <= 30} {incr k} {
	if { [captureBuffer getframe $k] } {
	   ixPuts "Error ! failed to get captureBuffer on $chassis $card $wanport"	
	   break
	} else {
	     set capFrame [captureBuffer cget -frame]
	     set typeField [lrange $capFrame 0 15]
	     set tarValue [format "%s %s 81 00 A0 64" $lan_da3 $lan_sa3]
	     if {$typeField == $tarValue} {
            incr Flag3
	        ixPuts "It is expected that receiving a Vlan=100 Priority =5 upstream stream3 ."
	        break
	     } else { 
		    puts $typeField
	        incr Mark3
	     }
	}		
}	
if  {$Mark3 == 30} {
    ixPuts "error ! not receiving Vlan=100 Priority =5 upstream stream3."
}


set Flag [expr $Flag1 + $Flag2 + $Flag3]
if {$Flag == 3} {
	ixPuts "#########################  result  #####################"
	puts "this case pass!"
	ixPuts "########################################################"
} else {
	ixPuts "#########################  result  #####################"
	puts "this case fail!"
	ixPuts "########################################################"
}
