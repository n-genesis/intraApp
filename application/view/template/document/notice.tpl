<?php if(isset($events)){?>
<?php foreach($events as $event){?>
<div class="alert alert-<?php echo $event['type']; ?> alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
<?php echo $event['message']; ?>
</div>
<?php }?>
<?php }?>