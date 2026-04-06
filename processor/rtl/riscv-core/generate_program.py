# generate_program.py

# This script generates a program.mem file for JAL, JALR, and AUIPC tests.

def generate_program():
    program = [
        # JAL instruction
        '00000000000100000000000001101111',  # JAL instruction encoding
        # JALR instruction
        '00000000000000010000000001100111',  # JALR instruction encoding
        # AUIPC instruction
        '00000000000000000000111101101111'   # AUIPC instruction encoding
    ]

    with open('program.mem', 'w') as f:
        for instr in program:
            f.write(instr + '\n')

if __name__ == '__main__':
    generate_program()
