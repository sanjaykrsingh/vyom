<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Services */

$this->title = Yii::t('app', 'Create Services');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Services'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="services-create">

    

   <?= $this->render('_form', [
        'model' => $model,'imageModel' => $imageModel
    ]) ?>
</div>
