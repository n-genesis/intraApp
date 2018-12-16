<?php
class ModelProfileCalls extends Model {
    public function getCallList($patient_id){
        $query = $this->db->query("SELECT *, DATE_FORMAT(call_date,'%m/%d/%Y') as date, SUBSTR(note,1,90) as note FROM patient_call WHERE patient_id =  '" . (int)$patient_id . "' ORDER BY call_date DESC");
        if ($query->num_rows) {
            return $query->rows;
        } else {
            return false;
        }
    }
    
    public function getCall($call_id){
        $query = $this->db->query("SELECT U.username, PC.call_id, PC.patient_id, PC.note, DATE_FORMAT(PC.call_date,'%m/%d/%Y') as date, PC.phone FROM patient_call PC LEFT JOIN user U ON U.user_id = PC.user_id WHERE PC.call_id = '".(int)$call_id."'");
        if($query->num_rows > 0){
            return $query->row;
        }else{
            return false;
        }
    }
    
    public function newCall($patient_id,$data){
        if(!empty($data)){
            $this->db->query("INSERT INTO patient_call(user_id, patient_id, note, call_date, phone) VALUES ('" . (int)$data['user_id'] . "','" . (int)$patient_id . "','" . $this->db->escape($data['note']) . "','" . date('Y-n-j',strtotime($this->db->escape($data['date']))) . "','" . $this->db->escape($data['phone']) . "')");
        }
        if(!$this->db->hasError()){
            return $this->db->getLastId();
        }else{
            return false;
        }
    }
    
     public function deleteCall($call_id){
        $query = $this->db->query("DELETE FROM patient_call WHERE call_id = '".(int)$call_id. "'");
        if(!$this->db->hasError()){
            return true;
        }else{
            return false;
        }
    }
}
?>