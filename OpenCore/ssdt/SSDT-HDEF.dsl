/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20211217 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Users/yaming/Desktop/work/SSDT-HDEF.aml, Tue Dec 21 20:20:18 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000005F (95)
 *     Revision         0x02
 *     Checksum         0x8F
 *     OEM ID           "ALC"
 *     OEM Table ID     "HDEF"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20211217 (539038231)
 */
DefinitionBlock ("", "SSDT", 2, "ALC", "HDEF", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)

    Scope (_SB.PCI0)
    {
        Device (HDEF)
        {
            Name (_ADR, 0x001B0000)  // _ADR: Address
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (Package (0x02)
                {
                    0x09, 
                    0x04
                })
            }
        }
    }
}

