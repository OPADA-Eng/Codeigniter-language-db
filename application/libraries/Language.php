<?php (! defined('BASEPATH')) and exit('No direct script access allowed');

/**
 * CodeIgniter Language library
 *
 * @package CodeIgniter
 * @author  Mohammad Opada Al-Bosh <m.opada.albosh@gmail.com>
 * @link    https://github.com/OPADA-Eng/Codeigniter-language-db
 */
class Language
{
	// ci instance object
	private $_ci;
	// language words opposits array 
	private $_keywords = array();
	// current session user language id
	private $_languageId;
	
	public function __construct()
    {
        $this->ci = & get_instance();
		$this->ci->load->model('language_model');
		$this->ci->load->model('configuration_model');
		// if there is session language stored
		if($this->ci->session->userdata('lang') !== FALSE){
			$this->_languageId = $this->ci->session->userdata('lang');
		}
		else{
			// get default language from configuration table
			$this->_languageId = $this->ci->configuration_model->get_item('default_display_language');
		}
	}
	
	// return opposits keyword language word 
	public function get_string($string='')
	{
		return $this->_keywords[$string];
	}
	
	/**
	 * load page keywords and opposite language words
	 * 
	 * @param string $page name of page to be loaded.
     * @param int $languageId id of language to load it's words.
     * 
	 */
	public function load($page='',$languageId='')
	{
		
		$lang_id = $this->_languageId; 
		if($languageId != ''){
			$lang_id = $languageId;
		}
		$new_keywords = $this->ci->language_model->get_page_strings($page,$lang_id);
		
		$this->_keywords = array_merge($this->_keywords,$new_keywords);
	}
	
}
	