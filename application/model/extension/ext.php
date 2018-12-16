<?php
class ModelExtExt extends Model {
    public $var = 'Var property';
    
    public function getProp(){
        return $this->var;
    }
}
?>