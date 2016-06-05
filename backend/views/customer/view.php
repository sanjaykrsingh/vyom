<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Customer */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Customers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="customer-view">

    

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'name',
            'itinerary_id',
            'mobile_no',
            'email:email',
          
            'created_at',
            'updated_at',
        ],
    ]) ?>
    <?php    
      if(!is_array($model->day_description)){
          $model->day_description = json_decode($model->day_description, true);
      }
      
      for($i=1 ; $i<=10; $i++) {
          $day_value = (!empty($model->day_description['day'.$i]))?$model->day_description['day'.$i]:"";
       ?>
       <div class="form-group field-customer-day_description has-success">
        <label class="control-label" for="customer-day_description">Day <?=$i;?></label>
        <textarea id="customer-day_description<?=$i;?>" disabled="" class="form-control" name="Customer[day_description][day<?=$i;?>]" rows="6"><?=$day_value;?></textarea>
        <div class="help-block"></div>
        </div> 
    <?php }?>
    
    

</div>
