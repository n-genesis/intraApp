<div class="card">
	<div class="card-header bgm-cyan">
		<h2>Patient Records <small>In hendrerit lorem nislac lacinia</small></h2>
		<ul class="actions actions-alt">
			<li class="dropdown"><a href="#" data-toggle="dropdown" aria-expanded="false"> <i class="zmdi zmdi-more-vert"></i> </a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li><a href="#">Refresh</a></li>
					<li><a href="#">Save</a></li>
				</ul></li>
		</ul>
		<button class="btn bgm-blue btn-float waves-effect"><i class="zmdi zmdi-check-all"></i></button>
	</div>
    
	<div class="card-body">
		<ul class="tab-nav tn-justified tn-icon" role="tablist">
		    <?php $category_index_1 = 1;?>
		    <?php foreach ($categories as $category) {?>
			<li role="presentation" class="<?php echo ($category_index_1 == 1?'active':'');?>"><a aria-expanded="false" class="col-sx-4" href="#tab-<?php echo $category_index_1;?>" aria-controls="tab-<?php echo $category_index_1;?>" role="tab" data-toggle="tab"><?php echo $category['category_name'];?> </a></li>
			<?php $category_index_1++;?>
			<?php }?>
		</ul>

		<div class="tab-content p-20">
		    <?php $category_index_2 = 1;?>
		    <?php foreach ($categories as $category) {?>
			<div role="tabpanel" class="tab-pane animated fadeIn <?php echo ($category_index_2 == 1?'active':'');?>" id="tab-<?php echo $category_index_2;?>">
			    
			    <?php foreach ($category['group_option'] as $group_option) {?>
                <?php foreach ($group_option['categories'] as $group_category) {?>
                <?php foreach ($group_category as $options) {?>
                <div class="row">
                    <div class="col-md-12"><h3><?php echo (is_string($options)?$options:'');?></h3></div> 
                
                <?php if(is_array($options)) {?>
                
                    <?php foreach ($options as $option) {?>
                    <div class="col-sm-3 m-b-25">
                    <p class="f-500 m-b-15 c-black">
                        <?php echo $option['option_name']; ?>
                    </p>
                    
                    <?php
                    switch ($option['type']) {
                        case 'select':
                            ?>
                            <select class="selectpicker">
                                <?php foreach ($option['options'] as $option_values) {?>
                                    <option><?php echo $option_values; ?></option>
                                <?php } ?>
                            </select>
                            <?php
                            break;
                        case 'input':
                            ?>
                            <div class="form-group">
                                <div class="fg-line">
                                    <?php foreach ($option['options'] as $option_values) {?>
                                    <input class="form-control" type="text" placeholder="<?php echo $option_values; ?>">
                                    <?php } ?>
                                </div>
                             </div>
                            <?php
                            break;
                        default:
                            
                            break;
                    }
                    ?>
                    </div>
                <?php }?>
                
                <?php }?>
                
                </div>
                <?php }?>
                <?php }?> 
                <?php }?>
                
                
			    </div>
			<?php $category_index_2++;?>
			<?php }?>
		</div>
            
	</div>
</div>
