<li class="dropdown"><a data-toggle="dropdown" href="#"><i class="him-icon zmdi zmdi-comment-alt-text"></i></a>
	<div class="dropdown-menu dropdown-menu-lg pull-right">
		<div class="list-group him-notification">
			<div class="lg-header">
				Previously Viewed Profiles
			</div>
			<div class="lg-body c-overflow">
			    <?php
			    for ($i=0; $i < count($profiles) ; $i++) { 
				?>
				<a class="list-group-item media" href="<?php echo $profile_link.$profiles[$i]['patient_id']; ?>">
                <div class="pull-left">
                    <img class="lgi-img" src="files/patient-profile/default_avatar.png" alt="">
                </div>
                <div class="media-body">
                    <?php echo $profiles[$i]['name']; ?>
                    <br />
                    SSN: <?php echo $profiles[$i]['ssn']; ?>
                </div>
                </a>
				<?	
				}
			    ?>
			</div>

			<a class="view-more" href="<?php echo $previously_viewed;?>">View Previous</a>
		</div>
	</div>
</li>