<?php

use yii\helpers\Html;
use backend\assets\ImageUploadAsset;

/* @var $this yii\web\View */
/* @var $model backend\models\Restaurant */

ImageUploadAsset::register($this);

$this->title = Yii::t('app', 'Create Site Seen');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Site Seens'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-seen-create">

    

     <?= $this->render('_form', [
        'model' => $model,'imageModel' => $imageModel
    ]) ?>

</div>
