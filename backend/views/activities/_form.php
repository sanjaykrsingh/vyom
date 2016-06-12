<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Activities */
/* @var $form yii\widgets\ActiveForm */
?>
 <?php if(!empty($errors)):
        $co= count($errors); ?>
<div class="error-summary">
<?php        for($i =0; $i < $co; $i++ ):
         if(!empty($errors[$i])):  
          echo "<br>Row ".($i+1)." - ";    
    ?>
    <?php if(isset($errors[$i]['name'][0])){ echo $errors[$i]['name'][0].", ";}?>
    <?php if(isset($errors[$i]['valid_from'][0])){ echo $errors[$i]['valid_from'][0].", ";}?>
    <?php if(isset($errors[$i]['valid_to'][0])){ echo $errors[$i]['valid_to'][0].", ";}?>
    <?php if(isset($errors[$i]['retail_price'][0])){ echo $errors[$i]['retail_price'][0].", ";}?>
    <?php if(isset($errors[$i]['discounted_price'][0])){ echo $errors[$i]['discounted_price'][0]."";}?>
   <?php else:$co++;
       endif; ?>
   <?php endfor;?>
</div>       
<?php endif; ?>
<div class="form-group">
    <?php $form = ActiveForm::begin(['id' => 'activitiesForm']); ?>
<input type="hidden" name="site_seen_id" value="<?=$site_seen_id;?>" />
  
    <div class="form-group" style="height: auto;">
        <div class="col-xs-3">
            Name
        </div>
        <div class="col-xs-2">
            Valid From
        </div>
        <div class="col-xs-2">
            Valid To
        </div>
        <div class="col-xs-2">
            Retail Price
        </div>
        <div class="col-xs-2">
            Discounted Price
        </div>
        <div class="col-xs-1">&nbsp; </div>
    </div><br><br>
    
    <?php if(!empty($data)):
        $co= count($data); 
        for($i =0; $i < $co; $i++ ):
    ?>
    <div class="form-group">
        <div class="col-xs-3">
            <input type="text"  class="form-control" name="Activities[name][]" value="<?=$data[$i]["Activities"]["name"]; ?>">
        </div>
        <div class="col-xs-2 dateContainer">
            <div class="input-group input-append date addDatePicker" >
                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                <input type="text" class="form-control" name="Activities[valid_from][]" value="<?=$data[$i]["Activities"]["valid_from"]; ?>">
            </div>
        </div>
        <div class="col-xs-2 dateContainer">
            <div class="input-group input-append date addDatePicker">
                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                <input type="text" class="form-control" name="Activities[valid_to][]" value="<?=$data[$i]["Activities"]["valid_to"]; ?>">
            </div>
        </div>
        <div class="col-xs-2">
            <input type="text"  class="form-control"  data-validation="length alphanumeric" data-validation-length="min4" name="Activities[retail_price][]" value="<?=$data[$i]["Activities"]["retail_price"]; ?>">
        </div>
        <div class="col-xs-2">
            <input type="text" id="activities-discounted_price" class="form-control"  data-validation="length alphanumeric" data-validation-length="min4" name="Activities[discounted_price][]" value="<?=$data[$i]["Activities"]["discounted_price"]; ?>">
        </div>

        <div class="col-xs-1">
            <?php if($i == 0 ):?>
            <button type="button" class="btn btn-default addButton"><i class="fa fa-plus"></i></button>
            <?php else:?>
            <button type="button" class="btn btn-default removeButton"><i class="fa fa-minus"></i></button>
            <?php endif;?>
        </div>
    </div>
    <?php endfor; endif; ?>
    <!-- The template for adding new field -->
    <div class="form-group hide" id="taskTemplate">
        <div class="col-xs-3">
            <input type="text"  class="form-control" name="Activities[name][]">
        </div>
        <div class="col-xs-2 dateContainer">
            <div class="input-group input-append date addDatePicker">
                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                <input type="text" class="form-control" name="Activities[valid_from][]">
            </div>
        </div>
        <div class="col-xs-2 dateContainer">
            <div class="input-group input-append date addDatePicker">
                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                <input type="text" class="form-control" name="Activities[valid_to][]">
            </div>
        </div>
        <div class="col-xs-2">
            <input type="text"  class="form-control" name="Activities[retail_price][]">
        </div>
        <div class="col-xs-2">
            <input type="text" id="activities-discounted_price" class="form-control" name="Activities[discounted_price][]">
        </div>

        <div class="col-xs-1">
            <button type="button" class="btn btn-default removeButton"><i class="fa fa-minus"></i></button>
        </div>
    </div>
    <div class="form-group" >
        <div class="col-xs-5" style="margin-top: 10px;">
            <button type="submit" class="btn btn-default" id="AddValue">Submit</button>
        </div>
    </div>
    <?php ActiveForm::end(); ?>
</div>