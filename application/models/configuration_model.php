<?php

/**
 * 
 */
class Configuration_model extends CI_Model {
	/*
	 * get configuration item from db configuration table
	 * 
	 * @param string $key key of config item
	 * @return string $value
	 */
	public function get_item($key='')
	{
		$q = $this->db->get_where('configeration',array('Key'=>$key));
		if($q->num_rows>0){
			return $q->row()->Value;
		}
		return FALSE;
	}
}
