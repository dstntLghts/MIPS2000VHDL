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
static const char *ng0 = "C:/Users/Xhaar/Desktop/MIPS2000VHDL/SHIFT.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_1830103426_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_2770553711_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_3064532541_1035706684(char *, char *, char *, char *, int );


static void work_a_3327597146_3212880686_p_0(char *t0)
{
    char t24[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned char t11;
    unsigned char t12;
    int t13;
    char *t14;
    unsigned char t15;
    unsigned char t16;
    char *t17;
    int t18;
    char *t19;
    int t20;
    char *t21;
    char *t22;
    int t23;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    int t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;

LAB0:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (31 - 4);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 2648U);
    t7 = *((char **)t6);
    t8 = (4 - 4);
    t9 = (t8 * 1U);
    t10 = (0 + t9);
    t6 = (t7 + t10);
    memcpy(t6, t1, 5U);
    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t11 = *((unsigned char *)t2);
    t12 = (t11 == (unsigned char)3);
    if (t12 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t11 = *((unsigned char *)t2);
    t12 = (t11 == (unsigned char)2);
    if (t12 != 0)
        goto LAB5;

LAB6:
LAB3:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 2408U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    memcpy(t1, t2, 32U);
    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 2528U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    memcpy(t1, t2, 32U);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 6638);
    t13 = xsi_mem_cmp(t1, t2, 2U);
    if (t13 == 1)
        goto LAB11;

LAB16:    t7 = (t0 + 6640);
    t18 = xsi_mem_cmp(t7, t2, 2U);
    if (t18 == 1)
        goto LAB12;

LAB17:    t17 = (t0 + 6642);
    t20 = xsi_mem_cmp(t17, t2, 2U);
    if (t20 == 1)
        goto LAB13;

LAB18:    t21 = (t0 + 6644);
    t23 = xsi_mem_cmp(t21, t2, 2U);
    if (t23 == 1)
        goto LAB14;

LAB19:
LAB15:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 6646);
    t6 = (t0 + 4152);
    t7 = (t6 + 56U);
    t14 = *((char **)t7);
    t17 = (t14 + 56U);
    t19 = *((char **)t17);
    memcpy(t19, t1, 32U);
    xsi_driver_first_trans_fast_port(t6);

LAB10:    t1 = (t0 + 4072);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 2768U);
    t6 = *((char **)t1);
    t1 = (t0 + 6460U);
    t13 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t6, t1);
    t7 = (t0 + 2288U);
    t14 = *((char **)t7);
    t7 = (t14 + 0);
    *((int *)t7) = t13;
    goto LAB3;

LAB5:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1672U);
    t6 = *((char **)t1);
    t15 = *((unsigned char *)t6);
    t16 = (t15 == (unsigned char)2);
    if (t16 != 0)
        goto LAB7;

LAB9:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 2648U);
    t2 = *((char **)t1);
    t1 = (t0 + 6444U);
    t13 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t1);
    t6 = (t0 + 2288U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    *((int *)t6) = t13;

LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1352U);
    t7 = *((char **)t1);
    t1 = (t0 + 6348U);
    t13 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t7, t1);
    t14 = (t0 + 2288U);
    t17 = *((char **)t14);
    t14 = (t17 + 0);
    *((int *)t14) = t13;
    goto LAB8;

LAB11:    xsi_set_current_line(59, ng0);
    t25 = (t0 + 2528U);
    t26 = *((char **)t25);
    t25 = (t0 + 6428U);
    t27 = (t0 + 2288U);
    t28 = *((char **)t27);
    t29 = *((int *)t28);
    t27 = ieee_p_1242562249_sub_2770553711_1035706684(IEEE_P_1242562249, t24, t26, t25, t29);
    t30 = (t0 + 4152);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memcpy(t34, t27, 32U);
    xsi_driver_first_trans_fast_port(t30);
    goto LAB10;

LAB12:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4152);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t14 = (t7 + 56U);
    t17 = *((char **)t14);
    memcpy(t17, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB10;

LAB13:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    t1 = (t0 + 6428U);
    t6 = (t0 + 2288U);
    t7 = *((char **)t6);
    t13 = *((int *)t7);
    t6 = ieee_p_1242562249_sub_1830103426_1035706684(IEEE_P_1242562249, t24, t2, t1, t13);
    t14 = (t0 + 4152);
    t17 = (t14 + 56U);
    t19 = *((char **)t17);
    t21 = (t19 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t6, 32U);
    xsi_driver_first_trans_fast_port(t14);
    goto LAB10;

LAB14:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 2408U);
    t2 = *((char **)t1);
    t1 = (t0 + 6412U);
    t6 = (t0 + 2288U);
    t7 = *((char **)t6);
    t13 = *((int *)t7);
    t6 = ieee_p_1242562249_sub_3064532541_1035706684(IEEE_P_1242562249, t24, t2, t1, t13);
    t14 = (t0 + 4152);
    t17 = (t14 + 56U);
    t19 = *((char **)t17);
    t21 = (t19 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t6, 32U);
    xsi_driver_first_trans_fast_port(t14);
    goto LAB10;

LAB20:;
}


extern void work_a_3327597146_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3327597146_3212880686_p_0};
	xsi_register_didat("work_a_3327597146_3212880686", "isim/Toplevel_tb_isim_beh.exe.sim/work/a_3327597146_3212880686.didat");
	xsi_register_executes(pe);
}
