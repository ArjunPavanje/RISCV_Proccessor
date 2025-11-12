# 123.5
li x1, 0x42f70000

# 3.14159
li x2, 0x40490fd0

# 39.0
li x3, 0x421c0000

# -11.795
li x4, 0xc13cb85
slli x4, x4, 4
addi x4, x4, 0x2

# -41
li x5, 0xc224000
slli x5, x5, 4

# NaN
li x6, 0x7fc00000

# +Infinity
li x7, 0x7f800000

# -Infinity
li x8, 0xff80000
slli x8, x8, 4

# +0
li x9, 0x00000000



fmv.d.x f1, x1
fmv.d.x f2, x2
fmv.d.x f3, x3
fmv.d.x f4, x4
fmv.d.x f5, x5
fmv.d.x f6, x6
fmv.d.x f7, x7
fmv.d.x f8, x8
fmv.d.x f9, x9

fsqrt.s f10, f1             # sqrt(123.5)
fsqrt.s f11, f2             # sqrt(3.14159)
fsqrt.s f12, f3             # sqrt(39.0)
fsqrt.s f13, f4             # sqrt(-11.795)
fsqrt.s f14, f5             # sqrt(-41.0) 
fsqrt.s f15, f6             # sqrt(NaN) 
fsqrt.s f16, f7             # sqrt(+Infinity) 
fsqrt.s f17, f8             # sqrt(-Infinity) 
fsqrt.s f18, f9             # sqrt(0.0) 

end:
    jal x0, end