/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210604 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Users/wumingquan/Desktop/dsdt/0628/DSDT.aml, Mon Aug  2 22:18:34 2021
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00008AD9 (35545)
 *     Revision         0x02
 *     Checksum         0xCA
 *     OEM ID           "ALASKA"
 *     OEM Table ID     "A M I"
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20051117 (537202967)
 */
DefinitionBlock ("", "DSDT", 2, "ALASKA", "A M I", 0x00000001)
{
    Name (SP1O, 0x2E)
    Name (IO1B, 0x0A00)
    Name (IO1L, 0x10)
    Name (IO2B, 0x0A10)
    Name (IO2L, 0x10)
    Name (IO3B, 0x0A20)
    Name (IO3L, 0x10)
    Name (TCBR, 0xFED08000)
    Name (TCLT, 0x1000)
    Name (SRCB, 0xFED1C000)
    Name (SRCL, 0x4000)
    Name (SUSW, 0xFF)
    Name (PMLN, 0x80)
    Name (SMIP, 0xB2)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x00100000)
    Name (PM30, 0x0430)
    Name (SMBS, 0x1180)
    Name (SMBL, 0x20)
    Name (HPTB, 0xFED00000)
    Name (HPTC, 0xFED1F404)
    Name (GPBS, 0x0500)
    Name (GPLN, 0x80)
    Name (PEBS, 0x80000000)
    Name (LAPB, 0xFEE00000)
    Name (VTD0, 0xFFFFFFFF)
    Name (ACPH, 0xDE)
    Name (ASSB, Zero)
    Name (AOTB, Zero)
    Name (AAXB, Zero)
    Name (HIDK, 0x0303D041)
    Name (HIDM, 0x030FD041)
    Name (CIDK, 0x0B03D041)
    Name (CIDM, 0x130FD041)
    Name (PEHP, One)
    Name (SHPC, Zero)
    Name (PEPM, One)
    Name (PECS, One)
    Name (ITKE, Zero)
    Name (MBEC, 0xFFFF)
    Name (SRSI, 0xB2)
    Name (CSMI, 0x61)
    Name (PMBS, 0x0400)
    Name (SMIA, 0xB2)
    Name (SMIB, 0xB3)
    Name (OFST, 0x35)
    Name (TRST, 0x02)
    Name (TPMF, Zero)
    Name (TCMF, Zero)
    Name (TMF1, Zero)
    Name (TMF2, Zero)
    Name (TMF3, Zero)
    Name (WHEA, One)
    Name (DSSP, Zero)
    Name (FHPP, Zero)
    Name (PEER, One)
    Name (PICM, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        If (Arg0)
        {
            DBG8 = 0xAA
        }
        Else
        {
            DBG8 = 0xAC
        }

        PICM = Arg0
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        If ((OSVR != Ones))
        {
            Return (OSVR) /* \OSVR */
        }

        If ((PICM == Zero))
        {
            DBG8 = 0xAC
        }

        OSVR = 0x03
        If (CondRefOf (_OSI))
        {
            If (_OSI ("Windows 2001"))
            {
                OSVR = 0x04
            }

            If (_OSI ("Windows 2001.1"))
            {
                OSVR = 0x05
            }

            If (_OSI ("FreeBSD"))
            {
                OSVR = 0x06
            }

            If (_OSI ("HP-UX"))
            {
                OSVR = 0x07
            }

            If (_OSI ("OpenVMS"))
            {
                OSVR = 0x08
            }

            If (_OSI ("Windows 2001 SP1"))
            {
                OSVR = 0x09
            }

            If (_OSI ("Windows 2001 SP2"))
            {
                OSVR = 0x0A
            }

            If (_OSI ("Windows 2001 SP3"))
            {
                OSVR = 0x0B
            }

            If (_OSI ("Windows 2006"))
            {
                OSVR = 0x0C
            }

            If (_OSI ("Windows 2006 SP1"))
            {
                OSVR = 0x0D
            }

            If (_OSI ("Windows 2009"))
            {
                OSVR = 0x0E
            }

            If (_OSI ("Windows 2012"))
            {
                OSVR = 0x0F
            }

            If (_OSI ("Windows 2013"))
            {
                OSVR = 0x10
            }
        }
        Else
        {
            If (MCTH (_OS, "Microsoft Windows NT"))
            {
                OSVR = Zero
            }

            If (MCTH (_OS, "Microsoft Windows"))
            {
                OSVR = One
            }

            If (MCTH (_OS, "Microsoft WindowsME: Millennium Edition"))
            {
                OSVR = 0x02
            }

            If (MCTH (_OS, "Linux"))
            {
                OSVR = 0x03
            }

            If (MCTH (_OS, "FreeBSD"))
            {
                OSVR = 0x06
            }

            If (MCTH (_OS, "HP-UX"))
            {
                OSVR = 0x07
            }

            If (MCTH (_OS, "OpenVMS"))
            {
                OSVR = 0x08
            }
        }

        Return (OSVR) /* \OSVR */
    }

    Method (MCTH, 2, NotSerialized)
    {
        If ((SizeOf (Arg0) < SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Local0 = (SizeOf (Arg0) + One)
        Name (BUF0, Buffer (Local0){})
        Name (BUF1, Buffer (Local0){})
        BUF0 = Arg0
        BUF1 = Arg1
        While (Local0)
        {
            Local0--
            If ((DerefOf (BUF0 [Local0]) != DerefOf (BUF1 [Local0]
                )))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        PRWP [Zero] = Arg0
        Local0 = (SS1 << One)
        Local0 |= (SS2 << 0x02)
        Local0 |= (SS3 << 0x03)
        Local0 |= (SS4 << 0x04)
        If (((One << Arg1) & Local0))
        {
            PRWP [One] = Arg1
        }
        Else
        {
            Local0 >>= One
            If (((OSFL () == One) || (OSFL () == 0x02)))
            {
                FindSetLeftBit (Local0, PRWP [One])
            }
            Else
            {
                FindSetRightBit (Local0, PRWP [One])
            }
        }

        Return (PRWP) /* \PRWP */
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    OperationRegion (DEB0, SystemIO, 0x80, One)
    Field (DEB0, ByteAcc, NoLock, Preserve)
    {
        DBG8,   8
    }

    OperationRegion (DEB1, SystemIO, 0x90, 0x02)
    Field (DEB1, WordAcc, NoLock, Preserve)
    {
        DBG9,   16
    }

    Name (SS1, One)
    Name (SS2, Zero)
    Name (SS3, One)
    Name (SS4, One)
    Name (IOST, 0xFFFF)
    Name (TOPM, 0x000FFFFF)
    Name (ROMS, 0xFFE00000)
    Name (VGAF, One)
    Scope (_SB)
    {
        Name (PR00, Package (0x26)
        {
            Package (0x04)
            {
                0x001FFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR00, Package (0x26)
        {
            Package (0x04)
            {
                0x001FFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                Zero, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x18
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x19
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x19
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x19
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x1A
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x1C
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                Zero, 
                0x1D
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                Zero, 
                0x1E
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x20
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                Zero, 
                0x24
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                Zero, 
                0x25
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                Zero, 
                0x26
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                Zero, 
                0x2F
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                Zero, 
                0x2C
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                Zero, 
                0x2D
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                Zero, 
                0x2E
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                Zero, 
                0x1F
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                Zero, 
                0x27
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x02, 
                Zero, 
                0x1F
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x03, 
                Zero, 
                0x27
            }
        })
        Name (PR09, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR09, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR01, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR01, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR02, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR02, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR08, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, 
                Zero
            }
        })
        Name (AR08, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR17, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR17, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x28
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x2C
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x2D
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x2E
            }
        })
        Name (PR13, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR13, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x20
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x24
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x25
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x26
            }
        })
        Name (PR12, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR12, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x1B
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x1E
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x1C
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x1D
            }
        })
        Name (PR97, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR97, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x40
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x44
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x45
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x46
            }
        })
        Name (PRSA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,6,7,10,11,12,14,15}
        })
        Alias (PRSA, PRSB)
        Name (PRSC, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,6,10,11,12,14,15}
        })
        Alias (PRSC, PRSD)
        Alias (PRSA, PRSE)
        Alias (PRSA, PRSF)
        Alias (PRSA, PRSG)
        Alias (PRSA, PRSH)
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
            {
                Return (BN00 ())
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    Return (AR00) /* \_SB_.AR00 */
                }

                Return (PR00) /* \_SB_.PR00 */
            }

            Name (CPRB, Zero)
            Name (LVGA, 0x55)
            Name (STAV, 0x0F)
            Name (BRB, 0x0100)
            Name (BRL, 0x0100)
            Name (IOB, 0x0100)
            Name (IOL, 0x0100)
            Name (MBB, 0x00010000)
            Name (MBL, 0x00010000)
            Name (MABL, 0x00010000)
            Name (MABH, 0x00010000)
            Name (MALL, 0x00010000)
            Name (MALH, 0x00010000)
            Name (MAML, 0x00010000)
            Name (MAMH, 0x00010000)
            Name (CRS1, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x007F,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y00)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x03AF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x03B0,             // Length
                    ,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x03E0,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0918,             // Length
                    ,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y02, TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0x0FFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0300,             // Length
                    ,, _Y01, TypeStatic, DenseTranslation)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x02000000,         // Range Minimum
                    0xFFDFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFDE00000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
            })
            Name (CRS2, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0080,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y06)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y08, TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y07, TypeStatic, DenseTranslation)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x80000000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x80000000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y0B, AddressRangeMemory, TypeStatic)
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (STAV) /* \_SB_.PCI0.STAV */
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                If (CPRB)
                {
                    CreateWordField (CRS1, \_SB.PCI0._Y00._MIN, MIN0)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y00._MAX, MAX0)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y00._LEN, LEN0)  // _LEN: Length
                    MIN0 = BRB /* \_SB_.PCI0.BRB_ */
                    LEN0 = BRL /* \_SB_.PCI0.BRL_ */
                    Local0 = LEN0 /* \_SB_.PCI0._CRS.LEN0 */
                    MAX0 = (MIN0 + Local0--)
                    CreateWordField (CRS1, \_SB.PCI0._Y01._MIN, MIN1)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y01._MAX, MAX1)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y01._LEN, LEN1)  // _LEN: Length
                    If ((IOB == 0x1000))
                    {
                        Local0 = IOL /* \_SB_.PCI0.IOL_ */
                        MAX1 = (IOB + Local0--)
                        Local0 = (MAX1 - MIN1) /* \_SB_.PCI0._CRS.MIN1 */
                        LEN1 = (Local0 + One)
                    }
                    Else
                    {
                        MIN1 = IOB /* \_SB_.PCI0.IOB_ */
                        LEN1 = IOL /* \_SB_.PCI0.IOL_ */
                        Local0 = LEN1 /* \_SB_.PCI0._CRS.LEN1 */
                        MAX1 = (MIN1 + Local0--)
                    }

                    If (((LVGA == One) || (LVGA == 0x55)))
                    {
                        If (VGAF)
                        {
                            CreateWordField (CRS1, \_SB.PCI0._Y02._MIN, IMN1)  // _MIN: Minimum Base Address
                            CreateWordField (CRS1, \_SB.PCI0._Y02._MAX, IMX1)  // _MAX: Maximum Base Address
                            CreateWordField (CRS1, \_SB.PCI0._Y02._LEN, ILN1)  // _LEN: Length
                            IMN1 = 0x03B0
                            IMX1 = 0x03DF
                            ILN1 = 0x30
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._MIN, VMN1)  // _MIN: Minimum Base Address
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._MAX, VMX1)  // _MAX: Maximum Base Address
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._LEN, VLN1)  // _LEN: Length
                            VMN1 = 0x000A0000
                            VMX1 = 0x000BFFFF
                            VLN1 = 0x00020000
                            VGAF = Zero
                        }
                    }

                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MIN, MIN3)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MAX, MAX3)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._LEN, LEN3)  // _LEN: Length
                    MIN3 = MBB /* \_SB_.PCI0.MBB_ */
                    LEN3 = MBL /* \_SB_.PCI0.MBL_ */
                    Local0 = LEN3 /* \_SB_.PCI0._CRS.LEN3 */
                    MAX3 = (MIN3 + Local0--)
                    If ((MALH || MALL))
                    {
                        CreateQWordField (CRS1, \_SB.PCI0._Y05._MIN, MN8L)  // _MIN: Minimum Base Address
                        Local0 = (0xB4 + 0x04)
                        CreateDWordField (CRS1, Local0, MN8H)
                        MN8L = MABL /* \_SB_.PCI0.MABL */
                        MN8H = MABH /* \_SB_.PCI0.MABH */
                        CreateQWordField (CRS1, \_SB.PCI0._Y05._MAX, MX8L)  // _MAX: Maximum Base Address
                        Local1 = (0xBC + 0x04)
                        CreateDWordField (CRS1, Local1, MX8H)
                        CreateQWordField (CRS1, \_SB.PCI0._Y05._LEN, LN8L)  // _LEN: Length
                        Local2 = (0xCC + 0x04)
                        CreateDWordField (CRS1, Local2, LN8H)
                        MN8L = MABL /* \_SB_.PCI0.MABL */
                        MN8H = MABH /* \_SB_.PCI0.MABH */
                        LN8L = MALL /* \_SB_.PCI0.MALL */
                        LN8H = MALH /* \_SB_.PCI0.MALH */
                        MX8L = MAML /* \_SB_.PCI0.MAML */
                        MX8H = MAMH /* \_SB_.PCI0.MAMH */
                    }

                    Return (CRS1) /* \_SB_.PCI0.CRS1 */
                }
                Else
                {
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MIN, MIN2)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MAX, MAX2)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y06._LEN, LEN2)  // _LEN: Length
                    MIN2 = BRB /* \_SB_.PCI0.BRB_ */
                    LEN2 = BRL /* \_SB_.PCI0.BRL_ */
                    Local1 = LEN2 /* \_SB_.PCI0._CRS.LEN2 */
                    MAX2 = (MIN2 + Local1--)
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MIN, MIN4)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MAX, MAX4)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y07._LEN, LEN4)  // _LEN: Length
                    MIN4 = IOB /* \_SB_.PCI0.IOB_ */
                    LEN4 = IOL /* \_SB_.PCI0.IOL_ */
                    Local1 = LEN4 /* \_SB_.PCI0._CRS.LEN4 */
                    MAX4 = (MIN4 + Local1--)
                    If (LVGA)
                    {
                        CreateWordField (CRS2, \_SB.PCI0._Y08._MIN, IMN2)  // _MIN: Minimum Base Address
                        CreateWordField (CRS2, \_SB.PCI0._Y08._MAX, IMX2)  // _MAX: Maximum Base Address
                        CreateWordField (CRS2, \_SB.PCI0._Y08._LEN, ILN2)  // _LEN: Length
                        IMN2 = 0x03B0
                        IMX2 = 0x03DF
                        ILN2 = 0x30
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MIN, VMN2)  // _MIN: Minimum Base Address
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MAX, VMX2)  // _MAX: Maximum Base Address
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._LEN, VLN2)  // _LEN: Length
                        VMN2 = 0x000A0000
                        VMX2 = 0x000BFFFF
                        VLN2 = 0x00020000
                    }

                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._MIN, MIN5)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._MAX, MAX5)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._LEN, LEN5)  // _LEN: Length
                    MIN5 = MBB /* \_SB_.PCI0.MBB_ */
                    LEN5 = MBL /* \_SB_.PCI0.MBL_ */
                    Local1 = LEN5 /* \_SB_.PCI0._CRS.LEN5 */
                    MAX5 = (MIN5 + Local1--)
                    If ((MALH || MALL))
                    {
                        CreateQWordField (CRS2, \_SB.PCI0._Y0B._MIN, MN9L)  // _MIN: Minimum Base Address
                        Local0 = (0x72 + 0x04)
                        CreateDWordField (CRS2, Local0, MN9H)
                        CreateQWordField (CRS2, \_SB.PCI0._Y0B._MAX, MX9L)  // _MAX: Maximum Base Address
                        Local1 = (0x7A + 0x04)
                        CreateDWordField (CRS2, Local1, MX9H)
                        CreateQWordField (CRS2, \_SB.PCI0._Y0B._LEN, LN9L)  // _LEN: Length
                        Local2 = (0x8A + 0x04)
                        CreateDWordField (CRS2, Local2, LN9H)
                        MN9L = MABL /* \_SB_.PCI0.MABL */
                        MN9H = MABH /* \_SB_.PCI0.MABH */
                        LN9L = MALL /* \_SB_.PCI0.MALL */
                        LN9H = MALH /* \_SB_.PCI0.MALH */
                        MX9L = MAML /* \_SB_.PCI0.MAML */
                        MX9H = MAMH /* \_SB_.PCI0.MAMH */
                    }

                    Return (CRS2) /* \_SB_.PCI0.CRS2 */
                }
            }

            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                Name (SUPP, Zero)
                Name (CTRL, Zero)
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0x1E
                    }

                    If (!PEHP)
                    {
                        CTRL &= 0x1E
                    }

                    If (!SHPC)
                    {
                        CTRL &= 0x1D
                    }

                    If (!PEPM)
                    {
                        CTRL &= 0x1B
                    }

                    If (!PEER)
                    {
                        CTRL &= 0x15
                    }

                    If (!PECS)
                    {
                        CTRL &= 0x0F
                    }

                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI0._OSC.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }

            Name (_PXM, Zero)  // _PXM: Device Proximity
            Device (IOH)
            {
                Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                Name (_UID, 0x0A)  // _UID: Unique ID
                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    Memory32Fixed (ReadWrite,
                        0xFC000000,         // Address Base
                        0x01000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFD000000,         // Address Base
                        0x01000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFE000000,         // Address Base
                        0x00B00000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEB00000,         // Address Base
                        0x00100000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED00400,         // Address Base
                        0x0003FC00,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED45000,         // Address Base
                        0x000BB000,         // Address Length
                        )
                })
            }

            Method (NPTS, 1, NotSerialized)
            {
            }

            Method (NWAK, 1, NotSerialized)
            {
            }

            Device (^UNC0)
            {

                Method (_UID, 0, NotSerialized)  // _UID: Unique ID
                {
                    Local0 = (^^PCI0.BRB + ^^PCI0.BRL) /* \_SB_.PCI0.BRL_ */
                    Return (Local0)
                }

                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                {
                    Local0 = (^^PCI0.BRB + ^^PCI0.BRL) /* \_SB_.PCI0.BRL_ */
                    Return (Local0)
                }

                Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
                {
                    Return (Arg3)
                }

                Name (_ADR, Zero)  // _ADR: Address
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Name (CRS1, ResourceTemplate ()
                {
                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                        0x0000,             // Granularity
                        0x00FF,             // Range Minimum
                        0x00FF,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0001,             // Length
                        ,, _Y0C)
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Local0 = (^^PCI0.BRB + ^^PCI0.BRL) /* \_SB_.PCI0.BRL_ */
                    CreateWordField (CRS1, \_SB.UNC0._Y0C._MIN, UMIN)  // _MIN: Minimum Base Address
                    UMIN = Local0
                    CreateWordField (CRS1, \_SB.UNC0._Y0C._MAX, UMAX)  // _MAX: Maximum Base Address
                    UMAX = Local0
                    Return (CRS1) /* \_SB_.UNC0.CRS1 */
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                     If (_OSI ("Darwin"))
                    {
                           Return (Zero)
                    }
                    Else
                    {
                    Return (^^PCI0.STAV) /* \_SB_.PCI0.STAV */
                }
            }
         }

            Device (VTDR)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_UID, 0x04)  // _UID: Unique ID
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadOnly,
                        0x00000000,         // Address Base
                        0x00002000,         // Address Length
                        _Y0D)
                })
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((VTD0 == 0xFFFFFFFF))
                    {
                        Return (Zero)
                    }

                    Return (0x0F)
                }

                Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (BUF0, \_SB.PCI0.VTDR._Y0D._BAS, VBR0)  // _BAS: Base Address
                    CreateDWordField (BUF0, \_SB.PCI0.VTDR._Y0D._LEN, VLT0)  // _LEN: Length
                    VBR0 = VTD0 /* \VTD0 */
                    If ((VTD0 == 0xFFFFFFFF))
                    {
                        VLT0 = Zero
                    }

                    Return (BUF0) /* \_SB_.PCI0.VTDR.BUF0 */
                }
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                Method (SPTS, 1, NotSerialized)
                {
                    PS1S = One
                    PS1E = One
                    SLPS = One
                }

                Method (SWAK, 1, NotSerialized)
                {
                    SLPS = Zero
                    PS1E = Zero
                    If (RTCS){}
                    Else
                    {
                        Notify (PWRB, 0x02) // Device Wake
                    }
                }

                OperationRegion (SMIE, SystemIO, PM30, 0x08)
                Field (SMIE, ByteAcc, NoLock, Preserve)
                {
                        ,   4, 
                    PS1E,   1, 
                        ,   31, 
                    PS1S,   1, 
                    Offset (0x08)
                }

                Scope (\_SB)
                {
                    Name (SLPS, Zero)
                    OperationRegion (PMS0, SystemIO, PMBS, 0x04)
                    Field (PMS0, ByteAcc, NoLock, Preserve)
                    {
                            ,   10, 
                        RTCS,   1, 
                            ,   3, 
                        PEXS,   1, 
                        WAKS,   1, 
                        Offset (0x03), 
                        PWBT,   1, 
                        Offset (0x04)
                    }

                    Device (SLPB)
                    {
                        Name (_HID, EisaId ("PNP0C0E") /* Sleep Button Device */)  // _HID: Hardware ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If ((SUSW != 0xFF))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                        {
                            If ((SUSW != 0xFF))
                            {
                                Return (Package (0x02)
                                {
                                    SUSW, 
                                    0x04
                                })
                            }
                            Else
                            {
                                Return (Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                })
                            }
                        }
                    }
                }

                Scope (\_SB)
                {
                    Scope (PCI0)
                    {
                        Device (PCH)
                        {
                            Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                            Name (_UID, 0x01C7)  // _UID: Unique ID
                            Name (_STA, 0x0F)  // _STA: Status
                            Name (ICHR, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y0E)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y0F)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y10)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y11)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y13)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y12)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y14)
                                Memory32Fixed (ReadWrite,
                                    0xFF000000,         // Address Base
                                    0x01000000,         // Address Length
                                    )
                            })
                            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                            {
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y0E._MIN, PBB)  // _MIN: Minimum Base Address
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y0E._MAX, PBH)  // _MAX: Maximum Base Address
                                CreateByteField (ICHR, \_SB.PCI0.PCH._Y0E._LEN, PML)  // _LEN: Length
                                PBB = PMBS /* \PMBS */
                                PBH = PMBS /* \PMBS */
                                PML = 0x54
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y0F._MIN, P2B)  // _MIN: Minimum Base Address
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y0F._MAX, P2H)  // _MAX: Maximum Base Address
                                CreateByteField (ICHR, \_SB.PCI0.PCH._Y0F._LEN, P2L)  // _LEN: Length
                                P2B = (PMBS + 0x58)
                                P2H = (PMBS + 0x58)
                                P2L = 0x28
                                If (SMBS)
                                {
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y10._MIN, SMB)  // _MIN: Minimum Base Address
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y10._MAX, SMH)  // _MAX: Maximum Base Address
                                    CreateByteField (ICHR, \_SB.PCI0.PCH._Y10._LEN, SML)  // _LEN: Length
                                    SMB = SMBS /* \SMBS */
                                    SMH = SMBS /* \SMBS */
                                    SML = SMBL /* \SMBL */
                                }

                                If (GPBS)
                                {
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y11._MIN, IGB)  // _MIN: Minimum Base Address
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y11._MAX, IGH)  // _MAX: Maximum Base Address
                                    CreateByteField (ICHR, \_SB.PCI0.PCH._Y11._LEN, IGL)  // _LEN: Length
                                    IGB = GPBS /* \GPBS */
                                    IGH = GPBS /* \GPBS */
                                    IGL = GPLN /* \GPLN */
                                }

                                If (APCB)
                                {
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y12._BAS, APB)  // _BAS: Base Address
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y12._LEN, APL)  // _LEN: Length
                                    APB = APCB /* \APCB */
                                    APL = APCL /* \APCL */
                                }

                                CreateDWordField (ICHR, \_SB.PCI0.PCH._Y13._BAS, RCB)  // _BAS: Base Address
                                CreateDWordField (ICHR, \_SB.PCI0.PCH._Y13._LEN, RCL)  // _LEN: Length
                                RCB = SRCB /* \SRCB */
                                RCL = SRCL /* \SRCL */
                                If (TCBR)
                                {
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y14._BAS, TCB)  // _BAS: Base Address
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y14._LEN, TCL)  // _LEN: Length
                                    TCB = TCBR /* \TCBR */
                                    TCL = TCLT /* \TCLT */
                                }

                                Return (ICHR) /* \_SB_.PCI0.PCH_.ICHR */
                            }
                        }

                        Device (CWDT)
                        {
                            Name (_HID, EisaId ("INT3F0D") /* ACPI Motherboard Resources */)  // _HID: Hardware ID
                            Name (_CID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _CID: Compatible ID
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0454,             // Range Minimum
                                    0x0454,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    _Y15)
                            })
                            Method (_STA, 0, Serialized)  // _STA: Status
                            {
                                Return (0x0F)
                            }

                            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                            {
                                CreateWordField (BUF0, \_SB.PCI0.CWDT._Y15._MIN, WDB)  // _MIN: Minimum Base Address
                                CreateWordField (BUF0, \_SB.PCI0.CWDT._Y15._MAX, WDH)  // _MAX: Maximum Base Address
                                WDB = (PMBS + 0x54)
                                WDH = (PMBS + 0x54)
                                Return (BUF0) /* \_SB_.PCI0.CWDT.BUF0 */
                            }
                        }
                    }
                }

                Device (SIO1)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x0111)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y16)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y17)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y18)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y19)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (((SP1O < 0x03F0) && (SP1O > 0xF0)))
                        {
                            CreateWordField (CRS, \_SB.PCI0.LPCB.SIO1._Y16._MIN, GPI0)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.LPCB.SIO1._Y16._MAX, GPI1)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.LPCB.SIO1._Y16._LEN, GPIL)  // _LEN: Length
                            GPI0 = SP1O /* \SP1O */
                            GPI1 = SP1O /* \SP1O */
                            GPIL = 0x02
                        }

                        If (IO1B)
                        {
                            CreateWordField (CRS, \_SB.PCI0.LPCB.SIO1._Y17._MIN, GP10)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.LPCB.SIO1._Y17._MAX, GP11)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.LPCB.SIO1._Y17._LEN, GPL1)  // _LEN: Length
                            GP10 = IO1B /* \IO1B */
                            GP11 = IO1B /* \IO1B */
                            GPL1 = IO1L /* \IO1L */
                        }

                        If (IO2B)
                        {
                            CreateWordField (CRS, \_SB.PCI0.LPCB.SIO1._Y18._MIN, GP20)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.LPCB.SIO1._Y18._MAX, GP21)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.LPCB.SIO1._Y18._LEN, GPL2)  // _LEN: Length
                            GP20 = IO2B /* \IO2B */
                            GP21 = IO2B /* \IO2B */
                            GPL2 = IO2L /* \IO2L */
                        }

                        If (IO3B)
                        {
                            CreateWordField (CRS, \_SB.PCI0.LPCB.SIO1._Y19._MIN, GP30)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.LPCB.SIO1._Y19._MAX, GP31)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.LPCB.SIO1._Y19._LEN, GPL3)  // _LEN: Length
                            GP30 = IO3B /* \IO3B */
                            GP31 = IO3B /* \IO3B */
                            GPL3 = IO3L /* \IO3L */
                        }

                        Return (CRS) /* \_SB_.PCI0.LPCB.SIO1.CRS_ */
                    }

                    Name (DCAT, Package (0x15)
                    {
                        0x02, 
                        0x03, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0x05, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0x05, 
                        0xFF, 
                        0x06
                    })
                    Mutex (MUT0, 0x00)
                    Method (ENFG, 1, NotSerialized)
                    {
                        Acquire (MUT0, 0xFFFF)
                        INDX = 0x87
                        INDX = 0x87
                        LDN = Arg0
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        INDX = 0xAA
                        Release (MUT0)
                    }

                    OperationRegion (IOID, SystemIO, SP1O, 0x02)
                    Field (IOID, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x07), 
                        LDN,    8, 
                        Offset (0x21), 
                        SCF1,   8, 
                        SCF2,   8, 
                        SCF3,   8, 
                        SCF4,   8, 
                        SCF5,   8, 
                        SCF6,   8, 
                        Offset (0x29), 
                        CKCF,   8, 
                        Offset (0x30), 
                        ACTR,   8, 
                        Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                        IOH2,   8, 
                        IOL2,   8, 
                        Offset (0x70), 
                        INTR,   4, 
                        INTT,   4, 
                        Offset (0x74), 
                        DMCH,   8, 
                        Offset (0xE0), 
                        RGE0,   8, 
                        RGE1,   8, 
                        RGE2,   8, 
                        RGE3,   8, 
                        RGE4,   8, 
                        RGE5,   8, 
                        RGE6,   8, 
                        RGE7,   8, 
                        RGE8,   8, 
                        RGE9,   8, 
                        Offset (0xF0), 
                        OPT0,   8, 
                        OPT1,   8, 
                        OPT2,   8, 
                        OPT3,   8, 
                        OPT4,   8, 
                        OPT5,   8, 
                        OPT6,   8, 
                        OPT7,   8, 
                        OPT8,   8, 
                        OPT9,   8
                    }

                    Method (CGLD, 1, NotSerialized)
                    {
                        Return (DerefOf (DCAT [Arg0]))
                    }

                    Method (DSTA, 1, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        Local0 = ACTR /* \_SB_.PCI0.LPCB.SIO1.ACTR */
                        If ((Local0 == 0xFF))
                        {
                            Return (Zero)
                        }

                        Local0 &= One
                        If ((Arg0 < 0x10))
                        {
                            IOST |= (Local0 << Arg0)
                        }

                        If (Local0)
                        {
                            Return (0x0F)
                        }
                        ElseIf ((Arg0 < 0x10))
                        {
                            If (((One << Arg0) & IOST))
                            {
                                Return (0x0D)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Else
                        {
                            Local0 = ((IOAH << 0x08) | IOAL) /* \_SB_.PCI0.LPCB.SIO1.IOAL */
                            If (Local0)
                            {
                                Return (0x0D)
                            }

                            Return (Zero)
                        }

                        EXFG ()
                    }

                    Method (DCNT, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        If (((DMCH < 0x04) && ((Local1 = (DMCH & 0x03)) != Zero)))
                        {
                            RDMA (Arg0, Arg1, Local1++)
                        }

                        ACTR = Arg1
                        Local1 = (IOAH << 0x08)
                        Local1 |= IOAL
                        RRIO (Arg0, Arg1, Local1, 0x08)
                        EXFG ()
                    }

                    Name (CRS1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y1C)
                        IRQNoFlags (_Y1A)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y1B)
                            {}
                    })
                    CreateWordField (CRS1, \_SB.PCI0.LPCB.SIO1._Y1A._INT, IRQM)  // _INT: Interrupts
                    CreateByteField (CRS1, \_SB.PCI0.LPCB.SIO1._Y1B._DMA, DMAM)  // _DMA: Direct Memory Access
                    CreateWordField (CRS1, \_SB.PCI0.LPCB.SIO1._Y1C._MIN, IO11)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0.LPCB.SIO1._Y1C._MAX, IO12)  // _MAX: Maximum Base Address
                    CreateByteField (CRS1, \_SB.PCI0.LPCB.SIO1._Y1C._LEN, LEN1)  // _LEN: Length
                    Method (DCRS, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        IO11 = (IOAH << 0x08)
                        IO11 |= IOAL /* \_SB_.PCI0.LPCB.SIO1.IO11 */
                        IO12 = IO11 /* \_SB_.PCI0.LPCB.SIO1.IO11 */
                        LEN1 = 0x08
                        If (INTR)
                        {
                            IRQM = (One << INTR) /* \_SB_.PCI0.LPCB.SIO1.INTR */
                        }
                        Else
                        {
                            IRQM = Zero
                        }

                        If (((DMCH > 0x03) || (Arg1 == Zero)))
                        {
                            DMAM = Zero
                        }
                        Else
                        {
                            Local1 = (DMCH & 0x03)
                            DMAM = (One << Local1)
                        }

                        EXFG ()
                        Return (CRS1) /* \_SB_.PCI0.LPCB.SIO1.CRS1 */
                    }

                    Method (DSRS, 2, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x09, IRQM)
                        CreateByteField (Arg0, 0x0C, DMAM)
                        CreateWordField (Arg0, 0x02, IO11)
                        ENFG (CGLD (Arg1))
                        IOAL = (IO11 & 0xFF)
                        IOAH = (IO11 >> 0x08)
                        If (IRQM)
                        {
                            FindSetRightBit (IRQM, Local0)
                            INTR = (Local0 - One)
                        }
                        Else
                        {
                            INTR = Zero
                        }

                        If (DMAM)
                        {
                            FindSetRightBit (DMAM, Local0)
                            DMCH = (Local0 - One)
                        }
                        Else
                        {
                            DMCH = 0x04
                        }

                        EXFG ()
                        DCNT (Arg1, One)
                        Local2 = Arg1
                        If ((Local2 > Zero))
                        {
                            Local2 -= One
                        }
                    }
                }

                Name (PMFG, Zero)
                Method (SIOS, 1, NotSerialized)
                {
                    Debug = "SIOS"
                    If ((0x05 != Arg0))
                    {
                        ^SIO1.ENFG (0x0A)
                        PMFG = ^SIO1.OPT3 /* \_SB_.PCI0.LPCB.SIO1.OPT3 */
                        ^SIO1.OPT3 = 0xFF
                        ^SIO1.OPT4 = 0xFF
                        ^SIO1.OPT6 &= 0xCF
                        ^SIO1.OPT6 |= 0x10
                        ^SIO1.OPT6 |= 0x20
                        ^SIO1.OPT3 = 0xFF
                        ^SIO1.OPT4 = 0xFF
                        ^SIO1.OPT2 |= One /* \_SB_.PCI0.LPCB.SIO1.OPT2 */
                        ^SIO1.EXFG ()
                    }
                }

                Method (SIOW, 1, NotSerialized)
                {
                    ^SIO1.ENFG (0x0A)
                    PMFG = ^SIO1.OPT3 /* \_SB_.PCI0.LPCB.SIO1.OPT3 */
                    ^SIO1.OPT3 = 0xFF
                    ^SIO1.OPT4 = 0xFF
                    ^SIO1.OPT6 &= 0xCF
                    ^SIO1.OPT2 &= 0xFE /* \_SB_.PCI0.LPCB.SIO1.OPT2 */
                    ^SIO1.EXFG ()
                }

                Method (SIOH, 0, NotSerialized)
                {
                    If ((PMFG & 0x08))
                    {
                        Notify (PS2K, 0x02) // Device Wake
                    }

                    If ((PMFG & 0x10))
                    {
                        Notify (PS2M, 0x02) // Device Wake
                    }
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP030B"))  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((IOST & 0x0400))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x0060,             // Range Minimum
                                0x0060,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IO (Decode16,
                                0x0064,             // Range Minimum
                                0x0064,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {1}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                    {
                        KBFG = Arg0
                    }
                }

                Scope (\)
                {
                    Name (KBFG, One)
                }

                Method (PS2K._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x1D, 0x03))
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F03") /* Microsoft PS/2-style Mouse */)  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0F13") /* PS/2 Mouse */)  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((IOST & 0x4000))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (CRS1, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {12}
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If ((IOST & 0x0400))
                        {
                            Return (CRS1) /* \_SB_.PCI0.LPCB.PS2M.CRS1 */
                        }
                        Else
                        {
                            Return (CRS2) /* \_SB_.PCI0.LPCB.PS2M.CRS2 */
                        }
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IRQNoFlags ()
                                {12}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                    {
                        MSFG = Arg0
                    }
                }

                Scope (\)
                {
                    Name (MSFG, One)
                }

                Method (PS2M._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x1D, 0x03))
                }

                Device (UAR1)
                {
                    Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (^^SIO1.DSTA (Zero))
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        ^^SIO1.DCNT (Zero, Zero)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Return (^^SIO1.DCRS (Zero, Zero))
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        ^^SIO1.DSRS (Arg0, Zero)
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        EndDependentFn ()
                    })
                }

                Device (IPIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0087,             // Range Minimum
                            0x0087,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0089,             // Range Minimum
                            0x0089,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x008F,             // Range Minimum
                            0x008F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x00,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (TIMR)
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
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (RTC)
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
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x10)  // _UID: Unique ID
                    Name (CRS1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x00,               // Alignment
                            0x0B,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If ((MBEC & 0xFFFF))
                        {
                            Return (CRS1) /* \_SB_.PCI0.LPCB.RMSC.CRS1 */
                        }
                        Else
                        {
                            Return (CRS2) /* \_SB_.PCI0.LPCB.RMSC.CRS2 */
                        }
                    }
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }
            }

            Device (P0P9)
            {
                Name (_ADR, 0x001E0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR09) /* \_SB_.AR09 */
                    }

                    Return (PR09) /* \_SB_.PR09 */
                }
            }

            Device (SAT0)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
                Name (^NATA, Package (0x01)
                {
                    0x001F0002
                })
                Name (\FZTF, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF5         // .......
                })
                Name (REGF, One)
                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If ((Arg0 == 0x02))
                    {
                        REGF = Arg1
                    }
                }

                Name (TIM0, Package (0x08)
                {
                    Package (0x04)
                    {
                        0x78, 
                        0xB4, 
                        0xF0, 
                        0x0384
                    }, 

                    Package (0x04)
                    {
                        0x23, 
                        0x21, 
                        0x10, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0B, 
                        0x09, 
                        0x04, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        0x78, 
                        0x5A, 
                        0x3C, 
                        0x28, 
                        0x1E, 
                        0x14
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        One, 
                        0x02, 
                        One, 
                        0x02, 
                        One
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        0x04, 
                        0x03, 
                        0x02, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x02, 
                        One, 
                        Zero, 
                        Zero
                    }
                })
                Name (TMD0, Buffer (0x14){})
                CreateDWordField (TMD0, Zero, PIO0)
                CreateDWordField (TMD0, 0x04, DMA0)
                CreateDWordField (TMD0, 0x08, PIO1)
                CreateDWordField (TMD0, 0x0C, DMA1)
                CreateDWordField (TMD0, 0x10, CHNF)
                OperationRegion (CFG2, PCI_Config, 0x40, 0x20)
                Field (CFG2, DWordAcc, NoLock, Preserve)
                {
                    PMPT,   4, 
                    PSPT,   4, 
                    PMRI,   6, 
                    Offset (0x02), 
                    SMPT,   4, 
                    SSPT,   4, 
                    SMRI,   6, 
                    Offset (0x04), 
                    PSRI,   4, 
                    SSRI,   4, 
                    Offset (0x08), 
                    PM3E,   1, 
                    PS3E,   1, 
                    SM3E,   1, 
                    SS3E,   1, 
                    Offset (0x0A), 
                    PMUT,   2, 
                        ,   2, 
                    PSUT,   2, 
                    Offset (0x0B), 
                    SMUT,   2, 
                        ,   2, 
                    SSUT,   2, 
                    Offset (0x0C), 
                    Offset (0x14), 
                    PM6E,   1, 
                    PS6E,   1, 
                    SM6E,   1, 
                    SS6E,   1, 
                    PMCR,   1, 
                    PSCR,   1, 
                    SMCR,   1, 
                    SSCR,   1, 
                        ,   4, 
                    PMAE,   1, 
                    PSAE,   1, 
                    SMAE,   1, 
                    SSAE,   1
                }

                Name (GMPT, Zero)
                Name (GMUE, Zero)
                Name (GMUT, Zero)
                Name (GMCR, Zero)
                Name (GSPT, Zero)
                Name (GSUE, Zero)
                Name (GSUT, Zero)
                Name (GSCR, Zero)
                Device (PRT0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (PSCR << One)
                        Local0 = (PMCR | Local1)
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local1 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local2 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (PMRI, Local1, PMUT, PSRI, Local2, PSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local0 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local1 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local1 |= Local3
                        GMPT = PMRI /* \_SB_.PCI0.SAT0.PMRI */
                        GMUE = Local0
                        GMUT = PMUT /* \_SB_.PCI0.SAT0.PMUT */
                        GMCR = PMCR /* \_SB_.PCI0.SAT0.PMCR */
                        GSPT = PSRI /* \_SB_.PCI0.SAT0.PSRI */
                        GSUE = Local1
                        GSUT = PSUT /* \_SB_.PCI0.SAT0.PSUT */
                        GSCR = PSCR /* \_SB_.PCI0.SAT0.PSCR */
                        STM ()
                        PMRI = GMPT /* \_SB_.PCI0.SAT0.GMPT */
                        Local0 = GMUE /* \_SB_.PCI0.SAT0.GMUE */
                        PMUT = GMUT /* \_SB_.PCI0.SAT0.GMUT */
                        PMCR = GMCR /* \_SB_.PCI0.SAT0.GMCR */
                        Local1 = GSUE /* \_SB_.PCI0.SAT0.GSUE */
                        PSUT = GSUT /* \_SB_.PCI0.SAT0.GSUT */
                        PSCR = GSCR /* \_SB_.PCI0.SAT0.GSCR */
                        If ((Local0 & One))
                        {
                            PM3E = One
                        }
                        Else
                        {
                            PM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            PM6E = One
                        }
                        Else
                        {
                            PM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            PMAE = One
                        }
                        Else
                        {
                            PMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            PS3E = One
                        }
                        Else
                        {
                            PS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            PS6E = One
                        }
                        Else
                        {
                            PS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            PSAE = One
                        }
                        Else
                        {
                            PSAE = Zero
                        }

                        ATA0 = GTF (Zero, Arg1)
                        ATA1 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA0))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA1))
                        }
                    }
                }

                Device (PRT1)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (SSCR << One)
                        Local0 = (SMCR | Local1)
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local1 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local2 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (SMRI, Local1, SMUT, SSRI, Local2, SSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local0 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local1 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local1 |= Local3
                        GMPT = SMRI /* \_SB_.PCI0.SAT0.SMRI */
                        GMUE = Local0
                        GMUT = SMUT /* \_SB_.PCI0.SAT0.SMUT */
                        GMCR = SMCR /* \_SB_.PCI0.SAT0.SMCR */
                        GSPT = SSRI /* \_SB_.PCI0.SAT0.SSRI */
                        GSUE = Local1
                        GSUT = SSUT /* \_SB_.PCI0.SAT0.SSUT */
                        GSCR = SSCR /* \_SB_.PCI0.SAT0.SSCR */
                        STM ()
                        SMRI = GMPT /* \_SB_.PCI0.SAT0.GMPT */
                        Local0 = GMUE /* \_SB_.PCI0.SAT0.GMUE */
                        SMUT = GMUT /* \_SB_.PCI0.SAT0.GMUT */
                        SMCR = GMCR /* \_SB_.PCI0.SAT0.GMCR */
                        Local1 = GSUE /* \_SB_.PCI0.SAT0.GSUE */
                        SSUT = GSUT /* \_SB_.PCI0.SAT0.GSUT */
                        SSCR = GSCR /* \_SB_.PCI0.SAT0.GSCR */
                        If ((Local0 & One))
                        {
                            SM3E = One
                        }
                        Else
                        {
                            SM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            SM6E = One
                        }
                        Else
                        {
                            SM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            SMAE = One
                        }
                        Else
                        {
                            SMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            SS3E = One
                        }
                        Else
                        {
                            SS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            SS6E = One
                        }
                        Else
                        {
                            SS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            SSAE = One
                        }
                        Else
                        {
                            SSAE = Zero
                        }

                        ATA2 = GTF (Zero, Arg1)
                        ATA3 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA2))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA3))
                        }
                    }
                }

                Method (GTM, 7, Serialized)
                {
                    PIO0 = Ones
                    PIO1 = Ones
                    DMA0 = Ones
                    DMA1 = Ones
                    CHNF = 0x10
                    If (REGF){}
                    Else
                    {
                        Return (TMD0) /* \_SB_.PCI0.SAT0.TMD0 */
                    }

                    If ((Arg1 & 0x20))
                    {
                        CHNF |= 0x02
                    }

                    Local6 = Match (DerefOf (TIM0 [One]), MEQ, Arg0, MTR, Zero, 
                        Zero)
                    Local7 = DerefOf (DerefOf (TIM0 [Zero]) [Local6])
                    DMA0 = Local7
                    PIO0 = Local7
                    If ((Arg4 & 0x20))
                    {
                        CHNF |= 0x08
                    }

                    Local6 = Match (DerefOf (TIM0 [0x02]), MEQ, Arg3, MTR, Zero, 
                        Zero)
                    Local7 = DerefOf (DerefOf (TIM0 [Zero]) [Local6])
                    DMA1 = Local7
                    PIO1 = Local7
                    If ((Arg1 & 0x07))
                    {
                        Local5 = Arg2
                        If ((Arg1 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg1 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA0 = DerefOf (DerefOf (TIM0 [0x03]) [Local5])
                        CHNF |= One
                    }

                    If ((Arg4 & 0x07))
                    {
                        Local5 = Arg5
                        If ((Arg4 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg4 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA1 = DerefOf (DerefOf (TIM0 [0x03]) [Local5])
                        CHNF |= 0x04
                    }

                    Debug = TMD0 /* \_SB_.PCI0.SAT0.TMD0 */
                    Return (TMD0) /* \_SB_.PCI0.SAT0.TMD0 */
                }

                Method (STM, 0, Serialized)
                {
                    If (REGF)
                    {
                        GMUE = Zero
                        GMUT = Zero
                        GSUE = Zero
                        GSUT = Zero
                        If ((CHNF & One))
                        {
                            Local0 = Match (DerefOf (TIM0 [0x03]), MLE, DMA0, MTR, Zero, 
                                Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GMUT = DerefOf (DerefOf (TIM0 [0x04]) [Local0])
                            GMUE |= One
                            If ((Local0 > 0x02))
                            {
                                GMUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GMUE &= 0xFD
                                GMUE |= 0x04
                            }
                        }
                        ElseIf (((PIO0 == Ones) | (PIO0 == Zero)))
                        {
                            If (((DMA0 < Ones) & (DMA0 > Zero)))
                            {
                                PIO0 = DMA0 /* \_SB_.PCI0.SAT0.DMA0 */
                                GMUE |= 0x80
                            }
                        }

                        If ((CHNF & 0x04))
                        {
                            Local0 = Match (DerefOf (TIM0 [0x03]), MLE, DMA1, MTR, Zero, 
                                Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GSUT = DerefOf (DerefOf (TIM0 [0x04]) [Local0])
                            GSUE |= One
                            If ((Local0 > 0x02))
                            {
                                GSUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GSUE &= 0xFD
                                GSUE |= 0x04
                            }
                        }
                        ElseIf (((PIO1 == Ones) | (PIO1 == Zero)))
                        {
                            If (((DMA1 < Ones) & (DMA1 > Zero)))
                            {
                                PIO1 = DMA1 /* \_SB_.PCI0.SAT0.DMA1 */
                                GSUE |= 0x80
                            }
                        }

                        If ((CHNF & 0x02))
                        {
                            GMUE |= 0x20
                        }

                        If ((CHNF & 0x08))
                        {
                            GSUE |= 0x20
                        }

                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIO0, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = DerefOf (DerefOf (TIM0 [One]) [Local0])
                        GMPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GMUE |= 0x50
                        }

                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIO1, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = DerefOf (DerefOf (TIM0 [0x02]) [Local0])
                        GSPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GSUE |= 0x50
                        }
                    }
                }

                Name (AT01, Buffer (0x07)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEF         // .......
                })
                Name (AT02, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90         // .......
                })
                Name (AT03, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC6         // .......
                })
                Name (AT04, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x91         // .......
                })
                Name (ATA0, Buffer (0x1D){})
                Name (ATA1, Buffer (0x1D){})
                Name (ATA2, Buffer (0x1D){})
                Name (ATA3, Buffer (0x1D){})
                Name (ATAB, Buffer (0x1D){})
                CreateByteField (ATAB, Zero, CMDC)
                Method (GTFB, 3, Serialized)
                {
                    Local0 = (CMDC * 0x38)
                    Local1 = (Local0 + 0x08)
                    CreateField (ATAB, Local1, 0x38, CMDX)
                    Local0 = (CMDC * 0x07)
                    CreateByteField (ATAB, (Local0 + 0x02), A001)
                    CreateByteField (ATAB, (Local0 + 0x06), A005)
                    CMDX = Arg0
                    A001 = Arg1
                    A005 = Arg2
                    CMDC++
                }

                Method (GTF, 2, Serialized)
                {
                    Debug = Arg1
                    CMDC = Zero
                    Name (ID49, 0x0C00)
                    Name (ID59, Zero)
                    Name (ID53, 0x04)
                    Name (ID63, 0x0F00)
                    Name (ID88, 0x0F00)
                    Name (IRDY, One)
                    Name (PIOT, Zero)
                    Name (DMAT, Zero)
                    If ((SizeOf (Arg1) == 0x0200))
                    {
                        CreateWordField (Arg1, 0x62, IW49)
                        ID49 = IW49 /* \_SB_.PCI0.SAT0.GTF_.IW49 */
                        CreateWordField (Arg1, 0x6A, IW53)
                        ID53 = IW53 /* \_SB_.PCI0.SAT0.GTF_.IW53 */
                        CreateWordField (Arg1, 0x7E, IW63)
                        ID63 = IW63 /* \_SB_.PCI0.SAT0.GTF_.IW63 */
                        CreateWordField (Arg1, 0x76, IW59)
                        ID59 = IW59 /* \_SB_.PCI0.SAT0.GTF_.IW59 */
                        CreateWordField (Arg1, 0xB0, IW88)
                        ID88 = IW88 /* \_SB_.PCI0.SAT0.GTF_.IW88 */
                    }

                    Local7 = 0xA0
                    If (Arg0)
                    {
                        Local7 = 0xB0
                        IRDY = (CHNF & 0x08)
                        If ((CHNF & 0x10))
                        {
                            PIOT = PIO1 /* \_SB_.PCI0.SAT0.PIO1 */
                        }
                        Else
                        {
                            PIOT = PIO0 /* \_SB_.PCI0.SAT0.PIO0 */
                        }

                        If ((CHNF & 0x04))
                        {
                            If ((CHNF & 0x10))
                            {
                                DMAT = DMA1 /* \_SB_.PCI0.SAT0.DMA1 */
                            }
                            Else
                            {
                                DMAT = DMA0 /* \_SB_.PCI0.SAT0.DMA0 */
                            }
                        }
                    }
                    Else
                    {
                        IRDY = (CHNF & 0x02)
                        PIOT = PIO0 /* \_SB_.PCI0.SAT0.PIO0 */
                        If ((CHNF & One))
                        {
                            DMAT = DMA0 /* \_SB_.PCI0.SAT0.DMA0 */
                        }
                    }

                    If ((((ID53 & 0x04) && (ID88 & 0xFF00)) && DMAT))
                    {
                        Local1 = Match (DerefOf (TIM0 [0x03]), MLE, DMAT, MTR, Zero, 
                            Zero)
                        If ((Local1 > 0x05))
                        {
                            Local1 = 0x05
                        }

                        GTFB (AT01, (0x40 | Local1), Local7)
                    }
                    ElseIf (((ID63 & 0xFF00) && PIOT))
                    {
                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIOT, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = (0x20 | DerefOf (DerefOf (TIM0 [0x07]) [Local0]))
                        GTFB (AT01, Local1, Local7)
                    }

                    If (IRDY)
                    {
                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIOT, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = (0x08 | DerefOf (DerefOf (TIM0 [0x06]) [Local0]))
                        GTFB (AT01, Local1, Local7)
                    }
                    ElseIf ((ID49 & 0x0400))
                    {
                        GTFB (AT01, One, Local7)
                    }

                    If (((ID59 & 0x0100) && (ID59 & 0xFF)))
                    {
                        GTFB (AT03, (ID59 & 0xFF), Local7)
                    }

                    Debug = ATAB /* \_SB_.PCI0.SAT0.ATAB */
                    Return (ATAB) /* \_SB_.PCI0.SAT0.ATAB */
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, CMDN)
                    Local0 = (CMDN * 0x38)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Debug = RETB /* \_SB_.PCI0.SAT0.RATA.RETB */
                    Return (Concatenate (RETB, FZTF))
                }
            }

            Device (SAT1)
            {
                Name (_ADR, 0x001F0005)  // _ADR: Address
                Name (REGF, One)
                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If ((Arg0 == 0x02))
                    {
                        REGF = Arg1
                    }
                }

                Name (TIM0, Package (0x08)
                {
                    Package (0x04)
                    {
                        0x78, 
                        0xB4, 
                        0xF0, 
                        0x0384
                    }, 

                    Package (0x04)
                    {
                        0x23, 
                        0x21, 
                        0x10, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0B, 
                        0x09, 
                        0x04, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        0x78, 
                        0x5A, 
                        0x3C, 
                        0x28, 
                        0x1E, 
                        0x14
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        One, 
                        0x02, 
                        One, 
                        0x02, 
                        One
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        0x04, 
                        0x03, 
                        0x02, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x02, 
                        One, 
                        Zero, 
                        Zero
                    }
                })
                Name (TMD0, Buffer (0x14){})
                CreateDWordField (TMD0, Zero, PIO0)
                CreateDWordField (TMD0, 0x04, DMA0)
                CreateDWordField (TMD0, 0x08, PIO1)
                CreateDWordField (TMD0, 0x0C, DMA1)
                CreateDWordField (TMD0, 0x10, CHNF)
                OperationRegion (CFG2, PCI_Config, 0x40, 0x20)
                Field (CFG2, DWordAcc, NoLock, Preserve)
                {
                    PMPT,   4, 
                    PSPT,   4, 
                    PMRI,   6, 
                    Offset (0x02), 
                    SMPT,   4, 
                    SSPT,   4, 
                    SMRI,   6, 
                    Offset (0x04), 
                    PSRI,   4, 
                    SSRI,   4, 
                    Offset (0x08), 
                    PM3E,   1, 
                    PS3E,   1, 
                    SM3E,   1, 
                    SS3E,   1, 
                    Offset (0x0A), 
                    PMUT,   2, 
                        ,   2, 
                    PSUT,   2, 
                    Offset (0x0B), 
                    SMUT,   2, 
                        ,   2, 
                    SSUT,   2, 
                    Offset (0x0C), 
                    Offset (0x14), 
                    PM6E,   1, 
                    PS6E,   1, 
                    SM6E,   1, 
                    SS6E,   1, 
                    PMCR,   1, 
                    PSCR,   1, 
                    SMCR,   1, 
                    SSCR,   1, 
                        ,   4, 
                    PMAE,   1, 
                    PSAE,   1, 
                    SMAE,   1, 
                    SSAE,   1
                }

                Name (GMPT, Zero)
                Name (GMUE, Zero)
                Name (GMUT, Zero)
                Name (GMCR, Zero)
                Name (GSPT, Zero)
                Name (GSUE, Zero)
                Name (GSUT, Zero)
                Name (GSCR, Zero)
                Device (PRT0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (PSCR << One)
                        Local0 = (PMCR | Local1)
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local1 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local2 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (PMRI, Local1, PMUT, PSRI, Local2, PSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local0 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local1 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local1 |= Local3
                        GMPT = PMRI /* \_SB_.PCI0.SAT1.PMRI */
                        GMUE = Local0
                        GMUT = PMUT /* \_SB_.PCI0.SAT1.PMUT */
                        GMCR = PMCR /* \_SB_.PCI0.SAT1.PMCR */
                        GSPT = PSRI /* \_SB_.PCI0.SAT1.PSRI */
                        GSUE = Local1
                        GSUT = PSUT /* \_SB_.PCI0.SAT1.PSUT */
                        GSCR = PSCR /* \_SB_.PCI0.SAT1.PSCR */
                        STM ()
                        PMRI = GMPT /* \_SB_.PCI0.SAT1.GMPT */
                        Local0 = GMUE /* \_SB_.PCI0.SAT1.GMUE */
                        PMUT = GMUT /* \_SB_.PCI0.SAT1.GMUT */
                        PMCR = GMCR /* \_SB_.PCI0.SAT1.GMCR */
                        Local1 = GSUE /* \_SB_.PCI0.SAT1.GSUE */
                        PSUT = GSUT /* \_SB_.PCI0.SAT1.GSUT */
                        PSCR = GSCR /* \_SB_.PCI0.SAT1.GSCR */
                        If ((Local0 & One))
                        {
                            PM3E = One
                        }
                        Else
                        {
                            PM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            PM6E = One
                        }
                        Else
                        {
                            PM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            PMAE = One
                        }
                        Else
                        {
                            PMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            PS3E = One
                        }
                        Else
                        {
                            PS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            PS6E = One
                        }
                        Else
                        {
                            PS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            PSAE = One
                        }
                        Else
                        {
                            PSAE = Zero
                        }

                        ATA0 = GTF (Zero, Arg1)
                        ATA1 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA0))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA1))
                        }
                    }
                }

                Device (PRT1)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (SSCR << One)
                        Local0 = (SMCR | Local1)
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local1 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local2 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (SMRI, Local1, SMUT, SSRI, Local2, SSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local0 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local1 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local1 |= Local3
                        GMPT = SMRI /* \_SB_.PCI0.SAT1.SMRI */
                        GMUE = Local0
                        GMUT = SMUT /* \_SB_.PCI0.SAT1.SMUT */
                        GMCR = SMCR /* \_SB_.PCI0.SAT1.SMCR */
                        GSPT = SSRI /* \_SB_.PCI0.SAT1.SSRI */
                        GSUE = Local1
                        GSUT = SSUT /* \_SB_.PCI0.SAT1.SSUT */
                        GSCR = SSCR /* \_SB_.PCI0.SAT1.SSCR */
                        STM ()
                        SMRI = GMPT /* \_SB_.PCI0.SAT1.GMPT */
                        Local0 = GMUE /* \_SB_.PCI0.SAT1.GMUE */
                        SMUT = GMUT /* \_SB_.PCI0.SAT1.GMUT */
                        SMCR = GMCR /* \_SB_.PCI0.SAT1.GMCR */
                        Local1 = GSUE /* \_SB_.PCI0.SAT1.GSUE */
                        SSUT = GSUT /* \_SB_.PCI0.SAT1.GSUT */
                        SSCR = GSCR /* \_SB_.PCI0.SAT1.GSCR */
                        If ((Local0 & One))
                        {
                            SM3E = One
                        }
                        Else
                        {
                            SM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            SM6E = One
                        }
                        Else
                        {
                            SM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            SMAE = One
                        }
                        Else
                        {
                            SMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            SS3E = One
                        }
                        Else
                        {
                            SS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            SS6E = One
                        }
                        Else
                        {
                            SS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            SSAE = One
                        }
                        Else
                        {
                            SSAE = Zero
                        }

                        ATA2 = GTF (Zero, Arg1)
                        ATA3 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA2))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA3))
                        }
                    }
                }

                Method (GTM, 7, Serialized)
                {
                    PIO0 = Ones
                    PIO1 = Ones
                    DMA0 = Ones
                    DMA1 = Ones
                    CHNF = 0x10
                    If (REGF){}
                    Else
                    {
                        Return (TMD0) /* \_SB_.PCI0.SAT1.TMD0 */
                    }

                    If ((Arg1 & 0x20))
                    {
                        CHNF |= 0x02
                    }

                    Local6 = Match (DerefOf (TIM0 [One]), MEQ, Arg0, MTR, Zero, 
                        Zero)
                    Local7 = DerefOf (DerefOf (TIM0 [Zero]) [Local6])
                    DMA0 = Local7
                    PIO0 = Local7
                    If ((Arg4 & 0x20))
                    {
                        CHNF |= 0x08
                    }

                    Local6 = Match (DerefOf (TIM0 [0x02]), MEQ, Arg3, MTR, Zero, 
                        Zero)
                    Local7 = DerefOf (DerefOf (TIM0 [Zero]) [Local6])
                    DMA1 = Local7
                    PIO1 = Local7
                    If ((Arg1 & 0x07))
                    {
                        Local5 = Arg2
                        If ((Arg1 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg1 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA0 = DerefOf (DerefOf (TIM0 [0x03]) [Local5])
                        CHNF |= One
                    }

                    If ((Arg4 & 0x07))
                    {
                        Local5 = Arg5
                        If ((Arg4 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg4 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA1 = DerefOf (DerefOf (TIM0 [0x03]) [Local5])
                        CHNF |= 0x04
                    }

                    Debug = TMD0 /* \_SB_.PCI0.SAT1.TMD0 */
                    Return (TMD0) /* \_SB_.PCI0.SAT1.TMD0 */
                }

                Method (STM, 0, Serialized)
                {
                    If (REGF)
                    {
                        GMUE = Zero
                        GMUT = Zero
                        GSUE = Zero
                        GSUT = Zero
                        If ((CHNF & One))
                        {
                            Local0 = Match (DerefOf (TIM0 [0x03]), MLE, DMA0, MTR, Zero, 
                                Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GMUT = DerefOf (DerefOf (TIM0 [0x04]) [Local0])
                            GMUE |= One
                            If ((Local0 > 0x02))
                            {
                                GMUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GMUE &= 0xFD
                                GMUE |= 0x04
                            }
                        }
                        ElseIf (((PIO0 == Ones) | (PIO0 == Zero)))
                        {
                            If (((DMA0 < Ones) & (DMA0 > Zero)))
                            {
                                PIO0 = DMA0 /* \_SB_.PCI0.SAT1.DMA0 */
                                GMUE |= 0x80
                            }
                        }

                        If ((CHNF & 0x04))
                        {
                            Local0 = Match (DerefOf (TIM0 [0x03]), MLE, DMA1, MTR, Zero, 
                                Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GSUT = DerefOf (DerefOf (TIM0 [0x04]) [Local0])
                            GSUE |= One
                            If ((Local0 > 0x02))
                            {
                                GSUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GSUE &= 0xFD
                                GSUE |= 0x04
                            }
                        }
                        ElseIf (((PIO1 == Ones) | (PIO1 == Zero)))
                        {
                            If (((DMA1 < Ones) & (DMA1 > Zero)))
                            {
                                PIO1 = DMA1 /* \_SB_.PCI0.SAT1.DMA1 */
                                GSUE |= 0x80
                            }
                        }

                        If ((CHNF & 0x02))
                        {
                            GMUE |= 0x20
                        }

                        If ((CHNF & 0x08))
                        {
                            GSUE |= 0x20
                        }

                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIO0, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = DerefOf (DerefOf (TIM0 [One]) [Local0])
                        GMPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GMUE |= 0x50
                        }

                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIO1, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = DerefOf (DerefOf (TIM0 [0x02]) [Local0])
                        GSPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GSUE |= 0x50
                        }
                    }
                }

                Name (AT01, Buffer (0x07)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEF         // .......
                })
                Name (AT02, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90         // .......
                })
                Name (AT03, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC6         // .......
                })
                Name (AT04, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x91         // .......
                })
                Name (ATA0, Buffer (0x1D){})
                Name (ATA1, Buffer (0x1D){})
                Name (ATA2, Buffer (0x1D){})
                Name (ATA3, Buffer (0x1D){})
                Name (ATAB, Buffer (0x1D){})
                CreateByteField (ATAB, Zero, CMDC)
                Method (GTFB, 3, Serialized)
                {
                    Local0 = (CMDC * 0x38)
                    Local1 = (Local0 + 0x08)
                    CreateField (ATAB, Local1, 0x38, CMDX)
                    Local0 = (CMDC * 0x07)
                    CreateByteField (ATAB, (Local0 + 0x02), A001)
                    CreateByteField (ATAB, (Local0 + 0x06), A005)
                    CMDX = Arg0
                    A001 = Arg1
                    A005 = Arg2
                    CMDC++
                }

                Method (GTF, 2, Serialized)
                {
                    Debug = Arg1
                    CMDC = Zero
                    Name (ID49, 0x0C00)
                    Name (ID59, Zero)
                    Name (ID53, 0x04)
                    Name (ID63, 0x0F00)
                    Name (ID88, 0x0F00)
                    Name (IRDY, One)
                    Name (PIOT, Zero)
                    Name (DMAT, Zero)
                    If ((SizeOf (Arg1) == 0x0200))
                    {
                        CreateWordField (Arg1, 0x62, IW49)
                        ID49 = IW49 /* \_SB_.PCI0.SAT1.GTF_.IW49 */
                        CreateWordField (Arg1, 0x6A, IW53)
                        ID53 = IW53 /* \_SB_.PCI0.SAT1.GTF_.IW53 */
                        CreateWordField (Arg1, 0x7E, IW63)
                        ID63 = IW63 /* \_SB_.PCI0.SAT1.GTF_.IW63 */
                        CreateWordField (Arg1, 0x76, IW59)
                        ID59 = IW59 /* \_SB_.PCI0.SAT1.GTF_.IW59 */
                        CreateWordField (Arg1, 0xB0, IW88)
                        ID88 = IW88 /* \_SB_.PCI0.SAT1.GTF_.IW88 */
                    }

                    Local7 = 0xA0
                    If (Arg0)
                    {
                        Local7 = 0xB0
                        IRDY = (CHNF & 0x08)
                        If ((CHNF & 0x10))
                        {
                            PIOT = PIO1 /* \_SB_.PCI0.SAT1.PIO1 */
                        }
                        Else
                        {
                            PIOT = PIO0 /* \_SB_.PCI0.SAT1.PIO0 */
                        }

                        If ((CHNF & 0x04))
                        {
                            If ((CHNF & 0x10))
                            {
                                DMAT = DMA1 /* \_SB_.PCI0.SAT1.DMA1 */
                            }
                            Else
                            {
                                DMAT = DMA0 /* \_SB_.PCI0.SAT1.DMA0 */
                            }
                        }
                    }
                    Else
                    {
                        IRDY = (CHNF & 0x02)
                        PIOT = PIO0 /* \_SB_.PCI0.SAT1.PIO0 */
                        If ((CHNF & One))
                        {
                            DMAT = DMA0 /* \_SB_.PCI0.SAT1.DMA0 */
                        }
                    }

                    If ((((ID53 & 0x04) && (ID88 & 0xFF00)) && DMAT))
                    {
                        Local1 = Match (DerefOf (TIM0 [0x03]), MLE, DMAT, MTR, Zero, 
                            Zero)
                        If ((Local1 > 0x05))
                        {
                            Local1 = 0x05
                        }

                        GTFB (AT01, (0x40 | Local1), Local7)
                    }
                    ElseIf (((ID63 & 0xFF00) && PIOT))
                    {
                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIOT, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = (0x20 | DerefOf (DerefOf (TIM0 [0x07]) [Local0]))
                        GTFB (AT01, Local1, Local7)
                    }

                    If (IRDY)
                    {
                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIOT, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = (0x08 | DerefOf (DerefOf (TIM0 [0x06]) [Local0]))
                        GTFB (AT01, Local1, Local7)
                    }
                    ElseIf ((ID49 & 0x0400))
                    {
                        GTFB (AT01, One, Local7)
                    }

                    If (((ID59 & 0x0100) && (ID59 & 0xFF)))
                    {
                        GTFB (AT03, (ID59 & 0xFF), Local7)
                    }

                    Debug = ATAB /* \_SB_.PCI0.SAT1.ATAB */
                    Return (ATAB) /* \_SB_.PCI0.SAT1.ATAB */
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, CMDN)
                    Local0 = (CMDN * 0x38)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Debug = RETB /* \_SB_.PCI0.SAT1.RATA.RETB */
                    Return (Concatenate (RETB, FZTF))
                }
            }

            Device (SMB)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
                OperationRegion (SMIO, SystemIO, SMBS, SMBL)
                Field (SMIO, ByteAcc, NoLock, Preserve)
                {
                    HSTS,   8, 
                    HCNT,   8, 
                    HCMD,   8, 
                    TSAD,   8, 
                    HDT0,   8, 
                    HDT1,   8, 
                    HBDT,   8, 
                    RSAD,   8, 
                    RSDA,   16, 
                    AUST,   8, 
                    AUCT,   8, 
                    SMLP,   8, 
                    SMBP,   8, 
                    SSTS,   8, 
                    SCMD,   8, 
                    NDAD,   8, 
                    NDLB,   8, 
                    NDHB,   8
                }

                Method (SMCS, 0, NotSerialized)
                {
                    HSTS = 0x20
                }

                Scope (\_GPE)
                {
                    Method (_L07, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
                    {
                        \_SB.PCI0.SMB.HSTS = 0x20
                    }

                    Method (_L1B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
                    {
                        \_SB.PCI0.SMB.HSTS = 0x20
                    }
                }
            }

            Device (EUSB)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
                Name (_S4D, 0x02)  // _S4D: S4 Device State
                Name (_S3D, 0x02)  // _S3D: S3 Device State
                Name (_S2D, 0x02)  // _S2D: S2 Device State
                Name (_S1D, 0x02)  // _S1D: S1 Device State
                Device (HUBN)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PR10)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCA, Package (0x04)
                            {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                            })
                            Return (UPCA) /* \_SB_.PCI0.EUSB.HUBN.PR10._UPC.UPCA */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                            0x81, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x30, 
                            0x1C, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                                }
                            })
                            Return (PLDP) /* \_SB_.PCI0.EUSB.HUBN.PR10._PLD.PLDP */
                        }
                        Device (PR30)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                                })
                                Return (UPCP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR30._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1C, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                                    }
                                })
                                Return (PLDP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR30._PLD.PLDP */
                            }
                        }

                        Device (PR31)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                                })
                                Return (UPCP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR31._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1D, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                                    }
                                })
                                Return (PLDP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR31._PLD.PLDP */
                            }
                        }

                        Device (PR32)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                                })
                                Return (UPCP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR32._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1D, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                                    }
                                })
                                Return (PLDP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR32._PLD.PLDP */
                            }
                        }

                        Device (PR33)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                                })
                                Return (UPCP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR33._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                                    }
                                })
                                Return (PLDP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR33._PLD.PLDP */
                            }
                        }

                        Device (PR34)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                                })
                                Return (UPCP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR34._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    { 0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xB1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                                    }
                                })
                                Return (PLDP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR34._PLD.PLDP */
                            }
                        }

                        Device (PR35)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                                })
                                Return (UPCP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR35._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xB1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                                    }
                                })
                                Return (PLDP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR35._PLD.PLDP */
                            }
                        }

                        Device (PR36)
                        {
                            Name (_ADR, 0x07)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                                })
                                Return (UPCP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR36._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xB1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                                    }
                                })
                                Return (PLDP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR36._PLD.PLDP */
                            }
                        }

                        Device (PR37)
                        {
                            Name (_ADR, 0x08)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                                })
                                Return (UPCP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR37._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xB1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                                    }
                                })
                                Return (PLDP) /* \_SB_.PCI0.EUSB.HUBN.PR10.PR37._PLD.PLDP */
                            }
                        }
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }

            Device (USBE)
            {
                Name (_ADR, 0x001A0000)  // _ADR: Address
                Name (_S4D, 0x02)  // _S4D: S4 Device State
                Name (_S3D, 0x02)  // _S3D: S3 Device State
                Name (_S2D, 0x02)  // _S2D: S2 Device State
                Name (_S1D, 0x02)  // _S1D: S1 Device State
                Device (HUBN)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PR10)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                            })
                            Return (UPCP) /* \_SB_.PCI0.USBE.HUBN.PR10._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                            0x81, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x30, 
                            0x1C, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                                }
                            })
                            Return (PLDP) /* \_SB_.PCI0.USBE.HUBN.PR10._PLD.PLDP */
                        }
                        Device (PR30)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                                })
                                Return (UPCP) /* \_SB_.PCI0.USBE.HUBN.PR10.PR30._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1C, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                                    }
                                })
                                Return (PLDP) /* \_SB_.PCI0.USBE.HUBN.PR10.PR30._PLD.PLDP */
                            }
                        }

                        Device (PR31)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                                })
                                Return (UPCP) /* \_SB_.PCI0.USBE.HUBN.PR10.PR31._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1D, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                                    }
                                })
                                Return (PLDP) /* \_SB_.PCI0.USBE.HUBN.PR10.PR31._PLD.PLDP */
                            }
                        }

                        Device (PR32)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                                })
                                Return (UPCP) /* \_SB_.PCI0.USBE.HUBN.PR10.PR32._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1D, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                                    }
                                })
                                Return (PLDP) /* \_SB_.PCI0.USBE.HUBN.PR10.PR32._PLD.PLDP */
                            }
                        }

                        Device (PR33)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                                })
                                Return (UPCP) /* \_SB_.PCI0.USBE.HUBN.PR10.PR33._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                                    }
                                })
                                Return (PLDP) /* \_SB_.PCI0.USBE.HUBN.PR10.PR33._PLD.PLDP */
                            }
                        }
                        Device (PR34)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                                })
                                Return (UPCP) /* \_SB_.PCI0.USBE.HUBN.PR10.PR34._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xB1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                                    }
                                })
                                Return (PLDP) /* \_SB_.PCI0.USBE.HUBN.PR10.PR34._PLD.PLDP */
                            }
                        }

                        Device (PR35)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                                })
                                Return (UPCP) /* \_SB_.PCI0.USBE.HUBN.PR10.PR35._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                                    }
                                })
                                Return (PLDP) /* \_SB_.PCI0.USBE.HUBN.PR10.PR35._PLD.PLDP */
                            }
                        }
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }

            Device (PEX0)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR01) /* \_SB_.AR01 */
                    }

                    Return (PR01) /* \_SB_.PR01 */
                }
            }

            Device (PEX1)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR02) /* \_SB_.AR02 */
                    }

                    Return (PR02) /* \_SB_.PR02 */
                }
            }

            Device (PEX2)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR03) /* \_SB_.AR03 */
                    }

                    Return (PR03) /* \_SB_.PR03 */
                }
            }

            Device (PEX3)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR04) /* \_SB_.AR04 */
                    }

                    Return (PR04) /* \_SB_.PR04 */
                }
            }

            Device (PEX4)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR05) /* \_SB_.AR05 */
                    }

                    Return (PR05) /* \_SB_.PR05 */
                }
            }

            Device (PEX5)
            {
                Name (_ADR, 0x001C0005)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR06) /* \_SB_.AR06 */
                    }

                    Return (PR06) /* \_SB_.PR06 */
                }
            }

            Device (PEX6)
            {
                Name (_ADR, 0x001C0006)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR07) /* \_SB_.AR07 */
                    }

                    Return (PR07) /* \_SB_.PR07 */
                }
            }

            Device (PEX7)
            {
                Name (_ADR, 0x001C0007)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR08) /* \_SB_.AR08 */
                    }

                    Return (PR08) /* \_SB_.PR08 */
                }
            }

            Device (P0PA)
            {
                Name (_ADR, 0x00110000)  // _ADR: Address
            }

            Device (GBE)
            {
                Name (_ADR, 0x00190000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }

            Device (NPE1)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPE2)
            {
                Name (_ADR, 0x00010001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR12) /* \_SB_.AR12 */
                    }

                    Return (PR12) /* \_SB_.PR12 */
                }
            }

            Device (NPE3)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR13) /* \_SB_.AR13 */
                    }

                    Return (PR13) /* \_SB_.PR13 */
                }
            }

            Device (NPE4)
            {
                Name (_ADR, 0x00020001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPE5)
            {
                Name (_ADR, 0x00020002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPE6)
            {
                Name (_ADR, 0x00020003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPE7)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR17) /* \_SB_.AR17 */
                    }

                    Return (PR17) /* \_SB_.PR17 */
                }
            }

            Device (NPE8)
            {
                Name (_ADR, 0x00030001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPE9)
            {
                Name (_ADR, 0x00030002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPEA)
            {
                Name (_ADR, 0x00030003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }
            Device (MCHC)
            {
                Name (_ADR, Zero)
            }
        }

        Scope (\_GPE)
        {
            Method (_L1D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                \_SB.PCI0.LPCB.SIOH ()
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                Notify (\_SB.PCI0.P0P9, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                Notify (\_SB.PCI0.EUSB, 0x02) // Device Wake
                Notify (\_SB.PCI0.USBE, 0x02) // Device Wake
                Notify (\_SB.PCI0.GBE, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                Notify (\_SB.PCI0.PEX0, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX1, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX2, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX3, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX4, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX5, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX6, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX7, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE1, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE2, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE3, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE4, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE5, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE6, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE7, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE8, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE9, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPEA, 0x02) // Device Wake
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Name (_UID, 0xAA)  // _UID: Unique ID
            Name (_STA, 0x0B)  // _STA: Status
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (GPRW (0x1D, 0x03))
            }
        }
    }

    OperationRegion (_SB.PCI0.LPCB.PIX0, PCI_Config, 0x60, 0x0C)
    Field (\_SB.PCI0.LPCB.PIX0, ByteAcc, NoLock, Preserve)
    {
        PIRA,   8, 
        PIRB,   8, 
        PIRC,   8, 
        PIRD,   8, 
        Offset (0x08), 
        PIRE,   8, 
        PIRF,   8, 
        PIRG,   8, 
        PIRH,   8
    }

    Scope (_SB)
    {
        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        CreateWordField (BUFA, One, IRA0)
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRA & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSA) /* \_SB_.PRSA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRA |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRA & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRA = Local0
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRB & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSB) /* \_SB_.PRSB */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRB |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRB & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRB = Local0
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRC & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSC) /* \_SB_.PRSC */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRC |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRC & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRC = Local0
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRD & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSD) /* \_SB_.PRSD */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRD |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRD & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRD = Local0
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRE & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSE) /* \_SB_.PRSE */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRE |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRE & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRE = Local0
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRF & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSF) /* \_SB_.PRSF */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRF |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRF & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRF = Local0
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRG & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSG) /* \_SB_.PRSG */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRG |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRG & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRG = Local0
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRH & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSH) /* \_SB_.PRSH */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRH |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRH & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRH = Local0
            }
        }
    }

    OperationRegion (_SB.PCI0.LPCB.LPCR, PCI_Config, 0x80, 0x04)
    Field (\_SB.PCI0.LPCB.LPCR, ByteAcc, NoLock, Preserve)
    {
        CADR,   3, 
            ,   1, 
        CBDR,   3, 
        Offset (0x01), 
        LTDR,   2, 
            ,   2, 
        FDDR,   1, 
        Offset (0x02), 
        CALE,   1, 
        CBLE,   1, 
        LTLE,   1, 
        FDLE,   1, 
        Offset (0x03), 
        GLLE,   1, 
        GHLE,   1, 
        KCLE,   1, 
        MCLE,   1, 
        C1LE,   1, 
        C2LE,   1, 
        Offset (0x04)
    }

    Method (UXDV, 1, NotSerialized)
    {
        Local0 = 0xFF
        Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
        _T_0 = (Arg0 + Zero)
        If ((_T_0 == 0x03F8))
        {
            Local0 = Zero
        }
        ElseIf ((_T_0 == 0x02F8))
        {
            Local0 = One
        }
        ElseIf ((_T_0 == 0x0220))
        {
            Local0 = 0x02
        }
        ElseIf ((_T_0 == 0x0228))
        {
            Local0 = 0x03
        }
        ElseIf ((_T_0 == 0x0238))
        {
            Local0 = 0x04
        }
        ElseIf ((_T_0 == 0x02E8))
        {
            Local0 = 0x05
        }
        ElseIf ((_T_0 == 0x0338))
        {
            Local0 = 0x06
        }
        ElseIf ((_T_0 == 0x03E8))
        {
            Local0 = 0x07
        }

        Return (Local0)
    }

    Method (RRIO, 4, NotSerialized)
    {
        Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
        _T_0 = (Arg0 + Zero)
        If ((_T_0 == Zero))
        {
            CALE = Zero
            Local0 = UXDV (Arg2)
            If ((Local0 != 0xFF))
            {
                CADR = Local0
            }

            If (Arg1)
            {
                CALE = One
            }
        }
        ElseIf ((_T_0 == One))
        {
            CBLE = Zero
            Local0 = UXDV (Arg2)
            If ((Local0 != 0xFF))
            {
                CBDR = Local0
            }

            If (Arg1)
            {
                CBLE = One
            }
        }
        ElseIf ((_T_0 == 0x02))
        {
            LTLE = Zero
            If ((Arg2 == 0x0378))
            {
                LTDR = Zero
            }

            If ((Arg2 == 0x0278))
            {
                LTDR = One
            }

            If ((Arg2 == 0x03BC))
            {
                LTDR = 0x02
            }

            If (Arg1)
            {
                LTLE = One
            }
        }
        ElseIf ((_T_0 == 0x03))
        {
            FDLE = Zero
            If ((Arg2 == 0x03F0))
            {
                FDDR = Zero
            }

            If ((Arg2 == 0x0370))
            {
                FDDR = One
            }

            If (Arg1)
            {
                FDLE = One
            }
        }
        ElseIf ((_T_0 == 0x08))
        {
            If ((Arg2 == 0x0200))
            {
                If (Arg1)
                {
                    GLLE = One
                }
                Else
                {
                    GLLE = Zero
                }
            }

            If ((Arg2 == 0x0208))
            {
                If (Arg1)
                {
                    GHLE = One
                }
                Else
                {
                    GHLE = Zero
                }
            }
        }
        ElseIf ((_T_0 == 0x09))
        {
            If ((Arg2 == 0x0200))
            {
                If (Arg1)
                {
                    GLLE = One
                }
                Else
                {
                    GLLE = Zero
                }
            }

            If ((Arg2 == 0x0208))
            {
                If (Arg1)
                {
                    GHLE = One
                }
                Else
                {
                    GHLE = Zero
                }
            }
        }
        ElseIf ((_T_0 == 0x0A))
        {
            If (((Arg2 == 0x60) || (Arg2 == 0x64)))
            {
                If (Arg1)
                {
                    KCLE = One
                }
                Else
                {
                    KCLE = Zero
                }
            }
        }
        ElseIf ((_T_0 == 0x0B))
        {
            If (((Arg2 == 0x62) || (Arg2 == 0x66)))
            {
                If (Arg1)
                {
                    MCLE = One
                }
                Else
                {
                    MCLE = Zero
                }
            }
        }
        ElseIf ((_T_0 == 0x0C))
        {
            If ((Arg2 == 0x2E))
            {
                If (Arg1)
                {
                    C1LE = One
                }
                Else
                {
                    C1LE = Zero
                }
            }

            If ((Arg2 == 0x4E))
            {
                If (Arg1)
                {
                    C2LE = One
                }
                Else
                {
                    C2LE = Zero
                }
            }
        }
        ElseIf ((_T_0 == 0x0D))
        {
            If ((Arg2 == 0x2E))
            {
                If (Arg1)
                {
                    C1LE = One
                }
                Else
                {
                    C1LE = Zero
                }
            }

            If ((Arg2 == 0x4E))
            {
                If (Arg1)
                {
                    C2LE = One
                }
                Else
                {
                    C2LE = Zero
                }
            }
        }
    }

    Method (RDMA, 3, NotSerialized)
    {
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Device (HPET)
            {
                Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                Name (CRS, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFED00000,         // Address Base
                        0x00000400,         // Address Length
                        _Y1D)
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
                    CreateDWordField (CRS, \_SB.PCI0.HPET._Y1D._BAS, HTBS)  // _BAS: Base Address
                    Local0 = (HPTS * 0x1000)
                    HTBS = (Local0 + 0xFED00000)
                    Return (CRS) /* \_SB_.PCI0.HPET.CRS_ */
                }
            }
        }
    }

    Name (WOTB, Zero)
    Name (WSSB, Zero)
    Name (WAXB, Zero)
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        DBG8 = Arg0
        If (((Arg0 == 0x04) && (OSFL () == 0x02)))
        {
            Sleep (0x0BB8)
        }

        PTS (Arg0)
        WAKP [Zero] = Zero
        WAKP [One] = Zero
        WSSB = ASSB /* \ASSB */
        WOTB = AOTB /* \AOTB */
        WAXB = AAXB /* \AAXB */
        ASSB = Arg0
        AOTB = OSFL ()
        AAXB = Zero
        \_SB.SLPS = One
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        DBG8 = (Arg0 << 0x04)
        WAK (Arg0)
        If (ASSB)
        {
            ASSB = WSSB /* \WSSB */
            AOTB = WOTB /* \WOTB */
            AAXB = WAXB /* \WAXB */
        }

        If (DerefOf (WAKP [Zero]))
        {
            WAKP [One] = Zero
        }
        Else
        {
            WAKP [One] = Arg0
        }

        Return (WAKP) /* \WAKP */
    }

    Device (LDRC)
    {
        Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
        Name (_UID, 0x0E11)  // _UID: Unique ID
    }

    Device (_SB.RMEM)
    {
        Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
        Name (_UID, One)  // _UID: Unique ID
    }

    OperationRegion (GSTS, SystemIO, 0x0422, One)
    Field (GSTS, ByteAcc, NoLock, Preserve)
    {
        GP0,    1, 
        Offset (0x01)
    }

    OperationRegion (PMIO, SystemIO, PMBS, 0x80)
    Field (PMIO, ByteAcc, NoLock, Preserve)
    {
        Offset (0x20), 
        Offset (0x22), 
        GP00,   1
    }

    OperationRegion (DBG0, SystemIO, 0x80, 0x02)
    Field (DBG0, ByteAcc, NoLock, Preserve)
    {
        IO80,   8, 
        IO81,   8
    }

    OperationRegion (GINV, SystemIO, 0x052C, One)
    Field (GINV, ByteAcc, NoLock, Preserve)
    {
        GPIN,   1, 
        Offset (0x01)
    }

    Scope (_SB)
    {
        Name (\PCAP, 0x00010000)
        Method (\_GPE._L10, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            GP0 = One
            GPIN ^= One
            IO80 = 0xBB
            Notify (\_SB.WERR, 0x80) // Status Change
        }

        Device (WERR)
        {
            Name (_HID, EisaId ("PNP0C33") /* Error Device */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((OSFL () == 0x0A))
                {
                    If ((PCAP & 0x00010000))
                    {
                        Return (0x0F)
                    }
                }

                Return (Zero)
            }
        }

        OperationRegion (SWPT, SystemIO, 0xB2, 0x02)
        Field (SWPT, ByteAcc, Lock, Preserve)
        {
            SWIC,   8, 
            SWIS,   8
        }

        OperationRegion (GNVS, SystemMemory, 0xFFFF0000, 0x06)
        Field (GNVS, AnyAcc, Lock, Preserve)
        {
            WSIS,   16, 
            WSIB,   8, 
            WSID,   8, 
            WSIF,   8, 
            WSTS,   8
        }

        Method (SWWE, 1, NotSerialized)
        {
            SWIC = Zero
            SWIC = Arg0
        }

        Device (SRIO)
        {
            Name (_HID, "PNP0C14" /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_WDG, Buffer (0x14)
            {
                /* 0000 */  0xF2, 0xF9, 0x7A, 0x0E, 0xA1, 0x44, 0x6F, 0x4C,  // ..z..DoL
                /* 0008 */  0xA4, 0xB0, 0xA7, 0x67, 0x84, 0x80, 0xDA, 0x61,  // ...g...a
                /* 0010 */  0x41, 0x41, 0x01, 0x02                           // AA..
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (WMAA, 3, NotSerialized)
            {
                Local0 = Arg2
                CreateWordField (Local0, Zero, CPW0)
                CreateByteField (Local0, 0x02, CPB2)
                CreateByteField (Local0, 0x03, CPB3)
                CreateByteField (Local0, 0x04, CPB4)
                CreateByteField (Local0, 0x05, CPB5)
                WSIS = CPW0 /* \_SB_.SRIO.WMAA.CPW0 */
                WSIB = CPB2 /* \_SB_.SRIO.WMAA.CPB2 */
                WSID = CPB3 /* \_SB_.SRIO.WMAA.CPB3 */
                WSIF = CPB4 /* \_SB_.SRIO.WMAA.CPB4 */
                If ((Arg1 == One))
                {
                    SWIS = One
                    SWWE (0x73)
                }

                If ((Arg1 == 0x02))
                {
                    SWIS = 0x02
                    SWWE (0x73)
                }

                If ((Arg1 == 0x03))
                {
                    SWIS = 0x03
                    SWWE (0x73)
                }

                Return (Zero)
            }
        }
    }

    Device (_SB.PCI0.LPCB.TPM)
    {
        Name (_ADR, Zero)
        Name (_STR, Unicode ("TPM 1.2 Device"))  // _STR: Description String
        Name (_UID, One)  // _UID: Unique ID
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
            Memory32Fixed (ReadOnly,
                0xFED40000,         // Address Base
                0x00005000,         // Address Length
                )
        })
        OperationRegion (TMMB, SystemMemory, 0xFED40000, 0x5000)
        Field (TMMB, ByteAcc, Lock, Preserve)
        {
            ACCS,   8, 
            Offset (0x18), 
            TSTA,   8, 
            TBCA,   8, 
            Offset (0xF00), 
            TVID,   16, 
            TDID,   16
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (TPMF)
            {
                Return (0x0F)
            }

            Return (Zero)
        }
    }

    Scope (_SB.PCI0.LPCB.TPM)
    {
        OperationRegion (ASMI, SystemIO, SMIA, One)
        Field (ASMI, ByteAcc, NoLock, Preserve)
        {
            INQ,    8
        }

        OperationRegion (BSMI, SystemIO, SMIB, One)
        Field (BSMI, ByteAcc, NoLock, Preserve)
        {
            DAT,    8
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If ((Arg0 == ToUUID ("3dddfaa6-361b-4eb4-a424-8d10089d1653") /* Physical Presence Interface */))
            {
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                _T_0 = ToInteger (Arg2)
                If ((_T_0 == Zero))
                {
                    Return (Buffer (0x02)
                    {
                         0xFF, 0x01                                       // ..
                    })
                }
                ElseIf ((_T_0 == One))
                {
                    Return ("1.2")
                }
                ElseIf ((_T_0 == 0x02))
                {
                    ToInteger (DerefOf (Arg3 [Zero]), TMF2) /* \TMF2 */
                    TMF1 = 0x12
                    DAT = TMF1 /* \TMF1 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    DAT = TMF2 /* \TMF2 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    If ((DAT == 0xF1))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }
                ElseIf ((_T_0 == 0x03))
                {
                    Name (PPI1, Package (0x02)
                    {
                        Zero, 
                        Zero
                    })
                    DAT = 0x11
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (One)
                    }

                    PPI1 [One] = DAT /* \_SB_.PCI0.LPCB.TPM_.DAT_ */
                    Return (PPI1) /* \_SB_.PCI0.LPCB.TPM_._DSM.PPI1 */
                }
                ElseIf ((_T_0 == 0x04))
                {
                    Return (TRST) /* \TRST */
                }
                ElseIf ((_T_0 == 0x05))
                {
                    Name (PPI2, Package (0x03)
                    {
                        Zero, 
                        Zero, 
                        Zero
                    })
                    DAT = 0x21
                    INQ = OFST /* \OFST */
                    PPI2 [One] = DAT /* \_SB_.PCI0.LPCB.TPM_.DAT_ */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    DAT = 0x31
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    If ((DAT == 0xF0))
                    {
                        DAT = 0x51
                        INQ = OFST /* \OFST */
                        If ((DAT == 0xFF))
                        {
                            PPI2 [0x02] = 0xFFFFFFF0
                            Return (PPI2) /* \_SB_.PCI0.LPCB.TPM_._DSM.PPI2 */
                        }
                    }
                    ElseIf ((DAT == 0xF1))
                    {
                        DAT = 0x51
                        INQ = OFST /* \OFST */
                        If ((DAT == 0xFF))
                        {
                            PPI2 [0x02] = 0xFFFFFFF1
                            Return (PPI2) /* \_SB_.PCI0.LPCB.TPM_._DSM.PPI2 */
                        }
                    }
                    Else
                    {
                        PPI2 [0x02] = DAT /* \_SB_.PCI0.LPCB.TPM_.DAT_ */
                    }

                    Return (PPI2) /* \_SB_.PCI0.LPCB.TPM_._DSM.PPI2 */
                }
                ElseIf ((_T_0 == 0x06))
                {
                    Return (0x03)
                }
                ElseIf ((_T_0 == 0x07))
                {
                    ToInteger (DerefOf (Arg3 [Zero]), TMF2) /* \TMF2 */
                    TMF1 = 0x12
                    DAT = TMF1 /* \TMF1 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    DAT = TMF2 /* \TMF2 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    If ((DAT == 0xF1))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }
                ElseIf ((_T_0 == 0x08))
                {
                    ToInteger (DerefOf (Arg3 [Zero]), TMF2) /* \TMF2 */
                    TMF1 = 0x43
                    DAT = TMF1 /* \TMF1 */
                    INQ = OFST /* \OFST */
                    DAT = TMF2 /* \TMF2 */
                    INQ = OFST /* \OFST */
                    Return (DAT) /* \_SB_.PCI0.LPCB.TPM_.DAT_ */
                }
                Else
                {
                }
            }
            ElseIf ((Arg0 == ToUUID ("376054ed-cc13-4675-901c-4756d7f2d45d") /* Unknown UUID */))
            {
                Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                _T_1 = ToInteger (Arg2)
                If ((_T_1 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }
                ElseIf ((_T_1 == One))
                {
                    TMF1 = 0x22
                    DAT = TMF1 /* \TMF1 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    ToInteger (DerefOf (Arg3 [Zero]), TMF1) /* \TMF1 */
                    DAT = TMF1 /* \TMF1 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    Return (Zero)
                }
                Else
                {
                }
            }

            Return (Buffer (One)
            {
                 0x00                                             // .
            })
        }
    }

    Method (WOSC, 4, NotSerialized)
    {
        CreateDWordField (Arg3, Zero, CDW1)
        If ((Arg2 > One))
        {
            CreateDWordField (Arg3, 0x04, CDW2)
        }

        If ((Arg0 == ToUUID ("ed855e0c-6c90-47bf-a62a-26de0fc5ad5c") /* Unknown UUID */))
        {
            CreateDWordField (Arg3, 0x08, CDW3)
            If (WHEA)
            {
                If ((CDW2 & One)){}
            }

            Return (Zero)
        }

        If ((Arg0 == ToUUID ("0811b06e-4a27-44f9-8d60-3cbbc22e7b48") /* Platform-wide Capabilities */))
        {
            If ((CDW2 & 0x10)){}
            Return (Zero)
        }

        CDW1 |= 0x04
        Return (Zero)
    }

    Scope (_SB)
    {
        Name (\PETE, Zero)
        Name (\PSTE, Zero)
        Name (\TSTE, Zero)
        Name (\NPB0, One)
        Name (\NPB1, Zero)
        Name (\NPB2, Zero)
        Name (\NPB3, Zero)
        Name (P0ID, Zero)
        Name (P1ID, 0x20)
        Name (P2ID, 0x40)
        Name (P3ID, 0x60)
        Name (P0BM, 0x3FFFFFFF)
        Name (P1BM, 0x3FFFFFFF)
        Name (P2BM, 0x3FFFFFFF)
        Name (P3BM, 0x3FFFFFFF)
        Name (CUU0, Zero)
        Name (CUU1, Zero)
        Name (CUU2, Zero)
        Name (CUU3, Zero)
        Method (PSTA, 1, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                If (NPB0)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            If ((Arg0 == One))
            {
                If (NPB1)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            If ((Arg0 == 0x02))
            {
                If (NPB2)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            If ((Arg0 == 0x03))
            {
                If (NPB3)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Return (Zero)
        }

        Method (CSTA, 2, NotSerialized)
        {
            Local0 = Zero
            If ((Arg0 == Zero))
            {
                Local0 = (P0BM >> Arg1)
            }

            If ((Arg0 == One))
            {
                Local0 = (P1BM >> Arg1)
            }

            If ((Arg0 == 0x02))
            {
                Local0 = (P2BM >> Arg1)
            }

            If ((Arg0 == 0x03))
            {
                Local0 = (P3BM >> Arg1)
            }

            Local0 &= One
            If ((Local0 == Zero))
            {
                Return (Zero)
            }
            Else
            {
                Return (One)
            }
        }

        Device (SCK0)
        {
            Name (_HID, "ACPI0004" /* Module Device */)  // _HID: Hardware ID
            Name (_UID, "CPUSCK0")  // _UID: Unique ID
            Name (SCKN, Zero)
            Name (LSTA, 0xFF)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                CUU0 = "CPUSCK0"
                Local0 = PSTA (Zero)
                Local1 = (Local0 & 0x03)
                LSTA = Local1
                Return (Local0)
            }

            Processor (C000, 0x00, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, Zero)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, Zero) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C001, 0x01, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, One)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, One) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C002, 0x02, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x02)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x02) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C003, 0x03, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x03)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x03) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C004, 0x04, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x04)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x04) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C005, 0x05, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x05)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x05) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C006, 0x06, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x06)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x06) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C007, 0x07, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x07)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x07) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C008, 0x08, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x08)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x08) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C009, 0x09, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x09)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x09) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C00A, 0x0A, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0A)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x0A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C00B, 0x0B, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0B)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x0B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C00C, 0x0C, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0C)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x0C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C00D, 0x0D, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0D)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x0D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C00E, 0x0E, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0E)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x0E) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C00F, 0x0F, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0F)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x0F) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C010, 0x10, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x10)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x10) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C011, 0x11, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x11)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x11) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C012, 0x12, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x12)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x12) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C013, 0x13, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x13)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x13) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C014, 0x14, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x14)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x14) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C015, 0x15, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x15)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x15) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C016, 0x16, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x16)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x16) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C017, 0x17, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x17)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x17) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C018, 0x18, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x18)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x18) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C019, 0x19, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x19)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x19) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C01A, 0x1A, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x1A)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x1A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C01B, 0x1B, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x1B)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x1B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C01C, 0x1C, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x1C)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x1C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C01D, 0x1D, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x1D)  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x1D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }

        Device (SCK1)
        {
            Name (_HID, "ACPI0004" /* Module Device */)  // _HID: Hardware ID
            Name (_UID, "CPUSCK1")  // _UID: Unique ID
            Name (SCKN, One)
            Name (LSTA, 0xFF)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                CUU1 = "CPUSCK1"
                Local0 = PSTA (One)
                Local1 = (Local0 & 0x03)
                LSTA = Local1
                Return (Local0)
            }

            Processor (C100, 0x20, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x20)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x20) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C101, 0x21, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x21)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x21) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C102, 0x22, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x22)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x22) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C103, 0x23, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x23)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x23) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C104, 0x24, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x24)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x24) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C105, 0x25, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x25)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x25) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C106, 0x26, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x26)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x26) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C107, 0x27, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x27)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x27) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C108, 0x28, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x28)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x28) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C109, 0x29, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x29)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x29) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C10A, 0x2A, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x2A)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x2A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C10B, 0x2B, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x2B)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x2B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C10C, 0x2C, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x2C)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x2C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C10D, 0x2D, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x2D)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x2D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C10E, 0x2E, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x2E)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x2E) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C10F, 0x2F, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x2F)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x2F) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C110, 0x30, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x30)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x30) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C111, 0x31, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x31)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x31) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C112, 0x32, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x32)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x32) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C113, 0x33, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x33)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x33) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C114, 0x34, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x34)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x34) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C115, 0x35, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x35)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x35) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C116, 0x36, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x36)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x36) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C117, 0x37, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x37)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x37) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C118, 0x38, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x38)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x38) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C119, 0x39, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x39)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x39) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C11A, 0x3A, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x3A)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x3A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C11B, 0x3B, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x3B)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x3B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C11C, 0x3C, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x3C)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x3C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C11D, 0x3D, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x3D)  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x3D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }

        Device (SCK2)
        {
            Name (_HID, "ACPI0004" /* Module Device */)  // _HID: Hardware ID
            Name (_UID, "CPUSCK2")  // _UID: Unique ID
            Name (SCKN, 0x02)
            Name (LSTA, 0xFF)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                CUU2 = "CPUSCK2"
                Local0 = PSTA (0x02)
                Local1 = (Local0 & 0x03)
                LSTA = Local1
                Return (Local0)
            }

            Processor (C200, 0x40, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x40)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x40) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C201, 0x41, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x41)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x41) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C202, 0x42, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x42)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x42) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C203, 0x43, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x43)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x43) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C204, 0x44, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x44)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x44) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C205, 0x45, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x45)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x45) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C206, 0x46, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x46)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x46) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C207, 0x47, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x47)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x47) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C208, 0x48, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x48)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x48) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C209, 0x49, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x49)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x49) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C20A, 0x4A, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x4A)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x4A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C20B, 0x4B, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x4B)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x4B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C20C, 0x4C, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x4C)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x4C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C20D, 0x4D, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x4D)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x4D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C20E, 0x4E, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x4E)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x4E) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C20F, 0x4F, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x4F)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x4F) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C210, 0x50, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x50)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x50) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C211, 0x51, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x51)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x51) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C212, 0x52, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x52)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x52) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C213, 0x53, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x53)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x53) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C214, 0x54, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x54)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x54) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C215, 0x55, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x55)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x55) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C216, 0x56, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x56)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x56) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C217, 0x57, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x57)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x57) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C218, 0x58, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x58)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x58) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C219, 0x59, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x59)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x59) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C21A, 0x5A, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x5A)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x5A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C21B, 0x5B, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x5B)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x5B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C21C, 0x5C, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x5C)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x5C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C21D, 0x5D, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x5D)  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x5D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }

        Device (SCK3)
        {
            Name (_HID, "ACPI0004" /* Module Device */)  // _HID: Hardware ID
            Name (_UID, "CPUSCK3")  // _UID: Unique ID
            Name (SCKN, 0x03)
            Name (LSTA, 0xFF)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                CUU3 = "CPUSCK3"
                Local0 = PSTA (0x03)
                Local1 = (Local0 & 0x03)
                LSTA = Local1
                Return (Local0)
            }

            Processor (C300, 0x60, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x60)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x60) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C301, 0x61, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x61)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x61) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C302, 0x62, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x62)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x62) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C303, 0x63, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x63)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x63) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C304, 0x64, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x64)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x64) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C305, 0x65, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x65)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x65) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C306, 0x66, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x66)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x66) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C307, 0x67, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x67)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x67) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C308, 0x68, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x68)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x68) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C309, 0x69, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x69)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x69) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C30A, 0x6A, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x6A)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x6A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C30B, 0x6B, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x6B)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x6B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C30C, 0x6C, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x6C)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x6C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C30D, 0x6D, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x6D)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x6D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C30E, 0x6E, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x6E)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x6E) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C30F, 0x6F, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x6F)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x6F) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C310, 0x70, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x70)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x70) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C311, 0x71, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x71)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x71) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C312, 0x72, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x72)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x72) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C313, 0x73, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x73)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x73) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C314, 0x74, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x74)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x74) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C315, 0x75, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x75)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x75) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C316, 0x76, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x76)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x76) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C317, 0x77, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x77)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x77) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C318, 0x78, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x78)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x78) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C319, 0x79, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x79)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x79) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C31A, 0x7A, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x7A)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x7A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C31B, 0x7B, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x7B)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x7B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C31C, 0x7C, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x7C)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x7C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C31D, 0x7D, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x7D)  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x7D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (SS1)
    {
        Name (_S1, Package (0x04)  // _S1_: S1 System State
        {
            One, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS3)
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x05, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS4)
    {
        Name (_S4, Package (0x04)  // _S4_: S4 System State
        {
            0x06, 
            Zero, 
            Zero, 
            Zero
        })
    }

    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
    Method (PTS, 1, NotSerialized)
    {
        If (Arg0)
        {
            \_SB.PCI0.LPCB.SPTS (Arg0)
            \_SB.PCI0.PEX0.SPRT (Arg0)
            \_SB.PCI0.PEX1.SPRT (Arg0)
            \_SB.PCI0.PEX2.SPRT (Arg0)
            \_SB.PCI0.PEX3.SPRT (Arg0)
            \_SB.PCI0.PEX4.SPRT (Arg0)
            \_SB.PCI0.PEX5.SPRT (Arg0)
            \_SB.PCI0.PEX6.SPRT (Arg0)
            \_SB.PCI0.PEX7.SPRT (Arg0)
            \_SB.PCI0.LPCB.SIOS (Arg0)
        }
    }

    Method (WAK, 1, NotSerialized)
    {
        \_SB.PCI0.LPCB.SWAK (Arg0)
        If (\_SB.PCI0.PEX0.PMS)
        {
            \_SB.PCI0.PEX0.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX0, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX0.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX1.PMS)
        {
            \_SB.PCI0.PEX1.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX1, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX1.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX2.PMS)
        {
            \_SB.PCI0.PEX2.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX2, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX2.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX3.PMS)
        {
            \_SB.PCI0.PEX3.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX3, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX3.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX4.PMS)
        {
            \_SB.PCI0.PEX4.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX4, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX4.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX5.PMS)
        {
            \_SB.PCI0.PEX5.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX5, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX5.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX6.PMS)
        {
            \_SB.PCI0.PEX6.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX6, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX6.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX7.PMS)
        {
            \_SB.PCI0.PEX7.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX7, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX7.WPRT (Arg0)
        }

        \_SB.PCI0.LPCB.SIOW (Arg0)
    }

    Method (_SB._OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
    {
        WOSC (Arg0, Arg1, Arg2, Arg3)
        Return (Arg3)
    }
}

