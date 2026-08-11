.section .text
.globl _start

_start:

#Result from encryption Ciphertext and tag are :
#
#x10 = f3a1740a  Ciphertext = ad920fbef3a1740a
#x11 = ad920fbe
#x12 = f4bb8c3e Tag = 52d701729c9a14a3caa4db86f4bb8c3e
#x13 = caa4db86
#x14 = 9c9a14a3
#x15 = 52d70172


#########################################################
# ASCON BASE = 0x40000000
#########################################################

    lui x1,0x40000

#########################################################
# KEY
#########################################################

# KEY0 = 0x0C0D0E0F

    lui x2,0x0C0D1
    addi x2,x2,-497
    sw x2,24(x1)
    addi x0,x0,0

# KEY1 = 0x08090A0B

    lui x2,0x08091
    addi x2,x2,-1525
    sw x2,28(x1)
    addi x0,x0,0

# KEY2 = 0x04050607

    lui x2,0x04050
    addi x2,x2,0x607
    sw x2,32(x1)
    addi x0,x0,0

# KEY3 = 0x00010203

    lui x2,0x00010
    addi x2,x2,0x203
    sw x2,36(x1)
    addi x0,x0,0

#########################################################
# NONCE
#########################################################

# NONCE0

    lui x2,0x0C0D1
    addi x2,x2,-497
    sw x2,40(x1)
    addi x0,x0,0

# NONCE1

    lui x2,0x08091
    addi x2,x2,-1525
    sw x2,44(x1)
    addi x0,x0,0

# NONCE2

    lui x2,0x04050
    addi x2,x2,0x607
    sw x2,48(x1)
    addi x0,x0,0

# NONCE3

    lui x2,0x00010
    addi x2,x2,0x203
    sw x2,52(x1)
    addi x0,x0,0

#########################################################
# WRITE CIPHERTEXT
#########################################################

# DATA LOW = F3A1740A

    lui x2,0xF3A17
    addi x2,x2,0x40A
    sw x2,8(x1)
    addi x0,x0,0

# DATA HIGH = AD920FBE

    lui x2,0xAD921
    addi x2,x2,-66
    sw x2,12(x1)
    addi x0,x0,0

#########################################################
# WRITE RECEIVED TAG
#########################################################

# TAG0 = F4BB8C3E

    lui x2,0xF4BB9
    addi x2,x2,-962
    sw x2,72(x1)
    addi x0,x0,0

# TAG1 = CAA4DB86

    lui x2,0xCAA4E
    addi x2,x2,-1146
    sw x2,76(x1)
    addi x0,x0,0

# TAG2 = 9C9A14A3

    lui x2,0x9C9A1
    addi x2,x2,0x4A3
    sw x2,80(x1)
    addi x0,x0,0

# TAG3 = 52D70172

    lui x2,0x52D70
    addi x2,x2,0x172
    sw x2,84(x1)
    addi x0,x0,0

#########################################################
# START DECRYPTION
#########################################################

# CONTROL = 3 (start + decrypt)

    addi x2,x0,3
    sw x2,0(x1)
    addi x0,x0,0

# CONTROL = 2 (clear start, keep decrypt bit)

    addi x2,x0,2
    sw x2,0(x1)
    addi x0,x0,0

#########################################################
# WAIT UNTIL DONE
#########################################################

wait_done:

    lw x3,4(x1)
    addi x0,x0,0

    andi x4,x3,1
    beq x4,x0,wait_done

#########################################################
# READ RECOVERED PLAINTEXT
#########################################################

    lw x10,16(x1)
    addi x0,x0,0

    lw x11,20(x1)
    addi x0,x0,0

#########################################################
# READ STATUS
#########################################################

    lw x12,4(x1)
    addi x0,x0,0

#########################################################
# CHECK TAG VALID
#########################################################

    srli x13,x12,2
    andi x13,x13,1

done:
    jal x0,done
