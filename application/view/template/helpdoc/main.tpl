<div class="block-header">
	<h2>Help Document</h2>
</div>
<div class="row">
	<div class="col-sm-3 col-md-3 p-r-0">
		<div class="nav-side-menu">
			<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
			<div class="menu-list">
				<ul id="menu-content" class="menu-content">
				    <li class="active"><a href="<?php echo $link['main'];?>"><i class="zmdi zmdi-home"></i> Home </a></li>
					<li><a href="#"> <i class="zmdi zmdi-view-quilt"></i> Dashboard </a></li>
					<li><a href="#"><i class="zmdi zmdi-search"></i> Search </a></li>
					<li data-toggle="collapse" data-target="#profile" class="collapsed"><a href="javascript:void(0);"><i class="zmdi zmdi-account-box"></i> Profile <span class="arrow"></span></a></li>
					<ul class="sub-menu collapse" id="profile">
						<a href="<?php echo $link['general'];?>"><li>General</li></a>
                        <a href="<?php echo $link['insurance_policy'];?>"><li>Insurance/Policy</li></a>
                        <a href="<?php echo $link['employer'];?>"><li>Employer</li></a>
                        <a href="<?php echo $link['records'];?>"><li>Records</li></a>
                        <a href="<?php echo $link['notes_action'];?>"><li>Notes/Actions</li></a>
					</ul>
					<li data-toggle="collapse" data-target="#application" class="collapsed"><a href="javascript:void(0);"><i class="zmdi zmdi-assignment"></i> Application Info <span class="arrow"></span></a></li>
					<ul class="sub-menu collapse" id="application">
						<a href="#"><li>New Service 1</li></a>
						<a href="#"><li>New Service 2</li></a>
						<a href="#"><li>New Service 3</li></a>
					</ul>
					<li data-toggle="collapse" data-target="#system" class="collapsed"><a href="javascript:void(0);"><i class="zmdi zmdi-settings"></i> System Settings <span class="arrow"></span></a></li>
					<ul class="sub-menu collapse" id="system">
						<a href="#"><li>New New 1</li></a>
						<a href="#"><li>New New 2</li></a>
						<a href="#"><li>New New 3</li></a>
					</ul>
					<li><a href="#"> <i class="zmdi zmdi-code-setting"></i> Extensions </a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-sm-9 col-md-9">
		<div class="card">
			<div class="card-header">
				<h1 class="m-0">Help Document</h1>
				<small>Learn how to use INTRAapp and it's features</small>
			</div>
			<div class="card-body card-padding">
			    <div class="row">
			        <div class="col-md-4">
			            <div class="panel hover-effect text-center">
			                <a href="<?php echo $link['general'];?>">
        				    <div class="panel-body p-t-10">
        				        <h3 class="m-0 m-b-5">Profiles</h3>
        				        <img src="application/view/image/help/profile.gif" class="center-block" />
        				        <p class="m-t-10 m-b-5">Features, operations and associating profiles</p>
        				    </div>
        				    </a>
        				</div>
			        </div>
			        <div class="col-md-4">
                        <div class="panel hover-effect text-center">
                            <a href="#">
                            <div class="panel-body p-t-10">
                                <h3 class="m-0 m-b-5">Search</h3>
                                <img src="application/view/image/help/search.gif" class="center-block" />
                                <p class="m-t-10 m-b-5">Options for querying for profiles</p>
                            </div>
                            </a>
                        </div>
                    </div>
			        <div class="col-md-4">
                        <div class="panel hover-effect text-center">
                            <a href="#">
                            <div class="panel-body p-t-10">
                                <h3 class="m-0 m-b-5">Extensions</h3>
                                <img src="application/view/image/help/extension.gif" class="center-block" />
                                <p class="m-t-10 m-b-5">Installing, editing and removing add-ons</p>
                            </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4 col-md-offset-2">
                        <div class="panel hover-effect text-center">
                            <a href="#">
                            <div class="panel-body p-t-10">
                                <h3 class="m-0 m-b-5">Application Info</h3>
                                <img src="application/view/image/help/info.gif" class="center-block" />
                                <p class="m-t-10 m-b-5">Manage general general info used in application</p>
                            </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="panel hover-effect text-center">
                            <a href="#">
                            <div class="panel-body p-t-10">
                                <h3 class="m-0 m-b-5">System Settings</h3>
                                <img src="application/view/image/help/settings.gif" class="center-block" />
                                <p class="m-t-10 m-b-5">Manage user accounts and information</p>
                            </div>
                            </a>
                        </div>
                    </div>
			    </div>
			</div>
		</div>
	</div>
</div>
