/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20220331 (64-bit version)
 * Copyright (c) 2000 - 2022 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Users/yaming/Desktop/huaNan_x79_e5_2670_v1_c2/OpenCore/ssdt/SSDT-UNC-Dual.aml, Thu May 12 11:31:21 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000B9 (185)
 *     Revision         0x02
 *     Checksum         0x86
 *     OEM ID           "ACDT"
 *     OEM Table ID     "UNC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20220331 (539099953)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "UNC", 0x00000000)
{
    External (_SB_.PCI0.UNC0, DeviceObj)
    External (_SB_.PCI1.UNC1, DeviceObj)


    Scope (\_SB.PCI0.UNC0)
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

    Scope (\_SB.PCI1.UNC1)
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

