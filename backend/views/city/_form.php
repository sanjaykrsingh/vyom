<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\City */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="city-form">

   <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description')->textarea(['maxlength' => true]) ?>

   

    <?= $form->field($model, 'latitude')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'longitude')->textInput(['maxlength' => true]) ?>

   <?= $form->field($imageModel, 'imageFiles[]')->fileInput(['multiple' => true, 'accept' => 'image/*']) ?>

<?= $form->field($imageModel, 'smallFiles[]')->fileInput(['multiple' => true, 'accept' => 'image/*']) ?>


    <div class="form-group">
<?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>


        <div>
            <div class="file-drop-disabled">
                Image <br/>
                <?php if(!empty($bigImageList)){ foreach($bigImageList as $val){ ?> 
                        <div class="file-preview-frame file-preview-initial" id="preview-image-<?= $val['id']?>" data-fileindex="init_1" data-template="image"><div class="kv-file-content">
                                <img src="../../<?= $val['path']?>" class="kv-preview-data file-preview-image" title="<?= $val['name']?>" alt="Earth.jpg" style="width:auto;height:120px;">
                            </div><div class="file-thumbnail-footer">
                                <div class="file-footer-caption" title="Earth.jpg"><?= $val['name']?></div>
                                <div class="file-thumb-progress hide"><div class="progress">
                                        <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%;">
                                        <?= $val['name']?>    
                                        </div>
                                    </div></div> <div class="file-actions">
                                    <div class="file-footer-buttons">
                                        <button type="button" class="kv-file-remove btn btn-xs btn-default"  onclick="deleteImage(<?= $val['id']?>, 'preview-image-<?= $val['id']?>', 'restaurant' )" title="Remove" data-url="" data-key=""><i class="glyphicon glyphicon-trash text-danger"></i></button>
                                             </div>
                                    
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
        
        <div>
            <div class="file-drop-disabled">
                Small Image <br/>
                <?php if(!empty($smallImageList)){ foreach($smallImageList as $val){ ?> 
                        <div class="file-preview-frame file-preview-initial" id="preview-image-<?= $val['id']?>" data-fileindex="init_1" data-template="image"><div class="kv-file-content">
                                <img src="../../<?= $val['path']?>" class="kv-preview-data file-preview-image" title="<?= $val['name']?>" alt="Earth.jpg" style="width:auto;height:90px;">
                            </div><div class="file-thumbnail-footer">
                                <div class="file-footer-caption" title="Earth.jpg"><?= $val['name']?></div>
                                <div class="file-thumb-progress hide"><div class="progress">
                                        <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%;">
                                        <?= $val['name']?>    
                                        </div>
                                    </div></div> <div class="file-actions">
                                    <div class="file-footer-buttons">
                                        <button type="button" class="kv-file-remove btn btn-xs btn-default" onclick="deleteImage(<?= $val['id']?>, 'preview-image-<?= $val['id']?>', 'restaurant' )"  title="remove" data-url="" data-key=""><i class="glyphicon glyphicon-trash text-danger"></i></button>
                                             </div>
                                    
                                    <div class="file-upload-indicator" title=""></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                             <?php }}?>
                    </div></div>
                <div class="clearfix"></div>    <div class="file-preview-status text-center text-success"></div>
                
            </div>
        



<?php ActiveForm::end(); ?>

</div>
