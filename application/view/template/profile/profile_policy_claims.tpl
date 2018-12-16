<?php if(!empty($claims)){ ?>
<?php foreach($claims as $claim){ ?>
<div class="list-group-item media click">
	<div class="pull-right">
		<div class="actions dropdown">
			<a href="#" data-toggle="dropdown" aria-expanded="true"> <i class="zmdi zmdi-more-vert"></i> </a>

			<ul class="dropdown-menu dropdown-menu-right">
			    <!--
				<li><a href="#" data-sandbox-edit-claim="<?php echo $claim['claim_id'];?>">Edit</a></li>
				-->
				<li><a href="#" data-sandbox-delete="claim" data-sandbox-claim-id="<?php echo $claim['claim_id'];?>" data-sandbox-controller="<?php echo $delete_claim;?>">Delete</a></li>
			</ul>
		</div>
	</div>
	<div class="media-body" data-sandbox-view="claim" data-sandbox-claim-id="<?php echo $claim['claim_id'];?>" data-sandbox-title="Claim">
		<div class="lgi-heading">
		    <h1><?php echo $claim['title'];?></h1>
			<?php echo $claim['claim'];?>
		</div>
		<ul class="lgi-attrs">
			<li>Date Created: <?php echo $claim['date'];?></li>
			<?php if(!empty($claim['status'])){ ?>
			   <li class="<?php echo $claim['status'];?>">status: <?php echo $claim['status'];?></li> 
			<?php } ?>
		</ul>
	</div>
</div>
<?php } ?>
<?php }else{ ?>
<div class="text-center p-25">
<h2>No listed claims</h2>
</div>
<?php } ?>