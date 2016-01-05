<?php (! defined('BASEPATH')) and exit('No direct script access allowed');


class Language_model extends CI_Model {
	
	/*
	 * get All page keywords.
	 * 
	 * @param string $page name of page to be loaded.
	 * @param int $languageId id of language to load it's words.
	 */
	public function get_page_strings($page='',$languageId)
	{
		$this->db->join('content_holder','content_holder.Page_ID = page.id');
		$this->db->join('content_view','content_holder.id = content_view.Content_ID');
		$q = $this->db->get_where('page',array('Name'=>$page,'Language_ID'=>$languageId));
		if($q->num_rows()>0){
			$result = array();
			foreach ($q->result() as $key => $item) {
				$result[$item->Programming_Name] = $item->Content;
			}
			return $result;
		}
		return array();
	}
	
}