<div class="pmb-block">
	<div class="card">
		<div class="card-header bgm-bluegray">
			<h2><i class="zmdi zmdi-file"></i> <?php echo $title;?> <span class="pull-right"><span class="zmdi zmdi-calendar-note"></span> <?php echo $date;?></span></h2>

			<a href="<?php echo $add_note;?>" data-sandbox="add-note" data-sandbox-title="Add Note" class="btn btn-primary btn-float" data-sandbox-controller="<?php echo $add_note_controller;?>">
				<i class="zmdi zmdi-plus"></i>
			</a>
		</div>
		<div class="card-body card-padding">
			<?php echo substr($note,0,200);?>
		</div>
	</div>
</div>