<?php
/* herlper function to get opposite language Word.
 * 
 * @param string $string keyword to get it's linguistic opposit
 * 
 * @return string linguistic opposit
 */
function lang($string='')
{
	$ci = &get_instance();
	return $ci->language->get_string($string);
}