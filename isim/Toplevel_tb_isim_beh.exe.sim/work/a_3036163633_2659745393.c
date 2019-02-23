/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xc4ca3437 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Xhaar/Desktop/MIPS2000VHDL/reg_file_block.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_3620187407_sub_4042748798_3965413181(char *, char *, char *, char *, char *);
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_3036163633_2659745393_p_0(char *t0)
{
    char t20[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned char t17;
    unsigned char t18;
    unsigned char t19;
    unsigned char t21;
    int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t17 = (t2 == (unsigned char)3);
    if (t17 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t17 = (t2 == (unsigned char)2);
    if (t17 != 0)
        goto LAB8;

LAB9:
LAB6:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB10;

LAB12:
LAB11:    t1 = (t0 + 4112);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(35, ng0);
    t3 = (t0 + 2472U);
    t4 = *((char **)t3);
    t3 = (t0 + 1512U);
    t5 = *((char **)t3);
    t3 = (t0 + 6816U);
    t6 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t5, t3);
    t7 = (t6 - 0);
    t8 = (t7 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t6);
    t9 = (32U * t8);
    t10 = (0 + t9);
    t11 = (t4 + t10);
    t12 = (t0 + 4192);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t11, 32U);
    xsi_driver_first_trans_fast_port(t12);
    xsi_set_current_line(36, ng0);
    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t1 = (t0 + 1672U);
    t4 = *((char **)t1);
    t1 = (t0 + 6832U);
    t6 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t4, t1);
    t7 = (t6 - 0);
    t8 = (t7 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t6);
    t9 = (32U * t8);
    t10 = (0 + t9);
    t5 = (t3 + t10);
    t11 = (t0 + 4256);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t5, 32U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB3;

LAB5:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 1832U);
    t4 = *((char **)t1);
    t1 = (t0 + 4320);
    t5 = (t1 + 56U);
    t11 = *((char **)t5);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 5U);
    xsi_driver_first_trans_fast(t1);
    goto LAB6;

LAB8:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1672U);
    t4 = *((char **)t1);
    t1 = (t0 + 4320);
    t5 = (t1 + 56U);
    t11 = *((char **)t5);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 5U);
    xsi_driver_first_trans_fast(t1);
    goto LAB6;

LAB10:    xsi_set_current_line(48, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t18 = *((unsigned char *)t4);
    t19 = (t18 == (unsigned char)3);
    if (t19 == 1)
        goto LAB16;

LAB17:    t17 = (unsigned char)0;

LAB18:    if (t17 != 0)
        goto LAB13;

LAB15:
LAB14:    goto LAB11;

LAB13:    xsi_set_current_line(49, ng0);
    t14 = (t0 + 1992U);
    t15 = *((char **)t14);
    t14 = (t0 + 2632U);
    t16 = *((char **)t14);
    t14 = (t0 + 6944U);
    t7 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t16, t14);
    t22 = (t7 - 0);
    t8 = (t22 * 1);
    t9 = (32U * t8);
    t10 = (0U + t9);
    t23 = (t0 + 4384);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    memcpy(t27, t15, 32U);
    xsi_driver_first_trans_delta(t23, t10, 32U, 0LL);
    goto LAB14;

LAB16:    t3 = (t0 + 2632U);
    t5 = *((char **)t3);
    t3 = (t0 + 6944U);
    t11 = (t0 + 8047);
    t13 = (t20 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 0;
    t14 = (t13 + 4U);
    *((int *)t14) = 4;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t6 = (4 - 0);
    t8 = (t6 * 1);
    t8 = (t8 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t8;
    t21 = ieee_p_3620187407_sub_4042748798_3965413181(IEEE_P_3620187407, t5, t3, t11, t20);
    t17 = t21;
    goto LAB18;

}


extern void work_a_3036163633_2659745393_init()
{
	static char *pe[] = {(void *)work_a_3036163633_2659745393_p_0};
	xsi_register_didat("work_a_3036163633_2659745393", "isim/Toplevel_tb_isim_beh.exe.sim/work/a_3036163633_2659745393.didat");
	xsi_register_executes(pe);
}
