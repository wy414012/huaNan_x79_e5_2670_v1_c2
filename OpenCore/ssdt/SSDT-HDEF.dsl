/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20211217 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Users/yaming/Desktop/work/SSDT-HDEF.aml, Tue Dec 21 20:14:09 2021
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

