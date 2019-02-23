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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;
char *IEEE_P_1242562249;
char *UNISIM_P_0947159679;
char *STD_TEXTIO;
char *IEEE_P_2717149903;
char *IEEE_P_1367372525;
char *UNISIM_P_3222816464;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_1242562249_init();
    std_textio_init();
    ieee_p_2717149903_init();
    ieee_p_1367372525_init();
    work_a_1127804793_1181938964_init();
    work_a_0952683476_3212880686_init();
    work_a_3294646345_3212880686_init();
    work_a_2120276825_3212880686_init();
    work_a_1347197072_3212880686_init();
    work_a_4099441618_3212880686_init();
    work_a_3036163633_2659745393_init();
    work_a_1709162847_3212880686_init();
    work_a_0101855923_1181938964_init();
    work_a_2110357975_1181938964_init();
    work_a_4085668353_1181938964_init();
    work_a_0346916625_3212880686_init();
    work_a_3506152563_1181938964_init();
    work_a_2499398758_1181938964_init();
    work_a_3221528415_1181938964_init();
    work_a_0902411490_1181938964_init();
    work_a_3493985114_3212880686_init();
    work_a_3327597146_3212880686_init();
    work_a_0832606739_3212880686_init();
    work_a_3264794668_3212880686_init();
    work_a_1869964917_3212880686_init();
    work_a_2757899069_3212880686_init();
    work_a_0899034125_3212880686_init();
    work_a_2704071536_1696028597_init();
    work_a_0709323969_3588443593_init();
    work_a_0010332520_1142133938_init();
    work_a_1181385131_3588443593_init();
    work_a_0329541817_3212880686_init();
    work_a_4204489651_1446275585_init();
    work_a_1326623768_3212880686_init();
    work_a_1681128743_1181938964_init();
    work_a_3148282204_3212880686_init();
    work_a_2842780633_1696028597_init();
    work_a_0461531950_3588443593_init();
    work_a_0243245684_3212880686_init();
    work_a_2399776393_3212880686_init();
    unisim_p_0947159679_init();
    unisim_p_3222816464_init();
    unisim_a_0032955683_0883528894_init();
    work_a_1970754236_0000452272_init();
    work_a_3720894149_1181938964_init();
    unisim_a_3868148721_2381219257_init();
    work_a_2332004714_0000452272_init();
    unisim_a_2809917459_2381219257_init();
    work_a_2642707753_0000452272_init();
    work_a_2752100844_0000452272_init();
    work_a_3010637231_0000452272_init();
    work_a_1130845995_1181938964_init();
    work_a_1546360697_3212880686_init();
    work_a_2433312762_2372691052_init();


    xsi_register_tops("work_a_2433312762_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_2717149903 = xsi_get_engine_memory("ieee_p_2717149903");
    IEEE_P_1367372525 = xsi_get_engine_memory("ieee_p_1367372525");
    UNISIM_P_3222816464 = xsi_get_engine_memory("unisim_p_3222816464");

    return xsi_run_simulation(argc, argv);

}
