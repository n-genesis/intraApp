<div class="block-header">
	<h2>Application Extensions</h2>
</div>
<section data-alert="system">
<?php if(isset($system_notice)){ echo $system_notice; } ?>
</section>
<div class="card blog-post">
	<img src="application/view/image/widgets/preview.jpg" class="img-responsive" alt="">
	<div class="card-header">
		<h2>Extension List <small>Add to the functionality of INTRAapp and do more</small></h2>
		<ul class="actions">
			<li class="dropdown"><a href="#" data-toggle="dropdown" aria-expanded="false"> <i class="zmdi zmdi-more-vert"></i> </a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li><a href="#">Refresh</a></li>
					<li><a href="#">Manage Widgets</a></li>
					<li><a href="#">Widgets Settings</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="card-body card-padding">
<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-module" class="form-horizontal">
    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th class="text-left">Extension Name</th>
                    <th class="text-right">Action</th>
                </tr>
            </thead>
            <tbody>
                <?php if ($extensions) { ?>
                <?php foreach ($extensions as $extension) { ?>
                <tr>
                    <td class="f-20"><?php echo $extension['name']; ?></td>
                    <td class="text-right"><?php if (!$extension['installed']) { ?>
                        <a href="<?php echo $extension['install']; ?>" data-toggle="tooltip" title="Install" class="btn btn-success"><i class="zmdi zmdi-plus-circle"></i></a>
                        <?php } else { ?> 
                        <a onclick="confirm('Are you sure?') ? location.href='<?php echo $extension['uninstall']; ?>' : false;" data-toggle="tooltip" title="Uninstall" class="btn btn-danger"><i class="zmdi zmdi-minus-circle"></i></a>
                        <?php } ?>
                    <?php if ($extension['installed']) { ?>
                        <?php if ($extension['module']) { ?>
                        <a href="<?php echo $extension['edit']; ?>" data-toggle="tooltip" title="Edit" class="btn btn-primary"><i class="zmdi zmdi-plus"></i></a> 
                        <?php } else { ?> 
                        <a href="<?php echo $extension['edit']; ?>" data-toggle="tooltip" title="Edit" class="btn btn-primary"><i class="zmdi zmdi-edit"></i></a>
                        <?php } ?>
                    <?php } else { ?>
                    <button type="button" class="btn btn-primary" disabled="disabled">
                        <i class="zmdi zmdi-edit"></i>
                    </button>
                    <?php } ?>
                    </td>
                </tr>
                <?php foreach ($extension['module'] as $module) { ?>
                <tr>
                    <td class="text-left f-20">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;<?php echo $module['name']; ?></td>
                    <td class="text-right">
                        <a onclick="confirm('Are you sure?') ? location.href='<?php echo $module['delete']; ?>' : false;" data-toggle="tooltip" title="Delete" class="btn btn-danger"><i class="zmdi zmdi-delete"></i></a>
                        <a href="<?php echo $module['edit']; ?>" data-toggle="tooltip" title="Edit" class="btn btn-primary"><i class="zmdi zmdi-edit"></i></a>
                    </td>
                </tr>
                <?php } ?>
                <?php } ?>
                <?php } else { ?>
                <tr>
                    <td class="text-center" colspan="2">There are no extension uploaded</td>
                </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
</form>
	</div>
</div>