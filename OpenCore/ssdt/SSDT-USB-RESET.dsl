/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Users/wumingquan/Desktop/clover-x79-e5-2670-rx588/OpenCore/ssdt/SSDT-USB-RESET.aml, Thu Dec 16 15:53:44 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000B5 (181)
 *     Revision         0x02
 *     Checksum         0x6F
 *     OEM ID           "CORP"
 *     OEM Table ID     "UsbReset"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20210930 (539035952)
 */
DefinitionBlock ("", "SSDT", 2, "CORP", "UsbReset", 0x00001000)
{
    External (_SB_.PCI0.EUSB.HUBN, DeviceObj)
    External (_SB_.PCI0.USBE.HUBN, DeviceObj)

    Scope (\_SB.PCI0.EUSB.HUBN)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0F)
            }
        }
    }

    Scope (\_SB.PCI0.USBE.HUBN)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0F)
            }
        }
    }
}

