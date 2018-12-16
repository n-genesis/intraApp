<?php if(!empty($patient_info)){ ?>
<div class="block-header p-0">
	<h3><?php echo $title; ?> <a href="<?php echo $link['general'] ?>" class="f-20">[User ID: <?php echo $patient_info['patient_id']?>]</a></h3>
</div>
<!-- possilbe remove -->
<div class="card bgm-green c-white">
	<div class="card-body card-padding">
		<?php echo $title; ?>
		[User ID: <?php echo $patient_info['patient_id']?>]
	</div>
</div>
<div class="card">
	<div class="list-group lg-odd-black">
		<div class="action-header clearfix">
			<div class="ah-label hidden-xs">
				Activity List
			</div>
			<?php if($profile_activity) { ?>
			<div class="ah-search">
				<input type="text" placeholder="Start typing..." class="ahs-input">

				<i class="ahs-close" data-ma-action="action-header-close">&times;</i>
			</div>

			<ul class="actions">
				<li><a href="#" data-ma-action="action-header-open"> <i class="zmdi zmdi-search"></i> </a></li>

				<li><a href="#"> <i class="zmdi zmdi-time"></i> </a></li>
				<li class="dropdown"><a href="#" data-toggle="dropdown" aria-expanded="true"> <i class="zmdi zmdi-sort"></i> </a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li><a href="#">Last Modified</a></li>
						<li><a href="#">Last Edited</a></li>
						<li><a href="#">Name</a></li>
						<li><a href="#">Date</a></li>
					</ul></li>
				<li><a href="#"> <i class="zmdi zmdi-info"></i> </a></li>
			</ul>
			<?php } ?>
		</div>
		<?php if($profile_activity) { ?>
		<?php for ($i=0; $i < count($profile_activity) ; $i++) { ?>
		<div class="list-group-item media">
			<div class="checkbox pull-left">
				<label>
					<input type="checkbox" value="">
					<i class="input-helper"></i> </label>
			</div>
			<div class="pull-left">
				<img class="lgi-img" src="application/view/image/profile-pics/default-avatar.jpg" alt="">
			</div>

			<div class="pull-right">
				<div class="actions dropdown">
					<a href="#" data-toggle="dropdown" aria-expanded="true"> <i class="zmdi zmdi-more-vert"></i> </a>

					<ul class="dropdown-menu dropdown-menu-right">
						<li><a href="#">Edit</a></li>
						<li><a href="#">Delete</a></li>
					</ul>
				</div>
			</div>

			<div class="media-body">
				<div class="lgi-heading">
					<?php echo $profile_activity[$i]['action'] ?>
				</div>
				<!--
				<small class="lgi-text">An erant explicari salutatus duo, sumo doming delicata in cum. Eos at augue viderer principes</small>
				-->
				<ul class="lgi-attrs">
					<li>Date Created: <?php echo $profile_activity[$i]['update_time']; ?></li>
					<li>User: <?php echo $profile_activity[$i]['username']; ?></li>
					<li class="bgm-blue"><a href="<?php echo $link['general'] ?>" class=" c-white">Profile Id: <?php echo $profile_activity[$i]['patient_id']; ?></a></li>
				</ul>
			</div>
		</div>
		<?php } ?>
		
		<!-- Pagnation -->
		<?php echo $pagination; ?>

		<?php }else{ ?>
		<div class="list-group-item">
		    <div class="media-body">
                <div class="lgi-heading text-center">
                  <h2>No recorded activity to display</h2>
                  <a href="<?php echo $link['general'] ?>" class="btn bgm-blue waves-effect m-t-15 m-b-25">Back to Profile</a>
                </div>
            </div>
		</div>
		    
		<?php } ?>
	</div>

	
	
</div>
<?php } else{ ?>
<section id="patient-not-found">
    <h1><?php echo $page_notice; ?></h1>
    <img src="application/view/image/not-found.png" class="center-block" />
</section>
<?php } ?>