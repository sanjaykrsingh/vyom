<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\SiteSeen */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Site Seens'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-seen-view">
<p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
         
        <?= Html::a(Yii::t('app', 'Create'), ['create'], ['class' => 'btn btn-success']) ?>
        
    </p>

  <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
                //'id',
             [                      // the owner name of the model
            'label' => 'City',
            'value' => $model->cities->name,
             ],
        
            'title',
            'Description:ntext',
            'open_time',
            'close_time',
            'address',
            'phone_no1',
            'phone_no2',
            'email:email',
            'latitude',
            'longitude',
            'created_at',
            'updated_at',
        ],
    ]) ?>
<div>
            <div class="file-drop-disabled">
                Image <br/>
                <?php if(!empty($bigImageList)){ foreach($bigImageList as $val){ ?> 
                        <div class="file-preview-frame file-preview-initial" id="preview-1464429871093-init_1" data-fileindex="init_1" data-template="image"><div class="kv-file-content">
                                <img src="./<?= $val['path']?>" class="kv-preview-data file-preview-image" title="<?= $val['name']?>" alt="<?= $val['name']?>" style="width:auto;height:120px;">
                            </div><div class="file-thumbnail-footer">
                                <div class="file-footer-caption" title="<?= $val['name']?>"><?= $val['name']?></div>
                                <div class="file-thumb-progress hide"><div class="progress">
                                        <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%;">
                                        <?= $val['name']?>    
                                        </div>
                                    </div></div> <div class="file-actions">
                                    <div class="file-upload-indicator" title=""></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                <?php }}?>
                    </div></div>
                <div class="clearfix"></div>    <div class="file-preview-status text-center text-success"></div>
                
            </div>
        
        <div>
            <div class="file-drop-disabled">
                Small Image <br/>
                <?php if(!empty($smallImageList)){ foreach($smallImageList as $val){ ?> 
                        <div class="file-preview-frame file-preview-initial" id="preview-1464429871093-init_1" data-fileindex="init_1" data-template="image"><div class="kv-file-content">
                                <img src="./<?= $val['path']?>" class="kv-preview-data file-preview-image" title="<?= $val['name']?>" alt="<?= $val['name']?>" style="width:auto;height:90px;">
                            </div><div class="file-thumbnail-footer">
                                <div class="file-footer-caption" title="<?= $val['name']?>"><?= $val['name']?></div>
                                <div class="file-thumb-progress hide"><div class="progress">
                                        <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%;">
                                        <?= $val['name']?>    
                                        </div>
                                    </div></div> <div class="file-actions">
                                    
                                    <div class="file-upload-indicator" title=""></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                             <?php }}?>
                    </div></div>
                <div class="clearfix"></div>    <div class="file-preview-status text-center text-success"></div>
                
            </div>
    
</div>


