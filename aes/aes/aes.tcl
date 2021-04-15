//  Catapult Ultra Synthesis 10.5/861329 (Production Release) Wed Mar  4 15:45:36 PST 2020
//  
//  Copyright (c) Mentor Graphics Corporation, 1996-2020, All Rights Reserved.
//                        UNPUBLISHED, LICENSED SOFTWARE.
//             CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
//                 PROPERTY OF MENTOR GRAPHICS OR ITS LICENSORS
//  
//  Running on Linux joseph@allagash.cs.columbia.edu 3.10.0-1062.4.1.el7.x86_64 x86_64 aol
//  
//  Package information: SIFLIBS v23.5_0.0, HLS_PKGS v23.5_0.0, 
//                       SIF_TOOLKITS v23.5_0.0, SIF_XILINX v23.5_0.0, 
//                       SIF_ALTERA v23.5_0.0, CCS_LIBS v23.5_0.0, 
//                       CDS_PPRO v10.3c_2, CDS_DesigChecker v10.5, 
//                       CDS_OASYS v19.1_3.7, CDS_PSR v19.2_0.9, 
//                       DesignPad v2.78_1.0
//  
//  Start time Mon Mar 22 13:44:12 2021
project load /home/joseph/classes/hw-security/project/hls/catapult_hls/aes_accelerator
project new -name aes_accelerator
project load /home/joseph/classes/hw-security/project/hls/catapult_hls/aes_accelerator
project save
project new -name aes_accelerator
project load /home/joseph/classes/hw-security/project/hls/catapult_hls/aes_accelerator.ccs
solution file add ../../MachSuite/aes/aes/aes_test.c
solution file add ../../MachSuite/aes/aes/aes.h
solution file add ../../MachSuite/aes/aes/aes.c
solution file add ../../MachSuite/aes/aes/local_support.c
go analyze
solution file set ../../MachSuite/aes/aes/aes.c -args -I../../MachSuite/common/
go analyze
solution file remove {$PROJECT_HOME/../../MachSuite/aes/aes/local_support.c}
go analyze
solution design set aes256_encrypt_ecb -top
go compile
directive set /aes256_encrypt_ecb/in_buf:rsc -MAP_TO_MODULE ccs_ioport.ccs_in_wait
directive set /aes256_encrypt_ecb/k:rsc -MAP_TO_MODULE ccs_ioport.ccs_in_wait
directive set /aes256_encrypt_ecb/out_buf:rsc -MAP_TO_MODULE ccs_ioport.ccs_out_wait
solution library add nangate-45nm_beh -- -rtlsyntool DesignCompiler -vendor Nangate -technology 045nm
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 2 -CLOCK_EDGE rising -CLOCK_HIGH_TIME 1 -CLOCK_OFFSET 0.000000 -CLOCK_UNCERTAINTY 0.0 -RESET_KIND sync -RESET_SYNC_NAME rst -RESET_SYNC_ACTIVE high -RESET_ASYNC_NAME arst_n -RESET_ASYNC_ACTIVE low -ENABLE_NAME {} -ENABLE_ACTIVE high}}
directive set /aes256_encrypt_ecb -CHAN_IO_PROTOCOL standard
go assembly
go architect
go allocate
go extract
go libraries
directive set /aes256_encrypt_ecb -CHAN_IO_PROTOCOL use_library
go assembly
go architect
go allocate
go extract
go libraries
directive set /aes256_encrypt_ecb -TRANSACTION_DONE_SIGNAL false
go assembly
go architect
go allocate
go extract
options save -file /home/joseph/classes/hw-security/project/hls/catapult_hls/catapult.ini
logfile save_commands /home/joseph/classes/hw-security/project/MachSuite/aes/aes/aes.tcl
