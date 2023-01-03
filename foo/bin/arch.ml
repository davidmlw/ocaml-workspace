(* Implementation of the command, we just print the args. *)

type version = {
    major: int;
    minor: int
  }

let armv0p0 = {major=0; minor=0}

let armv8p0 = {major=8; minor=0}
let armv8p1 = {major=8; minor=1}
let armv8p2 = {major=8; minor=2}
let armv8p3 = {major=8; minor=3}
let armv8p4 = {major=8; minor=4}
let armv8p5 = {major=8; minor=5}
let armv8p6 = {major=8; minor=6}
let armv8p7 = {major=8; minor=7}
let armv8p8 = {major=8; minor=8}
let armv8p9 = {major=8; minor=9}

let armv9p0 = {major=9; minor=0}
let armv9p1 = {major=9; minor=1}
let armv9p2 = {major=9; minor=2}
let armv9p3 = {major=9; minor=3}
let armv9p4 = {major=9; minor=4}
let armv9p5 = {major=9; minor=5}
let armv9p6 = {major=9; minor=6}
let armv9p7 = {major=9; minor=7}
let armv9p8 = {major=9; minor=8}
let armv9p9 = {major=9; minor=9}

let v0p0 = Option.some(armv0p0)

let v8p0 = Option.some(armv8p0)
let v8p1 = Option.some(armv8p1)
let v8p2 = Option.some(armv8p2)
let v8p3 = Option.some(armv8p3)
let v8p4 = Option.some(armv8p4)
let v8p5 = Option.some(armv8p5)
let v8p6 = Option.some(armv8p6)
let v8p7 = Option.some(armv8p7)
let v8p8 = Option.some(armv8p8)
let v8p9 = Option.some(armv8p9)

let v9p0 = Option.some(armv9p0)
let v9p1 = Option.some(armv9p1)
let v9p2 = Option.some(armv9p2)
let v9p3 = Option.some(armv9p3)
let v9p4 = Option.some(armv9p4)
let v9p5 = Option.some(armv9p5)
let v9p6 = Option.some(armv9p6)
let v9p7 = Option.some(armv9p7)
let v9p8 = Option.some(armv9p8)
let v9p9 = Option.some(armv9p9)

type feature = {
    name: string;
    optional: version option;
    mandatory: version option;
    aarch64: bool;
    aarch32: bool;
    documentation: string
  }


type architechure = {
    name: string;
    version: version;
    features: feature list}

open Option
let feature name optional mandatory aarch64 aarch32 documentation = {name=name; optional=optional; mandatory=mandatory; aarch64=aarch64; aarch32=aarch32; documentation=documentation}

let feat_ARMv8p0             = feature "FEAT_ARMv8p0"             None v8p0 true  true  "Arm A-profile Version 8.0"
let feat_ARMv8p1             = feature "FEAT_ARMv8p1"             None v8p1 true  true  "Arm A-profile Version 8.1"
let feat_ARMv8p2             = feature "FEAT_ARMv8p2"             None v8p2 true  true  "Arm A-profile Version 8.2"
let feat_ARMv8p3             = feature "FEAT_ARMv8p3"             None v8p3 true  true  "Arm A-profile Version 8.3"
let feat_ARMv8p4             = feature "FEAT_ARMv8p4"             None v8p4 true  true  "Arm A-profile Version 8.4"
let feat_ARMv8p5             = feature "FEAT_ARMv8p5"             None v8p5 true  true  "Arm A-profile Version 8.5"
let feat_ARMv8p6             = feature "FEAT_ARMv8p6"             None v8p6 true  true  "Arm A-profile Version 8.6"
let feat_ARMv8p7             = feature "FEAT_ARMv8p7"             None v8p7 true  true  "Arm A-profile Version 8.7"
let feat_ARMv8p8             = feature "FEAT_ARMv8p8"             None v8p8 true  true  "Arm A-profile Version 8.8"
let feat_ARMv8p9             = feature "FEAT_ARMv8p9"             None v8p9 true  true  "Arm A-profile Version 8.9"
let feat_ARMv9p0             = feature "FEAT_ARMv9p0"             None v9p0 true  true  "Arm A-profile Version 9.0"
let feat_ARMv9p1             = feature "FEAT_ARMv9p1"             None v9p1 true  true  "Arm A-profile Version 9.1"
let feat_ARMv9p2             = feature "FEAT_ARMv9p2"             None v9p2 true  true  "Arm A-profile Version 9.2"
let feat_ARMv9p3             = feature "FEAT_ARMv9p3"             None v9p3 true  true  "Arm A-profile Version 9.3"

let feat_AARCH32             = feature "FEAT_AARCH32"             v8p0 None false true  "Arm A-profile Aarch32"
let feat_AARCH32_EL0         = feature "FEAT_AARCH32_EL0"         v8p0 None false true  "Arm A-profile Aarch32 EL0"
let feat_AARCH32_EL1         = feature "FEAT_AARCH32_EL1"         v8p0 None false true  "Arm A-profile Aarch32 EL1"
let feat_AARCH32_EL2         = feature "FEAT_AARCH32_EL2"         v8p0 None false true  "Arm A-profile Aarch32 EL2"
let feat_AARCH32_EL3         = feature "FEAT_AARCH32_EL3"         v8p0 None false true  "Arm A-profile Aarch32 EL3"
let feat_AARCH64             = feature "FEAT_AARCH64"             v8p0 None false true  "Arm A-profile Aarch64"
let feat_AARCH64_EL0         = feature "FEAT_AARCH64_EL0"         v8p0 None true  false "Arm A-profile Aarch64 EL0"
let feat_AARCH64_EL1         = feature "FEAT_AARCH64_EL1"         v8p0 None true  false "Arm A-profile Aarch64 EL1"
let feat_AARCH64_EL2         = feature "FEAT_AARCH64_EL2"         v8p0 None true  false "Arm A-profile Aarch64 EL2"
let feat_AARCH64_EL3         = feature "FEAT_AARCH64_EL3"         v8p0 None true  false "Arm A-profile Aarch64 EL3"
let feat_SIMDFP              = feature "FEAT_SIMDFP"              v8p0 None true  true  "Arm A-profile Advanced SIMD and Floating-Point extension"

(* 2022 Architecture Extensions *)
let feat_ABLE                = feature "FEAT_ABLE"                None None true  false "Address Breakpoint Linking extension"
let feat_ADERR               = feature "FEAT_ADERR"               None None true  false "RASv2 Additional Error syndrome reporting, for Device and Normal memory"
let feat_ANERR               = feature "FEAT_ANERR"               None None true  false "RASv2 Additional Error syndrome reporting, for Device and Normal memory"
let feat_AIE                 = feature "FEAT_AIE"                 None None true  false "Memory Attribute Index Enhancement"
let feat_B16B16              = feature "FEAT_B16B16"              None None true  false "Non-widening BFloat16 to BFloat16 arithmetic for SVE2.1 and SME2.1"
let feat_CLRBHB              = feature "FEAT_CLRBHB"              None None true  false "A new instruction CLRBHB is added in HINT space"
let feat_CSSC                = feature "FEAT_CSSC"                None None true  false "Common Short Sequence Compression scalar integer instructions"
let feat_CSV2_3              = feature "FEAT_CSV2_3"              None None true  false "New identification mechanism for Branch History information"
let feat_D128                = feature "FEAT_D128"                None None true  false "128-bit Translation Tables, 56 bit PA"
let feat_Debugv8p9           = feature "FEAT_Debugv8p9"           None None true  false "Debug 2022"
let feat_ECBHB               = feature "FEAT_ECBHB"               None None true  false "Imposes restrictions on branch hisory speculation around exceptions"
let feat_ETEv1p3             = feature "FEAT_ETEv1p3"             None None true  false "ETE support for v9.3"
let feat_FGT2                = feature "FEAT_FGT2"                None None true  false "Fine-grained traps 2"
let feat_HAFT                = feature "FEAT_HAFT"                None None true  false "Hardware managed Access Flag for Table descriptors"
let feat_ITE                 = feature "FEAT_ITE"                 None None true  false "Instrumentation trace extension"
let feat_LRCPC3              = feature "FEAT_LRCPC3"              None None true  false "Load-Acquire RCpc instructions version 3"
let feat_LSE128              = feature "FEAT_LSE128"              None None true  false "128-bit Atomics"
let feat_LVA3                = feature "FEAT_LVA3"                None None true  false "56-bit VA"
let feat_MEC                 = feature "FEAT_MEC"                 None None true  false "Memory Encryption Contexts"
let feat_MTE4                = feature "FEAT_MTE4"                None None true  false "Support for Canonical tag checking, reporting of all non-address bits on a fault, Store-only Tag checking, Memory tagging with Address tagging disabled"
let feat_MTE_CANONICAL_TAGS  = feature "FEAT_MTE_CANONICAL_TAGS"  None None true  false "Support for Canonical tag checking"
let feat_MTE_TAGGED_FAR      = feature "FEAT_MTE_TAGGED_FAR"      None None true  false "Support for reporting of all non-address bits on a fault"
let feat_MTE_STORE_ONLY      = feature "FEAT_MTE_STORE_ONLY"      None None true  false "Support for Store-only Tag checking"
let feat_MTE_NO_ADDRESS_TAGS = feature "FEAT_MTE_NO_ADDRESS_TAGS" None None true  false "Support for Memory tagging with Address tagging disabled"
let feat_MTE_ASYM_FAULT      = feature "FEAT_MTE_ASYM_FAULT"      None None true  false "Asymmetric Tag Check Fault handling"
let feat_MTE_ASYNC           = feature "FEAT_MTE_ASYNC"           None None true  false "Asynchronous Tag Check Fault handling"
let feat_MTE_PERM            = feature "FEAT_MTE_PERM"            None None true  false "Allocation tag access permission"
let feat_PCSRv8p9            = feature "FEAT_PCSRv8p9"            None None true  false "PCSR disable control"
let feat_PIE                 = feature "FEAT_PIE"                 None None true  false "Permission model enhancements"
let feat_POE                 = feature "FEAT_POE"                 None None true  false "Permission model enhancements"
let feat_S1PIE               = feature "FEAT_S1PIE"               None None true  false "Permission model enhancements"
let feat_S2PIE               = feature "FEAT_S2PIE"               None None true  false "Permission model enhancements;"
let feat_S1POE               = feature "FEAT_S1POE"               None None true  false "Permission model enhancements"
let feat_S2POE               = feature "FEAT_S2POE"               None None true  false "Permission model enhancements"
let feat_PMUv3p9             = feature "FEAT_PMUv3p9"             None None true  false "EL0 access controls for PMU event counters"
let feat_PMUv3_EDGE          = feature "FEAT_PMUv3_EDGE"          None None true  false "PMU event edge detection"
let feat_PMUv3_ICNTR         = feature "FEAT_PMUv3_ICNTR"         None None true  false "PMU instruction counter"
let feat_PMUv3_SS            = feature "FEAT_PMUv3_SS"            None None true  false "PMU snapshot"
let feat_PRFMSLC             = feature "FEAT_PRFMSLC"             None None true  false "Prefetching enhancements"
let feat_RASv2               = feature "FEAT_RASv2"               None None true  false "Reliability, Availability, and Serviceability (RAS) Extension version 2"
let feat_RPRFM               = feature "FEAT_RPRFM"               None None true  false "RPRFM range prefetch hint instruction"
let feat_SCTLR2              = feature "FEAT_SCTLR2"              None None true  false "Extension to SCTLR_ELx"
let feat_SEBEP               = feature "FEAT_SEBEP"               None None true  false "Synchronous Exception-based event profiling"
let feat_SME_F16F16          = feature "FEAT_SME_F16F16"          None None true  false "Non-widening half-precision FP16 to FP16 arithmetic for SME2.1"
let feat_SME2                = feature "FEAT_SME2"                None None true  false "Scalable Matrix Extension version SME2"
let feat_SME2p1              = feature "FEAT_SME2p1"              None None true  false "Scalable Matrix Extension version SME2.1"
let feat_SPECCOSP            = feature "FEAT_SPECCOSP"            None None true  false "Adds new Clear Other Speculative Predictions instruction"   (* to review *)
let feat_SPMU                = feature "FEAT_SPMU"                None None true  false "System PMU"
let feat_SPEv1p4             = feature "FEAT_SPEv1p4"             None None true  false "Addtional SPE events"
let feat_SPE_FDS             = feature "FEAT_SPE_FDS"             None None true  false "SPE filtering by data source"
let feat_SVE2p1              = feature "FEAT_SVE2p1"              None None true  false "Scalable Vector Extension version SVE2.1"
let feat_SYSINSTR128         = feature "FEAT_SYSINSTR128"         None None true  false "128-bit System instructions"
let feat_SYSREG128           = feature "FEAT_SYSREG128"           None None true  false "128-bit System registers"
let feat_TCR2                = feature "FEAT_TCR2"                None None true  false "Extension to TCR_ELx"
let feat_THE                 = feature "FEAT_THE"                 None None true  false "Translation Hardening Extension"
let feat_TRBE_EXT            = feature "FEAT_TRBE_EXT"            None None true  false "TRBE external mode"

(* 2021 Architecture Extensions *)
let feat_CMOW                = feature "FEAT_CMOW"                None v8p8 true  false "Control for cache maintenance permission"
let feat_CONSTPACFIELD       = feature "FEAT_CONSTPACFIELD"       v8p3 None true  false "PAC Algorithm enhancement"
let feat_Debugv8p8           = feature "FEAT_Debugv8p8"           v8p8 None true  true  "Debug v8.8"
let feat_HBC                 = feature "FEAT_HBC"                 None v8p8 true  false "Hinted conditional branches"
let feat_HPMN0               = feature "FEAT_HPMN0"               v8p8 None true  true  "Setting of MDCR_EL2.HPMN to zero"
let feat_NMI                 = feature "FEAT_NMI"                 None v8p8 true  false "Non-maskable Interrupts"
let feat_GICv3_NMI           = feature "FEAT_GICv3_NMI"           None None true  false "Non-maskable Interrupts"
let feat_MOPS                = feature "FEAT_MOPS"                None v8p8 true  false "Standardization of memory operations"
let feat_PACQARMA3           = feature "FEAT_PACQARMA3"           v8p3 None true  false "Pointer authentication - QARMA3 algorithm"
let feat_PMUv3_TH            = feature "FEAT_PMUv3_TH"            v8p8 None true  true  "Event counting threshold"
let feat_PMUv3p8             = feature "FEAT_PMUv3p8"             v8p8 None true  true  "Armv8.8 PMU Extensions"
let feat_PMUv3_EXT64         = feature "FEAT_PMUv3_EXT64"         None None true  false "Optional 64-bit external interface to the Performance Monitors"
let feat_PMUv3_EXT32         = feature "FEAT_PMUv3_EXT32"         None None true  false "Represents the original mostly 32-bit external interface to the Performance Monitors"
let feat_RNG_TRAP            = feature "FEAT_RNG_TRAP"            v8p5 None true  false "Trapping support for RNDR and RNDRRS"
let feat_SPEv1p3             = feature "FEAT_SPEv1p3"             None v8p8 true  true  "Armv8.8 Statistical Profiling Extensions"
let feat_TIDCP1              = feature "FEAT_TIDCP1"              None v8p1 true  true  "EL0 use of IMPLEMENTATION DEFINED functionality"
let feat_BRBEv1p1            = feature "FEAT_BRBEv1p1"            v9p3 None true  false "Branch Record Buffer Extensions version 1.1"


(* 2020 Architecture Extensions *)
let feat_AFP                 = feature "FEAT_AFP"                 None v8p7 true  false "Alternate floating-point behavior"
let feat_HCX                 = feature "FEAT_HCX"                 None v8p7 true  false "Support for the HCRX_EL2 register"
let feat_LPA2                = feature "FEAT_LPA2"                v8p7 None true  false "Larger physical address for 4KB and 16KB translation granules"
let feat_LS64                = feature "FEAT_LS64"                v8p7 None true  false "Support for 64 byte loads/stores without return"
let feat_LS64_V              = feature "FEAT_LS64_V"              v8p7 None true  false "Support for 64-byte stores with return"
let feat_LS64_ACCDATA        = feature "FEAT_LS64_ACCDATA"        v8p7 None true  false "Support for 64-byte EL0 stores with return"
let feat_MTE3                = feature "FEAT_MTE3"                v8p5 v8p7 true  false "MTE Asymmetric Fault Handling"
let feat_PAN3                = feature "FEAT_PAN3"                v8p1 v8p7 true  false "Support for SCTLR_ELx.EPAN"
let feat_PMUv3p7             = feature "FEAT_PMUv3p7"             None v8p7 true  true  "Armv8.7 PMU Extensions"
let feat_RPRES               = feature "FEAT_RPRES"               v8p7 None true  false "Increased precision of Reciprocal Estimate and Reciprocal Square Root Estimate"
let feat_RME                 = feature "FEAT_RME"                 v9p2 None true  false "Realm Management Extension"
let feat_SME_FA64            = feature "FEAT_SME_FA64"            v9p2 None true  false "Additional instructions for the SME Extension"
let feat_SME_F64F64          = feature "FEAT_SME_F64F64"          v9p2 None true  false "Additional instructions for the SME Extension"
let feat_SME_I16I64          = feature "FEAT_SME_I16I64"          v9p2 None true  false "Additional instructions for the SME Extension"
let feat_EBF16               = feature "FEAT_EBF16"               v9p2 None true  false "Additional instructions for the SME Extension"
let feat_SPEv1p2             = feature "FEAT_SPEv1p2"             None v8p7 true  false "Armv8.7 SPE"
let feat_WFxT                = feature "FEAT_WFxT"                None v8p7 true  false "WFE and WFI instructions with timeout"
let feat_XS                  = feature "FEAT_XS"                  None v8p7 true  false "XS attribute"
let feat_BRBE                = feature "FEAT_BRBE"                v9p2 None true  false "Branch Record Buffer Extensions"

(* Features introduced prior to 2020 *)
let feat_AdvSIMD             = feature "FEAT_AdvSIMD"             None None true  false "Advanced SIMD Extension"
let feat_AES                 = feature "FEAT_AES"                 v8p0 None true  true  "Advanced SIMD AES instructions"
let feat_PMULL               = feature "FEAT_PMULL"               v8p0 None true  true  "Advanced SIMD PMULL instructions	ARMv8.0-AES is split into AES and PMULL"
let feat_CP15SDISABLE2       = feature "FEAT_CP15SDISABLE2"       v8p0 None false true  "CP15DISABLE2"
let feat_CSV2                = feature "FEAT_CSV2"                v8p0 v8p5 true  true  "Cache Speculation Variant 2"
let feat_CSV2_1p1            = feature "FEAT_CSV2_1p1"            v8p0 None true  false "Cache Speculation Variant 2 version 1.1"
let feat_CSV2_1p2            = feature "FEAT_CSV2_1p2"            v8p0 None true  false "Cache Speculation Variant 2 version 1.2"
let feat_CSV2_2              = feature "FEAT_CSV2_2"              v8p0 None true  false "Cache Speculation Variant 2 version 2"
let feat_CSV3                = feature "FEAT_CSV3"                v8p0 v8p5 true  true  "Cache Speculation Variant 3"
let feat_DGH                 = feature "FEAT_DGH"                 v8p0 none true  false "Data Gathering Hint"
let feat_DoubleLock          = feature "FEAT_DoubleLock"          v8p0 None true  true  "Double Lock"  (* to review *)
let feat_ETS                 = feature "FEAT_ETS"                 v8p0 v8p7 true  true  "Enhanced Translation Synchronization"
let feat_FP                  = feature "FEAT_FP"                  None None true  false "Floating point extension"
let feat_IVIPT               = feature "FEAT_IVIPT"               None None true  false "The IVIPT Extension"
let feat_PCSRv8              = feature "FEAT_PCSRv8"              v8p0 None true  true  "PC Sample-base Profiling extension (not EL3 and EL2)"
let feat_SPECRES             = feature "FEAT_SPECRES"             v8p0 v8p5 true  true  "Speculation restriction instructions"
let feat_RAS                 = feature "FEAT_RAS"                 v8p0 v8p2 true  false "Reliability, Availability, and Serviceability (RAS) Extension"
let feat_SB                  = feature "FEAT_SB"                  v8p0 v8p5 true  false "Speculation barrier"
let feat_SHA1                = feature "FEAT_SHA1"                v8p0 None true  true  "Advanced SIMD SHA1 instructions"
let feat_SHA256              = feature "FEAT_SHA256"              v8p0 None true  true  "Advanced SIMD SHA256 instructions	Split ARMv8.2-SHA into SHA-256, SHA-512 and SHA-3"
let feat_SSBS                = feature "FEAT_SSBS"                v8p0 None true  false "Speculative Store Bypass Safe Instruction	ARMv8.0-SSBS is split into SSBS and SSBS2"
let feat_SSBS2               = feature "FEAT_SSBS2"               v8p0 None true  false "MRS and MSR instructions for SSBS	ARMv8.0-SSBS is split into SSBS and SSBS2"
let feat_CRC32               = feature "FEAT_CRC32"               v8p0 v8p1 true  true  "CRC32 instructions"
let feat_nTLBPA              = feature "FEAT_nTLBPA"              v8p0 None true  true  "No intermediate caching by output address in TLB"
let feat_Debugv8p1           = feature "FEAT_Debugv8p1"           None None true  false "Debug with VHE"  (*to review*)
let feat_HPDS                = feature "FEAT_HPDS"                None v8p1 true  false "Hierarchical permission disables in translation tables"
let feat_LOR                 = feature "FEAT_LOR"                 None v8p1 true  false "Limited ordering regions"
let feat_LSE                 = feature "FEAT_LSE"                 none v8p1 true  false "Large System Extensions"
let feat_PAN                 = feature "FEAT_PAN"                 None v8p1 true  true  "Privileged access-never"
let feat_PMUv3p1             = feature "FEAT_PMUv3p1"             v8p1 None true  false "PMU extensions version 3.1"
let feat_RDM                 = feature "FEAT_RDM"                 None v8p1 true  true  "Rounding double multiply accumulate"
let feat_HAFDBS              = feature "FEAT_HAFDBS"              v8p1 None true  false "Hardware updates to access flag and dirty state in translation tables"
let feat_VHE                 = feature "FEAT_VHE"                 None v8p1 true  true  "Virtualization Host Extensions"
let feat_VMID16              = feature "FEAT_VMID16"              v8p1 None true  false "16-bit VMID"
let feat_AA32BF16            = feature "FEAT_AA32BF16"            v8p2 None false true  "AArch32 BFloat16 instructions"
let feat_AA32HPD             = feature "FEAT_AA32HPD"             v8p2 None false true  "AArch32 Hierarchical permission disables"
let feat_AA32I8MM            = feature "FEAT_AA32I8MM"            v8p2 None false true  "AArch32 Int8 Matrix Multiplication"
let feat_PAN2                = feature "FEAT_PAN2"                v8p1 v8p2 true  true  "AT S1E1R and AT S1E1W instruction variants for PAN"
let feat_BF16                = feature "FEAT_BF16"                v8p2 v8p6 true  false "AARch64 BFloat16 instructions"
let feat_DPB2                = feature "FEAT_DPB2"                v8p2 v8p5 true  false "DC CVADP instruction"
let feat_DPB                 = feature "FEAT_DPB"                 None v8p2 true  false "DC CVAP instruction"
let feat_Debugv8p2           = feature "FEAT_Debugv8p2"           v8p2 None true  true  "ARMv8.2 Debug"
let feat_DotProd             = feature "FEAT_DotProd"             v8p2 v8p4 true  true  "Advanced SIMD Int8 dot product instructions"
let feat_EVT                 = feature "FEAT_EVT"                 v8p2 v8p5 true  true  "Enhanced Virtualization Traps"
let feat_F32MM               = feature "FEAT_F32MM"               v8p2 None true  false "SVE single-precision floating-point matrix multiply instruction"
let feat_F64MM               = feature "FEAT_F64MM"               v8p2 None true  false "SVE double-precision floating-point matrix multiply instruction"
let feat_FHM                 = feature "FEAT_FHM"                 v8p2 None true  true  "Half-precision floating-point FMLAL instructions"
let feat_FP16                = feature "FEAT_FP16"                v8p2 None true  true "Half-precision floating-point data processing"
let feat_I8MM                = feature "FEAT_I8MM"                v8p2 v8p6 true  false "Int8 Matrix Multiplication"
let feat_IESB                = feature "FEAT_IESB"                v8p2 None true  false "Implicit Error synchronization event"
let feat_LPA                 = feature "FEAT_LPA"                 v8p2 None true  false "Large PA and IPA support"
let feat_LSMAOC              = feature "FEAT_LSMAOC"              v8p2 None false true  "Load/Store instruction multiple atomicity and ordering controls"
let feat_LVA                 = feature "FEAT_LVA"                 v8p2 None true  false "Large VA support"
let feat_MPAM                = feature "FEAT_MPAM"                v8p4 None true  false "Memory Partitioning and Monitoring"
let feat_PCSRv8p2            = feature "FEAT_PCSRv8p2"            v8p2 None true  true  "PC Sample-based profiling version 8.2"
let feat_SHA3                = feature "FEAT_SHA3"                v8p2 None true  false "Advanced SIMD EOR3, RAX1, XAR, and BCAX instructions	Split ARMv8.2-SHA into SHA-256, SHA-512 and SHA-3"
let feat_SHA512              = feature "FEAT_SHA512"              v8p2 None true  false "Advanced SIMD SHA512 instructions	Split ARMv8.2-SHA into SHA-256, SHA-512 and SHA-3"
let feat_SM3                 = feature "FEAT_SM3"                 v8p2 None true  false "Advanced SIMD SM3 instructions	Split into SM3 and SM4"
let feat_SM4                 = feature "FEAT_SM4"                 v8p2 None true  false "Advanced SIMD SM4 instructions	Split into SM3 and SM4"
let feat_SPE                 = feature "FEAT_SPE"                 v8p2 None true  false "Statistical Profiling Extension"
let feat_SVE                 = feature "FEAT_SVE"                 v8p2 None true  false "Scalable Vector Extension"
let feat_TTCNP               = feature "FEAT_TTCNP"               None v8p2 true  true  "Common not private translations"
let feat_HPDS2               = feature "FEAT_HPDS2"               v8p2 None true  true  "Heirarchical permission disables in translation tables 2"
let feat_XNX                 = feature "FEAT_XNX"                 None v8p2 true  true  "Execute-never control distinction by Exception level at stage 2"
let feat_UAO                 = feature "FEAT_UAO"                 None v8p2 true  false "Unprivileged Access Override control"
let feat_VPIPT               = feature "FEAT_VPIPT"               v8p2 None true  true  "VMID-aware PIPT instruction cache"
let feat_CCIDX               = feature "FEAT_CCIDX"               v8p3 None true  true  "Extended cache index"
let feat_FCMA                = feature "FEAT_FCMA"                None v8p3 true  true  "Floating-point FCMLA and FCADD instructions"
let feat_DoPD                = feature "FEAT_DoPD"                v8p3 None true  false "Debug over Powerdown"
let feat_EPAC                = feature "FEAT_EPAC"                v8p3 None true  false "Enhanced Pointer authentication"
let feat_FPAC                = feature "FEAT_FPAC"                v8p3 None true  false "Faulting on pointer authentication instructions"
let feat_FPACCOMBINE         = feature "FEAT_FPACCOMBINE"         v8p3 None true  false "Faulting on combined pointer authentication instructions"
let feat_JSCVT               = feature "FEAT_JSCVT"               None v8p3 true  true  "JavaScript FJCVTS conversion instruction"
let feat_LRCPC               = feature "FEAT_LRCPC"               None None true  false "Load-acquire RCpc instructions"
let feat_NV                  = feature "FEAT_NV"                  v8p3 None true  false "Nested virtualization"
let feat_PACQARMA5           = feature "FEAT_PACQARMA5"           v8p3 None true  false "Pointer authentication - QARMA5 algorithm"
let feat_PACIMP              = feature "FEAT_PACIMP"              v8p3 None true  false "Pointer authentication - IMPLEMENTATION DEFINED algorithm"
let feat_PAuth               = feature "FEAT_PAuth"               None v8p3 true  false "Pointer authentication"
let feat_PAuth2              = feature "FEAT_PAuth2"              v8p3 v8p6 true  false "Enhancements to pointer authentication"
let feat_SPEv1p1             = feature "FEAT_SPEv1p1"             v8p3 None true  false "Statistical Profiling Extensions version 1.1"
let feat_AMUv1               = feature "FEAT_AMUv1"               v8p4 None true  true "Activity Monitors Extension"
let feat_CNTSC               = feature "FEAT_CNTSC"               v8p4 None true  true  "Generic Counter Scaling"
let feat_Debugv8p4           = feature "FEAT_Debugv8p4"           v8p4 None true  true  "Debug relaxations and extensions version 8.4"
let feat_DoubleFault         = feature "FEAT_DoubleFault"         v8p4 None true  false "Double Fault Extension"
let feat_DIT                 = feature "FEAT_DIT"                 None v8p4 true  true  "Data Independent Timing instructions"
let feat_FlagM               = feature "FEAT_FlagM"               v8p2 v8p4 true  false "Condition flag manipulation"
let feat_IDST                = feature "FEAT_IDST"                None v8p4 true  false "ID space trap handling"
let feat_LRCPC2              = feature "FEAT_LRCPC2"              v8p2 v8p4 true  false "Load-acquire RCpc instructions version 2"
let feat_LSE2                = feature "FEAT_LSE2"                v8p2 v8p4 true  false "Large System Extensions version 2"
let feat_NV2                 = feature "FEAT_NV2"                 v8p4 None true  false "Enhanced support for nested virtualization"
let feat_PMUv3p4             = feature "FEAT_PMUv3p4"             v8p2 v8p4 true  true  "PMU extension version 3.4"
let feat_RASv1p1             = feature "FEAT_RASv1p1"             v8p2 v8p4 true  true  "Reliability, Availability, and Serviceability (RAS) Extension version 1.1"
let feat_S2FWB               = feature "FEAT_S2FWB"               None v8p4 true  false "Stage 2 forced write-back"
let feat_SEL2                = feature "FEAT_SEL2"                v8p4 None true  false "Secure EL2"
let feat_TLBIOS              = feature "FEAT_TLBIOS"              None v8p4 true  false "TLB invalidate outer-shared instructions	Split into TLBIOS and TLBIRANGE"
let feat_TLBIRANGE           = feature "FEAT_TLBIRANGE"           None v8p4 true  false "TLB range invalidate range instructions	Split into TLBIOS and TLBIRANGE"
let feat_TRF                 = feature "FEAT_TRF"                 v8p4 None true  true  "Self hosted Trace Extensions"
let feat_TTL                 = feature "FEAT_TTL"                 None v8p4 true  false "Translation Table Level"
let feat_BBM                 = feature "FEAT_BBM"                 None v8p4 true  false "Translation table break before make levels"
let feat_TTST                = feature "FEAT_TTST"                v8p4 None true  false "Small translation tables"
let feat_BTI                 = feature "FEAT_BTI"                 None v8p5 true  false "Branch target identification"
let feat_FlagM2              = feature "FEAT_FlagM2"              None v8p5 true  false "Condition flag manipulation version 2"
let feat_ExS                 = feature "FEAT_ExS"                 v8p5 None true  false "Disabling context synchronizing exception entry and exit"
let feat_E0PD                = feature "FEAT_E0PD"                None v8p5 true  false "Preventing EL0 access to halves of address maps"
let feat_FRINTTS             = feature "FEAT_FRINTTS"             v8p5 None true  false "FRINT32Z, FRINT32X, FRINT64Z, and FRINT64X instructions"
let feat_GTG                 = feature "FEAT_GTG"                 None v8p5 true  false "Guest translation granule size"
let feat_MTE                 = feature "FEAT_MTE"                 v8p5 None true  false "Instruction-only Memory Tagging Extension"
let feat_MTE2                = feature "FEAT_MTE2"                v8p5 None true  false "Full Memory Tagging Extension"
let feat_PMUv3p5             = feature "FEAT_PMUv3p5"             None v8p5 true  true  "PMU Extension version 3.5"
let feat_RNG                 = feature "FEAT_RNG"                 v8p5 None true  false "Random number generator"
let feat_AMUv1p1             = feature "FEAT_AMUv1p1"             v8p6 None true  true  "Activity Monitors Extension version 1.1"
let feat_ECV                 = feature "FEAT_ECV"                 None v8p6 true  true  "Enhanced counter virtualization"
let feat_FGT                 = feature "FEAT_FGT"                 None v8p6 true  true  "Fine Grain Traps"
let feat_MPAMv0p1            = feature "FEAT_MPAMv0p1"            None None true  false "Memory Partitioning and Monitoring version 0.1"
let feat_MPAMv1p1            = feature "FEAT_MPAMv1p1"            None None true  false "Memory Partitioning and Monitoring version1.1"
let feat_MTPMU               = feature "FEAT_MTPMU"               v8p6 None true  true  "Multi-threaded PMU Extensions"
let feat_TWED                = feature "FEAT_TWED"                v8p6 None true  true  "Delayed trapping of WFE"
let feat_ETMv4               = feature "FEAT_ETMv4"               None None true  false "Embedded Trace Macrocell version4"
let feat_ETMv4p1             = feature "FEAT_ETMv4p1"             None None true  false "Embedded Trace Macrocell version 4.1"
let feat_ETMv4p2             = feature "FEAT_ETMv4p2"             None None true  false "Embedded Trace Macrocell version 4.2"
let feat_ETMv4p3             = feature "FEAT_ETMv4p3"             None None true  false "Embedded Trace Macrocell version 4.3"
let feat_ETMv4p4             = feature "FEAT_ETMv4p4"             None None true  false "Embedded Trace Macrocell version 4.3"
let feat_ETMv4p5             = feature "FEAT_ETMv4p5"             None None true  false "Embedded Trace Macrocell version 4.4"
let feat_ETMv4p6             = feature "FEAT_ETMv4p6"             None None true  false "Embedded Trace Macrocell version 4.5"
let feat_GICv3               = feature "FEAT_GICv3"               None None true  false "Generic Interrupt Controller version 3"
let feat_GICv3p1             = feature "FEAT_GICv3p1"             None None true  false "Generic Interrupt Controller version 3.1"
let feat_GICv3_TDIR          = feature "FEAT_GICv3_TDIR"          None None true  false "Trapping Non-secure EL1 writes to ICV_DIR"
let feat_GICv4               = feature "FEAT_GICv4"               None None true  false "Generic Interrupt Controller version 4"
let feat_GICv4p1             = feature "FEAT_GICv4p1"             None None true  false "Generic Interrupt Controller version 4.1"
let feat_PMUv3               = feature "FEAT_PMUv3"               None None true  false "PMU extension version 3"
let feat_ETE                 = feature "FEAT_ETE"                 v9p0 None true  false "Embedded Trace Extension"
let feat_ETEv1p1             = feature "FEAT_ETEv1p1"             v9p1 None true  false "Embedded Trace Extension, version 1.1"
let feat_ETEv1p2             = feature "FEAT_ETEv1p2"             v9p2 None true  false "Embedded Trace Extension, version 1.2"
let feat_SVE2                = feature "FEAT_SVE2"                v9p0 None true  false "SVE version 2"
let feat_SVE_AES             = feature "FEAT_SVE_AES"             v9p0 None true  false "SVE AES instructions"
let feat_SVE_PMULL128        = feature "FEAT_SVE_PMULL128"        v9p0 None true  false "SVE PMULL instructions	SVE2-AES is split into AES and PMULL support"
let feat_SVE_BitPerm         = feature "FEAT_SVE_BitPerm"         v9p0 None true  false "SVE Bit Permute"
let feat_SVE_SHA3            = feature "FEAT_SVE_SHA3"            v9p0 None true  false "SVE SHA-3 instructions"
let feat_SVE_SM4             = feature "FEAT_SVE_SM4"             v9p0 None true  false "SVE SM4 instructions"
let feat_TME                 = feature "FEAT_TME"                 None None true  false "Transactional Memory Extension"
let feat_TRBE                = feature "FEAT_TRBE"                v9p0 None true  false "Trace Buffer Extension"
let feat_SME                 = feature "FEAT_SME"                 v9p2 None true  false "Scalable Matrix Extension"

let feat_ASMv8p2             = feature "FEAT_ASMv8p2"             none v8p2 true  false "Armv8.2 changes to the A64 ISA"  (* P A2-86*)
let feat_empty               = feature "FEAT_EMPTY"               None None false false "Empty feature for SET programming"


let feature_compare (f1:feature) (f2:feature) = String.compare f1.name f2.name
let feature_print (f:feature) = Printf.printf "%s\n" f.name

module Fset = Set.Make(struct type t = feature;;let compare=feature_compare end)

let features = Fset.of_list [
                   feat_ARMv8p0; feat_ARMv8p1; feat_ARMv8p2; feat_ARMv8p3;
                   feat_ARMv8p4; feat_ARMv8p5; feat_ARMv8p6; feat_ARMv8p7; feat_ARMv8p8;
                   feat_ARMv8p9; feat_ARMv9p0; feat_ARMv9p1; feat_ARMv9p2; feat_ARMv9p3;
                   feat_AARCH32; feat_AARCH32_EL0; feat_AARCH32_EL1; feat_AARCH32_EL2; feat_AARCH32_EL3;
                   feat_AARCH64; feat_AARCH64_EL0; feat_AARCH64_EL1; feat_AARCH64_EL2; feat_AARCH64_EL3;
                   feat_SIMDFP;

                   feat_ABLE; feat_ADERR; feat_ANERR; feat_AIE; feat_B16B16; feat_CLRBHB; feat_CSSC;
                   feat_CSV2_3; feat_D128; feat_Debugv8p9; feat_ECBHB; feat_ETEv1p3; feat_FGT2; feat_HAFT;
                   feat_ITE; feat_LRCPC3; feat_LSE128; feat_LVA3; feat_MEC; feat_MTE4;
                   feat_MTE_CANONICAL_TAGS; feat_MTE_TAGGED_FAR; feat_MTE_STORE_ONLY;
                   feat_MTE_NO_ADDRESS_TAGS; feat_MTE_ASYM_FAULT; feat_MTE_ASYNC; feat_MTE_PERM;
                   feat_PCSRv8p9; feat_PIE; feat_POE; feat_S1PIE; feat_S2PIE; feat_S1POE; feat_S2POE;
                   feat_PMUv3p9; feat_PMUv3_EDGE; feat_PMUv3_ICNTR; feat_PMUv3_SS; feat_PRFMSLC;
                   feat_RASv2; feat_RPRFM; feat_SCTLR2; feat_SEBEP; feat_SME_F16F16; feat_SME2;
                   feat_SME2p1; feat_SPECCOSP; feat_SPMU; feat_SPEv1p4; feat_SPE_FDS; feat_SVE2p1;
                   feat_SYSINSTR128; feat_SYSREG128; feat_TCR2; feat_THE; feat_TRBE_EXT;

                   feat_CMOW; feat_CONSTPACFIELD; feat_Debugv8p8; feat_HBC; feat_HPMN0; feat_NMI;
                   feat_GICv3_NMI; feat_MOPS; feat_PACQARMA3; feat_PMUv3_TH; feat_PMUv3p8;
                   feat_PMUv3_EXT64; feat_PMUv3_EXT32; feat_RNG_TRAP; feat_SPEv1p3; feat_TIDCP1; feat_BRBEv1p1;

                   feat_AFP; feat_HCX; feat_LPA2; feat_LS64; feat_LS64_V; feat_LS64_ACCDATA;
                   feat_MTE3; feat_PAN3; feat_PMUv3p7; feat_RPRES; feat_RME; feat_SME_FA64;
                   feat_SME_F64F64; feat_SME_I16I64; feat_EBF16; feat_SPEv1p2; feat_WFxT;
                   feat_XS; feat_BRBE;

                   feat_AdvSIMD; feat_AES; feat_PMULL; feat_CP15SDISABLE2; feat_CSV2;
                   feat_CSV2_1p1; feat_CSV2_1p2; feat_CSV2_2; feat_CSV3; feat_DGH; feat_DoubleLock;
                   feat_ETS; feat_FP; feat_IVIPT; feat_PCSRv8; feat_SPECRES; feat_RAS; feat_SB;
                   feat_SHA1; feat_SHA256; feat_SSBS; feat_SSBS2; feat_CRC32; feat_nTLBPA;
                   feat_Debugv8p1; feat_HPDS; feat_LOR; feat_LSE; feat_PAN; feat_PMUv3p1; feat_RDM;
                   feat_HAFDBS; feat_VHE; feat_VMID16; feat_AA32BF16; feat_AA32HPD; feat_AA32I8MM;
                   feat_PAN2; feat_BF16; feat_DPB2; feat_DPB; feat_Debugv8p2; feat_DotProd; feat_EVT;
                   feat_F32MM; feat_F64MM; feat_FHM; feat_FP16; feat_I8MM; feat_IESB; feat_LPA;
                   feat_LSMAOC; feat_LVA; feat_MPAM; feat_PCSRv8p2; feat_SHA3; feat_SHA512; feat_SM3;
                   feat_SM4; feat_SPE; feat_SVE; feat_TTCNP; feat_HPDS2; feat_XNX; feat_UAO; feat_VPIPT;
                   feat_CCIDX; feat_FCMA; feat_DoPD; feat_EPAC; feat_FPAC; feat_FPACCOMBINE; feat_JSCVT;
                   feat_LRCPC; feat_NV; feat_PACQARMA5; feat_PACIMP; feat_PAuth; feat_PAuth2; feat_SPEv1p1;
                   feat_AMUv1; feat_CNTSC; feat_Debugv8p4; feat_DoubleFault; feat_DIT; feat_FlagM;
                   feat_IDST; feat_LRCPC2; feat_LSE2; feat_NV2; feat_PMUv3p4; feat_RASv1p1; feat_S2FWB;
                   feat_SEL2; feat_TLBIOS; feat_TLBIRANGE; feat_TRF; feat_TTL; feat_BBM; feat_TTST;
                   feat_BTI; feat_FlagM2; feat_ExS; feat_E0PD; feat_FRINTTS; feat_GTG; feat_MTE;
                   feat_MTE2; feat_PMUv3p5; feat_RNG; feat_AMUv1p1; feat_ECV; feat_FGT; feat_MPAMv0p1;
                   feat_MPAMv1p1; feat_MTPMU; feat_TWED; feat_ETMv4; feat_ETMv4p1; feat_ETMv4p2;
                   feat_ETMv4p3; feat_ETMv4p4; feat_ETMv4p5; feat_ETMv4p6; feat_GICv3; feat_GICv3p1;
                   feat_GICv3_TDIR; feat_GICv4; feat_GICv4p1; feat_PMUv3; feat_ETE; feat_ETEv1p1;
                   feat_ETEv1p2; feat_SVE2; feat_SVE_AES; feat_SVE_PMULL128; feat_SVE_BitPerm;
                   feat_SVE_SHA3; feat_SVE_SM4; feat_TME; feat_TRBE; feat_SME;

                   feat_ASMv8p2;]

let feature_by_name name = Fset.find {feat_empty with name=name} features
let version_to_feature version = feature_by_name (Printf.sprintf "FEAT_ARMv%dp%d" version.major version.minor)
let smaller_versions version =
  if (version.major==8) then
    List.map (fun x -> {version with minor=x}) (List.init (version.minor+1) (fun x -> x))
  else if (version.major==9) then
    let v9s = List.map (fun x -> {version with minor=x}) (List.init (version.minor+1) (fun x -> x)) in
    let v8s = List.map (fun x -> {major=8; minor=x+5}) (List.init (version.minor+1) (fun x -> x)) in
    List.concat [v9s; v8s]
  else []

let architecture name version features =
  let smalls = List.map version_to_feature (smaller_versions version) in
  {name=name; version=version; features=List.concat [smalls; features]}

let version_compare (v1:version) (v2:version) =
  let major = Int.compare v1.major v2.major in
  if (major == 0)
  then Int.compare v1.minor v2.minor
  else major

let has feature arch = Fset.mem feature (Fset.of_list arch.features)
let ( <-- ) feature arch = Fset.mem feature arch
let ( </- ) feature arch = not (feature <-- arch)

let ( <* ) arg func = func arg
let ( *> ) func arg = func arg

let has_all features arch =
  let len = Fset.cardinal (Fset.inter arch (Fset.of_list features)) in
  len == List.length features

let has_none features arch =
  let len = Fset.cardinal (Fset.inter arch (Fset.of_list features)) in
  len == 0

let has_least_one features arch =
  let len = Fset.cardinal (Fset.inter arch (Fset.of_list features)) in
  len >= 1

let has_most_one features arch =
  let len = Fset.cardinal (Fset.inter arch (Fset.of_list features)) in
  len <= 1

let has_exact_one features arch =
  let len = Fset.cardinal (Fset.inter arch (Fset.of_list features)) in
  len == 1

let has_all_or_none features arch =
  let len = Fset.cardinal (Fset.inter arch (Fset.of_list features)) in
  len == 0 || len == List.length features
let find_first_error rs = Result.Ok true
let find_ok rs =
  if true then
    Result.Ok true
  else Result.Error ["error"]

let collect_errors rs =
  if true then
    Result.Ok true
  else Result.Error ["error"]

let fooo feature arch = feature <-- arch

let ( $ ) f a = f a

(*A derives B*)
let ( => ) a b = (not a || a && b)
(*B requires A*)
let ( <= ) a b = (not b || a && b)
(*A equals B*)
let ( <=> ) a b = (not a && not b || a && b)

let ( $$ ) c e = if c then Result.Ok true else Result.Error e

let aassert_feat_VHE arch =
  (feat_VHE <-- arch) => (feat_LSE <-- arch) $$ "An implementation that includes FEAT_VHE requires FEAT_LSE to be implemented."

let assert_feat_E0PD arch =
  (feat_E0PD <-- arch) => (feat_CSV3 <-- arch) $$ "Implementations that support FEAT_E0PD must also support FEAT_CSV3."

let assert_feat_DoubleLock arch =
  find_first_error [
  (feat_ARMv9p0 <-- arch) => (feat_DoubleLock </- arch) $$ "The implementation of FEAT_DoubleLock in an Armv9 implementation is prohibited.";
  (feat_DoPD <-- arch) => (feat_DoubleLock </- arch) $$ "If FEAT_DoPD is implemented, this FEAT_DoubleLock feature is not implemented.";
  (feat_DoPD </- arch) => (feat_Debugv8p2 </- arch) => (feat_Debugv8p2 <-- arch) $$ "If FEAT_DoPD is not implemented and FEAT_Debugv8p2 is not implemented, FEAT_DoubleLock is mandatory."
    ]

let assert_feat_VHE arch =
  (feat_LSE <-- arch) <= (feat_VHE <-- arch) $$  "An implementation that includes FEAT_VHE requires FEAT_LSE to be implemented."

let assert_feat_FP16 arch =
  find_first_error [
      (feat_FP16 <-- arch) <=> (feat_SVE <-- arch || feat_FHM <-- arch) $$ "This feature is OPTIONAL in Armv8.2 implementations, unless one of the following is implemented: The Scalable Vector Extension (SVE) and FEAT_FHM.";
      (feat_ARMv8p4 <-- arch) => (feat_FHM </- arch) => (feat_FP16 </- arch) $$ "From Armv8.4, if FEAT_FHM is not implemented, FEAT_FP16 is not implemented."
    ]


let assert_feat_FHM arch =
  find_first_error [
      (feat_FHM <-- arch) => (feat_FP16 <-- arch) $$ "can be implemented only when FEAT_FP16 is implemented.";
      (feat_ARMv8p4 <-- arch) => (feat_FHM <-- arch) <=> (feat_FP16 <-- arch) $$ "This feature is mandatory in Armv8.4 implementations when FEAT_FP16 is implemented. This feature is not implemented in Armv8.4 implementations when FEAT_FP16 is not implemented."
    ]

let assert_feat_HPDS2 arch =
  find_first_error [
      (feat_HPDS2 <-- arch) => (feat_HPDS <-- arch) $$ "FEAT_HPDS2 requires implementation of FEAT_HPDS";
      (feat_AARCH32_EL1 <-- arch) => (feat_HPDS2 <-- arch) => (feat_AA32HPD <-- arch) $$ "FEAT_HPDS2 requires implementation of FEAT_AA32HPD, if any Exception level higher than EL0 can use AArch32"
    ]

let assert_feat_F32MM arch =
  (feat_SVE <-- arch) <= (feat_F32MM <-- arch) $$ "FEAT_F32MM requires FEAT_SVE"

let assert_feat_F64MM arch =
  (feat_SVE <-- arch) <= (feat_F64MM <-- arch) $$ "FEAT_F64MM requires FEAT_SVE"


let assert_feat_NV arch =
  (feat_NV <-- arch) <= (feat_NV2 <-- arch) $$ "The feature is OPTIONAL in Armv8.3 implementations. This feature must be implemented if FEAT_NV2 is implemented."

let assert_feat_PAuth arch =
  ((arch <*has_least_one*> [feat_PACQARMA5; feat_PACIMP; feat_PACQARMA3]) && not (arch <*has_all*> [feat_PACQARMA5; feat_PACIMP; feat_PACQARMA3]))
  <= (feat_PAuth <-- arch)
  $$ "When FEAT_PAuth is implemented, one of the following must be true: Exactly one of the PAC algorithms is implemented; exactly two PAC algorithms are implemented."

let assert_feat_PACQARMA5 arch =
  (feat_PAuth <-- arch) <= (feat_PACQARMA5 <-- arch) $$ "can be implemented only if FEAT_PAuth is implemented."

let assert_feat_PACIMP arch =
  (feat_PAuth <-- arch) <= (feat_PACIMP <-- arch) $$ "FEAT_PACIMP can be implemented only if FEAT_PAuth is implemented."


let assert_feat_DoPD arch =
  find_first_error [
      (feat_DoPD <-- arch) => (feat_DoubleLock </- arch) $$ "When FEAT_DoPD is implemented: FEAT_DoubleLock is not implemented.";
      (feat_DoPD <-- arch) => (feat_Debugv8p2 <-- arch)  $$ "When FEAT_DoPD is implemented: FEAT_Debugv8p2 must be implemented.";
      (feat_DoPD <-- arch) => (feat_PCSRv8 <-- arch) => (feat_PCSRv8p2 <-- arch) $$ "If PC Sample-based profiling is implemented, FEAT_PCSRv8p2 must be implemented."
    ]

let assert_feat_FPAC arch =
  (feat_PAuth2 <-- arch) <= (feat_FPAC <-- arch) $$ "FEAT_FPAC is OPTIONAL in Armv8.3 implementations, and can be implemented only if FEAT_PAuth2 is implemented."

let assert_feat_FPACCOMBINE arch =
  (feat_FPAC <-- arch) <= (feat_FPACCOMBINE <-- arch) $$ "FEAT_FPACCOMBINE is OPTIONAL in Armv8.3 implementations, and can be implemented only if FEAT_FPAC is implemented"

let assert_feat_PACQARMA3 arch =
  (feat_PAuth <-- arch) <= (feat_PACQARMA3 <-- arch) $$ "FEAT_PACQARMA3 can be implemented only if FEAT_PAuth is implemented"

let assert_feat_CONSTPACFIELD arch =
  (feat_PAuth2 <-- arch ) <= (feat_CONSTPACFIELD <-- arch) $$ "FEAT_CONSTPACFIELD can be implemented only if FEAT_PAuth2 is implemented"

let assert_feat_TTST arch =
  (feat_TTST <-- arch) => (feat_SEL2 <-- arch) $$ "FEAT_TTST is mandatory if FEAT_SEL2 is implemented. FEAT_TTST is OPTIONAL if FEAT_SEL2 is not implemented"

let assert_feat_SEL2 arch = (*to review*)
  find_first_error
    [false => (feat_SEL2 </- arch) $$ "This feature is not supported if EL2 is using AArch32";
     true => (feat_SEL2 <-- arch) $$ "This feature is mandatory in Armv8.4 implementations that implement both EL2 and Secure state"]

let assert_feat_Debugv8p4 arch =
  (feat_SEL2 <-- arch) => (feat_Debugv8p4 <-- arch) $$ "FEAT_Debugv8p4 is mandatory if FEAT_SEL2 is implemented"

let assert_feat_TRF arch =
  (feat_ETMv4 <-- arch) <= (feat_TRF <-- arch)
  $$ "If an ETM Architecture PE Trace Unit is implemented and the ETM PE Trace Unit includes System register access to its control registers, this feature is mandatory."

let assert_feat_DoubleFault arch =
  (feat_ARMv8p4 <-- arch) => (feat_AARCH64_EL3 <-- arch) <=> (feat_DoubleFault <-- arch) $$ "This feature is mandatory in Armv8.4 implementations if EL3 is implemented, Otherwise, it is not implemented"

let assert_feat_FRINTTS arch =
  (feat_SIMDFP <-- arch) <=> (feat_FRINTTS <-- arch) $$ "This feature requires SIMD&FP, and is mandatory in Armv8.5 implementations when SIMD&FP is implemented"

let assert_feat_AFP arch =
  (feat_SIMDFP <-- arch) => (feat_AFP <-- arch) $$ "This feature is mandatory in Armv8.7 implementations that implement floating-point support."

let assert_feat_RPRES arch =
  (feat_RPRES <-- arch) => (feat_AFP <-- arch) $$ "This feature requires implementation of FEAT_AFP."

let assert_feat_LS64_V arch =
  (feat_LS64_V <-- arch) => (feat_LS64 <-- arch) $$ "FEAT_LS64_V can be implemented only if FEAT_LS64 is implemented."

let assert_feat_LS64_ACCDATA arch =
  (feat_LS64_ACCDATA <-- arch) => (feat_LS64_V <-- arch) $$ "FEAT_LS64_ACCDATA can be implemented only if FEAT_LS64_V is implemented."

let assert_feat_SPEv1p3 arch =
  (feat_SPE <-- arch) => (feat_SPEv1p3 <-- arch) <=> (feat_ARMv8p8 <-- arch) $$ "This feature is mandatory from Armv8.8 when FEAT_SPE is implemented."

let assert_feat_Debugv8p8 arch =
  (feat_SPE <-- arch) => (feat_Debugv8p8 <-- arch) <=> (feat_ARMv8p8 <-- arch) $$ "This feature is mandatory from Armv8.8 when FEAT_SPE is implemented."

let assert_feat_VERSION_v8 arch =
  find_first_error [
      (feat_ARMv8p0 <-- arch) <= (feat_ARMv8p1 <-- arch) $$ "Arm A-profile Version 8.1 depends on 8.0";
      (feat_ARMv8p1 <-- arch) <= (feat_ARMv8p2 <-- arch) $$ "Arm A-profile Version 8.2 depends on 8.1";
      (feat_ARMv8p2 <-- arch) <= (feat_ARMv8p3 <-- arch) $$ "Arm A-profile Version 8.3 depends on 8.2";
      (feat_ARMv8p3 <-- arch) <= (feat_ARMv8p4 <-- arch) $$ "Arm A-profile Version 8.4 depends on 8.3";
      (feat_ARMv8p4 <-- arch) <= (feat_ARMv8p5 <-- arch) $$ "Arm A-profile Version 8.5 depends on 8.4";
      (feat_ARMv8p5 <-- arch) <= (feat_ARMv8p6 <-- arch) $$ "Arm A-profile Version 8.6 depends on 8.5";
      (feat_ARMv8p6 <-- arch) <= (feat_ARMv8p7 <-- arch) $$ "Arm A-profile Version 8.7 depends on 8.6";
      (feat_ARMv8p7 <-- arch) <= (feat_ARMv8p8 <-- arch) $$ "Arm A-profile Version 8.8 depends on 8.7"
    ]

let assert_feat_PMUv3 arch =
  find_first_error [
      (feat_PMUv3   <-- arch) <= (feat_PMUv3p1 <-- arch) $$ "FEAT_PMUv3p1 depends on FEAT_PMUv3";
      (feat_PMUv3p1 <-- arch) <= (feat_PMUv3p4 <-- arch) $$ "(FEAT_PMUv3p4 depends on FEAT_PMUv3p1";
      (feat_PMUv3p4 <-- arch) <= (feat_PMUv3p5 <-- arch) $$ "(FEAT_PMUv3p5 depends on FEAT_PMUv3p4";
      (feat_PMUv3p5 <-- arch) <= (feat_PMUv3p7 <-- arch) $$ "(FEAT_PMUv3p7 depends on FEAT_PMUv3p5";
      (feat_PMUv3p7 <-- arch) <= (feat_PMUv3p8 <-- arch) $$ "(FEAT_PMUv3p8 depends on FEAT_PMUv3p7";
      (feat_PMUv3 <-- arch) => (feat_ARMv8p1 <-- arch) => (feat_PMUv3p1 <-- arch)
      $$ "The Performance Monitors Extension is an OPTIONAL feature, but if it is implemented, an Arm8.1 implementation must include FEAT_PMUv3p1.";
      (feat_PMUv3 <-- arch) => (feat_ARMv8p4 <-- arch) => (feat_PMUv3p4 <-- arch)
      $$ "The Performance Monitors Extension is an OPTIONAL feature, but if it is implemented, an Armv8.4 implementation must include FEAT_PMUv3p4.";
      (feat_PMUv3 <-- arch) => (feat_ARMv8p5 <-- arch) => (feat_PMUv3p5 <-- arch)
      $$ "The Performance Monitors Extension is an OPTIONAL feature, but if it is implemented, an Armv8.5 implementation must include FEAT_PMUv3p5.";
      (feat_PMUv3 <-- arch) => (feat_ARMv8p7 <-- arch) => (feat_PMUv3p7 <-- arch)
      $$ "The Performance Monitors Extension is an OPTIONAL feature, but if it is implemented, an Armv8.7 implementation must include FEAT_PMUv3p7.";
      (feat_PMUv3 <-- arch) => (feat_ARMv8p8 <-- arch) => (feat_PMUv3p8 <-- arch)
      $$ "The Performance Monitors Extension is an OPTIONAL feature, but if it is implemented, an Armv8.8 implementation must include FEAT_PMUv3p8."
    ]

let assert_feat_HPMN0 arch =
  find_first_error [
      (feat_ARMv8p8 <-- arch) => (feat_PMUv3 <-- arch && (feat_AARCH32_EL2 <-- arch || feat_AARCH64_EL2 <-- arch)) => (feat_HPMN0 <-- arch) $$ "This feature is mandatory in Armv8.8 implementations that include FEAT_PMUv3 and EL2.";
      (feat_HPMN0 <-- arch) => (feat_PMUv3 <-- arch && feat_FGT <-- arch && (feat_AARCH32_EL2 <-- arch || feat_AARCH64_EL2 <-- arch)) $$ "feature is OPTIONAL in implementations that include FEAT_PMUv3, FEAT_FGT, and EL2."]

let assert_feat_PMUv3_TH arch =
  (feat_PMUv3_TH <-- arch) => (feat_PMUv3 <-- arch && feat_AARCH64 <-- arch) $$ "This feature requires FEAT_PMUv3 to be implemented, and AArch64 state to be supported"

let assert_feat_RAS arch =
  find_first_error [
      (feat_RAS <-- arch) <= (feat_ARMv8p2 <-- arch) $$ "The RAS Extension must be implemented in Armv8.2";
      (feat_RAS <-- arch) <= (feat_IESB <-- arch) $$ "Armv8.2 introduces the following architectural features to the RAS Extension: FEAT_IESB.";
      (feat_RAS <-- arch) <= (feat_RASv1p1 <-- arch) $$ "FEAT_RASv1p1 depends on FEAT_RAS.";
      (feat_RASv1p1 <-- arch) <= (feat_DoubleFault <-- arch) $$ "This feature is implemented if ID_AA64PFR0_EL1.RAS >= 0b0010"
    ]

let assert_feat_SPE arch =
  find_first_error [
      (feat_SPE <-- arch) <= (feat_SPEv1p1 <-- arch) $$ "FEAT_SPEv1p1 requires FEAT_SPE";
      (feat_SPEv1p1 <-- arch) <= (feat_SPEv1p2 <-- arch) $$ "FEAT_SPEv1p2 requires FEAT_SPEv1p1";
      (feat_ARMv8p2 <-- arch) <= (feat_SPE <-- arch) $$ "The Statistical Profiling Extension, FEAT_SPE, is an OPTIONAL extension introduced by the Armv8.2 architecture.";
      (feat_ARMv8p3 <-- arch) <= (feat_SPEv1p1 <-- arch) $$ "FEAT_SPEv1p1 is OPTIONAL in Armv8.3 implementations.";
      (feat_SPE <-- arch) => (feat_ARMv8p5 <-- arch) <=> (feat_SPEv1p1 <-- arch) $$ "An Armv8.5 implementation that includes the Statistical Profiling Extension must include FEAT_SPEv1p1.";
      (feat_SPE <-- arch) => (feat_ARMv8p7 <-- arch) <=> (feat_SPEv1p2 <-- arch) $$ "FEAT_SPEv1p2 is mandatory from Armv8.7 when FEAT_SPE is implemented.";
      (feat_SPE <-- arch) => (feat_ARMv8p8 <-- arch) <=> (feat_SPEv1p3 <-- arch) $$ "FEAT_SPEv1p3 is mandatory from Armv8.8 when FEAT_SPE is implemented."
    ]

let assert_feat_PCSR arch =
  find_first_error [
      (feat_PCSRv8 <-- arch) <= (feat_PCSRv8p2 <-- arch) $$ "FEAT_PCSRv8p2 requires FEAT_PCSRv8";
      (feat_PCSRv8p2 <-- arch) <= (feat_PCSRv8p9 <-- arch) $$ "FEAT_PCSRv8p9 requires FEAT_PCSRv8p2"
    ]

let assert_feat_SVE arch =
  find_first_error [
      (feat_SVE <-- arch) => (feat_FCMA <-- arch) $$ "Implementation of FEAT_SVE requires implementation of FEAT_FCMA.";
      (feat_SVE <-- arch) => (feat_FP16 <-- arch) $$ "Implementation of FEAT_SVE requires implementation of FEAT_FP16."
    ]

let assert_feat_AMU arch =
  (feat_AMUv1 <-- arch) <= (feat_AMUv1p1 <-- arch) $$ "FEAT_AMUv1p1 requires FEAT_AMUv1"

let assert_feat_SVE2 arch =
  find_first_error [
      (feat_SVE  <-- arch) <= (feat_SVE2 <-- arch) $$ "FEAT_SVE2 requires FEAT_SVE.";
      (feat_SVE2 <-- arch) <= (feat_SVE_AES <-- arch) $$ "FEAT_SVE_AES requires FEAT_SVE2.";
      (feat_SVE2 <-- arch) <= (feat_SVE_BitPerm <-- arch) $$ "FEAT_SVE_BitPerm requires FEAT_SVE2.";
      (feat_SVE2 <-- arch) <= (feat_SVE_PMULL128 <-- arch) $$ "FEAT_SVE_PMULL128 requires FEAT_SVE2.";
      (feat_SVE2 <-- arch) <= (feat_SVE_SHA3 <-- arch) $$ "FEAT_SVE_SHA3 requires FEAT_SVE2.";
      (feat_SVE2 <-- arch) <= (feat_SVE_SM4 <-- arch) $$ "FEAT_SVE_SM4 requires FEAT_SVE2."
    ]

let assert_feat_ETE arch =
  find_first_error [
      (feat_ETE <-- arch) <= (feat_ETEv1p1 <-- arch) $$ "FEAT_ETEv1p1 extends FEAT_ETE to support FEAT_FGT.";
      (feat_ETEv1p1 <-- arch) <= (feat_ETEv1p2 <-- arch) $$ "FEAT_ETEv1p2 extends FEAT_ETE to support FEAT_RME";
      (feat_ETE <-- arch) => (feat_TRBE <-- arch && feat_TRF <-- arch) $$ "FEAT_ETE requires FEAT_TRBE and FEAT_TRF.";
      (feat_ETEv1p1 <-- arch) => (feat_TRBE <-- arch && feat_TRF <-- arch) $$ "FEAT_ETEv1p1 requires FEAT_TRBE and FEAT_TRF.";
      (feat_ETEv1p2 <-- arch) => (feat_RME <-- arch) $$ "FEAT_ETEv1p2 requires FEAT_RME."
    ]

let assert_feat_TRBE arch =
  (feat_TRBE <-- arch) => (feat_ETE <-- arch && feat_TRF <-- arch) $$ "FEAT_TRBE requires FEAT_ETE and FEAT_TRF."

let assert_feat_BRBE arch =
  (feat_BRBE <-- arch) <= (feat_BRBEv1p1 <-- arch) $$ "FEAT_BRBEv1p1 extends FEAT_BRBE to enable branch recording at EL3. This feature requires requires FEAT_BRBE."

let assert_feat_RME arch =
  find_first_error [
      (feat_RME <-- arch) => (feat_RNG <-- arch || feat_RNG_TRAP <-- arch) $$ "FEAT_RME requires FEAT_RNG or FEAT_RNG_TRAP.";
      (feat_ETE <-- arch) => (feat_RME <-- arch) => (feat_ETEv1p2 <-- arch) $$ "If the Trace Architecture is implemented, a PE that implements FEAT_RME also implements FEAT_ETEv1p2."
    ]

let assert_feat_SME arch =
  find_first_error [
      (feat_SME <-- arch) <= (feat_SME_FA64 <-- arch) $$ "FEAT_SME_FA64 requires FEAT_SME.";
      (feat_SME <-- arch) <= (feat_EBF16 <-- arch) $$ "FEAT_EBF16 requires FEAT_SME.";
      (feat_SME <-- arch) <= (feat_SME_F64F64 <-- arch) $$ "FEAT_SME_F64F64 requires FEAT_SME.";
      (feat_SME <-- arch) <= (feat_SME_I16I64 <-- arch) $$ "FEAT_SME_I16I64 requires FEAT_SME."
    ]

let assert_feat_VERSION_v9 arch =
  find_first_error [
      (feat_ARMv9p0 <-- arch) => (feat_ARMv8p5 <-- arch)                          $$ "An Armv9.0 compliant implementation must also be Armv8.5 compliant.";
      (feat_ARMv9p1 <-- arch) => (feat_ARMv8p6 <-- arch && feat_ARMv9p0 <-- arch) $$ "An Armv9.1 compliant implementation must also be Armv8.6 and Armv9.0 compliant.";
      (feat_ARMv9p2 <-- arch) => (feat_ARMv8p7 <-- arch && feat_ARMv9p1 <-- arch) $$ "An Armv9.2 compliant implementation must also be Armv8.7 and Armv9.1 compliant.";
      (feat_ARMv9p3 <-- arch) => (feat_ARMv8p8 <-- arch && feat_ARMv9p2 <-- arch) $$ "An Armv9.3 compliant implementation must also be Armv8.8 and Armv9.2 compliant."
    ]

let checkers = [
    assert_feat_E0PD; assert_feat_DoubleLock; assert_feat_VHE; assert_feat_FP16;
    assert_feat_FHM; assert_feat_HPDS2; assert_feat_F32MM; assert_feat_F64MM;
    assert_feat_NV; assert_feat_PAuth; assert_feat_PACQARMA5; assert_feat_PACIMP;
    assert_feat_DoPD; assert_feat_FPAC; assert_feat_FPACCOMBINE; assert_feat_PACQARMA3;
    assert_feat_CONSTPACFIELD; assert_feat_TTST; assert_feat_SEL2; assert_feat_Debugv8p4;
    assert_feat_TRF; assert_feat_DoubleFault; assert_feat_FRINTTS; assert_feat_AFP;
    assert_feat_RPRES; assert_feat_LS64_V; assert_feat_LS64_ACCDATA; assert_feat_SPEv1p3;
    assert_feat_Debugv8p8; assert_feat_VERSION_v8; assert_feat_PMUv3; assert_feat_HPMN0;
    assert_feat_PMUv3_TH; assert_feat_RAS; assert_feat_SPE; assert_feat_PCSR;
    assert_feat_SVE; assert_feat_AMU; assert_feat_SVE2; assert_feat_ETE;
    assert_feat_TRBE; assert_feat_BRBE; assert_feat_RME; assert_feat_SME; assert_feat_VERSION_v9
  ]


let () =
  Seq.iter feature_print (Fset.to_seq features);
  Printf.printf "\n%d\n" (Fset.cardinal features)

let () =
  let arch = architecture "A76" armv8p7 [feat_SB; feat_VHE; feat_LSE] in
  Seq.iter feature_print (List.to_seq arch.features);
  let result = find_first_error (List.map (fun f -> f (Fset.of_list arch.features)) checkers) in
  Printf.printf "\n%b\n" (Result.get_ok result)
