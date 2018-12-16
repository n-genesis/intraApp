<?php
class ModelProfileNotes extends Model {
    public function getNotesList($patient_id){
        $query = $this->db->query("SELECT *, DATE_FORMAT(note_date,'%m/%d/%Y') as date, SUBSTR(note,1,80) as note FROM patient_note WHERE patient_id =  '" . (int)$patient_id . "' ORDER BY note_date DESC");
        if ($query->num_rows) {
            return $query->rows;
        } else {
            return false;
        }
    }
    
    public function getLatestNote($patient_id){
        $query = $this->db->query("SELECT *, DATE_FORMAT(note_date,'%m/%d/%Y') as date FROM patient_note WHERE patient_id =  '" . (int)$patient_id . "' ORDER BY note_date ASC");
        if ($query->num_rows) {
            return $query->row;
        } else {
            return false;
        }
    }
    
    public function getNote($note_id){
        $query = $this->db->query("SELECT PN.note_id, DATE_FORMAT(PN.note_date,'%m/%d/%Y') as date, PN.title, PN.note, U.username FROM patient_note PN INNER JOIN user U ON PN.user_id = U.user_id WHERE PN.note_id = '".(int)$note_id."'");
        if($query->num_rows > 0){
            return $query->row;
        }else{
            return false;
        }
    }
    
    public function newNote($patient_id,$data){
        if(!empty($data)){
            $this->db->query("INSERT INTO `patient_note`(`user_id`, `title`, `note_date`, `note`, `patient_id`) VALUES ('" . (int)$data['user_id'] . "','" . $this->db->escape($data['title']) . "','" . date('Y-n-j',time()) . "','" . $this->db->escape($data['note']) . "','" . (int)$patient_id . "')");
        }
        if(!$this->db->hasError()){
            return $this->db->getLastId();
        }else{
            return false;
        }
    }
    
     public function deleteNote($note_id){
        $query = $this->db->query("DELETE FROM patient_note WHERE note_id = '".(int)$note_id. "'");
        if(!$this->db->hasError()){
            return true;
        }else{
            return false;
        }
    }
}
?>