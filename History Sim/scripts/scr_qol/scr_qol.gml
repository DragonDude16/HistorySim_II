// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_qol(num){
	pow1 = power(num, 0.45);
	pow2 = power(1.3, pow1);
	
	return (99+pow2)/100;
}