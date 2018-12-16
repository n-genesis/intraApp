<?php
class ModelExtensionModule extends Model {
	public function addModule($code, $data) {
		$this->db->query("INSERT INTO `module` SET `name` = '" . $this->db->escape($data['name']) . "', `code` = '" . $this->db->escape($code) . "', `setting` = '" . $this->db->escape(json_encode($data)) . "'");
	}
	
	public function editModule($module_id, $data) {
		$this->db->query("UPDATE `module` SET `name` = '" . $this->db->escape($data['name']) . "', `setting` = '" . $this->db->escape(json_encode($data)) . "' WHERE `module_id` = '" . (int)$module_id . "'");
	}

	public function deleteModule($module_id) {
		$this->db->query("DELETE FROM `module` WHERE `module_id` = '" . (int)$module_id . "'");
	}
		
	public function getModule($module_id) {
		$query = $this->db->query("SELECT * FROM `module` WHERE `module_id` = '" . $this->db->escape($module_id) . "'");

		if ($query->row) {
			return json_decode($query->row['setting'], true);
		} else {
			return array();	
		}
	}
	
	public function getModules() {
		$query = $this->db->query("SELECT * FROM `module` ORDER BY `code`");

		return $query->rows;
	}	
		
	public function getModulesByCode($code) {
		$query = $this->db->query("SELECT * FROM `module` WHERE `code` = '" . $this->db->escape($code) . "' ORDER BY `name`");

		return $query->rows;
	}	
	
	public function deleteModulesByCode($code) {
		$this->db->query("DELETE FROM `module` WHERE `code` = '" . $this->db->escape($code) . "'");
	}	
}
?>