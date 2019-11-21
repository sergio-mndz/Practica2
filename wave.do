onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_Processor_TB/clk
add wave -noupdate /MIPS_Processor_TB/reset
add wave -noupdate /MIPS_Processor_TB/PortIn
add wave -noupdate -radix binary -radixshowbase 0 /MIPS_Processor_TB/ALUResultOut
add wave -noupdate /MIPS_Processor_TB/PortOut
add wave -noupdate -divider {MUX jump}
add wave -noupdate /MIPS_Processor_TB/DUV/MUX_ForJump/Selector
add wave -noupdate /MIPS_Processor_TB/DUV/MUX_ForJump/MUX_Data0
add wave -noupdate /MIPS_Processor_TB/DUV/MUX_ForJump/MUX_Data1
add wave -noupdate /MIPS_Processor_TB/DUV/MUX_ForJump/MUX_Output
add wave -noupdate -divider {MUX jr}
add wave -noupdate /MIPS_Processor_TB/DUV/MUX_ForJr/Selector
add wave -noupdate /MIPS_Processor_TB/DUV/MUX_ForJr/MUX_Data0
add wave -noupdate /MIPS_Processor_TB/DUV/MUX_ForJr/MUX_Data1
add wave -noupdate /MIPS_Processor_TB/DUV/MUX_ForJr/MUX_Output
add wave -noupdate -divider Control
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/RegDst
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/BranchEQ
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/BranchNE
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/MemRead
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/MemtoReg
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/MemWrite
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/ALUSrc
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/RegWrite
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/ALUOp
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/Jump
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/Jal
add wave -noupdate -divider Alu
add wave -noupdate /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/ALUOperation
add wave -noupdate /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/A
add wave -noupdate /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/B
add wave -noupdate /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/Zero
add wave -noupdate /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/ALUResult
add wave -noupdate /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/Shamt
add wave -noupdate -divider {Program Counter}
add wave -noupdate /MIPS_Processor_TB/DUV/program_counter/NewPC
add wave -noupdate /MIPS_Processor_TB/DUV/program_counter/PCValue
add wave -noupdate -divider Stack
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM_Memory/ram[1023]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM_Memory/ram[1022]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM_Memory/ram[1021]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM_Memory/ram[1020]}
add wave -noupdate -divider Registry
add wave -noupdate -label s0 /MIPS_Processor_TB/DUV/Register_File/Register_s0/DataOutput
add wave -noupdate -label a1 /MIPS_Processor_TB/DUV/Register_File/Register_a1/DataOutput
add wave -noupdate -label a2 /MIPS_Processor_TB/DUV/Register_File/Register_a2/DataOutput
add wave -noupdate -label a3 /MIPS_Processor_TB/DUV/Register_File/Register_a3/DataOutput
add wave -noupdate -label sp /MIPS_Processor_TB/DUV/Register_File/Register_sp/DataOutput
add wave -noupdate -divider {Tower A}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM_Memory/ram[2]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM_Memory/ram[1]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM_Memory/ram[0]}
add wave -noupdate -divider {Tower B}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM_Memory/ram[10]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM_Memory/ram[9]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM_Memory/ram[8]}
add wave -noupdate -divider {Tower C}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM_Memory/ram[18]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM_Memory/ram[17]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM_Memory/ram[16]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {359576200 ps} 0} {{Cursor 2} {975 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 395
configure wave -valuecolwidth 54
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {248 ps} {283 ps}
