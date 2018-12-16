<?php
class ModelProfileRecord extends Model {
    public function getRecordById($patient_id){
        $query = $this->db->query("SELECT * FROM patient_records PR WHERE PR.patient_id = '" . (int)$patient_id . "'");
        if ($query->num_rows) {
            return $query->row;
        } else {
            return false;
        }
    }
    
    public function editRecord($patient_id, $data) {
        $this->db->query("UPDATE patient_records SET record = '" . $this->db->escape(serialize($data)) . "' WHERE patient_id =  '" . (int)$patient_id . "'");
        
        if(!$this->db->hasError()){
            return true;
        }else{
            return false;
        }
    }
    
    public function addRecord($patient_id,$data){
        $query = $this->db->query("INSERT INTO patient_records (`patient_id`, `record`) VALUES ('" . (int)$patient_id . "','" . $this->db->escape(serialize($data)) . "')");
        if ($this->db->countAffected() > 0) {
            return true;
        } else {
            return false;
        }
    }

}
?>