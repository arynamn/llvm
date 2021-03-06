# RUN: llvm-mc %s -triple=mips-unknown-linux-gnu -mcpu=mips32r6 | \
# RUN:   FileCheck %s -check-prefix=CHECK-ASM
#
# RUN: llvm-mc %s -triple=mips-unknown-linux-gnu -mcpu=mips32r6 \
# RUN:   -filetype=obj -o - | \
# RUN:   llvm-readobj -A - | \
# RUN:   FileCheck %s -check-prefix=CHECK-OBJ

# CHECK-ASM: .module ginv

# Check if the MIPS.abiflags section was correctly emitted:
# CHECK-OBJ: MIPS ABI Flags {
# CHECK-OBJ:   ASEs [ (0x20000)
# CHECK-OBJ:     GINV (0x20000)
# CHECK-OBJ: }

  .module ginv
  ginvi $4

# FIXME: Test should include gnu_attributes directive when implemented.
#        An explicit .gnu_attribute must be checked against the effective
#        command line options and any inconsistencies reported via a warning.
