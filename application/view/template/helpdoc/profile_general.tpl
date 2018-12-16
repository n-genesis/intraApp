<div class="block-header">
	<h2>Help Document</h2>
</div>
<div class="row">
	<div class="col-sm-3 col-md-3 p-r-0">
        <div class="nav-side-menu">
            <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
            <div class="menu-list">
                <ul id="menu-content" class="menu-content">
                    <li><a href="<?php echo $link['main'];?>"><i class="zmdi zmdi-home"></i> Home </a></li>
                    <li><a href="#"> <i class="zmdi zmdi-view-quilt"></i> Dashboard </a></li>
                    <li><a href="#"><i class="zmdi zmdi-search"></i> Search </a></li>
                    <li data-toggle="collapse" data-target="#profile" class="collapsed active"><a href="javascript:void(0);"><i class="zmdi zmdi-account-box"></i> Profile <span class="arrow"></span></a></li>
                    <ul class="sub-menu collapse in" id="profile">
                        <a href="<?php echo $link['general'];?>"><li class="active">General</li></a>
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
			<div class="card-header p-b-5">
				<h1 class="m-0">General Information</h1>
			</div>
			<div class="card-body card-padding">
			    <p class="paragraph">
			       On the general profile page basic information; such as contact, personal, and general patient information, will be listed and can be edited. If a note was added to the profile the most recent one entered will also be displayed on this page as well. You can also add and change profile avatars by clicking on the avatar picture of selecting a new avatar picture you would like to be associated with profile. To modify general profile information select the field you wish to edit and enter changes. When a form field is selected it will be underlined in blue. To save the modifications click the save respective information section (it’s identified by a single button with a checkmark). 
			    </p>
			    <h3>1. Editing Information</h3>
			    <p class="paragraph">
			        When you want to edit a field simply click on it and it will be underlined in blue. As shown in figure 1-1 below. It is best to remember to save changes before going to a new page.
			    </p>
			    <figure class="doc-figure">
			        <a href="#" data-featherlight="application/view/image/help/profile/general_editing.png"><img src="application/view/image/help/profile/general_editing.png" class="img-responsive" /></a>
			        <figcaption><strong>Figure 1-1.</strong> <i>Editing profile information</i></figcaption>
			    </figure>
			    
			    <h3>2. Saving changes</h3>
                <p class="paragraph">
                    To save your edits made click on the corresponding save button (identified by circular button with a checkmark). As shown in figure 1-2. If edits are made and not saved before traversing to another page a dialog box will be shown to confirm you do not wish to save the changes.
                </p>
                <figure class="doc-figure">
                    <a href="#" data-featherlight="application/view/image/help/profile/general_saving.png"><img src="application/view/image/help/profile/general_saving.png" class="img-responsive" /></a>
                    <figcaption><strong>Figure 1-2.</strong> <i>Saving edited profile information</i></figcaption>
                </figure>
                
                <h3>3. Required fields</h3>
                <p class="paragraph">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </p>
                <figure class="doc-figure">
                    <a href="#" data-featherlight="application/view/image/help/profile/required_fields.png"><img src="application/view/image/help/profile/required_fields.png" class="img-responsive" /></a>
                    <figcaption><strong>Figure 1-2.</strong> <i>Identifying what fields must be filled in before info can be saved</i></figcaption>
                </figure>
			</div>
		</div>
	</div>
</div>
