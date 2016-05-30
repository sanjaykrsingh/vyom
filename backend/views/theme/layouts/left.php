<?php 
use yii\bootstrap\Nav;
//use yii\widgets\Menu;
use dmstr\widgets\Menu;
?>
<aside class="main-sidebar">

    <section class="sidebar">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?= $directoryAsset ?>/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p>Alexander Pierce</p>

                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </form>
        <!-- /.search form -->

        <?php use mdm\admin\components\MenuHelper;
              //use dmstr\menuhelpers\MenuHelper;
        $items = MenuHelper::getAssignedMenu(Yii::$app->user->id, null, null,true);
       // print_r($items);die;
        echo Menu::widget([
            'items' => $items,//MenuHelper::getAssignedMenu(Yii::$app->user->id ,null, null, true),
            //'options' => ['class' =>'dropdown-submenu nav nav-pills nav-stacked'],            
            'options' => ['class' =>'sidebar-menu'],            
        ]);
        
//        echo Menu::widget([
//                'items' => [
//                    ['label' => 'Home<i class="fa fa-angle-left pull-right"></i>', 'url' => ['site/index']],
//                    ['label' => 'About<i class="fa fa-angle-left pull-right"></i>', 'url' => ['site/about']],        
//                    ['label' => 'Admin<i class="fa fa-angle-left pull-right"></i>',
//                        'url' => [''],
//                        'items' => [
//                                ['label' => '<i class="fa fa-circle-o"></i>Assignment', 'url' => ['/admin/assignment/index']],
//                                ['label' => '<i class="fa fa-circle-o"></i>Menu', 'url' => ['/admin/menu/index']],
//                                ['label' => '<i class="fa fa-circle-o"></i>Permission', 'url' => ['/admin/permission/index']],
//                                ['label' => '<i class="fa fa-circle-o"></i>Roles', 'url' => ['/admin/route/index']],
//                                ['label' => '<i class="fa fa-circle-o"></i>Rules', 'url' => ['/admin/role/index']],
//                                ['label' => '<i class="fa fa-circle-o"></i>User Manage', 'url' => ['/user/index']],
//                        ],
//                        'options' => ['class' =>'treeview'],
//                        'submenuTemplate' => "\n<ul class='treeview-menu'>\n{items}\n</ul>\n",
//                    ],
//                ],
//
//                    'activateParents'=>true,
//                    'encodeLabels' => false,
//                    'options' => ['class' =>'sidebar-menu'],
//            ]);
        ?>

    </section>

</aside>
