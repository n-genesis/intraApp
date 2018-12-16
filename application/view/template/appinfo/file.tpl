<?php if(!empty($files)){ ?>
<?php foreach($files as $name => $extension){ ?>
<div class="file-box" data-sandbox-file="select" data-sandbox-filename="<?php echo $name; ?>">
    <div class="file">
        <a href="#"> <span class="corner"></span>
        <div class="icon">
            <i class="zmdi zmdi-file"></i>
        </div>
        <div class="file-name">
            <span data-sandbox-file="name"><?php echo $name; ?></span>
            <br>
            <small>Added: <?php echo $extension['create'];?></small>
        </div>
        </a>
    </div>
</div>
<?php } ?>
<?php }else { ?>
    <h1 class="text-center">Empty</h1>
<?php } ?>