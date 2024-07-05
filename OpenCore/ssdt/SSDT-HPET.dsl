/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Users/ymwl/Desktop/huaNan_x79_e5_2670_v1_c2/OpenCore/EFI/OC/ACPI/SSDT-HPET.aml, Fri Jul  5 17:41:51 2024
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000001A8 (424)
 *     Revision         0x02
 *     Checksum         0x33
 *     OEM ID           "CORP"
 *     OEM Table ID     "HPET"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200528 (538969384)
 */
DefinitionBlock ("", "SSDT", 2, "CORP", "HPET", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.SBRG, DeviceObj)
    External (HPTC, IntObj)

    If (_OSI ("Darwin"))
    {
        If (CondRefOf (\_SB.PCI0.HPET))
        {
            Device (\_SB.PCI0.HPEA)
            {
                Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                Name (CRS, ResourceTemplate ()
                {
                    IRQNoFlags ()
                        {0}
                    IRQNoFlags ()
                        {8}
                    Memory32Fixed (ReadWrite,
                        0xFED00000,         // Address Base
                        0x00000400,         // Address Length
                        _Y00)
                })
                OperationRegion (HCNT, SystemMemory, HPTC, 0x04)
                Field (HCNT, DWordAcc, NoLock, Preserve)
                {
                    HPTS,   2, 
                        ,   5, 
                    HPTE,   1
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (HPTE)
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (CRS, \_SB.PCI0.HPEA._Y00._BAS, HTBS)  // _BAS: Base Address
                    Local0 = (HPTS * 0x1000)
                    HTBS = (Local0 + 0xFED00000)
                    Return (CRS) /* \_SB_.PCI0.HPEA.CRS_ */
                }
            }
        }

        If (CondRefOf (\_SB.PCI0.SBRG.RTC0))
        {
            Device (\_SB.PCI0.SBRG.RTC1)
            {
                Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    IO (Decode16,
                        0x0070,             // Range Minimum
                        0x0070,             // Range Maximum
                        0x00,               // Alignment
                        0x02,               // Length
                        )
                })
            }
        }

        If (CondRefOf (\_SB.PCI0.SBRG.TMR))
        {
            Device (\_SB.PCI0.SBRG.TMIR)
            {
                Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    IO (Decode16,
                        0x0040,             // Range Minimum
                        0x0040,             // Range Maximum
                        0x00,               // Alignment
                        0x04,               // Length
                        )
                })
            }
        }
    }
}

