<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Customer */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="customer-form">

    <?php $form = ActiveForm::begin(); ?>

    
    <?= $form->field($model, 'itinerary_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
    
    <?= $form->field($model, 'mobile_no')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
    <?php    
      for($i=1 ; $i<=10; $i++) {
          $day_value = (!empty($day_description['day'.$i]))?$day_description['day'.$i]:"";
       ?>
       <div class="form-group field-customer-day_description has-success">
        <label class="control-label" for="customer-day_description">Day <?=$i;?></label>
        <textarea id="customer-day_description<?=$i;?>" class="form-control" name="Customer[day_description][]" rows="6"><?=$day_value;?></textarea>
        <div class="help-block"></div>
        </div> 
    <?php }?>
    <?= $form->field($model, 'day_description')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
