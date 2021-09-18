/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210730 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Users/wumingquan/Desktop/SSDT-XHCI-PEXN.aml, Sat Sep 18 09:48:06 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000057 (87)
 *     Revision         0x02
 *     Checksum         0x0E
 *     OEM ID           "ACDT"
 *     OEM Table ID     "XHCI"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20210730 (539035440)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "XHCI", 0x00000000)
{
    External (_SB_.PCI0.PEX1, DeviceObj)

    Scope (\_SB.PCI0.PEX1)
    {
        Device (XHCI)
        {
            Name (_ADR, Zero)  // _ADR: Address
        }
    }
}

