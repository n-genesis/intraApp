<aside id="sidebar" class="sidebar c-overflow">
	<div class="s-profile">
		<a href="#" data-ma-action="profile-menu-toggle">
		<div class="sp-pic">
			<img src="application/view/image/profile-pics/default-avatar.jpg" alt="" class="center-block">
		</div>
		<div class="sp-info">
			<?php echo $username;?>

			<i class="zmdi zmdi-caret-down"></i>
		</div>
		</a>

		<ul class="main-menu">
		    <!--
			<li><a href="#"><i class="zmdi zmdi-settings"></i> Settings</a></li>
			-->
			<li><a href="<?php echo $logout;?>"><i class="zmdi zmdi-time-restore"></i> Logout</a></li>
		</ul>
	</div>

	<ul class="main-menu">
		<li><a href="<?php echo $dashboard;?>"><i class="zmdi zmdi-home"></i> Dashboard</a></li>
		<!--
		<li><a href="<?php echo $search_person;?>"><i class="zmdi zmdi-search"></i> Search</a></li>
		-->
		<li class="sub-menu"><a href="#" data-ma-action="submenu-toggle"><i class="zmdi zmdi-search"></i> Search</a>
			<ul>
				<li><a href="<?php echo $search_person;?>">Person</a></li>
				<li><a href="<?php echo $search_insurance;?>">Insurance</a></li>
				<li><a href="<?php echo $search_employer;?>">Employer</a></li>
			</ul>
		</li>
		<!-- extension menu options -->
		<?php if(isset($extensions_links)) { ?>
		<?php for($i=0; $i <count($extensions_links) ; $i++) { ?>
			<li><a href="<?php echo $extensions_links[$i]['link'] ;?>"><i class="zmdi zmdi-open-in-browser"></i><?php echo $extensions_links[$i]['name'] ;?></a></li>
		<?php } ?>
		<?php } ?>
		<li class="sub-menu"><a href="#" data-ma-action="submenu-toggle"><i class="zmdi zmdi-collection-text"></i> Application Information</a>
            <ul>
                <li><a href="#">Insurance</a></li>
                <li><a href="#">Employer</a></li>
                <li><a href="#">Profiles</a></li>
                <li><a href="<?php echo $appinfo_files;?>">Files</a></li>
            </ul>
        </li>
		<li class="sub-menu"><a href="#" data-ma-action="submenu-toggle"><i class="zmdi zmdi-settings"></i> System Settings</a>
            <ul>
                <li><a href="#">User Administration</a></li>
                <li><a href="<?php echo $extensions;?>">Extentions</a></li>
                <li><a href="#">System</a></li>
            </ul>
        </li>
        <li><a href="<?php echo $helpdoc;?>"><i class="zmdi zmdi-help-outline"></i> Help Document</a></li>
	</ul>
</aside>