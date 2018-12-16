<div class="row">
    <div class="col-md-3">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="file-manager">
                    <h5>Showing: <span data-sandbox="directory-title">root</span></h5>
                    <div class="hr-line-dashed"></div>
                    <button class="btn btn-primary btn-block">
                        Upload Files
                    </button>
                    <div class="hr-line-dashed"></div>
                    <h5>Folders</h5>
                    <!-- Directory files-->
                    <section id="directory-list">
                        <ul class="folder-list" style="padding: 0">
                        <li><a href="<?php echo $root_link; ?>" data-sandbox-file-manager="directory" data-sandbox-file-directory="root"><i class="zmdi zmdi-folder"></i> root</a></li>  
                        <?php foreach ($directory as $name => $link) {?>
                            <li><a href="<?php echo $link; ?>" data-sandbox-file-manager="directory" data-sandbox-file-directory="<?php echo $name; ?>"><i class="zmdi zmdi-folder"></i> <?php echo $name; ?></a></li>
                        <?php } ?>
                        </ul>
                    </section>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-9">
        <div class="card">
            <div class="card-header">
                <h2>File Manager <small>Current Dir <span class="label label-info" data-sandbox="directory-title"><?php echo (!empty($current_dir)?$current_dir:'root') ;?></span></small></h2>
                <ul class="actions">
                    <li><a href="#" onclick="document.location.reload(true); return false;"><i class="zmdi zmdi-refresh-alt"></i></a></li>
                    <li class="dropdown"><a href="#" data-toggle="dropdown" aria-expanded="false"> <i class="zmdi zmdi-folder"></i> </a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <?php foreach ($directory as $name => $link) {?>
                                <li><a href="<?php echo $link; ?>" data-sandbox-file-manager="directory" data-sandbox-file-directory="<?php echo $name; ?>"><i class="zmdi zmdi-folder"></i> <?php echo $name; ?></a></li>
                            <?php } ?>
                        </ul></li>
                </ul>
            </div>
            <div class="card-body card-padding">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Directory files-->
                        <section id="file-list">
                            <?php echo $file_list;?> 
                        </section>                
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>