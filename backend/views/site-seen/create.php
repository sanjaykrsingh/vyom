<?php

use yii\helpers\Html;

$this->title = Yii::t('app', 'Create Site Seen');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Site Seens'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-seen-create">

    

     <?= $this->render('_form', [
        'model' => $model,'imageModel' => $imageModel
    ]) ?>

</div>
