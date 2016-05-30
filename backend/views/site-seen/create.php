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

    <h1><?= Html::encode($this->title) ?></h1>

     <?= $this->render('_form', [
        'model' => $model,'imageModel' => $imageModel
    ]) ?>

</div>
