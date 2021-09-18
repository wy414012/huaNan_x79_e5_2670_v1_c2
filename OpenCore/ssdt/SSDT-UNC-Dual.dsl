/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210604 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Users/wumingquan/Desktop/SSDT-UNC.aml, Sun Aug  1 23:48:13 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000062 (98)
 *     Revision         0x02
 *     Checksum         0x09
 *     OEM ID           "ACDT"
 *     OEM Table ID     "UNC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200528 (538969384)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "UNC", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI1, DeviceObj)
    External (PRBM, IntObj)

    Scope (\_SB.PCI0)
    {
        Device (^UNC0)
        {
        Name (_HID, EisaId ("PNP0A03") /* PCI Bus */)  // _HID: Hardware ID
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                PRBM = Zero
            }
        }
    }
    }
    Scope (\_SB.PCI1)
    {
        Device (^UNC1)
        {
        Name (_HID, EisaId ("PNP0A03") /* PCI Bus */)  // _HID: Hardware ID
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                PRBM = Zero
            }
        }
    }
}
}

