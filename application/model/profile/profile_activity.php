<?php
/**
 * Profile User Activity
 */
class ModelProfileProfileActivity extends Model {
	
	function getActivity($data) {
		$query = "SELECT U.user_id, U.username, U.first_name, U.last_name, P.patient_id, P.first_name, P.last_name, USA.action, DATE_FORMAT(USA.update_time,'%m/%d/%Y %l:%i%p') as update_time FROM patient P LEFT JOIN user_session_activity USA ON P.patient_id = USA.patient_id LEFT JOIN user_log UL ON UL.log_id = USA.user_log_id INNER JOIN user U ON U.user_id = UL.user_id WHERE P.patient_id = '" . (int)$data['patient_id'] . "' ORDER BY USA.update_time DESC";
        
        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $query .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }
        
        $query = $this->db->query($query);
        
        if ($query->num_rows) {
            return $query->rows;
        } else {
            return false;
        }
	}
    /**
     * Return number of row from the activities table
     */
    function numActivity($patient_id) {
        $query = $this->db->query("SELECT * FROM user_session_activity WHERE patient_id = '" . (int)$patient_id . "'");
        return $query->num_rows;
    }
}

?>