/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140210-00 [Feb 10 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000036A (874)
 *     Revision         0x01
 *     Checksum         0x00
 *     OEM ID           "APPLE "
 *     OEM Table ID     "CpuPm"
 *     OEM Revision     0x00021500 (136448)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20140210 (538182160)
 */

DefinitionBlock ("E5-2650 v2.aml", "SSDT", 1, "APPLE ", "CpuPm", 0x00021500)
{
    External (\_SB_.SCK0.C000, DeviceObj)
    External (\_SB_.SCK0.C001, DeviceObj)
    External (\_SB_.SCK0.C002, DeviceObj)
    External (\_SB_.SCK0.C003, DeviceObj)
    External (\_SB_.SCK0.C004, DeviceObj)
    External (\_SB_.SCK0.C005, DeviceObj)
    External (\_SB_.SCK0.C006, DeviceObj)
    External (\_SB_.SCK0.C007, DeviceObj)
    External (\_SB_.SCK0.C008, DeviceObj)
    External (\_SB_.SCK0.C009, DeviceObj)
    External (\_SB_.SCK0.C00A, DeviceObj)
    External (\_SB_.SCK0.C00B, DeviceObj)
    External (\_SB_.SCK0.C00C, DeviceObj)
    External (\_SB_.SCK0.C00D, DeviceObj)
    External (\_SB_.SCK0.C00E, DeviceObj)
    External (\_SB_.SCK0.C00F, DeviceObj)

    Scope (\_SB_.SCK0.C000)
    {
        Method (_INI, 0, NotSerialized)
        {
            Store ("ssdtPRGen version.....: 21.5 / macOS 11.2.3 (20D91)", Debug)
            Store ("custom mode...........: 0", Debug)
            Store ("host processor........: Intel(R) Xeon(R) CPU E5-2650 v2 @ 2.60GHz", Debug)
            Store ("target processor......: E5-2650 v2", Debug)
            Store ("number of processors..: 1", Debug)
            Store ("baseFrequency.........: 1200", Debug)
            Store ("frequency.............: 2600", Debug)
            Store ("busFrequency..........: 100", Debug)
            Store ("logicalCPUs...........: 16", Debug)
            Store ("maximum TDP...........: 95", Debug)
            Store ("packageLength.........: 23", Debug)
            Store ("turboStates...........: 8", Debug)
            Store ("maxTurboFrequency.....: 3400", Debug)
            Store ("CPU Workarounds.......: 2", Debug)
            Store ("machdep.xcpm.mode.....: 0", Debug)
        }

        Name (APLF, 0x05)
        Name (APSN, 0x08)
        Name (APSS, Package (0x1C)
        {
            /* High Frequency Modes (turbo) */
            Package (0x06) { 0x0D48, 0x017318, 0x0A, 0x0A, 0x2200, 0x2200 },
            Package (0x06) { 0x0CE4, 0x017318, 0x0A, 0x0A, 0x2100, 0x2100 },
            Package (0x06) { 0x0C80, 0x017318, 0x0A, 0x0A, 0x2000, 0x2000 },
            Package (0x06) { 0x0C1C, 0x017318, 0x0A, 0x0A, 0x1F00, 0x1F00 },
            Package (0x06) { 0x0BB8, 0x017318, 0x0A, 0x0A, 0x1E00, 0x1E00 },
            Package (0x06) { 0x0B54, 0x017318, 0x0A, 0x0A, 0x1D00, 0x1D00 },
            Package (0x06) { 0x0AF0, 0x017318, 0x0A, 0x0A, 0x1C00, 0x1C00 },
            Package (0x06) { 0x0A8C, 0x017318, 0x0A, 0x0A, 0x1B00, 0x1B00 },
            /* High Frequency Modes (non-turbo) */
            Package (0x06) { 0x0A28, 0x017318, 0x0A, 0x0A, 0x1A00, 0x1A00 },
            Package (0x06) { 0x09C4, 0x0160C6, 0x0A, 0x0A, 0x1900, 0x1900 },
            Package (0x06) { 0x0960, 0x014ECE, 0x0A, 0x0A, 0x1800, 0x1800 },
            Package (0x06) { 0x08FC, 0x013D2D, 0x0A, 0x0A, 0x1700, 0x1700 },
            Package (0x06) { 0x0898, 0x012BE3, 0x0A, 0x0A, 0x1600, 0x1600 },
            Package (0x06) { 0x0834, 0x011AF0, 0x0A, 0x0A, 0x1500, 0x1500 },
            Package (0x06) { 0x07D0, 0x010A53, 0x0A, 0x0A, 0x1400, 0x1400 },
            Package (0x06) { 0x076C, 0x00FA0A, 0x0A, 0x0A, 0x1300, 0x1300 },
            Package (0x06) { 0x0708, 0x00EA15, 0x0A, 0x0A, 0x1200, 0x1200 },
            Package (0x06) { 0x06A4, 0x00DA74, 0x0A, 0x0A, 0x1100, 0x1100 },
            Package (0x06) { 0x0640, 0x00CB26, 0x0A, 0x0A, 0x1000, 0x1000 },
            Package (0x06) { 0x05DC, 0x00BC2A, 0x0A, 0x0A, 0x0F00, 0x0F00 },
            Package (0x06) { 0x0578, 0x00AD80, 0x0A, 0x0A, 0x0E00, 0x0E00 },
            Package (0x06) { 0x0514, 0x009F25, 0x0A, 0x0A, 0x0D00, 0x0D00 },
            /* Low Frequency Mode */
            Package (0x06) { 0x04B0, 0x00911B, 0x0A, 0x0A, 0x0C00, 0x0C00 },
            Package (0x06) { 0x044C,     Zero, 0x0A, 0x0A, 0x0B00, 0x0B00 },
            Package (0x06) { 0x03E8,     Zero, 0x0A, 0x0A, 0x0A00, 0x0A00 },
            Package (0x06) { 0x0384,     Zero, 0x0A, 0x0A, 0x0900, 0x0900 },
            Package (0x06) { 0x0320,     Zero, 0x0A, 0x0A, 0x0800, 0x0800 },
            /* CPU Workaround #2 */
            Package (0x06) { 0x02BC,     Zero, 0x0A, 0x0A, 0x0700, 0x0700 }
        })

        Method (ACST, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C000.ACST Called", Debug)
            Store ("C000 C-States    : 13", Debug)

            /* Low Power Modes for C000 */
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

        Method (_DSM, 4, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C000._DSM Called", Debug)

            If (LEqual (Arg2, Zero))
            {
                Return (Buffer (One)
                {
                    0x03
                })
            }

            Return (Package (0x02)
            {
                "plugin-type",
                One
            })
        }
    }

    Scope (\_SB_.SCK0.C001)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C001.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C001.ACST Called", Debug)
            Store ("C001 C-States    : 13", Debug)

            /* Low Power Modes for C001 */
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

    Scope (\_SB_.SCK0.C002)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C002.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_SB_.SCK0.C001.ACST ()) }
    }

    Scope (\_SB_.SCK0.C003)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C003.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_SB_.SCK0.C001.ACST ()) }
    }

    Scope (\_SB_.SCK0.C004)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C004.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_SB_.SCK0.C001.ACST ()) }
    }

    Scope (\_SB_.SCK0.C005)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C005.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_SB_.SCK0.C001.ACST ()) }
    }

    Scope (\_SB_.SCK0.C006)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C006.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_SB_.SCK0.C001.ACST ()) }
    }

    Scope (\_SB_.SCK0.C007)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C007.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_SB_.SCK0.C001.ACST ()) }
    }

    Scope (\_SB_.SCK0.C008)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C008.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_SB_.SCK0.C001.ACST ()) }
    }

    Scope (\_SB_.SCK0.C009)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C009.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_SB_.SCK0.C001.ACST ()) }
    }

    Scope (\_SB_.SCK0.C00A)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C00A.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_SB_.SCK0.C001.ACST ()) }
    }

    Scope (\_SB_.SCK0.C00B)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C00B.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_SB_.SCK0.C001.ACST ()) }
    }

    Scope (\_SB_.SCK0.C00C)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C00C.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_SB_.SCK0.C001.ACST ()) }
    }

    Scope (\_SB_.SCK0.C00D)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C00D.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_SB_.SCK0.C001.ACST ()) }
    }

    Scope (\_SB_.SCK0.C00E)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C00E.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_SB_.SCK0.C001.ACST ()) }
    }

    Scope (\_SB_.SCK0.C00F)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C00F.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_SB_.SCK0.C001.ACST ()) }
    }
}
