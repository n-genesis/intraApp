<div class="card">
	<div class="card-header">
		<h2>Praesent vitae justo purus <small>In hendrerit lorem nislac lacinia</small></h2>
	</div>

	<div class="card-body">
		<ul class="tab-nav tn-justified tn-icon" role="tablist">
			<li role="presentation" class=""><a aria-expanded="false" class="col-sx-4" href="#tab-1" aria-controls="tab-1" role="tab" data-toggle="tab"> <i class="zmdi zmdi-home icon-tab"></i> </a></li>
			<li class="active" role="presentation"><a aria-expanded="true" class="col-xs-4" href="#tab-2" aria-controls="tab-2" role="tab" data-toggle="tab"> <i class="zmdi zmdi-pin icon-tab"></i> </a></li>
		</ul>

		<div class="tab-content p-20">
			<div role="tabpanel" class="tab-pane animated fadeIn" id="tab-1">
				<img src="img/headers/sm/6.png" class="img-responsive m-b-15" alt="">
				Morbi id orci lacus. Nunc semper condimentum sem vel imperdiet. Praesent
				tristique purus id est dictum, vel vestibulum ante interdum.
			</div>

			<div role="tabpanel" class="tab-pane animated fadeIn active" id="tab-2">
				<img src="img/headers/sm/2.png" class="img-responsive m-b-15" alt="">
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet dapibus
				tellus. Nullam aliquet dignissim semper. Cras sit amet ligula congue, dapibus
				enim id, dapibus tellus.
			</div>

		</div>
	</div>
</div>
<div class="card">
<div class="card-header bgm-cyan">
		<h2><?php echo $category_name; ?></h2>

		<ul class="actions actions-alt">
			<li class="dropdown"><a href="#" data-toggle="dropdown" aria-expanded="false"> <i class="zmdi zmdi-more-vert"></i> </a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li><a href="#">Refresh</a></li>
					<li><a href="#">Manage Widgets</a></li>
					<li><a href="#">Widgets Settings</a></li>
				</ul></li>
		</ul>
	</div>

	<div class="card-body card-padding">
	    <h4><?php echo $category_group_name; ?></h4> 
		<div class="row">
		   
<?php foreach ($categories as $category) {?>
            <?php echo $category; ?>
        <?php } ?>
		</div>

	</div>
</div>
