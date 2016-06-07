<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Customer */

$this->title = Yii::t('app', 'Create Itinerary');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Itinerary'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="customer-create">

    

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
