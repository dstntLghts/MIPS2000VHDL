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
static const char *ng0 = "C:/Users/Xhaar/Desktop/MIPS2000VHDL/EXT_sz.vhd";
extern char *IEEE_P_2592010699;



static void work_a_1709162847_3212880686_p_0(char *t0)
{
    char t15[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB10;

LAB11:    xsi_set_current_line(50, ng0);

LAB3:    t1 = (t0 + 3072);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 1032U);
    t5 = *((char **)t1);
    t6 = (15 - 15);
    t7 = (t6 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t5 + t9);
    t10 = *((unsigned char *)t1);
    t11 = (t10 == (unsigned char)3);
    if (t11 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t6 = (15 - 15);
    t7 = (t6 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t2 + t9);
    t3 = *((unsigned char *)t1);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB8;

LAB9:    xsi_set_current_line(45, ng0);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(41, ng0);
    t12 = (t0 + 1648U);
    t13 = *((char **)t12);
    t12 = (t0 + 1032U);
    t14 = *((char **)t12);
    t16 = ((IEEE_P_2592010699) + 4024);
    t17 = (t0 + 4864U);
    t18 = (t0 + 4832U);
    t12 = xsi_base_array_concat(t12, t15, t16, (char)97, t13, t17, (char)97, t14, t18, (char)101);
    t19 = (t0 + 3152);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t12, 32U);
    xsi_driver_first_trans_fast_port(t19);
    goto LAB6;

LAB8:    xsi_set_current_line(43, ng0);
    t5 = (t0 + 1768U);
    t12 = *((char **)t5);
    t5 = (t0 + 1032U);
    t13 = *((char **)t5);
    t14 = ((IEEE_P_2592010699) + 4024);
    t16 = (t0 + 4880U);
    t17 = (t0 + 4832U);
    t5 = xsi_base_array_concat(t5, t15, t14, (char)97, t12, t16, (char)97, t13, t17, (char)101);
    t18 = (t0 + 3152);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t5, 32U);
    xsi_driver_first_trans_fast_port(t18);
    goto LAB6;

LAB10:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1768U);
    t5 = *((char **)t1);
    t1 = (t0 + 1032U);
    t12 = *((char **)t1);
    t13 = ((IEEE_P_2592010699) + 4024);
    t14 = (t0 + 4880U);
    t16 = (t0 + 4832U);
    t1 = xsi_base_array_concat(t1, t15, t13, (char)97, t5, t14, (char)97, t12, t16, (char)101);
    t17 = (t0 + 3152);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t1, 32U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB3;

}


extern void work_a_1709162847_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1709162847_3212880686_p_0};
	xsi_register_didat("work_a_1709162847_3212880686", "isim/Toplevel_tb_isim_beh.exe.sim/work/a_1709162847_3212880686.didat");
	xsi_register_executes(pe);
}
