<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Customer */

$this->title = Yii::t('app', 'Update Itinerary: ', [
    'modelClass' => 'Itinerary',
]) . ' Itinerary' ;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Itinerary'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="customer-update">

    

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
