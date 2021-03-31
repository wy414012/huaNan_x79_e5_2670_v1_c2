/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140926-64 [Nov  6 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of SSDT-1.aml, Tue Mar 16 14:52:20 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000082C (2092)
 *     Revision         0x01
 *     Checksum         0x0C
 *     OEM ID           "APPLE "
 *     OEM Table ID     "CpuPm"
 *     OEM Revision     0x00013500 (79104)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120420 (538051616)
 */
DefinitionBlock ("E5-1620 v2.aml", "SSDT", 1, "APPLE ", "CpuPm", 0x00013500)
{

    External (_SB_.C000, DeviceObj)
    External (_SB_.C001, DeviceObj)
    External (_SB_.C002, DeviceObj)
    External (_SB_.C003, DeviceObj)
    External (_SB_.C004, DeviceObj)
    External (_SB_.C005, DeviceObj)
    External (_SB_.C006, DeviceObj)
    External (_SB_.C007, DeviceObj)

    Scope (\_SB.C000)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store ("ssdtPRGen version....: 13.5 / Mac OS X 10.9.4 (13E28)", Debug)
            Store ("target processor.....: E5-1620 v2", Debug)
            Store ("running processor....: Intel(R) Xeon(R) CPU E5-1620 v2 @ 3.70GHz", Debug)
            Store ("baseFrequency........: 1200", Debug)
            Store ("frequency............: 3700", Debug)
            Store ("busFrequency.........: 100", Debug)
            Store ("logicalCPUs..........: 8", Debug)
            Store ("maximum TDP..........: 130", Debug)
            Store ("packageLength........: 28", Debug)
            Store ("turboStates..........: 2", Debug)
            Store ("maxTurboFrequency....: 3900", Debug)
            Store ("machdep.xcpm.mode....: 0", Debug)
        }

        Name (APLF, One)
        Name (APSN, 0x02)
        Name (APSS, Package (0x1C)
        {
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
                0x0001E87C, 
                0x0A, 
                0x0A, 
                0x2400, 
                0x2400
            }, 

            Package (0x06)
            {
                0x0DAC, 
                0x0001D581, 
                0x0A, 
                0x0A, 
                0x2300, 
                0x2300
            }, 

            Package (0x06)
            {
                0x0D48, 
                0x0001C2DD, 
                0x0A, 
                0x0A, 
                0x2200, 
                0x2200
            }, 

            Package (0x06)
            {
                0x0CE4, 
                0x0001B08F, 
                0x0A, 
                0x0A, 
                0x2100, 
                0x2100
            }, 

            Package (0x06)
            {
                0x0C80, 
                0x00019E96, 
                0x0A, 
                0x0A, 
                0x2000, 
                0x2000
            }, 

            Package (0x06)
            {
                0x0C1C, 
                0x00018CF3, 
                0x0A, 
                0x0A, 
                0x1F00, 
                0x1F00
            }, 

            Package (0x06)
            {
                0x0BB8, 
                0x00017BA3, 
                0x0A, 
                0x0A, 
                0x1E00, 
                0x1E00
            }, 

            Package (0x06)
            {
                0x0B54, 
                0x00016AA7, 
                0x0A, 
                0x0A, 
                0x1D00, 
                0x1D00
            }, 

            Package (0x06)
            {
                0x0AF0, 
                0x000159FD, 
                0x0A, 
                0x0A, 
                0x1C00, 
                0x1C00
            }, 

            Package (0x06)
            {
                0x0A8C, 
                0x000149A6, 
                0x0A, 
                0x0A, 
                0x1B00, 
                0x1B00
            }, 

            Package (0x06)
            {
                0x0A28, 
                0x000139A1, 
                0x0A, 
                0x0A, 
                0x1A00, 
                0x1A00
            }, 

            Package (0x06)
            {
                0x09C4, 
                0x000129EC, 
                0x0A, 
                0x0A, 
                0x1900, 
                0x1900
            }, 

            Package (0x06)
            {
                0x0960, 
                0x00011A87, 
                0x0A, 
                0x0A, 
                0x1800, 
                0x1800
            }, 

            Package (0x06)
            {
                0x08FC, 
                0x00010B71, 
                0x0A, 
                0x0A, 
                0x1700, 
                0x1700
            }, 

            Package (0x06)
            {
                0x0898, 
                0xFCAA, 
                0x0A, 
                0x0A, 
                0x1600, 
                0x1600
            }, 

            Package (0x06)
            {
                0x0834, 
                0xEE32, 
                0x0A, 
                0x0A, 
                0x1500, 
                0x1500
            }, 

            Package (0x06)
            {
                0x07D0, 
                0xE006, 
                0x0A, 
                0x0A, 
                0x1400, 
                0x1400
            }, 

            Package (0x06)
            {
                0x076C, 
                0xD227, 
                0x0A, 
                0x0A, 
                0x1300, 
                0x1300
            }, 

            Package (0x06)
            {
                0x0708, 
                0xC495, 
                0x0A, 
                0x0A, 
                0x1200, 
                0x1200
            }, 

            Package (0x06)
            {
                0x06A4, 
                0xB74D, 
                0x0A, 
                0x0A, 
                0x1100, 
                0x1100
            }, 

            Package (0x06)
            {
                0x0640, 
                0xAA51, 
                0x0A, 
                0x0A, 
                0x1000, 
                0x1000
            }, 

            Package (0x06)
            {
                0x05DC, 
                0x9D9E, 
                0x0A, 
                0x0A, 
                0x0F00, 
                0x0F00
            }, 

            Package (0x06)
            {
                0x0578, 
                0x9134, 
                0x0A, 
                0x0A, 
                0x0E00, 
                0x0E00
            }, 

            Package (0x06)
            {
                0x0514, 
                0x8513, 
                0x0A, 
                0x0A, 
                0x0D00, 
                0x0D00
            }, 

            Package (0x06)
            {
                0x04B0, 
                0x793A, 
                0x0A, 
                0x0A, 
                0x0C00, 
                0x0C00
            }
        })
        Method (ACST, 0, NotSerialized)
        {
            Store ("Method C000.ACST Called", Debug)
            Store ("C000 C-States    : 13", Debug)
            Return (Package (0x05)
            {
                One, 
                0x03, 
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

    Scope (\_SB.C001)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C001.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Store ("Method C001.ACST Called", Debug)
            Store ("C001 C-States    : 13", Debug)
            Return (Package (0x05)
            {
                One, 
                0x03, 
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
                    0x03E8, 
                    0x03E8
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

                    0x03, 
                    0xC6, 
                    0xC8
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

                    0x06, 
                    0xF5, 
                    0x015E
                }
            })
        }
    }

    Scope (\_SB.C002)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C002.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C003)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C003.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C004)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C004.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C005)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C005.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C006)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C006.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C007)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C007.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }
}

