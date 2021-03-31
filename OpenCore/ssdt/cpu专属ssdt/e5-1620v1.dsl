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

DefinitionBlock ("", "SSDT", 1, "APPLE ", "CpuPm", 0x00021500)
{
    External (\_SB_.SCK0.C000, DeviceObj)
    External (\_SB_.SCK0.C001, DeviceObj)
    External (\_SB_.SCK0.C002, DeviceObj)
    External (\_SB_.SCK0.C003, DeviceObj)
    External (\_SB_.SCK0.C004, DeviceObj)
    External (\_SB_.SCK0.C005, DeviceObj)
    External (\_SB_.SCK0.C006, DeviceObj)
    External (\_SB_.SCK0.C007, DeviceObj)

    Scope (\_SB_.SCK0.C000)
    {
        Method (_INI, 0, NotSerialized)
        {
            Store ("ssdtPRGen version.....: 21.5 / macOS 11.2.3 (20D91)", Debug)
            Store ("custom mode...........: 0", Debug)
            Store ("host processor........: Intel(R) Xeon(R) CPU E5-1620 0 @ 3.60GHz", Debug)
            Store ("target processor......: E5-1620", Debug)
            Store ("number of processors..: 1", Debug)
            Store ("baseFrequency.........: 1600", Debug)
            Store ("frequency.............: 3600", Debug)
            Store ("busFrequency..........: 100", Debug)
            Store ("logicalCPUs...........: 8", Debug)
            Store ("maximum TDP...........: 130", Debug)
            Store ("packageLength.........: 23", Debug)
            Store ("turboStates...........: 2", Debug)
            Store ("maxTurboFrequency.....: 3800", Debug)
            Store ("machdep.xcpm.mode.....: 0", Debug)
        }

        Name (APSN, 0x02)
        Name (APSS, Package (0x17)
        {
            /* High Frequency Modes (turbo) */
            Package (0x06) { 0x0ED8, 0x01FBD0, 0x0A, 0x0A, 0x2600, 0x2600 },
            Package (0x06) { 0x0E74, 0x01FBD0, 0x0A, 0x0A, 0x2500, 0x2500 },
            /* High Frequency Modes (non-turbo) */
            Package (0x06) { 0x0E10, 0x01FBD0, 0x0A, 0x0A, 0x2400, 0x2400 },
            Package (0x06) { 0x0DAC, 0x01E81C, 0x0A, 0x0A, 0x2300, 0x2300 },
            Package (0x06) { 0x0D48, 0x01D4C3, 0x0A, 0x0A, 0x2200, 0x2200 },
            Package (0x06) { 0x0CE4, 0x01C1C2, 0x0A, 0x0A, 0x2100, 0x2100 },
            Package (0x06) { 0x0C80, 0x01AF1A, 0x0A, 0x0A, 0x2000, 0x2000 },
            Package (0x06) { 0x0C1C, 0x019CCA, 0x0A, 0x0A, 0x1F00, 0x1F00 },
            Package (0x06) { 0x0BB8, 0x018AD0, 0x0A, 0x0A, 0x1E00, 0x1E00 },
            Package (0x06) { 0x0B54, 0x01792D, 0x0A, 0x0A, 0x1D00, 0x1D00 },
            Package (0x06) { 0x0AF0, 0x0167DF, 0x0A, 0x0A, 0x1C00, 0x1C00 },
            Package (0x06) { 0x0A8C, 0x0156E7, 0x0A, 0x0A, 0x1B00, 0x1B00 },
            Package (0x06) { 0x0A28, 0x014642, 0x0A, 0x0A, 0x1A00, 0x1A00 },
            Package (0x06) { 0x09C4, 0x0135F1, 0x0A, 0x0A, 0x1900, 0x1900 },
            Package (0x06) { 0x0960, 0x0125F3, 0x0A, 0x0A, 0x1800, 0x1800 },
            Package (0x06) { 0x08FC, 0x011646, 0x0A, 0x0A, 0x1700, 0x1700 },
            Package (0x06) { 0x0898, 0x0106EC, 0x0A, 0x0A, 0x1600, 0x1600 },
            Package (0x06) { 0x0834, 0x00F7E1, 0x0A, 0x0A, 0x1500, 0x1500 },
            Package (0x06) { 0x07D0, 0x00E927, 0x0A, 0x0A, 0x1400, 0x1400 },
            Package (0x06) { 0x076C, 0x00DABC, 0x0A, 0x0A, 0x1300, 0x1300 },
            Package (0x06) { 0x0708, 0x00CCA0, 0x0A, 0x0A, 0x1200, 0x1200 },
            Package (0x06) { 0x06A4, 0x00BED1, 0x0A, 0x0A, 0x1100, 0x1100 },
            /* Low Frequency Mode */
            Package (0x06) { 0x0640, 0x00B150, 0x0A, 0x0A, 0x1000, 0x1000 }
        })

        Method (ACST, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C000.ACST Called", Debug)
            Store ("C000 C-States    : 29", Debug)

            /* Low Power Modes for C000 */
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
    }

    Scope (\_SB_.SCK0.C001)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C001.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }
    }

    Scope (\_SB_.SCK0.C002)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C002.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }
    }

    Scope (\_SB_.SCK0.C003)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C003.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }
    }

    Scope (\_SB_.SCK0.C004)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C004.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }
    }

    Scope (\_SB_.SCK0.C005)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C005.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }
    }

    Scope (\_SB_.SCK0.C006)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C006.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }
    }

    Scope (\_SB_.SCK0.C007)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _SB_.SCK0.C007.APSS Called", Debug)

            Return (\_SB_.SCK0.C000.APSS)
        }
    }
}
