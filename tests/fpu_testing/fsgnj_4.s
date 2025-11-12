.section .text

# NaN
li x1, 0x7fc00000

# +Infinity
li x2, 0x7f800000

# -Infinity
li x3, 0xff80000
slli x3, x3, 4

# NaN (ohter)
li x4, 0xffc0000 
slli x4, x4, 4

# 39.0
li x5, 0x421c0000

fmv.d.x f1, x1
fmv.d.x f2, x2
fmv.d.x f3, x3
fmv.d.x f4, x4
fmv.d.x f5, x5

fsgnj.s f6, f5, f1
fsgnj.s f7, f5, f4
fsgnj.s f8, f4, f1

fsgnjn.s f9, f5, f1
fsgnjn.s f10, f5, f4
fsgnjn.s f11, f4, f1

fsgnjx.s f12, f5, f1
fsgnjx.s f13, f5, f4
fsgnjx.s f14, f4, f1


end:
    jal x0, end