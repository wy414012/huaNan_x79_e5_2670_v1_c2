/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140926-64 [Nov  6 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of SSDT-1.aml, Tue Mar 16 13:53:01 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000807 (2055)
 *     Revision         0x01
 *     Checksum         0xF3
 *     OEM ID           "APPLE "
 *     OEM Table ID     "CpuPm"
 *     OEM Revision     0x00012700 (75520)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120420 (538051616)
 */
DefinitionBlock ("i7-3820-4.5GHz.aml", "SSDT", 1, "APPLE ", "CpuPm", 0x00012700)
{

    External (_SB_.SCK0.C000, DeviceObj)
    External (_SB_.SCK0.C001, DeviceObj)
    External (_SB_.SCK0.C002, DeviceObj)
    External (_SB_.SCK0.C003, DeviceObj)
    External (_SB_.SCK0.C004, DeviceObj)
    External (_SB_.SCK0.C005, DeviceObj)
    External (_SB_.SCK0.C006, DeviceObj)
    External (_SB_.SCK0.C007, DeviceObj)

    Scope (\_SB.SCK0.C000)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store ("ssdtPRGen version....: 12.7 / Mac OS X 10.9.2 (13C64)", Debug)
            Store ("target processor.....: i7-3820", Debug)
            Store ("running processor....: Intel(R) Core(TM) i7-3820 CPU @ 3.60GHz", Debug)
            Store ("baseFrequency........: 1200", Debug)
            Store ("frequency............: 3600", Debug)
            Store ("busFrequency.........: 100", Debug)
            Store ("logicalCPUs..........: 8", Debug)
            Store ("maximum TDP..........: 130", Debug)
            Store ("packageLength........: 34", Debug)
            Store ("turboStates..........: 9", Debug)
            Store ("maxTurboFrequency....: 4500", Debug)
            Store ("machdep.xcpm.mode....: 0", Debug)
        }

        Name (APLF, One)
        Name (APSN, 0x09)
        Name (APSS, Package (0x22)
        {
            Package (0x06)
            {
                0x1194, 
                0x0001FBD0, 
                0x0A, 
                0x0A, 
                0x2D00, 
                0x2D00
            }, 

            Package (0x06)
            {
                0x1130, 
                0x0001FBD0, 
                0x0A, 
                0x0A, 
                0x2C00, 
                0x2C00
            }, 

            Package (0x06)
            {
                0x10CC, 
                0x0001FBD0, 
                0x0A, 
                0x0A, 
                0x2B00, 
                0x2B00
            }, 

            Package (0x06)
            {
                0x1068, 
                0x0001FBD0, 
                0x0A, 
                0x0A, 
                0x2A00, 
                0x2A00
            }, 

            Package (0x06)
            {
                0x1004, 
                0x0001FBD0, 
                0x0A, 
                0x0A, 
                0x2900, 
                0x2900
            }, 

            Package (0x06)
            {
                0x0FA0, 
                0x0001FBD0, 
                0x0A, 
                0x0A, 
                0x2800, 
                0x2800
            }, 

            Package (0x06)
            {
                0x0F3C, 
                0x0001FBD0, 
                0x0A, 
                0x0A, 
                0x2700, 
                0x2700
            }, 

            Package (0x06)
            {
                0x0ED8, 
                0x0001FBD0, 
                0x0A, 
                0x0A, 
                0x2600, 
                0x2600
            }, 

            Package (0x06)
            {
                0x0E74, 
                0x0001FBD0, 
                0x0A, 
                0x0A, 
                0x2500, 
                0x2500
            }, 

            Package (0x06)
            {
                0x0E10, 
                0x0001FBD0, 
                0x0A, 
                0x0A, 
                0x2400, 
                0x2400
            }, 

            Package (0x06)
            {
                0x0DAC, 
                0x0001E81C, 
                0x0A, 
                0x0A, 
                0x2300, 
                0x2300
            }, 

            Package (0x06)
            {
                0x0D48, 
                0x0001D4C3, 
                0x0A, 
                0x0A, 
                0x2200, 
                0x2200
            }, 

            Package (0x06)
            {
                0x0CE4, 
                0x0001C1C2, 
                0x0A, 
                0x0A, 
                0x2100, 
                0x2100
            }, 

            Package (0x06)
            {
                0x0C80, 
                0x0001AF1A, 
                0x0A, 
                0x0A, 
                0x2000, 
                0x2000
            }, 

            Package (0x06)
            {
                0x0C1C, 
                0x00019CCA, 
                0x0A, 
                0x0A, 
                0x1F00, 
                0x1F00
            }, 

            Package (0x06)
            {
                0x0BB8, 
                0x00018AD0, 
                0x0A, 
                0x0A, 
                0x1E00, 
                0x1E00
            }, 

            Package (0x06)
            {
                0x0B54, 
                0x0001792D, 
                0x0A, 
                0x0A, 
                0x1D00, 
                0x1D00
            }, 

            Package (0x06)
            {
                0x0AF0, 
                0x000167DF, 
                0x0A, 
                0x0A, 
                0x1C00, 
                0x1C00
            }, 

            Package (0x06)
            {
                0x0A8C, 
                0x000156E7, 
                0x0A, 
                0x0A, 
                0x1B00, 
                0x1B00
            }, 

            Package (0x06)
            {
                0x0A28, 
                0x00014642, 
                0x0A, 
                0x0A, 
                0x1A00, 
                0x1A00
            }, 

            Package (0x06)
            {
                0x09C4, 
                0x000135F1, 
                0x0A, 
                0x0A, 
                0x1900, 
                0x1900
            }, 

            Package (0x06)
            {
                0x0960, 
                0x000125F3, 
                0x0A, 
                0x0A, 
                0x1800, 
                0x1800
            }, 

            Package (0x06)
            {
                0x08FC, 
                0x00011646, 
                0x0A, 
                0x0A, 
                0x1700, 
                0x1700
            }, 

            Package (0x06)
            {
                0x0898, 
                0x000106EC, 
                0x0A, 
                0x0A, 
                0x1600, 
                0x1600
            }, 

            Package (0x06)
            {
                0x0834, 
                0xF7E1, 
                0x0A, 
                0x0A, 
                0x1500, 
                0x1500
            }, 

            Package (0x06)
            {
                0x07D0, 
                0xE927, 
                0x0A, 
                0x0A, 
                0x1400, 
                0x1400
            }, 

            Package (0x06)
            {
                0x076C, 
                0xDABC, 
                0x0A, 
                0x0A, 
                0x1300, 
                0x1300
            }, 

            Package (0x06)
            {
                0x0708, 
                0xCCA0, 
                0x0A, 
                0x0A, 
                0x1200, 
                0x1200
            }, 

            Package (0x06)
            {
                0x06A4, 
                0xBED1, 
                0x0A, 
                0x0A, 
                0x1100, 
                0x1100
            }, 

            Package (0x06)
            {
                0x0640, 
                0xB150, 
                0x0A, 
                0x0A, 
                0x1000, 
                0x1000
            }, 

            Package (0x06)
            {
                0x05DC, 
                0xA41B, 
                0x0A, 
                0x0A, 
                0x0F00, 
                0x0F00
            }, 

            Package (0x06)
            {
                0x0578, 
                0x9732, 
                0x0A, 
                0x0A, 
                0x0E00, 
                0x0E00
            }, 

            Package (0x06)
            {
                0x0514, 
                0x8A94, 
                0x0A, 
                0x0A, 
                0x0D00, 
                0x0D00
            }, 

            Package (0x06)
            {
                0x04B0, 
                0x7E40, 
                0x0A, 
                0x0A, 
                0x0C00, 
                0x0C00
            }
        })
        Method (ACST, 0, NotSerialized)
        {
            Store ("Method C000.ACST Called", Debug)
            Store ("C000 C-States    : 29", Debug)
            Return (Package (0x06)
            {
                One, 
                0x04, 
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x01,               // Bit Width
                            0x02,               // Bit Offset
                            0x0000000000000000, // Address
                            0x01,               // Access Size
                            )
                    }, 

                    One, 
                    Zero, 
                    0x03E8
                }, 

                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x01,               // Bit Width
                            0x02,               // Bit Offset
                            0x0000000000000010, // Address
                            0x03,               // Access Size
                            )
                    }, 

                    0x03, 
                    0xCD, 
                    0x01F4
                }, 

                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x01,               // Bit Width
                            0x02,               // Bit Offset
                            0x0000000000000020, // Address
                            0x03,               // Access Size
                            )
                    }, 

                    0x06, 
                    0xF5, 
                    0x015E
                }, 

                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x01,               // Bit Width
                            0x02,               // Bit Offset
                            0x0000000000000030, // Address
                            0x03,               // Access Size
                            )
                    }, 

                    0x07, 
                    0xF5, 
                    0xC8
                }
            })
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            Store ("Method C000._DSM Called", Debug)
            If (LEqual (Arg2, Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                             /* . */
                })
            }

            Return (Package (0x02)
            {
                "plugin-type", 
                One
            })
        }
    }

    Scope (\_SB.SCK0.C001)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C001.APSS Called", Debug)
            Return (\_SB.SCK0.C000.APSS)
        }
    }

    Scope (\_SB.SCK0.C002)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C002.APSS Called", Debug)
            Return (\_SB.SCK0.C000.APSS)
        }
    }

    Scope (\_SB.SCK0.C003)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C003.APSS Called", Debug)
            Return (\_SB.SCK0.C000.APSS)
        }
    }

    Scope (\_SB.SCK0.C004)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C004.APSS Called", Debug)
            Return (\_SB.SCK0.C000.APSS)
        }
    }

    Scope (\_SB.SCK0.C005)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C005.APSS Called", Debug)
            Return (\_SB.SCK0.C000.APSS)
        }
    }

    Scope (\_SB.SCK0.C006)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C006.APSS Called", Debug)
            Return (\_SB.SCK0.C000.APSS)
        }
    }

    Scope (\_SB.SCK0.C007)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C007.APSS Called", Debug)
            Return (\_SB.SCK0.C000.APSS)
        }
    }
}

