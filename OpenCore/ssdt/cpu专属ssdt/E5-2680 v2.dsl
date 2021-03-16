/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140926-64 [Nov  6 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of SSDT-1.aml, Tue Mar 16 14:19:23 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000C48 (3144)
 *     Revision         0x01
 *     Checksum         0xC2
 *     OEM ID           "APPLE "
 *     OEM Table ID     "CpuPm"
 *     OEM Revision     0x00013500 (79104)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120420 (538051616)
 */
DefinitionBlock ("E5-2680 v2.aml", "SSDT", 1, "APPLE ", "CpuPm", 0x00013500)
{

    External (_SB_.C000, DeviceObj)
    External (_SB_.C001, DeviceObj)
    External (_SB_.C002, DeviceObj)
    External (_SB_.C003, DeviceObj)
    External (_SB_.C004, DeviceObj)
    External (_SB_.C005, DeviceObj)
    External (_SB_.C006, DeviceObj)
    External (_SB_.C007, DeviceObj)
    External (_SB_.C008, DeviceObj)
    External (_SB_.C009, DeviceObj)
    External (_SB_.C00A, DeviceObj)
    External (_SB_.C00B, DeviceObj)
    External (_SB_.C00C, DeviceObj)
    External (_SB_.C00D, DeviceObj)
    External (_SB_.C00E, DeviceObj)
    External (_SB_.C00F, DeviceObj)
    External (_SB_.C010, DeviceObj)
    External (_SB_.C011, DeviceObj)
    External (_SB_.C012, DeviceObj)
    External (_SB_.C013, DeviceObj)

    Scope (\_SB.C000)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store ("ssdtPRGen version....: 13.5 / Mac OS X 10.9.2 (13C64)", Debug)
            Store ("target processor.....: E5-2680 v2", Debug)
            Store ("running processor....: Intel(R) Xeon(R) CPU E5-2680 v2 @ 2.80GHz", Debug)
            Store ("baseFrequency........: 1200", Debug)
            Store ("frequency............: 2800", Debug)
            Store ("busFrequency.........: 100", Debug)
            Store ("logicalCPUs..........: 20", Debug)
            Store ("maximum TDP..........: 115", Debug)
            Store ("packageLength........: 25", Debug)
            Store ("turboStates..........: 8", Debug)
            Store ("maxTurboFrequency....: 3600", Debug)
            Store ("machdep.xcpm.mode....: 0", Debug)
        }

        Name (APLF, One)
        Name (APSN, 0x08)
        Name (APSS, Package (0x19)
        {
            Package (0x06)
            {
                0x0E10, 
                0x0001C138, 
                0x0A, 
                0x0A, 
                0x2400, 
                0x2400
            }, 

            Package (0x06)
            {
                0x0DAC, 
                0x0001C138, 
                0x0A, 
                0x0A, 
                0x2300, 
                0x2300
            }, 

            Package (0x06)
            {
                0x0D48, 
                0x0001C138, 
                0x0A, 
                0x0A, 
                0x2200, 
                0x2200
            }, 

            Package (0x06)
            {
                0x0CE4, 
                0x0001C138, 
                0x0A, 
                0x0A, 
                0x2100, 
                0x2100
            }, 

            Package (0x06)
            {
                0x0C80, 
                0x0001C138, 
                0x0A, 
                0x0A, 
                0x2000, 
                0x2000
            }, 

            Package (0x06)
            {
                0x0C1C, 
                0x0001C138, 
                0x0A, 
                0x0A, 
                0x1F00, 
                0x1F00
            }, 

            Package (0x06)
            {
                0x0BB8, 
                0x0001C138, 
                0x0A, 
                0x0A, 
                0x1E00, 
                0x1E00
            }, 

            Package (0x06)
            {
                0x0B54, 
                0x0001C138, 
                0x0A, 
                0x0A, 
                0x1D00, 
                0x1D00
            }, 

            Package (0x06)
            {
                0x0AF0, 
                0x0001C138, 
                0x0A, 
                0x0A, 
                0x1C00, 
                0x1C00
            }, 

            Package (0x06)
            {
                0x0A8C, 
                0x0001AC44, 
                0x0A, 
                0x0A, 
                0x1B00, 
                0x1B00
            }, 

            Package (0x06)
            {
                0x0A28, 
                0x000197B4, 
                0x0A, 
                0x0A, 
                0x1A00, 
                0x1A00
            }, 

            Package (0x06)
            {
                0x09C4, 
                0x00018387, 
                0x0A, 
                0x0A, 
                0x1900, 
                0x1900
            }, 

            Package (0x06)
            {
                0x0960, 
                0x00016FBD, 
                0x0A, 
                0x0A, 
                0x1800, 
                0x1800
            }, 

            Package (0x06)
            {
                0x08FC, 
                0x00015C54, 
                0x0A, 
                0x0A, 
                0x1700, 
                0x1700
            }, 

            Package (0x06)
            {
                0x0898, 
                0x0001494D, 
                0x0A, 
                0x0A, 
                0x1600, 
                0x1600
            }, 

            Package (0x06)
            {
                0x0834, 
                0x000136A5, 
                0x0A, 
                0x0A, 
                0x1500, 
                0x1500
            }, 

            Package (0x06)
            {
                0x07D0, 
                0x0001245C, 
                0x0A, 
                0x0A, 
                0x1400, 
                0x1400
            }, 

            Package (0x06)
            {
                0x076C, 
                0x00011272, 
                0x0A, 
                0x0A, 
                0x1300, 
                0x1300
            }, 

            Package (0x06)
            {
                0x0708, 
                0x000100E6, 
                0x0A, 
                0x0A, 
                0x1200, 
                0x1200
            }, 

            Package (0x06)
            {
                0x06A4, 
                0xEFB6, 
                0x0A, 
                0x0A, 
                0x1100, 
                0x1100
            }, 

            Package (0x06)
            {
                0x0640, 
                0xDEE2, 
                0x0A, 
                0x0A, 
                0x1000, 
                0x1000
            }, 

            Package (0x06)
            {
                0x05DC, 
                0xCE6A, 
                0x0A, 
                0x0A, 
                0x0F00, 
                0x0F00
            }, 

            Package (0x06)
            {
                0x0578, 
                0xBE4B, 
                0x0A, 
                0x0A, 
                0x0E00, 
                0x0E00
            }, 

            Package (0x06)
            {
                0x0514, 
                0xAE87, 
                0x0A, 
                0x0A, 
                0x0D00, 
                0x0D00
            }, 

            Package (0x06)
            {
                0x04B0, 
                0x9F1B, 
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

    Scope (\_SB.C008)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C008.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C009)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C009.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C00A)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C00A.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C00B)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C00B.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C00C)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C00C.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C00D)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C00D.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C00E)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C00E.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C00F)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C00F.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C010)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C010.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C011)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C011.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C012)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C012.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }

    Scope (\_SB.C013)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.C013.APSS Called", Debug)
            Return (\_SB.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Return (\_SB.C001.ACST ())
        }
    }
}

