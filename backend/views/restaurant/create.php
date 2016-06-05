<?php

use yii\helpers\Html;
use backend\assets\ImageUploadAsset;

/* @var $this yii\web\View */
/* @var $model backend\models\Restaurant */

ImageUploadAsset::register($this);

$this->title = Yii::t('app', 'Create Restaurant');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Restaurants'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="restaurant-create">

    

    <?= $this->render('_form', [
        'model' => $model,'imageModel' => $imageModel
    ]) ?>

</div>
