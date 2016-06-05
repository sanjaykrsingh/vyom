<?php

use yii\helpers\Html;

use backend\assets\ImageUploadAsset;

/* @var $this yii\web\View */
/* @var $model backend\models\Restaurant */

ImageUploadAsset::register($this);

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Site Seen',
]) . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Site Seens'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="site-seen-update">

    

     <?= $this->render('_form', [
                    'model' => $model,'imageModel' => $imageModel, 'bigImageList'=>$bigImageList,'smallImageList'=>$smallImageList 
            ]) ?>

</div>
