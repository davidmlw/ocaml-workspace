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

type extention = RAS | PMU | Debug | PCSR | ETM

type elx = EL0 | EL1 | EL2 | EL3

type architechure = {
    name: string;
    version: version;
    extensions: extention list;
    a64elx: elx list;
    a32elx: elx list;
    features: feature list}

let has_extension ext arch =
  List.mem ext arch.extensions

open Option
let feature name optional mandatory aarch64 aarch32 documentation = {name=name; optional=optional; mandatory=mandatory; aarch64=aarch64; aarch32=aarch32; documentation=documentation}

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
let feat_CMOW                = feature "FEAT_CMOW"                None None true  false "Control for cache maintenance permission"
let feat_CONSTPACFIELD       = feature "FEAT_CONSTPACFIELD"       v8p3 None true  false "PAC Algorithm enhancement"
let feat_Debugv8p8           = feature "FEAT_Debugv8p8"           None None true  false "Debug v8.8"
let feat_HBC                 = feature "FEAT_HBC"                 None None true  false "Hinted conditional branches"
let feat_HPMN0               = feature "FEAT_HPMN0"               None None true  false "Setting of MDCR_EL2.HPMN to zero"
let feat_NMI                 = feature "FEAT_NMI"                 None None true  false "Non-maskable Interrupts"
let feat_GICv3_NMI           = feature "FEAT_GICv3_NMI"           None None true  false "Non-maskable Interrupts"
let feat_MOPS                = feature "FEAT_MOPS"                None None true  false "Standardization of memory operations"
let feat_PACQARMA3           = feature "FEAT_PACQARMA3"           v8p3 None true  false "Pointer authentication - QARMA3 algorithm"
let feat_PMUv3_TH            = feature "FEAT_PMUv3_TH"            None None true  false "Event counting threshold"
let feat_PMUv3p8             = feature "FEAT_PMUv3p8"             None None true  false "Armv8.8 PMU Extensions"
let feat_PMUv3_EXT64         = feature "FEAT_PMUv3_EXT64"         None None true  false "Optional 64-bit external interface to the Performance Monitors"
let feat_PMUv3_EXT32         = feature "FEAT_PMUv3_EXT32"         None None true  false "Represents the original mostly 32-bit external interface to the Performance Monitors"
let feat_RNG_TRAP            = feature "FEAT_RNG_TRAP"            None None true  false "Trapping support for RNDR and RNDRRS"
let feat_SPEv1p3             = feature "FEAT_SPEv1p3"             None None true  false "Armv8.8 Statistical Profiling Extensions"
let feat_TIDCP1              = feature "FEAT_TIDCP1"              None None true  false "EL0 use of IMPLEMENTATION DEFINED functionality"
let feat_BRBEv1p1            = feature "FEAT_BRBEv1p1"            None None true  false "Branch Record Buffer Extensions version 1.1"


(* 2020 Architecture Extensions *)
let feat_AFP                 = feature "FEAT_AFP"                 None None true  false "Alternate floating-point behavior"
let feat_HCX                 = feature "FEAT_HCX"                 None None true  false "Support for the HCRX_EL2 register"
let feat_LPA2                = feature "FEAT_LPA2"                None None true  false "Larger physical address for 4KB and 16KB translation granules"
let feat_LS64                = feature "FEAT_LS64"                None None true  false "Support for 64 byte loads/stores without return"
let feat_LS64_V              = feature "FEAT_LS64_V"              None None true  false "Support for 64-byte stores with return"
let feat_LS64_ACCDATA        = feature "FEAT_LS64_ACCDATA"        None None true  false "Support for 64-byte EL0 stores with return"
let feat_MTE3                = feature "FEAT_MTE3"                None None true  false "MTE Asymmetric Fault Handling"
let feat_PAN3                = feature "FEAT_PAN3"                v8p1 v8p7 true  false "Support for SCTLR_ELx.EPAN"
let feat_PMUv3p7             = feature "FEAT_PMUv3p7"             None None true  false "Armv8.7 PMU Extensions"
let feat_RPRES               = feature "FEAT_RPRES"               None None true  false "Increased precision of Reciprocal Estimate and Reciprocal Square Root Estimate"
let feat_RME                 = feature "FEAT_RME"                 None None true  false "Realm Management Extension"
let feat_SME_FA64            = feature "FEAT_SME_FA64"            None None true  false "Additional instructions for the SME Extension"
let feat_SME_F64F64          = feature "FEAT_SME_F64F64"          None None true  false "Additional instructions for the SME Extension"
let feat_SME_I16I64          = feature "FEAT_SME_I16I64"          None None true  false "Additional instructions for the SME Extension"
let feat_EBF16               = feature "FEAT_EBF16"               None None true  false "Additional instructions for the SME Extension"
let feat_SPEv1p2             = feature "FEAT_SPEv1p2"             None None true  false "Armv8.7 SPE"
let feat_WFxT                = feature "FEAT_WFxT"                None None true  false "WFE and WFI instructions with timeout"
let feat_XS                  = feature "FEAT_XS"                  None None true  false "XS attribute"
let feat_BRBE                = feature "FEAT_BRBE"                None None true  false "Branch Record Buffer Extensions"

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
let feat_RAS                 = feature "FEAT_RAS"                 None None true  false "Reliability, Availability, and Serviceability (RAS) Extension"
let feat_SB                  = feature "FEAT_SB"                  v8p0 None true  false "Speculation barrier"
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
let feat_PMUv3p1             = feature "FEAT_PMUv3p1"             None v8p1 true  false "PMU extensions version 3.1"
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
let feat_I8MM                = feature "FEAT_I8MM"                v8p2 v8p5 true  false "Int8 Matrix Multiplication"
let feat_IESB                = feature "FEAT_IESB"                v8p2 None true  false "Implicit Error synchronization event"
let feat_LPA                 = feature "FEAT_LPA"                 v8p2 None true  false "Large PA and IPA support"
let feat_LSMAOC              = feature "FEAT_LSMAOC"              v8p2 None false true  "Load/Store instruction multiple atomicity and ordering controls"
let feat_LVA                 = feature "FEAT_LVA"                 v8p2 None true  false "Large VA support"
let feat_MPAM                = feature "FEAT_MPAM"                None None true  false "Memory Partitioning and Monitoring"
let feat_PCSRv8p2            = feature "FEAT_PCSRv8p2"            v8p2 None true  true  "PC Sample-based profiling version 8.2"
let feat_SHA3                = feature "FEAT_SHA3"                v8p2 None true  false "Advanced SIMD EOR3, RAX1, XAR, and BCAX instructions	Split ARMv8.2-SHA into SHA-256, SHA-512 and SHA-3"
let feat_SHA512              = feature "FEAT_SHA512"              v8p2 None true  false "Advanced SIMD SHA512 instructions	Split ARMv8.2-SHA into SHA-256, SHA-512 and SHA-3"
let feat_SM3                 = feature "FEAT_SM3"                 v8p2 None true  false "Advanced SIMD SM3 instructions	Split into SM3 and SM4"
let feat_SM4                 = feature "FEAT_SM4"                 v8p2 None true  false "Advanced SIMD SM4 instructions	Split into SM3 and SM4"
let feat_SPE                 = feature "FEAT_SPE"                 None None true  false "Statistical Profiling Extension"
let feat_SVE                 = feature "FEAT_SVE"                 None None true  false "Scalable Vector Extension"
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
let feat_SPEv1p1             = feature "FEAT_SPEv1p1"             v8p3 v8p5 true  false "Statistical Profiling Extensions version 1.1"
let feat_AMUv1               = feature "FEAT_AMUv1"               None None true  false "Activity Monitors Extension"
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
let feat_BTI                 = feature "FEAT_BTI"                 None None true  false "Branch target identification"
let feat_FlagM2              = feature "FEAT_FlagM2"              None None true  false "Condition flag manipulation version 2"
let feat_ExS                 = feature "FEAT_ExS"                 None None true  false "Disabling context synchronizing exception entry and exit"
let feat_E0PD                = feature "FEAT_E0PD"                None None true  false "Preventing EL0 access to halves of address maps"
let feat_FRINTTS             = feature "FEAT_FRINTTS"             None None true  false "FRINT32Z, FRINT32X, FRINT64Z, and FRINT64X instructions"
let feat_GTG                 = feature "FEAT_GTG"                 None None true  false "Guest translation granule size"
let feat_MTE                 = feature "FEAT_MTE"                 None None true  false "Instruction-only Memory Tagging Extension"
let feat_MTE2                = feature "FEAT_MTE2"                None None true  false "Full Memory Tagging Extension"
let feat_PMUv3p5             = feature "FEAT_PMUv3p5"             None None true  false "PMU Extension version 3.5"
let feat_RNG                 = feature "FEAT_RNG"                 None None true  false "Random number generator"
let feat_AMUv1p1             = feature "FEAT_AMUv1p1"             None None true  false "Activity Monitors Extension version 1.1"
let feat_ECV                 = feature "FEAT_ECV"                 None None true  false "Enhanced counter virtualization"
let feat_FGT                 = feature "FEAT_FGT"                 None None true  false "Fine Grain Traps"
let feat_MPAMv0p1            = feature "FEAT_MPAMv0p1"            None None true  false "Memory Partitioning and Monitoring version 0.1"
let feat_MPAMv1p1            = feature "FEAT_MPAMv1p1"            None None true  false "Memory Partitioning and Monitoring version1.1"
let feat_MTPMU               = feature "FEAT_MTPMU"               None None true  false "Multi-threaded PMU Extensions"
let feat_TWED                = feature "FEAT_TWED"                None None true  false "Delayed trapping of WFE"
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
let feat_ETE                 = feature "FEAT_ETE"                 None None true  false "Embedded Trace Extension"
let feat_ETEv1p1             = feature "FEAT_ETEv1p1"             None None true  false "Embedded Trace Extension, version 1.1"
let feat_SVE2                = feature "FEAT_SVE2"                None None true  false "SVE version 2"
let feat_SVE_AES             = feature "FEAT_SVE_AES"             None None true  false "SVE AES instructions"
let feat_SVE_PMULL128        = feature "FEAT_SVE_PMULL128"        None None true  false "SVE PMULL instructions	SVE2-AES is split into AES and PMULL support"
let feat_SVE_BitPerm         = feature "FEAT_SVE_BitPerm"         None None true  false "SVE Bit Permute"
let feat_SVE_SHA3            = feature "FEAT_SVE_SHA3"            None None true  false "SVE SHA-3 instructions"
let feat_SVE_SM4             = feature "FEAT_SVE_SM4"             None None true  false "SVE SM4 instructions"
let feat_TME                 = feature "FEAT_TME"                 None None true  false "Transactional Memory Extension"
let feat_TRBE                = feature "FEAT_TRBE"                None None true  false "Trace Buffer Extension"
let feat_SME                 = feature "FEAT_SME"                 None None true  false "Scalable Matrix Extension"

let feat_ASMv8p2             = feature "FEAT_ASMv8p2"             none v8p2 true  false "Armv8.2 changes to the A64 ISA"  (* P A2-86*)

let foo = ("FEAT_SB",                 v8p0, none, true,  false, "Speculation barrier")
let bar = String.compare "hello" "world"

let extension_PMU = [feat_PMUv3p1; feat_PMUv3p4]

let feature_compare (f1:feature) (f2:feature) = String.compare f1.name f2.name
let feature_print (f:feature) = Printf.printf "%s\n" f.name

module Fset = Set.Make(struct type t = feature;;let compare=feature_compare end)
let features = Fset.of_list [feat_SME; feat_SB]

let version_compare (v1:version) (v2:version) =
  let major = Int.compare v1.major v2.major in
  if (major == 0)
  then Int.compare v1.minor v2.minor
  else major

let has feature arch = Fset.mem feature (Fset.of_list arch.features)
let ( <-- ) feature arch = Fset.mem feature (Fset.of_list arch.features)
let ( </- ) feature arch = Fset.mem feature (Fset.of_list arch.features)

let ( <* ) arg func = func arg
let ( *> ) func arg = func arg

let has_all features arch =
  let len = Fset.cardinal (Fset.inter (Fset.of_list arch.features) (Fset.of_list features)) in
  len == List.length features

let has_none features arch =
  let len = Fset.cardinal (Fset.inter (Fset.of_list arch.features) (Fset.of_list features)) in
  len == 0

let has_least_one features arch =
  let len = Fset.cardinal (Fset.inter (Fset.of_list arch.features) (Fset.of_list features)) in
  len >= 1

let has_most_one features arch =
  let len = Fset.cardinal (Fset.inter (Fset.of_list arch.features) (Fset.of_list features)) in
  len <= 1

let has_exact_one features arch =
  let len = Fset.cardinal (Fset.inter (Fset.of_list arch.features) (Fset.of_list features)) in
  len == 1

let has_all_or_none features arch =
  let len = Fset.cardinal (Fset.inter (Fset.of_list arch.features) (Fset.of_list features)) in
  len == 0 || len == List.length features

let fooo feature arch = feature <-- arch

let ( $ ) f a = f a

let after cond result = if (cond) then result else Result.Ok true

let req cond error () =
  if cond then
    Result.Ok true
  else
    Result.Error error

let require ?(after=true) cond error =
  if (after) then
    if (cond)
    then Result.Ok true
    else Result.Error error
  else Result.Ok true

let under cond ?(require=false) error =
  if (cond) then
    if (require)
    then Result.Ok true
    else Result.Error error
  else Result.Ok true


(*A derives B*)
let ( => ) a b = (not a || a && b)
(*B requires A*)
let ( <= ) a b = (not b || a && b)

let ( $$ ) c e = if c then Result.Ok true else Result.Error e

let foo arch =
  after (feat_PACIMP <-- arch) $ require (feat_PAuth <-- arch) "can be implemented only if FEAT_PAuth is implemented."

let foo arch =
  under (feat_PACIMP <-- arch) ~require:(feat_PAuth <-- arch) "can be implemented only if FEAT_PAuth is implemented."

let bar arch = req (feat_Debugv8p2 <-- arch) "FEAT_Debugv8p2 must be implemented." ()

let aassert_feat_VHE arch =
  (feat_VHE <-- arch) => (feat_LSE <-- arch) $$ "An implementation that includes FEAT_VHE requires FEAT_LSE to be implemented."

let assert_feat_E0PD arch =
  (feat_E0PD <-- arch) => (feat_CSV3 <-- arch) $$ "Implementations that support FEAT_E0PD must also support FEAT_CSV3."

let assert_feat_DoubleLock arch =
  if arch.version.major == 9 then
    require (feat_DoubleLock <-- arch) "The implementation of FEAT_DoubleLock in an Armv9 implementation is prohibited."
  else if (feat_DoPD <-- arch) then
    require (feat_DoubleLock </- arch) "If FEAT_DoPD is implemented, this FEAT_DoubleLock feature is not implemented."
  else
    require (feat_Debugv8p2 </- arch && feat_DoubleLock <-- arch) "If FEAT_DoPD is not implemented and FEAT_Debugv8p2 is not implemented, FEAT_DoubleLock is mandatory."

let pmu_features = [feat_PMUv3; feat_PMUv3p1]

let assert_feat_VHE arch =
  (feat_LSE <-- arch) <= (feat_VHE <-- arch) $$  "An implementation that includes FEAT_VHE requires FEAT_LSE to be implemented."

let assert_feat_FP16 arch =
  if (arch.version < armv8p2) then
    require (feat_FP16 </- arch) "This feature is OPTIONAL in Armv8.2 implementations."
  else if (arch.version < armv8p4) then
    require (feat_FP16 </- arch || feat_FP16 <-- arch && (feat_SVE <-- arch || feat_FHM <-- arch)) "This feature is OPTIONAL in Armv8.2 implementations. If SVE or FEAT_FHM is implemented, FEAT_FP16 is implemented."
  else
    require (feat_FP16 </- arch || feat_FP16 <-- arch && feat_FHM <-- arch) "From Armv8.4, if FEAT_FHM is not implemented, FEAT_FP16 is not implemented."



let assert_feat_FHM arch =
  if (arch.version < armv8p2) then
    require (feat_FHM </- arch) "This feature is OPTIONAL in Armv8.2 implementations."
  else if (arch.version < armv8p4) then
    require (feat_FHM </- arch || feat_FHM <-- arch && feat_FP16 <-- arch) "can be implemented only when FEAT_FP16 is implemented."
  else
    require (arch <*has_all_or_none*> [feat_FP16; feat_FHM])
      "This feature is mandatory in Armv8.4 implementations when FEAT_FP16 is implemented. This feature is not implemented in Armv8.4 implementations when FEAT_FP16 is not implemented."

let assert_feat_HPDS2 arch =
  if (feat_HPDS2 <-- arch) then
    if (List.mem EL1 arch.a32elx) then
      require (feat_HPDS <-- arch && feat_AA32HPD <-- arch) "implementation of FEAT_HPDS2 requires implementation of both: FEAT_HPDS, FEAT_AA32HPD, if any Exception level higher than EL0 can use AArch32"
    else
      require (feat_HPDS <-- arch) "implementation of FEAT_HPDS2 requires implementation of both: FEAT_HPDS"
  else Result.Ok true

let assert_feat_F32MM arch =
  (feat_SVE <-- arch) <= (feat_F32MM <-- arch) $$ "FEAT_F32MM requires FEAT_SVE"

let assert_feat_F64MM arch =
  (feat_SVE <-- arch) <= (feat_F64MM <-- arch) $$ "FEAT_F64MM requires FEAT_SVE"

let assert_extention_RAS arch =
  (List.mem RAS arch.extensions) <= (arch.version > armv8p2) $$ "The RAS Extension must be implemented in Armv8.2"


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

let find_first_error rs = Result.Ok true
let find_ok rs =
  if true then
    Result.Ok true
  else Result.Error ["error"]

let collect_errors rs =
  if true then
    Result.Ok true
  else Result.Error ["error"]

let assert_feat_DoPD arch =
  find_first_error [
      (feat_DoPD <-- arch) => (feat_DoubleLock </- arch) $$ "When FEAT_DoPD is implemented: FEAT_DoubleLock is not implemented.";
      (feat_DoPD <-- arch) => (feat_Debugv8p2 <-- arch)  $$ "When FEAT_DoPD is implemented: FEAT_Debugv8p2 must be implemented.";
      (feat_DoPD <-- arch) => (arch <*has_extension*> PCSR) => (feat_PCSRv8p2 <-- arch) $$ "If PC Sample-based profiling is implemented, FEAT_PCSRv8p2 must be implemented."
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
  (arch <*has_extension*> ETM) => (feat_TRF <-- arch)
  $$ "If an ETM Architecture PE Trace Unit is implemented and the ETM PE Trace Unit includes System register access to its control registers, this feature is mandatory."

let assert_feat_DoubleFault arch =
  find_first_error
    [(arch.version >= armv8p4) => (List.mem EL3 arch.a64elx) => (feat_DoubleFault <-- arch) $$ "This feature is mandatory in Armv8.4 implementations if EL3 is implemented";
     (arch.version <armv8p4 || not (List.mem EL3 arch.a64elx)) => (feat_DoubleFault </- arch) $$ "Otherwise, it is not implemented"]


let ( ---> ) c e = if c then Result.Ok true else Result.Error e

let helloo = true => false => false
let hello = true => false

let world = true => true => false $$ "error"

let () =
  Seq.iter feature_print (Fset.to_seq features)

let () =
  let a = 1 in
  Printf.printf "%b %s" hello (Result.get_error world)
